#import "@preview/tenv:0.1.1": parse_dotenv
#import "@preview/codelst:2.0.2": sourcecode, sourcefile

#let env = parse_dotenv(read(".env"))

#let report(body) = {
  let serif = (
    "Times New Roman",
    "Noto Serif CJK JP",
  )
  let sans = (
    "Noto Sans CJK JP",
  )
  set text(
    11pt,
    font: serif,
    lang: "ja",
    region: "JP",
  )
  set page(
    paper: "a4",
    margin: (
      bottom: 1.75cm,
      top: 2.5cm,
      left: 2.5cm,
      right: 2.5cm,
    ),
  )
  set par(
    first-line-indent: (amount: 1em, all: true),
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

  show math.equation: set text(font: ("New Computer Modern Math",) + serif, lang: "ja")
  show math.equation.where(block: true): e => [
    #box(
      width: 100%,
      inset: 0em,
      [
        #set align(center)
        #e
      ],
    )
  ]

  show "、": "，"
  show "。": "．"

  body
}

#let reportTop(
  title: "",
  submit-date: "",
  body,
) = {
  align(
    right,
    [
      提出日: #submit-date\
      学籍番号: #env.AUTHOR_ID\
      #env.AUTHOR_AFFILIATION　#env.AUTHOR_NAME
    ],
  )
  align(left, text(15pt)[#title])
  v(15pt)
  body
}

#let reportCover(
  title: "",
  subtitle: "",
  lecture-name: "",
  body,
) = {
  align(
    right,
    text()[
      #text[提出日: ]#datetime.today().display("[year]年[month]月[day]日")
    ],
  )
  v(150pt)
  align(
    center,
    text(16pt)[
      #lecture-name
    ],
  )
  align(
    center,
    text(24pt)[
      *#title*
    ],
  )
  v(1fr)
  align(right)[
    #table(
      columns: (auto, auto),
      align: (right, left),
      stroke: none,
      [学籍番号], [#env.AUTHOR_ID],
      [所属], [#env.AUTHOR_AFFILIATION],
      [氏名], [#env.AUTHOR_NAME],
    )
  ]
  pagebreak()

  body
}
