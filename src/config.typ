#import "colors.typ": maroon

#let document-config = state("document-config", (
  author: none,
  course: none,
  date: datetime.today(),
  color: maroon,
))

// Running header title. `none` hides the header and footer (title page).
#let current-section = state("document-template-section", none)

// True while laying out a note, so headings stay inside the callout.
#let in-note = state("document-template-in-note", false)

// Whether the section that just finished should be followed by a page break.
// Starts true so the first section still clears the title page.
#let break-after-section = state("document-template-break-after", true)

#let merge(base, ..extra) = {
  let result = (:)
  for (key, value) in base.pairs() {
    result.insert(key, value)
  }

  for (key, value) in extra.named() {
    if value != none {
      result.insert(key, value)
    }
  }

  result
}

#let display-date(date) = if date == none {
  none
} else if type(date) == datetime {
  date.display()
} else {
  date
}

#let line-of(value) = if value != none [#value \ ]

// One page style for the whole document. Section titles live in
// `current-section`, so later sections can continue on the same page
// without `set page` inserting another break.
#let with-pages(body) = {
  set page(
    margin: (top: 3.5cm, bottom: 3cm),
    header: context {
      let title = current-section.get()
      if title != none {
        let cfg = document-config.get()
        let shown-date = display-date(cfg.date)
        set text(size: 0.75em)
        table(
          columns: (1fr, auto, 1fr),
          align: top,
          stroke: none,
          inset: 0pt,
          [
            #line-of(cfg.course)
            #line-of(shown-date)
          ],
          [],
          align(top + right)[
            #line-of(title)
            #line-of(cfg.author)
          ],
        )
        v(-0.5em)
        line(length: 100%)
      }
    },
    footer: context {
      if current-section.get() != none {
        set text(size: 0.75em)
        line(length: 100%)
        v(-0.5em)
        align(center)[
          #counter(page).display()
          \/
          #counter(page).final().first()
        ]
      }
    },
  )

  body
}

#let config(
  body,
  author: none,
  course: none,
  date: none,
  color: none,
) = {
  document-config.update(current => merge(
    current,
    author: author,
    course: course,
    date: date,
    color: color,
  ))
  with-pages(body)
}
