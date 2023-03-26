Inductive nat: Set :=
| O
| S : nat -> nat.

Definition zero : nat := O.

Fixpoint plus (n m: nat) : nat :=
    match n with
    | S n' => S (plus n' m)
    | O => m
    end.

Proposition zero_is_left_additive_identity : Prop:
    forall n: nat, plus zero n = n.
Proof.
    intro n.
    simpl.
    reflexivity.
Qed.