{-# LANGUAGE OverloadedStrings #-}
import Data.Monoid (mappend, (<>))
import Hakyll
import System.FilePath.Posix
import Control.Monad (liftM)
import Data.Default (def)
import qualified Data.Set as S
import qualified Data.Text as T
import Text.Pandoc.Options
import Text.Pandoc
import Text.Pandoc.PDF
import System.Process as Process
{-import qualified System.Process as Process-}

--------------------------------------------------------------------------------
main :: IO ()
main = hakyll $ do
    match "pictures/**/*.svg" $ do
        route   idRoute
        compile copyFileCompiler

    match "pictures/**/*.jpg" $ do
        route   idRoute
        compile copyFileCompiler

    match "pictures/*" $ do
        route   idRoute
        compile copyFileCompiler

    match "bibliography/*.bib" $ compile biblioCompiler
    match "bibliography/*.csl" $ compile cslCompiler
    match "bibliography/*.md" processWithBib

    -- Notes
    match "library/*.org" processPost
    match "notes/*.org" processPost
    match "notes/medecine/livres_medecine.org" processPost
    -- History notes
    match "notes/*.md" processWithBib

    -- posts
    match "notes/**/*.md" $ do 
        route $ setExtension "html"
        compile $ pandocCompiler
            >>= loadAndApplyTemplate "templates/plain.html" defaultContext
            >>= relativizeUrls

    match "assets/*.ico" $ do
        route idRoute
        compile copyFileCompiler

    match "assets/css/*" $ do
        route   idRoute
        compile compressCssCompiler

    match "assets/fonts/*" $ do
        route   idRoute
        compile copyFileCompiler

    match "posts/**/*" processPost
    match "index.md" processPost
    match "projects.html" $ createCategory "projects"
    match "computing.html" $ createCategory "computing"
    match "templates/*" $ compile templateCompiler

    -- latex
-- Painful to work with, so we use latex for notes instead
{-    match "notes/medecine/*.md" $ do-}
        {-route   $ setExtension ".pdf"-}
        {-compile $ do getResourceBody-}
            {->>= readPandoc-}
            {->>= writeXeTex-}
            {->>= loadAndApplyTemplate "templates/latex2.tex" defaultContext-}
            {->>= xelatex-}


  where
    pages = [ "projects.html", "computing.html"]
    --categories' = map (++ ".html") categories


--------------------------------------------------------------------------------
-- Math support
pandocMathCompiler =
    let mathExtensions = [Ext_tex_math_dollars, Ext_tex_math_double_backslash,
                          Ext_latex_macros]
        defaultExtensions = writerExtensions defaultHakyllWriterOptions
        writerOptions = defaultHakyllWriterOptions {
                          writerHTMLMathMethod = MathJax ""
                        }
    in pandocCompilerWith defaultHakyllReaderOptions writerOptions

-- Generate a list of posts for a given category
createCategory :: String -> Rules ()
createCategory cat = do
        route idRoute
        compile $ do
            posts <- recentFirst =<< loadAll ( fromGlob $ "posts/" ++ cat ++ "/*.md")
            let indexCtx =
                    listField "posts" teaserCtx (return posts) `mappend`
                    constField "title" "Home"                `mappend`
                    defaultContext

            getResourceBody
                >>= applyAsTemplate indexCtx
                >>= loadAndApplyTemplate "templates/plain.html" indexCtx
                >>= relativizeUrls

-- Context for teaser
teaserCtx = teaserField "teaser" "content" `mappend` postCtx

postCtx :: Context String
postCtx =
    dateField "date" "%B %e, %Y" `mappend`
    defaultContext

cslFile = "bibliography/chicago-light.csl"

processPost = do
  route $ setExtension "html"
  compile $ pandocMathCompiler
    >>= saveSnapshot "content"
    >>= loadAndApplyTemplate "templates/post.html" defaultContext
    >>= relativizeUrls

-- Compile bibtex file
bibtexCompiler :: String -> Compiler (Item String)
bibtexCompiler bibFile = do
    csl <- load $ fromFilePath cslFile
    bib <- load $ fromFilePath bibFile
    liftM writePandoc
      (getResourceBody >>= readPandocBiblio  defaultHakyllReaderOptions csl bib)

processWithBib = do
   route $ setExtension "html"
   compile $ bibtexCompiler "bibliography/history.bib"
        >>= loadAndApplyTemplate "templates/plain.html" defaultContext
        >>= relativizeUrls

niceRoute =  customRoute setOutput
  where setOutput x = takeBaseName p <.> "html"
         where p = toFilePath x

writeXeTex :: Item Pandoc -> Compiler (Item String)
writeXeTex = traverse $ \pandoc ->
      case runPure (writeLaTeX def pandoc) of
          Left err -> fail $ show err
          Right x  -> return (T.unpack x)

-- Does not work
latex = match pattern rules
  where
    pattern = "notes/medecine/superfiches.tex"
    rules = do
      route $ setExtension "pdf"
      compile $ getResourceLBS >>= withItemBody (unixFilterLBS "latexmk" ["-pdf", "-lualatex", "-cd"])

--------------------------------------------------------------------------------
-- | Hacky.
xelatex :: Item String -> Compiler (Item TmpFile)
xelatex item = do
    TmpFile texPath <- newTmpFile "xelatex.tex"
    let tmpDir  = takeDirectory texPath
        pdfPath = replaceExtension texPath "pdf"

    unsafeCompiler $ do
        writeFile texPath $ itemBody item
        _ <- Process.system $ unwords ["lualatex", 
            "-output-directory", tmpDir, texPath, ">/dev/null", "2>&1"]
        return ()

    makeItem $ TmpFile pdfPath

