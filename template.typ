#import "@preview/metro:0.3.0": *
#import "@preview/tenv:0.1.1": parse_dotenv
#import "@preview/codelst:2.0.2": sourcecode, sourcefile

#let env = parse_dotenv(read(".env"))

#let report(body) = {
  let serif = (
    "Times New Roman",
    "Noto Serif",
    "Noto Serif CJK JP",
  )
  let sans = (
    "Noto Sans",
    "Noto Sans CJK JP"
  )
  set text(
    11pt,
    font: serif,
    lang: "ja",
    region: "JP"
  )
  set page(
    paper: "a4",
    margin: (
      bottom: 1.75cm, top: 2.5cm,
      left: 2.5cm, right: 2.5cm
    ),
  )
  set par(
    first-line-indent: 1em,
    justify: true,
    leading: 1em,
  )

  show heading: it => {
    set text(font: sans, lang: "ja")
    set block(above: 1.5em, below: 1em)
    it
    v(-1em)
    box()
  }

  show "、": "，"
  show "。": "．"

  body

}

#let reportCover(
  title: "",
  subtitle: "",
  lecture-name: "",
  author-id: "",
  author-affiliation: "",
  author-name: "",
  body
) = {
  align(right, text()[
    #text[提出日: ]#datetime.today().display("[year]年[month]月[day]日")
  ])
  v(150pt)
  align(center, text(16pt)[
    #lecture-name
  ])
  align(center, text(24pt)[
    *#title*
  ])
  v(1fr)
  align(right)[
    #table(
      columns:(auto, auto),
      align: (right, left),
      stroke: none,
      [学籍番号],[#author-id],
      [所属],[#author-affiliation],
      [氏名],[#author-name]
    )
  ]
  pagebreak()

  body

}
