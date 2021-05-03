when configuring a bare bones system for the first time and the default shell is set to bash, ie. macos mojave, the quickest way to add a permanent alias for future shell instances is to use the below command

```shell
echo "alias l='ls -lah'" >> ~/.bash_profile"
```

the above command will/should just work for all future bash instances
