---
layout: page
title: What kind of analysis does the Alloy Analyzer do?
---
 
The Alloy Analyzer is, technically speaking, a 'model finder'. Given a logical formula (in Alloy), it attempts to find a model -- a binding of the variables to values -- that makes the formula true. For simulation, the formula will be some part of the system description. If it's a state invariant INV, for example, models of INV will be states that satisfy the invariant. If it's an operation OP, with variables representing the before and after states, models of OP will be legal state transitions. For checking, the formula is a negation, usually of an implication. To check that the system described by the property SYS has a property PROP, you would assert (SYS implies PROP); the Alloy Analyzer negates the assertion, and looks for a model of (SYS and not PROP), which, if found, will be a counterexample to the claim.

Version 4.x uses a new model finder engine called Kodkod and has a revised visualizer. Read more about it [here](http://alloy.mit.edu/alloy4/).

Version 3.0 improves on version 2.0 in a number of ways. Read more about it [here](newinA3.php).

Version 2.0 improves on the previous version in many ways. The language has support for arbitrary arity relations, relational operators, and basic integer operations. It has a new structuring mechanism for incremental extension, and a module system for dividing a model into separate files. It has parametric polymorphism for defining generic types and operations. The accompanying Alloy Analyzer is completely new. It offers better performance and scalability (through improved formula transformations, and the use of more powerful SAT solvers, such as MiniSat, zChaff, and Berkmin). The visualization facility is more flexible.
