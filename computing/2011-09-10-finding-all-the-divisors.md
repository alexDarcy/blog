---
layout: post
title: Finding all the divisors
category: computing
comments: false
---

In this post, we are going to search the all the divisors of an integer, as a
warm-up before studying factorizing techniques (see the following posts).
<!-- more -->
A number n is said to be factorized into primes if we can find all of its 
prime factors (called $q_0$, $q_1$....) and their exponents
($\alpha_0$, $\alpha_1$...). Then we can write 
$$n = q_0^{\alpha_0}q_1^{\alpha_1}q_2^{\alpha_2}... $$
The number of all divisors will then be the product of the powers +1 (the
demonstration is easy, see the next part): 
$$\sigma_0 = (\alpha_0+1)(\alpha_1+1)(\alpha_2+1)... $$
Let us take an example. The prime factors of 24 are 2 and 3 so if we decompose it into primes :
$$ 24 = 2^3 \cdot 3$$
The number of divisors is $(3+1).(1+1) = 8$. 

Now that we have this factorization, finding all the divisors is just a matter
of trying all the possible combinations of the prime factors.
In our example, its divisors are : 1,2,3,4,6,8,12,24 so eight in total.

_Beware :_ 1 and the number itself are counted as divisors !


Divisor function
For proving the number of divisors is the product of the powers+1, let us examine the number of divisors.
We will use a function called the divisor function. It is defined at the sum of
all the divisors of our number (let us call it n) at a given power (for example
k), noted as $\sigma_k(n)$.

If we choose $k=0$, we get what we want : the divisor function is then simply the sum of the divisors
(because a number at the power 0 is 1, and there are as many 1 as there are
divisors).

Now, the divisors of $q_0^{\alpha_0}$ are only the powers of $q_0$ (as it is prime). Thus there are
$\alpha_0 + 1$ divisors.

Finally, we just have to see that (the number of divisors of a product is the
product of the number of the divisors of each term) :
$$\begin{aligned}
\sigma_0(n) &= \sigma_0 (q_0^{\alpha_0}q_1^{\alpha_1}q_2^{\alpha_2})\\
            &= \sigma_0(q_0^{\alpha_0}) \sigma_0(q_1^{\alpha_1}) \sigma_0(q_2^{\alpha_2})
\end{aligned}$$
And using the previous remark, we find that 
$$ \sigma_0(n) = (\alpha_0+1)(\alpha_1+1)(\alpha_2+1)...$$
