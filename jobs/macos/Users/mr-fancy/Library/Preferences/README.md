## macos / settings

### dock settings

i ran the below command to make the the macos app switcher appear on both screens when using two monitors

[**reference**][lnk1]

```
defaults write com.apple.dock appswitcher-all-displays -bool true
killall Dock
```

[lnk1]: <https://apple.stackexchange.com/questions/106405/cmd-tab-behavior-on-mavericks-with-multiple-displays/126095#126095>
