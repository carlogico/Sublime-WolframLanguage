(* SYNTAX TEST "WolframLanguage.sublime-syntax" *)

(*
  For information on how this file is used, see
  https://www.sublimetext.com/docs/3/syntax.html#testing
  Run tests by pressing `ctrl+shift+b` (or `cmd+b` on macOS), i.e. run the `build` command
*)

(* NUMBERS *)

  11`
(*^^ constant.numeric *)
(*  ^ constant.numeric.precision *)
  11.`11
(*^^^ constant.numeric *)
(*   ^^^ constant.numeric.precision *)
  .11``
(*^^^ constant.numeric *)
(*   ^^ constant.numeric.accuracy *)
  11.11``
(*^^^^^ constant.numeric *)
(*     ^^ constant.numeric.accuracy *)
  11^^1a
(*^^^^ constant.numeric.base *)
(*    ^^ constant.numeric *)
  11.11*^-11
(*^^^^^ constant.numeric.wolfram *)
(*     ^^^^^ constant.numeric.exponent *)

(* NUMERIC CONSTANTS *)

   Catalan
(* ^ constant.numeric *)
   Pi
(* ^ constant.numeric *)

(* LANGUAGE CONSTANTS *)

   True
(* ^^^^ constant.language *)
   Left
(* ^^^^ constant.language *)

(* OPERATORS *)

  +
(*^ keyword.operator.arithmetic*)
  -
(*^ keyword.operator.arithmetic*)
  /
(*^ keyword.operator.arithmetic*)
  *
(*^ keyword.operator.arithmetic*)
  ^
(*^ keyword.operator.arithmetic*)

  !
(*^ keyword.operator.logical*)
  &&
(*^^ keyword.operator.logical*)
  ||
(*^^ keyword.operator.logical*)

  >
(*^ keyword.operator.comparison*)
  <
(*^ keyword.operator.comparison*)
  ==
(*^^ keyword.operator.comparison*)
  >=
(*^^ keyword.operator.comparison*)
  <=
(*^^ keyword.operator.comparison*)
  ===
(*^^^ keyword.operator.comparison*)
  =!=
(*^^^ keyword.operator.comparison*)

   @
(* ^ keyword.operator.call *)
   @@
(* ^^ keyword.operator.call *)
   @@@
(* ^^^ keyword.operator.call *)
   @*
