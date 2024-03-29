---
layout: page
title: download
main: download
---

Alloy is a self-contained executable, which includes the Kodkod
model finder and a variety of SAT solvers, as well as the standard
Alloy library and a collection of tutorial examples. The same jar file
can be incorporated into other applications to use Alloy as an API,
and includes the source code. See the release notes for details of new
features. To execute, simply double-click on the jar file, or type
`java -jar org.alloytools.alloy.dist.jar` in a console.

### released versions

|----------- | ------------|
| [Latest build](https://github.com/AlloyTools/org.alloytools.alloy/releases) | Alloy 6 (includes the version for macOS High Sierra)|

### previous release

|----------- | ------------|
| [Alloy 5.1.0](https://github.com/AlloyTools/org.alloytools.alloy/releases/tag/v5.1.0) | Alloy 5.1.0 (includes the version for macOS High Sierra)|

### old releases

Many of these releases no longer work on MacOS out of the box.

|----------- | ------------|
|[alloy4.2.jar](download/alloy4.2_2015-02-22.jar) |Alloy 4.2 (platform independent). Requires Java 6.|
|[alloy4.2.dmg](download/alloy4.2_2015-02-22.dmg) |Alloy 4.2 (for OS X). Requires Java 6.|
|[alloy4.jar](download/alloy4.jar) |Alloy 4.1 (platform independent). Requires Java 5.|
|[alloy4.dmg](download/alloy4.dmg) |Alloy 4.1 (for OS X). Requires Java 5.|

### Alloy extensions

#### Electrum
- Public web page: [http://haslab.github.io/Electrum](http://haslab.github.io/Electrum)
- Authors: Nuno Macedo, Julien Brunel, David Chemouil, Alcino Cunha
- Synopsis: Electrum extends Alloy with mutable signatures and fields as well as connectives from Linear Temporal Logic (with Past), it is well suited to model systems featuring both structural and behavioral aspects. Verification relies on bounded and unbounded model-checking; and the Visualizer is extended to allow interactive exploration of traces.

#### Sterling
- Public web page: [https://sterling-js.github.io/](https://sterling-js.github.io/)
- Authors: Tristan Dyer, John Baugh
- Synopsis: Sterling is a web-based visualizer for Alloy that can be customized and extended using JavaScript. It also includes enhanced views that make complex state easier to understand. The Graph View provides multiple layout options, does not restrict the movement of atoms to rows, and maintains the position of common elements when stepping through traces. The Table View provides sorting and filtering options, and skolemized variables can be displayed as highlighted rows. Using the Script View, included in the upcoming release, users can generate domain specific visualizations and extend the Sterling interface with user-defined scripts.
