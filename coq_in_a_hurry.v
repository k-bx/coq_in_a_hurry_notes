(* Notes from "Coq in a Hurry" *)

Check False.

Check 3.

Check (3+4).

Check (3=5).

Check (3,4).

Check ((3=5)/\True).

Check nat -> Prop.

Check (3 <= 6).

Locate "_ <= _".

Compute let f := fun x => (x * 3, x) in f 3.

(*
Definition example1 := fun x : nat => x*x+2*x+1.
*)

Definition example1 (x : nat) := x*x+2*x+1.
Check example1.
Compute example1 1.

