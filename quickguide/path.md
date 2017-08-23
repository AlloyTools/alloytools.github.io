---
layout: page
title:  About Module Paths
---

Alloy models may contain "open" statements, like this one:

	open util/integer

The Alloy `open` statement is roughly similar to the Java `import` or the C/C++ `include` in that it tells the tool to look at some source in another file.

Alloy will look for `util/integer.als` in two places:

First of all, if the module is one of the sample model that comes with Alloy 4, it will load it. 
This includes all the [util modules](util.html) such as `util/ordering` and `util/boolean`, as well as the 
example models such as `examples/algorithms/dijkstra`. You can see the list of sample models by 
clicking on the File menu, then click on `open sample models`.

Failing that, it will infer the location of the file based on the location of the current model and the name of the current model.

For example, let's suppose we are analyzing the model "C:\Desktop\main.als" with the following content:

	model filesystem/main

	open filesystem/debug as DEBUG
	open filesystem/library/dirmodel as DIR
	open filesystem/library/filemodel as FILE

The `filesystem/debug` module is on the same level as `filesystem/main`, so we will infer that it is at 
`C:\Desktop\debug.als`

The dirmodel and filemodel are in a subdirectory called "library", so we will infer that they 
are at `C:\Desktop\library\dirmodel.als` and `C:\Desktop\library\filemodel.als`
