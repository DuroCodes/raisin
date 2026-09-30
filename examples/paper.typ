#import "@local/raisin:1.0.0": colors, config, note, section, title-page

#show: config.with(
  author: [Author Name],
  course: [DEMO 101],
  color: colors.purple,
)

#title-page([Paper Title], subtitle: [A short subtitle])

#section(pagebreak: false)[Introduction][
  = Background

  #lorem(55)

  #note[
    == Aside
    #lorem(22)
  ]

  == Detail

  #lorem(35)
]

#section[Appendix][
  #lorem(28)
]
