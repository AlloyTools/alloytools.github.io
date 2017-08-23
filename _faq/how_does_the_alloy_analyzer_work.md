---
layout: page
title: How does the Alloy Analyzer work?
---
The Alloy Analyzer is essentially a compiler. It translates the problem to be analyzed into a (usually huge) boolean formula. This formula is handed to a SAT solver, and the solution is translated back by the Alloy Analyzer into the language of the model. All problems are solved within a user-specified _scope_ that bounds the size of the domains, and thus makes the problem finite (and reducable to a boolean formula).
