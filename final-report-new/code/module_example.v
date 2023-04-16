Inductive nat :=
| O
| S : nat -> nat.

Fixpoint plus (n m: nat) :=
    match n with
    | S n' => S (plus n' m)
    | O => m
    end.

(* A magma is a set with a binary (closed) operation. *)
Module Type Magma.
    Parameter T: Set.
    Parameter op: T -> T -> T.
End Magma.


(* Natural numbers with plus form a magma. *)
Module Nat: Magma.
    Definition T := nat.
    Definition op := plus.
End Nat.

Module Type M := Magma.
Module MyNat: M := Nat.

(* A functor transforming a magma into another magma. *)
Module DoubleMagma (M: Magma): Magma.
    Definition T := M.T.
    Definition op x y := M.op (M.op x y) (M.op x y).
End DoubleMagma.

Module NatWithDoublePlus := DoubleMagma Nat.
