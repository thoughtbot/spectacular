# Spectacular - An Xcode plugin for test-conscious developers

## Installation:

1. Download the source: `$ git clone git@github.com:thoughtbot/spectacular.git`
2. Move into the directory: `$ cd spectacular`
3. Install the plugin: `$ xcodebuild`
4. Restart Xcode

The plugin should now be loaded into the plugin directory
(`~/Library/Application Support/Developer/Shared/Xcode/Plug-ins`,
for reference).

## Useage

Spectacular is designed to be triggered fron a keyboard shortcut. By default,
it uses ⌘⌥^T, but you can override that inside the Keyboard pane in System
Preferences if you'd like.

Spectacular will try to find a file named the same as the currently active
file, but with Spec at the end. So `Foo.{m|h}` -> `FooSpec.m`. You should
really be naming your spec files this way anyway, so we're just enforcing good
habits.

Spectacular is also able to do the reverse lookup, so if you're already in
`FooSpec.m`, hitting the keyboard shortcut will jump to `Foo.m`.

## About

The spectacular Xcode plugin is written and maintained by [thoughtbot, inc](http://thoughtbot.com/).

![thoughtbot](http://thoughtbot.com/images/tm/logo.png)

The names and logos for thoughtbot are trademarks of thoughtbot, inc.

## License

Liftoff is Copyright (c) 2012-2013 thoughtbot, inc. It is free software, and may be redistributed under the terms specified in the LICENSE file.
