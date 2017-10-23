/*
 * Exercise A.1.4 on page 232 of
 * Software Abstractions, by Daniel Jackson
 *
 * When writing "navigation expressions," you may notice repeated
 * subexpressions that can be factored out, making the overall expression more
 * succinct. For example the expression (p.mother.brother + p.father.brother),
 * denoting p's uncles, can be written instead as p.(mother + father).brother.
 * Simplifications like this rely on the assumption that certain algebraic
 * identities hold, such as
 *
 * a) distributivity of join over union: s.(p + q) = s.p + s.q
 *
 * b) distributivity of join over difference: s.(p - q) = s.p - s.q
 *
 * c) distributivity of join over intersection: s.(p & q) = s.p & s.q
 *
 * for a given set s and binary relations p and q.
 *
 * For each putative identity, say whether it holds, and if not, give a
 * counterexample. The commands below tell the analyzer to find
 * counterexample withint a universe of 4 elements. When you find that a
 * property does not hold, try and obtain the smallest counterexample you can,
 * by reducing the scope (for example, replacing "for 4" by "for 2").
 */

assert union {
  all s: set univ, p, q: univ -> univ | s.(p + q) = s.p + s.q
}

assert difference {
  all s: set univ, p, q: univ -> univ | s.(p - q) = s.p - s.q
}

assert intersection {
  all s: set univ, p, q: univ -> univ | s.(p & q) = s.p & s.q
}

check union for 4
check difference for 4
check intersection for 4
