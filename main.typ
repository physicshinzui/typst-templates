#import "conf.typ": *
#show: doc => conf(doc)
// =========================
// Useful resources:
// - https://typst.app/docs/reference/math/ 
// - https://typst.app/docs/reference/model/bibliography/
// - https://typst.app/docs/reference/model/figure/

// Examples I should remember later on
// $ bb(b) $
// $ bb(N) = NN $
// $ f: NN -> RR$
// #footnote[This is a footnote.]
// $ bold(v) = vec(1,2,2) in RR^3 $
// $ mat(1, 2; 3, 4) $
// $ A = mat(a_11, a_12, ..., a_(1n); 
//           a_21, a_22, ..., a_(2n); 
//           dots.v, dots.v, dots.down,dots.v; 
//           a_(n 1), a_(n 2), ..., a_(n n)) $ <ex_mat>

//=========Main text===========
#let title = [
 題目, title
]
#let authors = [Shinji Iida]
#align(center, text(20pt, font:"Gothic")[
  *#title*
])
#align(center)[
  #authors
]
#outline()

= section

== Basics
#definition[
  Write a definition. 定義を書いてください。
] <def>

@def can be referred by using `@def`.#footnote[This is a footnote.]

#example("Example name")[
  Write an example
]
#definition[
  2nd definition
]<def2>

#theorem("Euclid")[There are infinitely many primes.
]
#proof[
Write a proof. 
$ y = a x $ <lin_eq>
You can refer to an equation using `@name` like @lin_eq.
]

#corollary[
Put a corollary.
] <cor>

#requirement[
For every object, its motion keeps linear uniform motion.
]

#result[
$m a = F$
]

#theorem[
  There are arbitrarily long stretches of composite numbers.
]
#proof[
  For any $n > 2$, consider $
    n! + 2, quad n! + 3, quad ..., quad n! + n 
  $
]

#theorem()[
  Unicode can be uesd, e.g., $μ = mu$.\
  For more details for math symbols, see #link("https://typst.app/docs/reference/symbols/sym/")[HERE]
]

We can cite like: @2021-iy @Poincare1908-am @Atkins2011-rd

== How to insert a figure
@pigeon shows a pigeion flying in the sky.
#figure(
  image("pigeon_free.png", width: 50%),
  caption: [A pigeion flying],
) <pigeon>

#figure(
  caption: [Timing results],
  table(
    columns: 4,
    [t], [1], [2], [3],
    [y], [0.3s], [0.4s], [0.8s],
  ),
)


#bibliography(title:"References", style:"ieee","paperpile.bib")
