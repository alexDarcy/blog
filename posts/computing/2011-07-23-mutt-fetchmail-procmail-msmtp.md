---
layout: post
title: Mail (mutt, fetchmail, procmail, msmtp)
category: computing
comments: false
---


Today, we will see how to get mails, read them, and answer them, inside a terminal. 
<!--more-->
We will need four utilities for that :

* one to fetch the mails on the server : <ic> fetchmail</ic>,
* one for processing the mails once they are received : <ic>procmail</ic>,
* a mail client for viewing them : we will choose <ic>mutt</ic>
* an agent for sending mails : <ic>msmtp</ic>is a good choice (or sendmail,
which should be installed by default on most Linux and BSD distribution )

Install each of this utilities according to the usual way of your distribution. 
The following tutorial assumes you have two accounts : account1@gmail.com and 
account2@gmail.com, account1 being the main account. Do not forget to change it to your needs !

_Note : you will have to rename the config files downloaded from here.
For example, "fetchmailrc" will become ".fetchmailrc"._

## Fetchmail
First, we need to fetch the mails from the server. Write a configuration file
similar to mine :

``` bash
set daemon 180
# First account
poll pop.horse.org service 993 with protocol imap
user 'rider@horse.org' there with password 'XXX'
is 'Alex' here                              
mda "/usr/bin/procmail -d %T"
# Subfolders too
folder INBOX, Courses
options ssl sslcertck                            

# Second account
poll pop.turtle.fr with protocol pop3
user 'alexis.praga@turtle.fr' there with password 'XXXX'
is 'Alex' here                              
mda "/usr/bin/procmail -d %T"
#options ssl sslcertck                            
```

Here is a configuration for two accounts so you can manage multiple
configurations. You also have an example of fetching subfolders and using SSL
certificates.

Then change the permissions:

``` bash
$ chmod 700 ~/.fetchmailrc
```

Now comment the line containing <ic>set daemon</ic> and start it in verbose mode 

``` bash
$ fetchmail -v
```

If everything looks good, you can uncomment the daemon mode and let it fetch new mail every minute with

``` text
set daemon 60 
```


## Procmail
The role of procmail is to filter your mail. The idea is to put all mails sent 
to account2 in corresponding mailbox, and the rest to the box of account1 
(it is supposed to be your main account). 

For that, you will need to create a mailbox. We will use the Maildir format.  For example, if <ic>~/Mail</ic> is you mail directory, we will create a folder named <ic>account1</ic> containing three folders : <ic>cur</ic>, <ic>tmp</ic>, <ic>new</ic>.  Do the same for account2.

Then, create your configuration, following mine :

``` bash
PATH=/bin:/usr/bin:/usr/local/bin 
VERBOSE=off
DEFAULT=/home/john/Mail/Horse/new
MAILDIR=/home/john/Mail            
LOGFILE=$HOME/.procmaillog  
# Recipes below this comment:

# Go to a certain folder
:0:
* ^To:.*@horse.fr
Turtle/new

#Rest go to account1
:0
Horse/new
```

Several things to note here. First, we must deliver mail into the <ic>New</ic>
folder. 
Then we can use rules to put mail into several folders (here, it's Horse or
Turtle). But it can also be used for filtering spam !
See the procmail documentation for that.

## Msmtp
In the <ic>.msmptrc</ic> file, we are going to specify 
two accounts. On of them will be the default, as in my file :

``` bash
account horse
host horse.org
port 587
from rider@horse.org
tls on
tls_starttls on
tls_trust_file /etc/ssl/certs/ca-certificates.crt
auth on
user rider
password XXXX
logfile ~/.msmtp.log

account default  : horse
account turtle : turtle
from alexis.praga@turtle.fr
```

_Note : Gmail can be picky about the certificate. Using the Equifax certificate
of your distribution is the safest way (see the configuration file for the
path). Otherwise, you can try :_
``` bash
/usr/share/ca-certificates/mozilla/Thawte_Premium_Server_CA.crt
```

Change the permissions :

``` bash
$ chmod 600 ~/.msmtprc
```

Then, you can try sending mail with the following command :

``` bash
$ cat test.mail | msmtp -a default account1@gmail.com 
```

where test.mail is an simple file like this one :

``` text
To: account1@gmail.com
From: fake@gmail.com
Subject: Test <br/> 

Hello !
```

_Beware, there must be an empty line after the Subject._

## Mutt
Finally, our mail client ! Mutt is powerful and highly configurable.
For more details, see the [official documentation](http://wiki.mutt.org/?MuttGuide).

My config file can be grabbed [here](http://alexis.praga.free.fr/files/muttrc).
It is pretty much commented so I will only explain the configuration about
managing several accounts and folders.

Mutt does not know of any account, just of folders, which may potentially be
mailbox. So we receive our mail in the spoolfile by default.

Mutt cannot move automatically mail to other folders (no, really, it cannot). So
we are left with two solutions : either create a macro which will invoke
procmail to filter mail or use Mutt's command. 
I did not try the first solution as the second is easiest.

Basically, you define rules for moving files (see the .muttrc) with <ic>save-hook</ic>.
When you have read your file, press <ic>s</ic> and a mailbox will be suggested. 
If your rules are correct, you just need to press <ic>Enter</ic>. Then, you can change mailboxes with <ic>c</ic> or ... see the next section.

Finally, you can define a mail associated to a mailbox with :

``` bash
folder-hook account1 set from= account1@gmail.com
folder-hook account2 set from= account2@gmail.com
```

In my .muttrc, you will see shortcuts for switching between the two accounts. Feel free to change them.

Now, let us test the awesomeness of mutt. For example, start mutt. The first time, we need to start fetchmail manually with <ic>f</ic> (cf my .muttrc).
You should have received all your new mails by now.

If you want to search a mail, use <ic>/</ic>. For reading a mail, just select it with <ic>Enter</ic>. Adding the sender to you alias is done with <ic>a</ic>. Answer him (or her) with <ic>r</ic>. 

Type your reply (with ViM for example) and send it with <ic>y</ic>. Congratulations you can now use Mutt in your everyday life !
If you want to see all the shortcuts, help is available with <ic>?</ic>.

## Mutt-patched

Following on the question of folders, there is an Mutt extension, called
mutt-patched, which displays mailboxes on a separate window.
For that, you need to install it and set :

``` bash
set sidebar_sort = yes
```

Please note the mailbox must be defined as subfolder of your main folder. So it
must be :

``` bash
set folder="~/Mail"
mailboxes !
mailboxes = +YourFolder1
mailboxes = +YourFolder2
```
