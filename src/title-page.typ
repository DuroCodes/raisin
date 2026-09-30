#import "config.typ": display-date, document-config, merge

// Full-page cover: rules at the top and bottom, title and meta centered vertically.
#let title-page(
  title,
  subtitle: none,
  author: none,
  course: none,
  date: none,
  color: none,
  size: 24pt,
) = context {
  // Cover sits outside the running header. The outer page style returns
  // when this rule ends, which also starts the body on the next page.
  set page(margin: auto, header: none, footer: none)

  let cfg = merge(
    document-config.at(here()),
    author: author,
    course: course,
    date: date,
    color: color,
  )

  let meta = (cfg.author, cfg.course, display-date(cfg.date)).filter(value => value != none)

  place(top, block(line(length: 100%)))

  align(horizon + left)[
    #text(size: size, fill: cfg.color)[
      #title
      #if subtitle != none [
        #linebreak()
        #text(size: 0.65em, fill: cfg.color.lighten(30%), subtitle)
      ]
    ]
    #if meta.len() > 0 [

      #meta.join([\ ])
    ]
  ]

  place(bottom, block(line(length: 100%)))
}
