---
layout: page
title:  private namespace
---

A new reserved keyword `private` has been added for declaring a `sig`, `fun`, `pred`, field, or an entire imported module as being "private" to this module (and does not show up in the namespace of other modules that import this module).

## Example 1: private sig, private field, private function, and private predicate

	module moduleA
	open moduleB

	module moduleB
	sig Person {
	  favorite: Book,
	  knows: set Person,
	  private likes: set Person
	}

	private sig Book { year: Int }

  	fun allBook: set Book { Book }

  	private fun union[a, b: set univ]: set univ { a+b }


From moduleA, you can refer to "Person", "favorite", "knows", and "allBook".

You cannot refer to "likes" because it is a private field, and you cannot refer to "union" because it is a private function.

From moduleA, you cannot refer to "Book" since it is a private sig,
and you cannot refer to "year" because it is a field in a private sig (and thus it is automatically private).

The important thing to note here is this is purely a namespace management mechanism, and you may still be able to access these "hidden" values via other names. For example, if you have Person X, you can access X.favorite to see the Book atom corresponding to his favorite book, even though you cannot refer to the Book signature by name. Likewise, you can get every atom in the Book sig by calling the "allBook" function.

## Example 2: private open

	module moduleA
	open moduleB

	module moduleB
	private open moduleC
	open moduleD
	sig B { }

	module moduleC
	sig C { }

	module moduleD
	sig D { }

In moduleB, you can certainly refer to B, C, and D.

In moduleA, you can refer to B and D, but you cannot refer to C, since moduleB imported moduleC as a "private import".
