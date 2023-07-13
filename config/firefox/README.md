
## customizing firefox

<a name="customizing-firefox"></a>

in order to use the `userChrome.css` contained within this directory with firefox >= 69 (quantum) one needs to enable the below setting in the `about:config`

```
toolkit.legacyUserProfileCustomizations.stylesheets
```

then place the `userChrome.css` within the firefox profile directory. the profile directory is a different location for each of the three major OSes, and can be found by opening either the `about: profiles` or the `about:config`

i pulled this information from the following [blog post][ul1]

[ul1]: <https://www.howtogeek.com/334716/how-to-customize-firefoxs-user-interface-with-userchrome.css/>

