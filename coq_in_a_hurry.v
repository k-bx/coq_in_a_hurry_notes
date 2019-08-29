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

Require Import Bool.
Compute if true then 3 else 5.

SearchPattern bool.

Require Import Arith.
Definition is_zero (n:nat) :=
  match n with
    0 => true
  | S p => false
  end.

Print pred.
Print Init.Nat.pred.

Fixpoint sum_n n :=
  match n with
    0 => 0
  | S p => p + sum_n p
  end.

(* Fixpoint rec_bad n := *)
(*   match n with 0 => 0 | S p => rec_bad (S p) end. *)

Fixpoint sum_n2 n s :=
 match n with
   0 => s
 | S p => sum_n2 p (p + s)
 end.

Fixpoint evenb n :=
  match n with
    0 => true
  | 1 => false
  | S (S p) => evenb p
  end.

Require Import List.
Check 1::2::3::nil.
Compute map (fun x => x + 3) (1::3::2::nil).
Compute map S (1::22::3::nil).
Compute let l := (1::2::3::nil) in l ++ map (fun x => x + 3) l.

SearchPattern (nat -> nat -> bool).
Search Nat.eqb.
Locate "_ =? _".

(* Exercise on lists, map, and app Define a function that takes as
input a number n and returns a list with n elements, from 0 to n −
1. *)

Definition head_evb l :=
  match l with nil => false | a::tl => evenb a end.

Fixpoint sum_list l :=
  match l with nil => 0 | n::tl => n + sum_list tl end.

Fixpoint insert n l :=
  match l with
    nil => n::nil
  | a::tl => if n <=? a then n::l else a::insert n tl
  end.
Fixpoint sort l :=
  match l with
    nil => nil
  | a::tl => insert a (sort tl)
  end.
Compute sort (1::4::3::22::5::16::7::nil).

(* Exercise on sorting Define a function that takes a list as input
and returns true when it has less than 2 elements or when the first
element is smaller than or equal to the second one. Then define a
function that takes a list as input and returns true exactly when this
list is sorted (Hint: when the list has at least two elements, the
first element must be smaller than the second element and the tail
must be sorted, use the first function to write the second one). *)

(* Exercise on counting Knowing that the Coq system provides a
function Nat.eqb to compare two natural numbers (Nat.eqb n p returns
true exactly when n = p), define a function count list that takes a
natural number and a list and returns the number of times the natural
number occurs in the list. *)

