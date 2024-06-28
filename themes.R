require(ggplot2)

custom_theme <- function(
    colour="black", face="bold", family="helvetica", size=ggplot2::rel(4),
    legend.direction="horizontal", legend.position="top", strip_size=ggplot2::rel(3),
    legend_text_size=ggplot2::rel(2), panel_fill="#E2E2E3", grid_colour="white"
    ) {
  ggplot2::theme(
    text=ggplot2::element_text(colour=colour, face=face, family=family, size=size),
    axis.text.x=ggplot2::element_text(angle=45, hjust=1, colour=colour, face=face, family=family, size=size),
    strip.background=ggplot2::element_blank(),
    strip.text=ggplot2::element_text(colour=colour, face=face, family=family, size=strip_size),
    legend.direction=legend.direction,
    legend.position=legend.position,
    # panel.background = ggplot2::element_rect(fill=panel_fill),
    panel.background=ggplot2::element_blank(),
    panel.grid=ggplot2::element_line(colour = grid_colour),
    legend.text=ggplot2::element_text(colour=colour, face=face, family=family, size=legend_text_size),
    plot.background=ggplot2::element_rect(fill='transparent', color=NA), #transparent plot bg
    legend.background=ggplot2::element_rect(fill='transparent'), #transparent legend bg
    legend.box.background=ggplot2::element_rect(fill='transparent') #transparent legend panel
  )
}
