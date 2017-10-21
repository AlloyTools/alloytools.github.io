/*
 * Exercise A.1.1 on page 240 of
 * Software Abstractions, by Daniel Jackson
 *
 * This following Alloy model constrains a binary relation to have a collection
 * of standard properties.
 *
 * A finite binary relation cannot have all of these properties at once. Which
 * individual properties, if eliminated would allow the remaining properties to
 * be satisfied? For each such property eliminated, give an example of a
 * relation that satisfies the rest.
 *
 * You can use the Alloy Analyzer to help you. The run command instructs the
 * analyzer to search for an instance satisfying the constraints in a universe
 * of 4 atoms. To eliminate a property, just comment it out. To get you
 * started, we have commented out the non-empty property to permit the empty
 * relation as a solution.
 */

pred show {
  some r: univ -> univ {
    // some r      // non empty
    r.r in r        // transitive
    no iden & r     // irreflexive
    ~r in r         // symmetric
    ~r.r in iden    // functional
    r.~r in iden    // injective
    univ in r.univ  // total
    univ in univ.r  // onto
  }
}

run show for 4
