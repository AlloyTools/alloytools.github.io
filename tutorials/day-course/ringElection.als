/*
 * An incomplete model of leader election in a ring.
 * Follow the instructions in the Dynamic Modeling lecture to complete.
 */

open util/ordering[Time] as to
open util/ordering[Process] as po

sig Time {}
sig Process {
  succ: Process,
  toSend: Process -> Time,
  elected: set Time
}

fact defineElected {
  no elected.(to/first)
  all t: Time - to/first |
    elected.t = { p:Process | p in (p.toSend.t - p.toSend.(t.prev)) }
}

fact traces {
  init [to/first]
  all t: Time - to/last | let t' = t.next |
    all p: Process |
      step[t, t', p] || step[t, t', succ.p] || skip[t, t', p]
}

pred init [t: Time] {
  // every process has exactly itself to send
}

pred skip [t, t': Time, p: Process] {
  // a no-op: process p send no ids during that time step
}

pred step [t, t': Time, p: Process] {
  // process p sends one id to successor
  // successor keeps it or drops it
}

assert atMostOneElected {
  // no more than one process is deemed elected
  // no process is deemed elected more than once
}
check atMostOneElected for 3 Process, 7 Time

assert atLeastOneElected {
  // at least one process is elected on each trace
}
check atLeastOneElected for 3 Process, 7 Time

pred looplessPath {
  no disj t, t': Time | toSend.t = toSend.t'
}
// run looplessPath for 3 Process, ? Time
