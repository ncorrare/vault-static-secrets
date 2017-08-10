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


```bash
$ echo $VAULT_TOKEN
31e4bd7d-3172-9933-e11c-57bf95ce9f02
$
```

If using the CLI, ensure the VAULT_ADDR environment variable is properly set:
```bash
$ echo $VAULT_ADDR
http://localhost:8200
$
```

### Creating a secret
Using the Vault's CLI:

- Write a secret called _bar_, with a content called _baz_ to the _secret/foo_ path in Vault.
```bash
$ vault write secret/foo bar=baz
Success! Data written to: secret/foo
$
```

Using Vault's Web UI:
- Navigate to the _secret_ path
![secret path](/img/select-mount.png "Navigate to the secret path")
- Click on _Create Secret_
![Create Secret](/img/create-secret-1.png "Create Secret")
- Fill in the form as below, and click on _Create Secret_
![Form Create Secret](/img/create-secret-2.png "Fill in the form")

Using the API:
- POST a JSON encoded key value pair with the secret to the path
```bash
$ curl -vv \
  "${VAULT_ADDR}/v1/secret/foo" -H 'Content-Type: application/json' \
  -H "X-Vault-Token: ${VAULT_TOKEN}" --data-binary '{"bar":"baz"}'
*   Trying ::1...
* TCP_NODELAY set
* Connection failed
* connect to ::1 port 8200 failed: Connection refused
*   Trying 127.0.0.1...
* TCP_NODELAY set
* Connected to localhost (127.0.0.1) port 8200 (#0)
> POST /v1/secret/foo HTTP/1.1
> Host: localhost:8200
> User-Agent: curl/7.54.0
> Accept: */*
> Content-Type: application/json
> X-Vault-Token: 2a76f2b1-0e8c-8c0c-39aa-9f027e41bc6d
> Content-Length: 13
>
* upload completely sent off: 13 out of 13 bytes
< HTTP/1.1 204 No Content
< Cache-Control: no-store
< Content-Type: application/json
< Date: Thu, 10 Aug 2017 21:56:43 GMT
<
* Connection #0 to host localhost left intact
$
```
The 204 HTTP Response code indicates that the value was added correctly.

