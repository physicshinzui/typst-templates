#import "book-template.typ": *
#show: doc => conf(
  title: "Template, テンプレ",
  author: "Shinji Iida",
  toc: true,
  lang: "en",
  font: "New Computer Modern", // "Hiragino Kaku Gothic Pro",
  bibliography-file: "../paperpile.bib", 
  doc
)

// =========================
// Useful resources:
// - https://typst.app/docs/reference/math/ 
// - https://typst.app/docs/reference/model/bibliography/
// - https://typst.app/docs/reference/model/figure/

//=========Main text===========

= section
== Basics
#definition[
  Write a definition. 定義(definition)を書いてください。
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
#lemma[Ito lemma][

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

#claim[
We can cite like: @2021-iy @Poincare1908-am @Atkins2011-rd
]
#remark[
  I remark here.
]
== How to insert a figure
@pigeon shows a pigeion flying in the sky.
#figure(
  image("../pigeon_free.png", width: 50%),
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


