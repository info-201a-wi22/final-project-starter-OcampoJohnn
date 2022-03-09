# Final tab
report_tab <- tabPanel(
  "Report",
  fluidRow(
    column(
      12,
      includeMarkdown("./docs/report.md")
    )
  )
)
