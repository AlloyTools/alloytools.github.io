---
layout: page
title: How does the Alloy Analyzer differ from theorem provers?
---

The Alloy Analyzer's analysis is fully automatic, and when an assertion is found to be false, the Alloy Analyzer generates a counterexample. It's a "refuter" rather than a "prover". When a theorem prover fails to prove a theorem, it can be hard to tell what's gone wrong: whether the theorem is invalid, or whether the proof strategy failed. If the Alloy Analyzer finds no counterexample, the assertion may still be invalid. But by picking a large enough scope, you can usually make this very unlikely.
