## Add GPG to sign
[Github guide to add GPG](https://docs.github.com/en/authentication/managing-commit-signature-verification/checking-for-existing-gpg-keys) 

```bash
git config --global --unset gpg.format
git config --global user.signingkey bla or bla! if subkey
git config --global commit.gpgsign true
```

## Add SSH to sign 
```bash
git config --global gpg.format ssh
git config --global user.signingkey /path/to/key.PUB
```
