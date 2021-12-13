## karabiner elements

when adding a custom rule for karabiner elements located within

```shell
$HOME/.config/karabiner/assets/complex_modifications
```

make sure there are a `title` and `description` keys within the complex modification `.json` or else there could be difficulty viewing the file, ie. not being able load the rule after a restart.

### adding a new rule ie. _(complex modification)_ to karabiner elements, _ke_

1. add new complex rule in above mentioned directory and along with above mentioned _keys_
2. restart karbiner elements from the **Misc** tab
3. view the **Log** tab to see if there are any issues with the newly added rule

#### troubleshooting 🧐

to obtain a **bundle identifier** for a specific application

```shell
osascript -e 'id of app "App Name"'
echo "example"
osascript -e 'id of app "Messages.app"'
```

if there is an issue with adding the rule

> _from my understanding_, karabiner elements copies separate rules into a global config file `karabiner.json`, so editing the local file will not update the global file until the local rule is removed, and readded with the updated changes and karabiner elements is restarted in the process.

1. first unload / **remove** the problematic rule
2. restart karabiner, view log, check for no errors.
3. edit the rule
4. readd rule
5. check for errors, if errors still persist **remove**, **restart** **readd**

[**learn more**][lm1]


[lm1]: [https://github.com/pqrs-org/Karabiner-Elements/issues/1225#issuecomment-401517364]

## TODOs

- [ ] implement toggle function to toggle between media keys
- [ ] implement toggle function when <kbd>caps lock</kbd> is on/off, ie. switch <kbd>-</kbd> to <kbd>_</kbd> when <kbd>caps lock</kbd> is **on**
    - [possible useful toggle func **github**][td1]
    - [**github** comment, double tap][td2]
    - [**github** caps lock + e to pageDown][td3]

[td1]: <https://gist.github.com/icanswiftabit/f91413052a95ad3f0ecf43ad9cfc0d53>
[td2]: <https://gist.github.com/icanswiftabit/f91413052a95ad3f0ecf43ad9cfc0d53>
[td3]: <https://github.com/pqrs-org/Karabiner-Elements/issues/2301#issuecomment-640966466>

