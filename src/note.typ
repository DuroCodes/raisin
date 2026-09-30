#import "config.typ": document-config, in-note

#let note(body) = context {
  let color = document-config.get().color
  block(
    width: 100%,
    inset: (left: 1em, right: 1em, y: 0.8em),
    fill: color.lighten(88%),
    stroke: (left: 2.5pt + color),
    {
      in-note.update(true)
      set par(justify: false)
      body
      in-note.update(false)
    },
  )
}
