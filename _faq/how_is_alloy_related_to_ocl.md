---
layout: page
title: How is Alloy related to OCL?
---

Alloy is similar to OCL, the Object Language of UML, but it has a more conventional syntax and a simpler semantics, and is designed for automatic analysis. Alloy is a fully declarative language, whereas OCL mixes declarative and operational elements. The 'navigational dot' of Syntropy is a key operator in Alloy, but is given a more uniform and flexible interpretation than in OCL. Because operators can be applied to entire sets and relations, Alloy tends to be more succinct than OCL. Alloy models can describe object models and operations, as well as properties to be checked. The Alloy Analyzer can check the consistency of an object model expressed in Alloy, and can generate snapshots from it, and can execute operations and check their properties. Alloy can handle relations with arbitrary arity, and has structuring mechanisms to allow reuse of model fragments.
