Definition a: bool := true.
Axiom trivial: forall p: Prop, p.

Theorem b: True = False.
Proof.
    apply trivial.
Qed.

Module Type M.
    Module N. End N.
End M.

Module Mod. End Mod.

Module Type M' := M with Module N := Mod.
