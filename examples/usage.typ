#import "@local/raisin:1.0.0": colors, config, note, section, title-page

#show: config.with(
  author: [Ada Lovelace],
  course: [CSCI 6767],
  color: colors.maroon,
)

#title-page([Paper Title], subtitle: [A short subtitle])

#section([Introduction])[
  = Background

  Body text.

  #note[
    == Aside
    A callout. Headings inside a note stay inside the box.
  ]
]

// `pagebreak` controls the break after this section.
#section(pagebreak: false)[Appendix][
  Continues on the same page.
]
