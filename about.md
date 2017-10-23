---
layout: page
title: about alloy
main: about
---

Alloy is a language for describing structures and a tool for exploring
them. It has been used in a wide range of applications from finding
holes in security mechanisms to designing telephone switching
networks.

An Alloy model is a collection of constraints that describes
(implicitly) a set of structures, for example: all the possible
security configurations of a web application, or all the possible
topologies of a switching network. Alloy’s tool, the Alloy Analyzer,
is a solver that takes the constraints of a model and finds structures
that satisfy them. It can be used both to explore the model by
generating sample structures, and to check properties of the model by
generating counterexamples. Structures are displayed graphically, and
their appearance can be customized for the domain at hand.

At its core, the Alloy language is a simple but expressive logic based
on the notion of relations, and was inspired by the Z specification
language and Tarski’s relational calculus. Alloy’s syntax is designed
to make it easy to build models incrementally, and was influenced by
modeling languages (such as the object models of OMT and UML). Novel
features of Alloy include a rich subtype facility for factoring out
common features and a uniform and powerful syntax for navigation
expressions.

Alloy Tools is an open source project maintained by a group of
volunteers organised via [Github](https://github.com/AlloyTools) that
can always use additional
[contributors](https://github.com/AlloyTools/org.alloytools.alloy/blob/master/CONTRIBUTING.md).

