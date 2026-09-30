#import "config.typ": break-after-section, current-section, document-config, in-note

// `pagebreak` controls the break after this section. `true` (the default)
// starts the following section on a new page. `false` lets it continue below.
#let section(title, body, pagebreak: true) = {
  current-section.update(title)
  context {
    if break-after-section.get() {
      std.pagebreak(weak: true)
    }
  }
  break-after-section.update(pagebreak)

  context {
    let color = document-config.get().color

    show math.equation: set text(font: "STIX Two Math")

    set par(justify: true)
    set enum(indent: 1em)
    set list(indent: 1em)

    show link: underline
    show link: set text(fill: color)

    show heading: it => context {
      let num-style = it.numbering
      if num-style == none {
        return it
      }

      let num = text(
        weight: "thin",
        numbering(num-style, ..counter(heading).at(here())) + [ \u{200b}],
      )

      // Inside a note, a hanging number is pulled through the accent bar and
      // the paragraph grows wider than the callout. Keep the number inline.
      if in-note.get() {
        block(
          width: 100%,
          breakable: false,
          above: 0.15em,
          below: 0.45em,
        )[
          #set par(justify: false, first-line-indent: 0pt, hanging-indent: 0pt)
          #set text(hyphenate: false)
          #text(fill: color.lighten(25%), weight: "thin", numbering(num-style, ..counter(heading).at(it.location())))
          #h(0.4em)
          #text(fill: color, it.body)
        ]
      } else {
        let x-offset = -1 * measure(num).width

        pad(
          left: x-offset,
          par(hanging-indent: -1 * x-offset, text(fill: color.lighten(25%), num) + [] + text(fill: color, it.body)),
        )
      }
    }

    set heading(numbering: "1.")

    {
      set par(justify: false)
      set text(hyphenate: false)
      pad(
        bottom: 0.5cm,
        align(center, text(fill: color, size: 1.75em, strong(title))),
      )
    }

    body
  }
}
