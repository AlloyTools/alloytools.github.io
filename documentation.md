---
layout: page
title: Documentation Alloy 6
main: docs
---

Alloy 6 is a self-contained executable, which includes the Pardinus/Kodkod model finder and a variety of SAT solvers, 
as well as the standard Alloy library and a collection of tutorial examples. The same jar file can be incorporated 
into other applications to use Alloy as an API, and includes the source code.

You can download alloy from https://github.com/AlloyTools/org.alloytools.alloy/releases/tag/v6.0.0

To execute, simply double-click on the jar file, or type `java -jar org.alloytools.alloy.dist.jar` in a console. For MacOS users, there is a DMG file.

Since Alloy 6, the tool can also perform temporal model-checking. at the time of this writing, this relies on external tools [NuSMV](https://nusmv.fbk.eu/) or [nuXmv](https://nuxmv.fbk.eu/) (preferred from an efficiency point of view) that should be installed by the user and mad available in the PATH.



| ------------- | ------------- |
| [FAQ](/faq/faq.html)  | Frequently asked questions about Alloy |
| [reference](spec.html) | Language reference for Alloy 6 |
| [grammar](https://github.com/AlloyTools/org.alloytools.alloy/blob/master/org.alloytools.alloy.core/parser/Alloy.cup)| Alloy Grammar in Java CUP|
| [lex](https://github.com/AlloyTools/org.alloytools.alloy/blob/master/org.alloytools.alloy.core/parser/Alloy.lex)| Alloy Lexical tokens in flex|
| [quick guide](quickguide) | Overview of new features in Alloy 4 |
| [comparisons](download/comparisons.pdf) | Comparisons to Z, B, VDM and OCL (PDF) |
| [Alloy API](documentation/alloy-api/index.html) | Documentation for Alloy API |
| [Alloy API Examples](documentation/alloy-api-examples.html) | examples of using [the compiler](code/ExampleUsingTheCompiler.java.html), [the ast](code/ExampleUsingTheAPI.java.html), [the evaluator](code/EvaluatorExample.java.html)|
| [online tutorial](tutorials/online) | A step-by-step walkthrough and tutorial for Alloy 4|
| [tutorial slides](tutorials/day-course) | Slides for day-long tutorial by Rob Seater and Greg Dennis |
| [digital humanities tutorial](http://blackmesatech.com/2013/07/alloy/) | A tutorial introducing Alloy for digital humanities work, by C. M. Sperberg-McQueen |
