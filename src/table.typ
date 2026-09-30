#import "config.typ": document-config

// Score above its weighted contribution. Useful in any scoring matrix.
#let score(value, weighted) = align(center)[
  #text(weight: "bold")[#value] \
  #text(size: 0.78em, fill: luma(115))[#weighted]
]

#let data-table(columns: auto, footer: false, align: left, inset: (x: 0.7em, y: 0.5em), ..cells) = context {
  let color = document-config.at(here()).color
  let items = cells.pos().map(item => if type(item) == array { item } else { (item,) }).flatten()
  let count = if type(columns) == array { columns.len() } else { columns }
  let header = items.slice(0, count)
  let rest = items.slice(count)
  let body = rest
  let foot = ()
  if footer {
    body = rest.slice(0, rest.len() - count)
    foot = rest.slice(rest.len() - count)
  }

  let emphasize(cell) = text(fill: color, weight: "bold", cell)
  let rows = items.len() / count

  table(
    columns: columns,
    align: align,
    inset: inset,
    stroke: (x, y) => (
      bottom: 0.6pt + if y == 0 or (footer and y == rows - 1) { black } else { black.lighten(60%) },
    ),
    table.header(..header.map(emphasize)),
    ..body,
    ..if footer { (table.footer(..foot.map(emphasize)),) } else { () },
  )
}
