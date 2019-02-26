---
layout: page
title: Plan for the reference manual
description: Plan for the reference manual as written by Hillel
index: 0
---


Right now, if you want to learn Alloy, you have to read Software Abstractions. SA is a very, very good book, but there's three big problems with relying on it:

1. It's not up to date. Alloy 4 things like seq, enum, disjunctive relations, etc aren't in it. These new feature are effectively invisible.
2. Very little on the IDE, libraries, or visualizations.
3. It costs money.

The last one is the big sticking point. There are no free online resources you can comprehensively learn Alloy from. This makes Alloy a lot less accessible. The online material doesn't need to be amazing, it just needs to make it possible to learn Alloy. I'm looking at the python documentation as inspiration: https://docs.python.org/3/library/ 

So I want us to start writing more comprehensive online documentation. I'd be happy to do the bulk of the writing (I like writing), but would probably need help to validate, error-check, and revise things.  I see this being a multiple-phase project:

0. Cheat sheet. Let's take this and make it more prominent on the official page.
1. Standard library. That would be
  - boolean
  - graph
  - integer
  - natural
  - ordering
  - relation
  - seqrel
  - sequence
  - sequniv
  - ternary
  - time

Some of these might be "internal only", and some might be obsoleted. But generally they should all have a list of what they export with a description and an example. I made a short example for ternary. Most of the others will be significantly longer, and include examples of use and gotchas.

2. New syntax not found in SA. Should cover at least
  - meta capability
  - let macros
  - seq
  - enum
  - disj multiplicities
  - disj predicate
  - string names for facts
  - private

Will probably eventually be folded into (4)- we can use this to explore the format of presenting information. I'd say leave out the different uses of syntax for now (things like predicate overloading and unified function/predicate/relation syntax)

3. The IDE

All of the ins and outs of the IDE. Some of this is already documented in the IDE itself, which we can leverage. Two parts to this: IDE itself and the visualizer component.

  IDE:
	- Sample models (we should probably make this more obvious- it's a great way to learn)
	- What skolem depth is, intuitively
	- Recursion Depth
	- Metamodel and Parse Tree
	- Unsat Core
	- "Prevent Overflows"
	- "'implicit this' name resolution"
	-  Infer partial instance
	- Optimization options (memory, stack, solver)

  Visualizer:
	- Import/Export
	- Evaluator
	- Magic Layout
	- All the zoom and save options
	- txt, table, tree views
	- What all the options for "themes" do
	- Projections

4. Reference documentation

Lookup information on all of the keywords of Alloy and the semantics. It should be possible for a very dedicated person to, using just the reference documentation, learn all the details of Alloy (if slowly), or at least get to an intermediate level of knowledge. This will probably be the heaviest and driest part.

5. Special topics

Probably a stretch goal, but things like "modeling dynamic systems", model optimization, material that will be useful to a person once they've built up their alloy intuition and want to push further. We might also want to document specific gotchas here.

6. User guide

A more traditional introduction, similar to SA, but made as a free resource. Very valuable, but will prob be made a lot easier by getting 1-4 done first.



