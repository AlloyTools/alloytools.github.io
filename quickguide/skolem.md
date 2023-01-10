---
layout: page
title:  Skolemization Relations
---


Often times, quantified formulas can be reduced to equivalent formulas without the use of quantifiers. This reduction is called **skolemization** and is based on the introduction of one or more **skolem constants or functions** that capture the constraint of the quantified formula in their values.

Consider the following example:

	sig A { r: lone B }
	sig B {}

	fact {
	  some x: A | no x.r
	}

The "some" formula may be equivalently expressed as:

	x' in A && no x'.r

`x'` is the skolem relation in this case. The existential quantifier "some" is not needed because the analysis will search for the existence of the skolem relation _x'_.

## Determining the names of skolem relations

The Alloy Analyzer automatically generates and assigns names to skolem relations. The names can be determined by looking at the solved instance using any of the three (Text, Tree, Viz) views. For instance, in the above example, the name _$x_ may have been assigned to the skolem relation _x'_.

## Using skolem relations

Skolem relations are displayed in the output like any other relation in the original model. Hence, its visualization may be customized to be made more conspicuous.
