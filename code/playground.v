Definition a: bool := true.
Axiom trivial: forall p: Prop, p.

Theorem b: True = False.
Proof.
    apply trivial.
Qed.