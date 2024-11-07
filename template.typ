#import "@preview/metro:0.1.0": *
#import "@preview/tenv:0.1.1": parse_dotenv

#let env = parse_dotenv(read(".env"))

#let report(body) = {
  let serif = (
    "Times New Roman",
    "Noto Serif CJK JP",
  )
  let sans = (
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