(* ^^ keyword.operator.call *)
   /*
(* ^^ keyword.operator.call *)
   /@
(* ^^ keyword.operator.call *)
   /;
(* ^^ keyword.operator.condition *)
   //
(* ^^ keyword.operator *)
   /:
(* ^^ keyword.operator *)
   =
(* ^ keyword.operator *)
   :=
(* ^^ keyword.operator *)
   :>
(* ^^ keyword.operator *)
   ->
(* ^^ keyword.operator *)
   <->
(* ^^^ keyword.operator *)


(* VARIABLES *)

  %%%
(*^^^ storage.type.Out *)
  %12
(*^^^ storage.type.Out *)

  f[x]
(*^ variable.function*)
  foo$bar12
(*^^^^^^^^^ variable.other *)
  $foo
(*^^^^ variable.other *)
  my`context12`$foo
(*^^^^ variable.other *)

  Plus
(* ^ variable.function *)
  System`Plus
(*     ^^^ variable.function *)

  Image[Red, Interleaving -> True]
(*^^^^^ variable.function *)
(*      ^ constant.language *)
(*           ^^^^^^^^^^^^ variable.parameter *)
(*                        ^^ keyword.operator *)

  Sum[x, {x, 1, 100}]
(*        ^ variable.parameter *)

  Map[func, list]
(*    ^^^^ variable.function *)

  TakeWhile[list, func]
(*                ^^^^ variable.function *)

  a ~ f ~ b ~ g ~ c
(*    ^ variable.function *)
(*            ^ variable.function *)

(* PATTERNS *)

  _.
(*^^ variable.parameter.default *)

  var_head
(*^^^^^^^^ meta.parameter *)
(*^^^^ variable.parameter *)
(*    ^^^^ variable.parameter.head *)

  var__head : foo
(*         ^ meta.pattern keyword.operator.Optional *)

  var___head ? EvenQ
(*           ^ meta.pattern keyword.operator.PatternTest *)

  var: patt ? EvenQ : foo
(*^^^ variable.parameter *)
(*   ^ keyword.operator.Pattern *)
(*     ^^^^^^^^^^^^ meta.pattern *)
(*     ^^^^ variable.other*)
(*          ^ keyword.operator.PatternTest *)
(*            ^^^^^ variable.function *)
(*                  ^ keyword.operator.Optional *)
(*                    ^^^ variable.other *)


(* FUNCTIONS *)

  f[x_, y_] := 2x
(*^ entity.name.function*)
(* ^ meta.arguments.wolfram punctuation.section.brackets.begin.wolfram *)
(*  ^^ meta.arguments.wolfram meta.pattern.blank.wolfram variable.parameter.wolfram *)
(*    ^^ meta.arguments.wolfram punctuation.separator.sequence.wolfram *)
(*      ^ variable.parameter*)
(*        ^ meta.arguments.wolfram punctuation.section.brackets.end.wolfram *)
(*          ^^ keyword.operator*)

  f[x_, OptionsPattern[]] := 2x
(*^ entity.name.function*)
(*  ^ variable.parameter*)
(*      ^^^^^^^^^^^^^^ variable.function*)
(*                        ^^ keyword.operator*)

  f[x_?TrueQ, y_ /; Negative[y]] := 2x /; y > 0
(*^ entity.name.function*)
(*  ^ variable.parameter*)
(*    ^ keyword.operator*)
(*               ^^ keyword.operator*)


  f[x_, s_] := 2x
(*^ entity.name.function*)
(*  ^ variable.parameter*)

  f[x_] := 2x
(*^ entity.name.function*)
(*  ^ variable.parameter*)

  f[x_] /; x > 0 := x
(*^ entity.name.function  *)

  f = Function[x, x ^ 2]
(*^ entity.name.function *)

  f = # ^ 2 &;
(*^ entity.name.function *)

  f[[]]


(* STRINGS *)

  "This is a `string` (* this is not \a comment*)"
(* ^ string.quoted *)
(*            ^ constant.other.placeholder *)
(*                       ^ string.quoted *)
(*                                    ^ constant.character.escape *)

  foo::bar = "message"
(*   ^^ keyword.operator.MessageName *)
(*     ^^^ string.unquoted *)
(*             ^^ string.quoted *)

  "this`is`a`context"
(*^ punctuation.definition.string.begin *)
(* ^^^^^^^^^^^^^^^^^ string.quoted.wolfram*)


(* COMMENTS *)

(* simple comment *)
(* ^ comment.block *)

(* comment (*in a comment*) *)
(* ^^^^^^^^ comment.block.wolfram *)
(*         ^^^^^^^^^^^^^^^^ comment.block.wolfram comment.block.wolfram *)


(* BRACKETS *)

  <|   |>  foo
(*^^ meta.association.wolfram punctuation.section.association.begin.wolfram  *)
(*   ^ meta.association.wolfram  *)
(*     ^^ meta.association.wolfram punctuation.section.association.end.wolfram *)
(*         ^^^ source.wolfram variable.other *)

  [ ]
(*^ meta.brackets.wolfram punctuation.section.brackets.begin.wolfram *)
(* ^ meta.brackets.wolfram *)
(*  ^ meta.brackets.wolfram punctuation.section.brackets.end.wolfram *)

  { }
(*^ meta.braces.wolfram punctuation.section.braces.begin.wolfram *)
(* ^ meta.braces.wolfram *)
(*  ^ meta.braces.wolfram punctuation.section.braces.end.wolfram *)

  ( )
(*^ meta.parens.wolfram punctuation.section.parens.begin.wolfram *)
(* ^ meta.parens.wolfram *)
(*  ^ meta.parens.wolfram punctuation.section.parens.end.wolfram *)

  [ [ ]]
(*^^^ meta.parts.wolfram punctuation.section.parts.begin.wolfram *)
(*   ^ meta.parts.wolfram *)
(*    ^^ meta.parts.wolfram punctuation.section.parts.end.wolfram *)


(* SCOPING *)

Module[
(*^^^^ variable.function.scoping.wolfram *)
(*    ^ punctuation.section.brackets.begin.wolfram *)
    { foo, bar = 1},
(*   ^ meta.block.local.wolfram *)
(*    ^^^ meta.block.local.wolfram variable.parameter.wolfram *)
(*                  ^ meta.block.wolfram *)
    foo
(*  ^^^ meta.block.wolfram variable.other *)
]

Block[
  {
    var1, (*comment*) var2 , var3 = var4
(*  ^^^^ meta.block.local.wolfram variable.parameter.wolfram *)
(*        ^^^^^^^^^^^ meta.block.local.wolfram comment.block.wolfram *)
(*                    ^^^^ meta.block.local.wolfram variable.parameter.wolfram *)
(*                           ^^^^ meta.block.local.wolfram variable.parameter.wolfram *)
(*                                  ^^^^ meta.block.local.wolfram variable.other*)
  },

  code
(*^^^^ meta.block.wolfram variable.other *)

]


(* ASSERTION FREE *)

  System`foo[[1]]
  a//a
  StringMatchQ[IgnoreCase -> Automatic, foo -> bar]

  foo["bar",  baz_Lisght] :=


(* multiline (* also a comment *)
  comment 
  asd
*)

(* ::s:: *)
