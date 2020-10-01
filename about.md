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
features of Alloy includes many new rich subtype facilities for factoring out
common features and a uniform and powerful syntax for navigation
expressions.

Alloy is a product of the [Software Design Group](http://sdg.csail.mit.edu) at [MIT](http://mit.edu).

### alloy team members

* [Daniel Jackson](http://people.csail.mit.edu/dnj) – Project director
* [Aleksandar Milicevic](http://people.csail.mit.edu/aleks) – Lead developer & Master guru
* [Emina Torlak](http://people.csail.mit.edu/emina) – Developer, Kodkod engine
* [Eunsuk Kang](http://people.csail.mit.edu/eskang) – General guru
* [Joe Near](http://people.csail.mit.edu/jnear) – General guru

### former team members

Major contributions to earlier versions of Alloy were made by: Felix
Chang, Jonathan Edwards, Robert Seater, Derek Rayside, Greg Dennis, Ilya Shlyakhter, Mana Taghdiri, Mandana Vaziri, Sarfraz Khurshid, and Manu Sridharan.

### acknowledgements

Alloy is the product of a research project funded by the National Science Foundation under Grant Nos. [0325283](http://www.nsf.gov/awardsearch/showAward.do?AwardNumber=0325283), [0541183](http://www.nsf.gov/awardsearch/showAward.do?AwardNumber=0541183), [0438897](http://www.nsf.gov/awardsearch/showAward.do?AwardNumber=0438897) and [0707612](http://www.nsf.gov/awardsearch/showAward.do?AwardNumber=0707612); by the [Air Force Research Laboratory](http://www.wpafb.af.mil/AFRL/) (AFRL/IF) and the Disruptive Technology Office (DTO) in the National Intelligence Community Information Assurance Research (NICIAR) Program; and by the [Nokia Corporation](http://www.nokia.com) as part of a collaboration between [Nokia Research](http://research.nokia.com/) and [MIT CSAIL](http://www.csail.mit.edu/).

