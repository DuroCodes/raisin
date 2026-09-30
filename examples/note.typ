#import "@local/raisin:1.0.0": colors, config, data-table, note, score, section, title-page

#show: config.with(
  author: [Author Name],
  course: [DEMO 101],
  color: colors.green,
)

#section[Note][
  #note[This is a note, it can have some content.]

  = Lorem

  #note[
    == Ipsum

    Notes can also have headings.

    #lorem(50)
  ]
]
