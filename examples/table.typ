#import "@local/raisin:1.0.0": colors, config, data-table, note, score, section, title-page

#show: config.with(
  author: [Author Name],
  course: [DEMO 101],
  color: colors.green,
)

#section[Comparison][
  #data-table(
    columns: (1fr, 1fr),
    align: (left, right),
    footer: true,

    ([Item], [Quantity]),
    ([Coffee Beans], [42]),
    ([USB Cables], [18]),
    ([Notebook], [67]),
    ([Headphones], [23]),
    ([Keyboard], [31]),
    ([Webcam], [14]),
    ([Mouse], [56]),
    ([HDMI Cable], [29]),
    ([Phone Charger], [38]),
    ([Total], [318]),
  )
]
