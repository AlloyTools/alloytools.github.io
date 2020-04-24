---
layout: page
title: Running the Alloy Analyzer on Mac OS X
---


Just open the downloaded `alloy.dmg` file (the latest version available at [Github Releases page](https://github.com/AlloyTools/org.alloytools.alloy/releases/latest)), and double click on the Alloy4 icon. To keep the application, drag the icon out of the dmg window and place it somewhere in your home directory or on your desktop.

## Running the Alloy Analyzer on other platforms

Just download the jar file (the latest version available at [Github Releases page](https://github.com/AlloyTools/org.alloytools.alloy/releases/latest)) then double-click on the jar file, or type:

	java -jar org.alloytools.alloy.dist.jar

in the console.

**Please note:** Platform-dependent libraries are currently available only for Mac OS X, Windows (x86), Linux (x86), and FreeBSD (x86). On other platforms, you can still run the Alloy Analyzer, but you will need to select the pure Java solver "SAT4J" (through the Options menu).
