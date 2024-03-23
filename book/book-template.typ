// ======== Preamble =========
#import "@preview/ctheorems:1.1.2": *

// Define my template as a function `conf`
#let conf(
  title: "Title",
  author: "Authors",
  date: datetime.today().display(),
  lang: "en",
  font: "New Computer Modern",
  toc: false, 
  bibliography-file: none,
  doc,
  ) = { 
  // For Styling
  if lang == "en" {
    font = font
  } else {
    font = font
  }
  set text(lang:lang, font:font, size:11pt)
  set heading(numbering: "1.")
  set page(numbering: "1")
  // #show link: underline

  // text(lang:"ja", font:"YuMincho", size:11pt) 

  align(center, text(20pt, font:"Gothic")[
    *#title*
  ])
  align(center)[
    #author \
    #date
  ]

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
  
  if toc == true {
    outline()
  }
  
  doc

  // Put this after `doc`
  bibliography(title:"References", style:"ieee", bibliography-file)

}

// For theorem environement
#let theorem = thmbox("theorem", "Theorem", fill: rgb("#eeffee"))
#let proposition = thmbox("proposition", "Proposition", fill: rgb("#eeffee"))
#let lemma = thmbox("lemma", "Lemma", fill: rgb("#eeffee"))
#let corollary = thmplain("corollary", "Corollary", titlefmt: strong)
#let definition = thmbox("definition", "Definition",fill: luma(245)).with(numbering: "1.")
#let example = thmplain("example", "Example").with(numbering: "1.")
#let proof = thmproof("proof", "Proof")
#let claim = thmbox("claim", "Claim").with(numbering: none)
#let remark = thmbox("remark", "Remark").with(numbering: none)

// For Physics environment
#let requirement = thmbox("requirement", "Requirement", fill: rgb("#eeffee"))
#let result = thmbox("result", "Result", fill: rgb("#eeffee"))
#let derivation = thmproof("derivation", "Derivation")