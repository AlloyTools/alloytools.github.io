---
layout: page
title: What has Alloy been used for?
---
Alloy has been used to model and analyze all kinds of system, but mostly with an emphasis on systems that involve complex structured state. Applications include: name servers, network configuration protocols, access control, telephony, scheduling, document structuring, key management, cryptography, instant messaging, railway switching, filesystem synchronization, semantic web. One area in which Alloy offers particular advantage over model checkers is for analyzing systems with configurations that are underdetermined, or that can change dynamically. For example, an analysis of the leader election phase of the Firewire prototol checked all behaviours involving all configurations of nodes (up to a certain size); a model checker would require that some configuration be hardwired.

In software engineering, one of the great benefits of Alloy is that you can analyze a tiny model. You can write three lines, and analyze it; add a few more lines, and analyze again. This incrementality makes Alloy especially good for exploring design ideas.

