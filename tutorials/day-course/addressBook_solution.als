/**
 * A complete model of an address book.
 */

open util/ordering[Book] as ord

abstract sig Target {}
sig Name extends Target {}
sig Addr extends Target {}

sig Book { addr: Name -> Target }

pred init [b: Book] { no b.addr }

pred inv [b: Book] {
  let addr = b.addr | all n: Name {
    n not in n.^addr
    some addr.n => some n.addr
  }
}

fun lookup [b: Book, n: Name] : set Addr {
  n.^(b.addr) & Addr
}

assert namesResolve {
  all b: Book | inv[b] =>
    all n: Name | some b.addr[n] => some lookup[b, n]
}
check namesResolve for 4

fact traces {
  init [ord/first]
  all b: Book - ord/last | let b' = ord/next[b] |
    some n: Name, t: Target |
      add[b, b', n, t] || delete[b, b', n, t]
}

pred add [b, b': Book, n: Name, t: Target] {
  // precondition
  t in Name => (n !in t.*(b.addr) && some b.addr[t])
  // postcondition
  b'.addr = b.addr + n->t
}
run add for 4

pred showAdd [b, b': Book, n: Name, t: Target] {
  inv[b]
  add[b, b', n, t]
}
run showAdd for 4

pred delete [b, b': Book, n: Name, t: Target] {
  // precondition
  some b.addr[n] - t || no b.addr.n
  // postcondition
  b'.addr = b.addr - n->t
}
run delete for 4

pred showDelete [b, b': Book, n: Name, t: Target] {
  inv[b]
  delete[b, b', n, t]
}
run showDelete for 4

assert deleteUndoesAdd {
  all b, b', b'': Book, n: Name, t: Target |
    (t !in b.addr[n] && add[b, b', n, t] && delete[b', b'', n, t]) =>
      b.addr = b''.addr
}
check deleteUndoesAdd for 4

assert initEstablishes {
  all b: Book | init [b] => inv [b]
}
check initEstablishes for 4

assert addPreserves {
  all b, b': Book, n: Name, t: Target |
    inv[b] && add[b, b', n, t] => inv [b']
}
check addPreserves for 4

assert deletePreserves {
  all b, b': Book, n: Name, t: Target |
    inv[b] && delete[b, b', n, t] => inv[b']
}
check deletePreserves for 4

pred showTrace {}
run showTrace for 6

assert tracePreservesInvariant {
  all b: Book | inv[b]
}
check tracePreservesInvariant for 6
