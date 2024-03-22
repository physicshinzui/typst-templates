// This code is helpful to modify template: 
// https://github.com/avonmoll/ifacconf-typst/blob/main/lib.typ
#let conf(
  title: none,
  authors: (),
  abstract: [],
  keywords: [],
  bib: none,
  heading-numbering: none,
  is-supporting-info: false,
  doc,
) = {

  set text(font: "New Computer Modern")
  set align(center)
  text(17pt, title)

  let count = authors.len()
  let ncols = calc.min(count, 3)
  grid(
    columns: (1fr,) * ncols,
    row-gutter: 24pt,
    ..authors.map(author => [
      #author.name \
      #author.affiliation \
      #link("mailto:" + author.email)
    ]),
  )
  
  if abstract != none{
    par(justify: true)[
      *Abstract* \
      #abstract
    ]
  }
  set align(left)
  // columns(1, doc)
  show par: set block(spacing: 0.65em)
  set par(
    first-line-indent: 2em,
    justify: true)

  // Configure equation numbering and spacing.
  set math.equation(numbering: "(1)")
  // show math.equation: set block(spacing: 0.65em)

  // Configure headings.
  if is-supporting-info == true {
    heading-numbering = "A.1"
  }
  set heading(numbering: heading-numbering)
  
  doc
  bibliography(bib, title: "References", style: "ieee")
}

#import "@preview/ctheorems:1.1.0": *
#let ifacconf-rules(doc) = { 
  show bibliography: set block(spacing: 5pt)
  show: thmrules
  doc
}

// Support for numbered Theorems, etc.
// NOTE: these definitions may be able to be cleaned up and compressed in the future
#let theorem = thmenv(
  "theorem",
  none,
  none,
  (name, number, body, ..args) => {
    set align(left)
    set par(justify: true)
    block(inset: 0mm, radius: 0mm, breakable: false, width: 100%)[_Theorem #number#if name != none [ (#name)]._#h(2pt)#body]
  },
).with(
  supplement: "Theorem",
  )

#let lemma = thmenv(
  "lemma",
  none,
  none,
  (name, number, body, ..args) => {
    set align(left)
    set par(justify: true)
    block(inset: 0mm, radius: 0mm, breakable: false, width: 100%)[_Lemma #number#if name != none [ (#name)]._#h(2pt)#body]
  },
).with(
  supplement: "Lemma",
  )

#let claim = thmenv(
  "claim",
  none,
  none,
  (name, number, body, ..args) => {
    set align(left)
    set par(justify: true)
    block(inset: 0mm, radius: 0mm, breakable: false, width: 100%)[_Claim #number#if name != none [ (#name)]._#h(2pt)#body]
  },
).with(
  supplement: "Claim",
  )

#let conjecture = thmenv(
  "conjecture",
  none,
  none,
  (name, number, body, ..args) => {
    set align(left)
    set par(justify: true)
    block(inset: 0mm, radius: 0mm, breakable: false, width: 100%)[_Conjecture #number#if name != none [ (#name)]._#h(2pt)#body]
  },
).with(
  supplement: "Conjecture",
  )

#let corollary = thmenv(
  "corollary",
  none,
  none,
  (name, number, body, ..args) => {
    set align(left)
    set par(justify: true)
    block(inset: 0mm, radius: 0mm, breakable: false, width: 100%)[_Corollary #number#if name != none [ (#name)]._#h(2pt)#body]
  },
).with(
  supplement: "Corollary",
  )

#let fact = thmenv(
  "fact",
  none,
  none,
  (name, number, body, ..args) => {
    set align(left)
    set par(justify: true)
    block(inset: 0mm, radius: 0mm, breakable: false, width: 100%)[_Fact #number#if name != none [ (#name)]._#h(2pt)#body]
  },
).with(
  supplement: "Fact",
  )

#let hypothesis = thmenv(
  "hypothesis",
  none,
  none,
  (name, number, body, ..args) => {
    set align(left)
    set par(justify: true)
    block(inset: 0mm, radius: 0mm, breakable: false, width: 100%)[_Hypothesis #number#if name != none [ (#name)]._#h(2pt)#body]
  },
).with(
  supplement: "Hypothesis",
  )

#let proposition = thmenv(
  "proposition",
  none,
  none,
  (name, number, body, ..args) => {
    set align(left)
    set par(justify: true)
    block(inset: 0mm, radius: 0mm, breakable: false, width: 100%)[_Proposition #number#if name != none [ (#name)]._#h(2pt)#body]
  },
).with(
  supplement: "Proposition",
  )

#let criterion = thmenv(
  "criterion",
  none,
  none,
  (name, number, body, ..args) => {
    set align(left)
    set par(justify: true)
    block(inset: 0mm, radius: 0mm, breakable: false, width: 100%)[_Criterion #number#if name != none [ (#name)]._#h(2pt)#body]
  },
).with(
  supplement: "Criterion",
  )

#let proof = thmbox(
  "proof",
  "Proof",
  inset: 0mm,
  base: none,
  bodyfmt: body => [#body #h(1fr) $square$],
  separator: [.#h(2pt)]
).with(numbering: none)
