Lemma trans_lookup_module
  {cf} {Σ} {cst: kername} m {wfΣ : Typing.wf Σ}:
  (* If cst refers to a module m in the environment Σ, *)
  Ast.Env.lookup_env Σ cst = Some (Ast.Env.ModuleDecl m)
  (* Then one cannot find cst in the translated
  environment. *)
  -> lookup_env (trans_global_env Σ) cst = None.
Proof.
  destruct Σ as [univs decls retro].
  intros H.
  cbn -[fold_right].