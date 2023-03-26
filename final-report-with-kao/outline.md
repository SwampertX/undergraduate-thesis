# Table of Contents

- [Table of Contents](#table-of-contents)
- [Dedication](#dedication)
- [Abstract](#abstract)
- [Introduction](#introduction)
- [Previous works - Module Implementation](#previous-works---module-implementation)
  - [Extra-Coq](#extra-coq)
  - [Coq](#coq)
- [Description of Modules in Coq and the MetaCoq implementation](#description-of-modules-in-coq-and-the-metacoq-implementation)
- [A modular environment; or rather, an environment as a specific module](#a-modular-environment-or-rather-an-environment-as-a-specific-module)
- [Gluing](#gluing)
  - [(!) The translation from Coq to TC](#-the-translation-from-coq-to-tc)
  - [The translation from TC to/from PCUIC](#the-translation-from-tc-tofrom-pcuic)
- [Properties checked](#properties-checked)
- [Coq-specific skills learnt](#coq-specific-skills-learnt)
- [Future work](#future-work)
- [Appendix: Typing Rules, Biblio](#appendix-typing-rules-biblio)


<a id="org1cb43f0"></a>

# Dedication


<a id="orgc9ea8d3"></a>

# Abstract


<a id="org2f53e69"></a>

# Introduction

-   Motivate Coq/ITPs
-   Motivate Metacoq - metaprogramming/verified proof assistant
-   Motivate modules
-   Motivate the verification of modules
-   Contribution - first attempt at formalizing modules, and hence changing the
    environment organization of Coq programs.


<a id="org93092d1"></a>

# Previous works - Module Implementation


<a id="orgd2ee273"></a>

## Extra-Coq


<a id="orgc91a46b"></a>

## Coq

-   v1: Jacek, unifying modules and signatures as structures.
-   v2: Elie, with namespacing and labels.
-   v3?: Note that the typing rules in the docs are found in (?), and is not true
    to the implementation/semantics.


<a id="org222350e"></a>

# Description of Modules in Coq and the MetaCoq implementation

-   Plain Modules, Signature, Aliasing.
-   Briefly introduce functors, and its problems.
-   MetaCoq implementation: the tree-structure of module is equipotent to the
    flat-structure of environment as list of its contents. (proofs?)
-   Strategy: change environments completely. Therefore envtyping, eta, typing
    (which defo depends on the environment).
-   Then elaborate away at the level of PCUIC.


<a id="org8cd1de6"></a>

# A modular environment; or rather, an environment as a specific module

-   In code, explain the concrete implementation (`Environment.v`) for a model.
-   Challenges: first implementation of a mixed list-tree poses difficulties such
    as a double fold, which greatly complicates proofs.
-   Second implementation: typing rules pose a challenge. The idea of global
    environment cease to exist (?).


<a id="org9403db5"></a>

# Gluing


<a id="org277ead9"></a>

## (!) The translation from Coq to TC

-   Unimplemented.


<a id="orgfc6f245"></a>

## The translation from TC to/from PCUIC

-   Implemented but unverified.


<a id="orgef86dd8"></a>

# Properties checked

Maybe just a small section in the &ldquo;proofs&rdquo; of correctness in implementation

-   typing rules of all sorts (which comes by extending the existing code).
    Classify them to illustrate work done.
-   Self-standing properties - probably on ident to kername
-   Many static-semantical properties are given by the coq parser. (such as no
    garbage name/assignments/terms/module contents etc)
-   (?) low-hanging fruits - &ldquo;sanity&rdquo; properties are done.


<a id="org47478da"></a>

# Coq-specific skills learnt

-   Strenghthening of induction hypotheses
-   Concrete sequent calculus and understanding of proof theory
-   Inductive types, mutual inductives, nested induction, induction principles,
    and different levels of recursion (typical, complete, structural,
    well-founded)
-   Coq-specific: tactics, context management, import management etc


<a id="orgb3c036d"></a>

# Future work

-   Verification of the glues.
-   Functors.
-   More typing rules.


<a id="orgdd2cbd2"></a>

# Appendix: Typing Rules, Biblio


