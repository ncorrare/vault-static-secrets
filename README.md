# Vault Static Secrets Guide
The goal of this guide is to demonstrate creating, reading, updating and deleting static secrets in Vault.

## Estimated Time to Complete
10 Minutes

## Prerequisites

- [Vault Cluster Guide](https://www.vaultproject.io/guides/vault-cluster.html)
- [Vault Initialization Guide](https://www.vaultproject.io/guides/vault-init.html)

## Challenge
Organizations generally have static secrets which creation cannot be managed by one of Vault's Dynamic Secret Backends. These may include:
- 3rd Party Tokens/API Keys
- Static Application Keys
- Certificates / PGP Keys / Private Keys / Encryption Keys
- Username and Passwords

These generally need to be stored centrally (to simplify rotation), and distributed securely to clients subject to policy and audit. Vault's static secret backends allow the secure store of generic secrets in a central repository.
Vault includes by default a generic secret mount in the _/secret_ path.

## Solution

Ensure that a VAULT_TOKEN environment variable is set:


{% highlight bash %}
$ echo $VAULT_TOKEN
31e4bd7d-3172-9933-e11c-57bf95ce9f02
$
{% endhighlight %}
