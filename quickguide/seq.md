---
layout: page
title:  sequence of atoms
---

A new reserved keyword "seq" has been added for declaring a field as a sequence of atoms. In the following example, for each person p, "p.books" is a sequence of Book:

	sig Book { }
	sig Person {
		books: seq Book
	}

The actual type of a sequence of Book is "Int->Book". So if s is a sequence of Book, then the first element is s[0] and you can get the set of all elements by writing "univ.s"

You can also use "seq" in existential quantifications, like this:

	some s: seq Book | FORMULA

Currently, the Alloy Analyzer does not support analysis of a model with universal quantifiers over sets or relations (including sequences).

You can also use "seq" in function argument declaration, like this:

	fun getAllElements [s: seq Book] : set Book {
	  univ.s
	}

Just like the other multiplicity symbols, when you use "seq" in a function argument declaration, we do not enforce that you always call the function/predicate with a well-formed sequence. So it is only for documentation purpose, to denote s is a binary relation from Int->Book.

Note: for effifiency, we bound the length of allowed sequences. You can change this bound by setting the scope on "seq". For example, if you want to allow sequences of up to 4 elements, you write

	check SomeAssertion for 4 seq

To make it easier to manipulate sequences, we provide a number of helper functions: (these are defined in the pre-included util/sequniv.als file)

| Feature | Description |
| **#s** | Return the number of elements in sequence s. |
| **s.elems** | Return the set of elements in sequence s.|
| **s.first** | If #s > 0, it returns the first element of s. Otherwise, it returns the empty set |
| **s.last** | If #s > 0, it returns the last element of s. Otherwise, it returns the empty set|
| **s.rest** | If #s > 1, it returns s with its first element removed. Otherwise, it returns the empty sequence|
| **s.butlast** | If #s > 1, it returns s with its last element removed. Otherwise, it returns the empty sequence|
| **s.isEmpty** | It returns true if #s==0.|
| **s.hasDups** | It returns true if s contains duplicate elements.|
| **s.inds** | If #s > 0, it returns the set of integers `{0 .. (#s)-1}`. Otherwise, it returns the empty set|
| **s.lastIdx** | If #s > 0, it returns the integer `(#s)-1`. Otherwise, it returns the empty set|
| **s.afterLastIdx** | If (#s < the longest allowed sequence length), it returns `#s`. Otherwise, it returns the empty set|
| **s.idxOf [x]** | If x does not appear in s, it returns the empty set. Otherwise, it returns the first index where x appears in s.|
| **s.lastIdxOf [x]** | If x does not appear in s, it returns the empty set. Otherwise, it returns the last index where x appears in s.|
| **s.indsOf [x]** |If x does not appear in s, it returns the empty set. Otherwise, it returns the set of indices where x appears in s.|
| **s.add [x]** | If (#s < the longest allowed sequence length), it appends x to s. Otherwise, it returns s.|
| **s.setAt [i, x]** | Precondition: 0 <= i < #s. It returns a new sequence where the i-th entry is changed to x.|
| **s.insert [i, x]** | Precondition: 0 <= i <= #s It returns a new sequence where x is inserted at index i. *Note:* if #s was already equal to the longest allowed sequence length, then the last element of s will be removed first.|
| **s.delete [i]** | Precondition: 0 <= i < #s. It returns the result of deleting the element at index i|
| **a.append [b]** | Returns the result of concatenating sequence a and sequence b. (If the resulting sequence is too longer, it will be truncated)|
| **s.subseq [from, to]** | Precondition: 0 <= from <= to < #s. Returns the subsequence between from and to, inclusively.|
