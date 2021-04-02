## Working with AppleScripts

<a name="working with applescripts"></a>


The default location for `$USER` Apple Scripts is `$HOME/Library/Scripts/`

Apple Scripts, ie. applescripts generally have a `.scpt` extension, but can also be saved into app bundles using `/Applications/Utilities/Script Editor.app`.

A useful companion app when writing applescripts is `Acessibility Inspector.app` provided by Xcode, which provides an extensive view of how GUI elements can be accessed via apple scripting.

Apple Scripts can be run from a CLI, however with modern versions of macos accessing certain functions of the OS has become limited due to security reasons.

To run an Apple Script from a CLI, ie.

```shell
/usr/bin/osascript /path/to/my_applescript.scpt
```

## useful links

<a name="useful-links"></a>


