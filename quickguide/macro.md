---
layout: page
title:  Macros
---

Untyped macros can be defined at the top level of a file. All 3 syntax are equivalent.  (If parameterless, 
then [ ] can be omitted.)

    let a[x,y,z]   {...}
    let a[x,y,z] = {...}
    let a[x,y,z] = .....

Macro expansion obeys proper grammar, so each argument to a macro must be an integer/boolean/set/relation or must be a (possibly partial) call to a predicate/function/macro.

Macros are untyped, so in a file we can't have 2 macros with the same name. Also, if a macro is in scope, it always overrides other possible sig/field/fun/pred with the same name (Just like when inside a paragraph if we see `let x=y | F`, then in `F` we always take `x` to mean `y`, even if globally there is some other `sig x` or some other field `x`)

Lexical scoping: Inside a macro body, if you refer to a name not in the parameter list, then we will resolve it from the file that "defined" the macro, rather than resolve it from the file that "calls" the macro.

Currying: if you call a macro with insufficient number of arguments, then the result is a new macro with the first `N` parameters filled in, like currying.


## Examples

### Applying Macros

      let apply [a,b,c] = a[b,c]
      let add [x,y] = x.plus[y]
      check { apply[add, 2, 3] = 5 }

or even:

      check { apply[plus, 2, 3] = 5 }


### Implementing "then" using currying

    open util/ordering[Time]
    sig Time { }
    let then [a, b, t, t']    {  some x:Time | a[t,x]&&  b[x,t']  }

    one sig Light { brightness: Int one->  Time }

    pred brighter [t, t': Time] {
        Light.brightness.t' = Light.brightness.t.plus[1]
        t' = t.next
    }

    pred dimmer [t, t': Time] {
        Light.brightness.t' = Light.brightness.t.minus[1]
        t' = t.next
    }

    run {
        some t:Time | brighter.then[dimmer].then[dimmer] [first, t]
    } for 4 Time

### Dynamics 

To make it easier to denote dynamic fields macros can be used:

    let dynamic[x] = x one->Time
    let dynamicSet[x] = x->Time

Sequential composition works due to the currying semantics. Given predicate `p[t,t':Time]` or macro `p[t,t']`, `q[t,t':Time]`, and `q[t,t']`, given predicate `r[t,t':Time]` or macro `r[t,t']`, you can construct the sequential composition `pqr` without needing to declaring and passing in t1,t2,t3,t4: 

    let then [a, b, t, t'] {
        some x:Time | a[t,x]&&  b[x,t']
    }

    let pqr = p.then[q].then[r]

It is easy to have `in` parameter and an `out` parameter for an imperative event. Just list them before `t` and `t'`. Eg. 

    let a[x,t,t'] { ... }

It is easy to have local variables in an imperative event, as long as the local variable is written to at most once. Just add a `some x:SomeType` in front of the body. eg. 

    some x, y:Int | a[x].then[b].then[c[x,y]].then[d[y]]

`while[cond,body]` works. Where cond should evaluate to a value that takes `t` and where body should evaluate to a value that takes `t` and `t'`)

`while0[cond,body,t,t']` ignores the body and just asserts that cond is false at time t and that t==t'. Then `while1` as `while0` + one loop unrolling. Then `while2` as `while1` + one loop unrolling. etc.

Finally, `let while = while3`, so `while` by default unrolls up to 3 times, and rejects traces that requires more than 3 unrollings. When the user imports `util/time`, the user can re-bind `while` to `while2`  to reduce the amount of loop unrolling, or maybe bind `while` to `while5` to increase the amount of loop unrolling.

This is how the farmer puzzle can be solved using these macros:

    open util/ordering[Time]
    sig Time { }

    let dynamic[x] = x one->  Time
    let dynamicSet[x] = x ->  Time

    let then [a, b, t, t'] {
        some x:Time | a[t,x]&&  b[x,t']
    }

    let while = while3

    let while9 [cond, body, t, t'] {
        some x:Time | (cond[t] =>  body[t,x] else t=x)&&  while8[cond,body,x,t']
    }

    let while8 [cond, body, t, t'] {
        some x:Time | (cond[t] =>  body[t,x] else t=x)&&  while7[cond,body,x,t']
    }

    let while7 [cond, body, t, t'] {
        some x:Time | (cond[t] =>  body[t,x] else t=x)&&  while6[cond,body,x,t']
    }

    let while6 [cond, body, t, t'] {
        some x:Time | (cond[t] =>  body[t,x] else t=x)&&  while5[cond,body,x,t']
    }

    let while5 [cond, body, t, t'] {
        some x:Time | (cond[t] =>  body[t,x] else t=x)&&  while4[cond,body,x,t']
    }

    let while4 [cond, body, t, t'] {
        some x:Time | (cond[t] =>  body[t,x] else t=x)&&  while3[cond,body,x,t']
    }

    let while3 [cond, body, t, t'] {
        some x:Time | (cond[t] =>  body[t,x] else t=x)&&  while2[cond,body,x,t']
    }

    let while2 [cond, body, t, t'] {
        some x:Time | (cond[t] =>  body[t,x] else t=x)&&  while1[cond,body,x,t']
    }

    let while1 [cond, body, t, t'] {
        some x:Time | (cond[t] =>  body[t,x] else t=x)&&  while0[cond,body,x,t']
    }

    let while0 [cond, body, t, t'] {
        !cond[t]&&  t=t'
    }

    abstract sig Place { }
    one sig Near, Far extends Place { }

    abstract sig Object { location: dynamic[Place] }
    one sig Farmer, Fox, Chicken, Grain extends Object {}

    pred eats [a, b: Object] { a->b in Fox->Chicken + Chicken->Grain }

    pred crossRiver [t, t': Time] {
        t' = t.next
        some x:Object | {
            x.location.t != x.location.t'
            x!=Farmer =>  {
                x.location.t=Farmer.location.t
                x.location.t'=Farmer.location.t'
            }
            all y:Object-Farmer-x | y.location.t = y.location.t'
        }
        no p, q: Object {
            p.eats[q]
            p.location.t'=q.location.t'
            p.location.t'!=Farmer.location.t'
        }
    }

    let notdone[t] = (Object.location.t != Far)

    run {
            some t:Time | {
            Object.location.first=Near
            while7[notdone, crossRiver, first, t]
        }
    } for 8 Time
