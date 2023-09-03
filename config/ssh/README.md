https://medium.com/risan/upgrade-your-ssh-key-to-ed25519-c6e8d60d3c54

## notes / working with ssh passphrases

- useful when forgetting, testing a ssh passphrase
https://stackoverflow.com/a/70160696/708807

> specfiy the path to the private key and not the public ie. `key.pub`

```
ssh-keygen -y -P "" -f ~/.ssh/id_ed25519
```

## editing / preparing files

> i use fish (fight me) the below commands are useful enc and denc

enc example

```fish
for encrypted_file in file1.txt.gpg file2.txt.gpg file3.txt.gpg
    gpg --decrypt "$encrypted_file" > (basename "$encrypted_file" .gpg)
end
```

denc example

```fish
for file in file1.txt file2.txt file3.txt;
    gpg --recipient your@email.com --encrypt "$file"
end
```
