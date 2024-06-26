#' Plot timeline of prevalence or incidence.
#'
#' @param simex The solved system of equations as returned by \code{run_model}.
#'
#' @param what What to plot: one of "prevalence" (number in each category per
#'   day), "deltas" (change in prevalence from one day to the next) and
#'   "incidence" (new additions to that compartment per day).
#'
#' @param format One of "timeline" (shows a timeline stratified by compartment
#'   and vaccination status) or "endpoint" (shows the final value stratified by
#'   age category).
#'
#' @param log Logical indicating whether a log scale should be used.
#'
#' @param freescales Logical indicating whether the different comparments should
#'   use different y-axes.
#'
#' @param show_hosp_capacity Logical indicating whether hospital capacity should be
#'   displayed in the "H" compartment (only possible when what = "prevalence").
#'
#' @param use_absolute_numbers Logical indicating whether absolute absolute
#'   numbers (in terms of individuals) should be shown or relative to population
#'   size.
#'
#' @param show_compartment The compartment to show when using \code{format = "endpoint"}.
#'
#' @param base_size Base size passed to theme_*
#'
#' @author Finlay Campbell
#'
#' @importFrom stringr str_to_title
#'
#' @export
#'
plot.simex <- function(simex,
                       what = c("prevalence", "deltas", "incidence"),
                       format = c("timeline", "endpoint"),
                       log = FALSE,
                       freescales = TRUE,
                       show_hosp_capacity = TRUE,
                       use_absolute_numbers = FALSE,
                       show_compartment = c("D", "S", "E", "C", "H", "R"),
                       base_size = 11) {

  ## check arguments
  what <- match.arg(what)
  format <- match.arg(format)
  show_compartment <- match.arg(show_compartment)

  ## get population
  pop <- sum(simex$pars[[1]]$population)

  ## get hospital capacity
  hosp_capacity <- simex$pars[[1]]$hosp_capacity
  if(use_absolute_numbers) hosp_capacity <- hosp_capacity * pop

  ## category labels
  cat <- c(S = "Susceptible", E = "Exposed", C = "Community Infection",
           H = "Hospital Infection", R = "Recovered", D = "Dead")

  if(format == "timeline") {

    ## extract relevant data
    df <- extract(simex, what, stratify_by = c("day", "vax", "compartment"))

    ## define horizontal line for hospital capacity if needed
    hline <-
      if(what == "prevalence" & show_hosp_capacity)
        geom_hline(
          data = tibble(
            compartment = factor("H", levels(df$compartment)),
            y = hosp_capacity
          ),
          aes(yintercept = y),
          color = "grey",
          linewidth = 1.5
        )
      else NULL

    ## plot
    df %>%
      ggplot(aes(day, if(use_absolute_numbers) value*pop else value, linetype = vax)) +
      hline +
      geom_line(linewidth = 1.5) +
      facet_wrap(
        ~ compartment,
        scales = ifelse(freescales, "free_y", "fixed"),
        labeller = labeller(compartment = cat)
      ) +
      scale_y_continuous(
        expand = expansion(mult = c(0.01, 0.05)),
        trans = ifelse(log, "log10", "identity"),
        labels = if(use_absolute_numbers) waiver() else percent
      ) +
      scale_linetype(name = "Vaccinated") +
      labs(x = "Day", y = str_to_title(what)) +
      theme_minimal(base_size = base_size) +
      theme(
        legend.position = 'bottom',
        plot.background = element_rect(fill = "white")
      )

  } else if(format == "endpoint") {

    ## define age groupings
    groupings <- list(
      "0-14" = paste0("age_", 1:3),
      "15-34" = paste0("age_", 4:7),
      "35-64" = paste0("age_", 8:13),
      "65+" = paste0("age_", 14:16)
    )
    groupings <- unlist(unname(imap(groupings, ~ setNames(rep(.y, length(.x)), .x))))

    ## extract relevant data
    extract(simex, what, stratify_by = c("day", "compartment", "age")) %>%
      filter(day == max(day) & compartment == show_compartment) %>%
      arrange(age) %>%
      mutate(
        age_frac = simex$pars[[1]]$age_frac[age],
        age = fct_inorder(groupings[as.character(age)])
      ) %>%
      group_by(age) %>%
      summarise(
        value = if(use_absolute_numbers) sum(value)*pop else sum(value)/sum(age_frac)
      ) %>%
      ggplot(aes(age, value)) +
      geom_col() +
      scale_x_discrete(labels = get_age_cat()) +
      scale_y_continuous(
        expand = expansion(mult = c(0.01, 0.05)),
        labels = if(use_absolute_numbers) waiver() else function(x) percent(x, 0.001)
      ) +
      labs(
        x = "Age category",
        y = ifelse(use_absolute_numbers, "Number of deaths", "Proportion of population that died")
      ) +
      theme_minimal(base_size = base_size) +
      theme(
        plot.background = element_rect(fill = "white")
      )

  }

}
