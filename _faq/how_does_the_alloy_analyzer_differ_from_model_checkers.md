---
layout: page
title: How does the Alloy Analyzer differ from model checkers?
---

The motivation for the Alloy project was to bring to Z-style specification the kind of automation offered by model checkers. The Alloy Analyzer is designed for analyzing state machines with operations over complex states. Model checkers are designed for analyzing state machines that are composed of several state machines running in parallel, each with relatively simple state. Alloy allows structural constraints on the state to be described very directly (with sets and relations), whereas most model checking languages provide only relatively low-level data types (such as arrays and records). The input languages of model checkers do not usually allow you to describe the state with the kinds of data structure easily handled by Alloy (tables, trees, etc); most require even simple data structures to be encoded using low-level primitives such as arrays and enumerations.

Model checkers do a temporal analysis that compares a state machine to another machine or a temporal logic formula. The term 'model checking' refers to checking that a particular state machine is a model (mathematically speaking) of a temporal logic formula. Technically, the Alloy Analyzer is a [model finder](#11), not a model checker: given a logical formula, it finds a model of the formula.

Every model checker has some kind of state machine idiom built in. Alloy has no built in idiom. This makes it possible to express and check properties that cannot always be checked with model checkers, especially those that relate states at different points in an execution (for example, that two operations commute). By modelling traces explicitly in Alloy, you can check LTL properties; this amounts essentially to bounded model checking, and works well only when counterexamples can be found in small traces.

Most model checkers do not allow state transitions to be specified declaratively: the input is essentially a program that uses assignment statements to describe a transition step. The Alloy Analyzer is designed for declarative specifications, in which invariants and operations are described by arbitrary formulas that may involve conjunction pervasively. This is very important for software modelling, because it allows very partial models to be analyzed (and thus incremental analysis of a model during its construction).
