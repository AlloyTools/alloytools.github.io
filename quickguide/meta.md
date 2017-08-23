---
layout: page
title: meta capability
---


A new meta capability has been added for greater flexibility to efficiently handle some situations.

When the model contains at least one attempt to reference a meta atom, then the model will be automatically augmented with meta atoms as follows:

*   For each user-defined sig X, we add a meta atom "X$"; and for each field Y in a user defined sig X, we add a meta atom "X$Y".
*   Given the meta atom "X$" representing some user signature; "X$.fields" represents the meta atoms for its immediate fields and "X$.subfields" the meta atoms for it and all descendants' fields.
*   Given the meta atom "X$Y" representing some field; "X$Y.value" represents the actual field value in the real world.
*   An atom "sig$" is added that represents the union of all meta atoms that represent signatures as well as a "field$" atom representing the union of all meta atoms that represent fields.

So, for example, say we have the following model:

	sig A {
	    x: Int,
	    y: Int,
	    z: Int
	}

One common thing you might want to have is an equals predicate:

	pred eq[a1, a2 : A] { a1.x=a2.x and a1.y=a2.y and a1.z=a2.z }

The inconvenience with doing it this way is that it gets very long as there are more fields in the sig and if you happen to add a new field in A you have to remember to modify the eq predicate as well.

Using the meta capability this predicate could be written more succinctly (and with no impact on performance) like this:

	pred eq[a1, a2 : A] { all f:A$.subfields | a1.(f.value)=a2.(f.value) }

You can also have more a intricate model such as:

	sig A { x: Int }
	sig B extends A { y: Int->Int }

and the following will still work:

	pred eq [b1, b2 : B]  { all f:B$.subfields | b1.(f.value)=b2.(f.value) }

We do some manipulations to make this common idiom work because it's a fairly common one: 
whenever we see an expression of the kind `all f:GUARD | body` or `some f:GUARD | body` where GUARD's 
type is a subtype of `(sig$+field$)`, we replicate the body multiple times for each possible meta atom 
in existence, and bind `f` to each possible meta atom one-at-a-time. We do this in such a way that there's 
no impact in performance; the cost of writing a frame condition using the meta capability is exactly the 
same as if you manually enumerate each field.

But this is a one-off case, so always be mindful about the expressions you write since these will still need to type-check.
