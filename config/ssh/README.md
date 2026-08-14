https://medium.com/risan/upgrade-your-ssh-key-to-ed25519-c6e8d60d3c54

## notes / working with ssh passphrases

- useful when forgetting, testing a ssh passphrase
https://stackoverflow.com/a/70160696/708807

> specfiy the path to the private key and not the public ie. `key.pub`

```
ssh-keygen -y -P "" -f ~/.ssh/id_ed25519
```

## editing / preparing files

> i use fish (fight me™️) the below commands are useful for encoding and dencoding

decode example

```fish
for encrypted_file in file1.txt.gpg file2.txt.gpg file3.txt.gpg
    gpg --decrypt "$encrypted_file" > (basename "$encrypted_file" .gpg)
end
```

encode example

```fish
for file in file1.txt file2.txt file3.txt;
    gpg --recipient your@email.com --encrypt "$file"
end
```

## working with gpg keys

1. when setting up a new user on a new box (ugghhh) copy over existing gpg keys and run the below commands.

credit: https://www.debuntu.org/how-to-importexport-gpg-key-pair/

```
gpg --list-keys
# example cmd
gpg --import /some/path/to/public/mygpgkey_pub.gpg
# example cmd
gpg --allow-secret-key-import --import ~/mygpgkey_sec.gpg
gpg --list-keys
```
