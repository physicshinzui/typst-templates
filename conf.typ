// ======== Preamble =========
#import "@preview/ctheorems:1.1.2": *

#let conf(doc) = { 
  // For Styling
  // set text(lang:"ja", font:"YuMincho",  size:11pt) 
  set text(lang:"en", font: "New Computer Modern", size:11pt)
  set heading(numbering: "1.")
  set page(numbering: "1")
  // #show link: underline

  // For Equation's behaviour 
  set math.equation(numbering: "(1)", supplement: [Eq])

  // For theorem environment : https://typst.app/universe/package/ctheorems
  show: thmrules.with(qed-symbol: $square$)

  // For matrix and vector expression
  set math.vec(delim: "[") 
  set math.mat(delim: "[") 

  // Figure 
  // #set figure
  // #show figure.caption: emph
  show figure.where(
    kind: table
  ): set figure.caption(position: top)

  // === Code === 
  // Reference: https://typst.app/docs/reference/text/raw/
  // Display inline code in a small box
  // that retains the correct baseline.
  show raw.where(block: false): box.with(
    fill: luma(240),
    inset: (x: 3pt, y: 0pt),
    outset: (y: 3pt),
    radius: 2pt,
  )
  // Display block code in a larger block
  // with more padding.
  show raw.where(block: true): block.with(
    fill: luma(240),
    inset: 10pt,
    radius: 4pt,
  )
  doc
}

// For theorem environement
#let theorem = thmbox("theorem", "Theorem", fill: rgb("#eeffee"))
#let proposition = thmbox("proposition", "Proposition", fill: rgb("#eeffee"))
#let corollary = thmplain("corollary", "Corollary", titlefmt: strong)
#let definition = thmbox("definition", "Definition",fill: luma(245)).with(numbering: "1.")
#let example = thmplain("example", "Example").with(numbering: "1.")
#let proof = thmproof("proof", "Proof")

// For Physics environment
#let requirement = thmbox("requirement", "Requirement", fill: rgb("#eeffee"))
#let result = thmbox("result", "Result", fill: rgb("#eeffee"))
#let derivation = thmproof("derivation", "Derivation")