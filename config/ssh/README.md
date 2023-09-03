https://medium.com/risan/upgrade-your-ssh-key-to-ed25519-c6e8d60d3c54

## notes / working with ssh passphrases

- useful when forgetting, testing a ssh passphrase
https://stackoverflow.com/a/70160696/708807

> specfiy the path to the private key and not the public ie. `key.pub`

```
ssh-keygen -y -P "" -f ~/.ssh/id_ed25519
```
