From Coq Require Import Arith ZArith Lia.

Inductive BoolSpecSet (P Q : Prop) : bool -> Set :=
    BoolSpecT : P -> BoolSpecSet P Q true | BoolSpecF : Q -> BoolSpecSet P Q false.

Lemma leb_spec_Set : forall x y : nat, BoolSpecSet (x <= y) (y < x) (x <=? y).
Proof.
  intros.
  destruct (Nat.leb_spec0 x y).
  now constructor.
  constructor. now lia.
Qed.

Lemma nat_rev_ind (max : nat) :
  forall (P : nat -> Prop),
    (forall n, n >= max -> P n) ->
    (forall n, n < max -> P (S n) -> P n) ->
    forall n, P n.
Proof.
  intros P hmax hS.
  assert (h : forall n, P (max - n)).
  { intros n. induction n.
    - apply hmax. lia.
    - destruct (Nat.leb_spec0 max n).
      + replace (max - S n) with 0 by lia.
        replace (max - n) with 0 in IHn by lia.
        assumption.
      + replace (max - n) with (S (max - S n)) in IHn by lia.
        apply hS.
        * lia.
        * assumption.
  }
  intro n.
  destruct (Nat.leb_spec0 max n).
  - apply hmax. lia.
  - replace n with (max - (max - n)) by lia. apply h.
Qed.

Lemma strong_nat_ind :
  forall (P : nat -> Prop),
    (forall n, (forall m, m < n -> P m) -> P n) ->
    forall n, P n.
Proof.
  intros P h n.
  assert (forall m, m < n -> P m).
  { induction n ; intros m hh.
    - lia.
    - destruct (Nat.eqb_spec n m).
      + subst. eapply h. assumption.
      + eapply IHn. lia.
  }
  eapply h. assumption.
Qed.

Lemma Z_of_pos_alt p : Z.of_nat (Pos.to_nat p) = Z.pos p.
Proof.
  induction p using Pos.peano_ind.
  rewrite Pos2Nat.inj_1. reflexivity.
  rewrite Pos2Nat.inj_succ. cbn. f_equal. lia.
Qed.
