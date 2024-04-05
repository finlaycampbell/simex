*simex*: a disease modelling tool for decision makers
---------------------------------------------------------------

*simex* is an R package for simulating the spread of infectious diseases, as
well as interventions such as social distancing measures, isolation and
vaccination. It uses an age-structured SEIR compartmental model with
country-specific age demographics and contact rates.

Installation
-------------

To install the development version from github:


```r
remotes::install_github("finlaycampbell/simex", dependencies = TRUE, force = TRUE)
```

Load the package using:


```r
library("simex")
```

Running *simex*
-------------

### Parameters and settings

Most settings are specified via the `get_parameters` function. The arguments and
their default values are given below:

<!--html_preserve--><div id="hjroqxjeku" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#hjroqxjeku table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

#hjroqxjeku thead, #hjroqxjeku tbody, #hjroqxjeku tfoot, #hjroqxjeku tr, #hjroqxjeku td, #hjroqxjeku th {
  border-style: none;
}

#hjroqxjeku p {
  margin: 0;
  padding: 0;
}

#hjroqxjeku .gt_table {
  display: table;
  border-collapse: collapse;
  line-height: normal;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#hjroqxjeku .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}

#hjroqxjeku .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#hjroqxjeku .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 3px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#hjroqxjeku .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#hjroqxjeku .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#hjroqxjeku .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#hjroqxjeku .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#hjroqxjeku .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#hjroqxjeku .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#hjroqxjeku .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#hjroqxjeku .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#hjroqxjeku .gt_spanner_row {
  border-bottom-style: hidden;
}

#hjroqxjeku .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}

#hjroqxjeku .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#hjroqxjeku .gt_from_md > :first-child {
  margin-top: 0;
}

#hjroqxjeku .gt_from_md > :last-child {
  margin-bottom: 0;
}

#hjroqxjeku .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#hjroqxjeku .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}

#hjroqxjeku .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}

#hjroqxjeku .gt_row_group_first td {
  border-top-width: 2px;
}

#hjroqxjeku .gt_row_group_first th {
  border-top-width: 2px;
}

#hjroqxjeku .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#hjroqxjeku .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}

#hjroqxjeku .gt_first_summary_row.thick {
  border-top-width: 2px;
}

#hjroqxjeku .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#hjroqxjeku .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#hjroqxjeku .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#hjroqxjeku .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}

#hjroqxjeku .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#hjroqxjeku .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#hjroqxjeku .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#hjroqxjeku .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#hjroqxjeku .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#hjroqxjeku .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#hjroqxjeku .gt_left {
  text-align: left;
}

#hjroqxjeku .gt_center {
  text-align: center;
}

#hjroqxjeku .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#hjroqxjeku .gt_font_normal {
  font-weight: normal;
}

#hjroqxjeku .gt_font_bold {
  font-weight: bold;
}

#hjroqxjeku .gt_font_italic {
  font-style: italic;
}

#hjroqxjeku .gt_super {
  font-size: 65%;
}

#hjroqxjeku .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}

#hjroqxjeku .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}

#hjroqxjeku .gt_indent_1 {
  text-indent: 5px;
}

#hjroqxjeku .gt_indent_2 {
  text-indent: 10px;
}

#hjroqxjeku .gt_indent_3 {
  text-indent: 15px;
}

#hjroqxjeku .gt_indent_4 {
  text-indent: 20px;
}

#hjroqxjeku .gt_indent_5 {
  text-indent: 25px;
}
</style>
<table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <thead>
    
    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Argument">Argument</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Description">Description</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Default value">Default value</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td headers="Argument" class="gt_row gt_left">iso3</td>
<td headers="Description" class="gt_row gt_left">The ISO3 code of the country used to draw age-distributions and contact rates from.</td>
<td headers="Default value" class="gt_row gt_left">"USA"</td></tr>
    <tr><td headers="Argument" class="gt_row gt_left">R0</td>
<td headers="Description" class="gt_row gt_left">The basic reproduction number.</td>
<td headers="Default value" class="gt_row gt_left">2.5</td></tr>
    <tr><td headers="Argument" class="gt_row gt_left">generation_time</td>
<td headers="Description" class="gt_row gt_left">The mean generation time in days.</td>
<td headers="Default value" class="gt_row gt_left">7</td></tr>
    <tr><td headers="Argument" class="gt_row gt_left">incubation_period</td>
<td headers="Description" class="gt_row gt_left">The mean incubation period in days.</td>
<td headers="Default value" class="gt_row gt_left">3</td></tr>
    <tr><td headers="Argument" class="gt_row gt_left">infectiousness_presymp</td>
<td headers="Description" class="gt_row gt_left">Relative infectiousness of presymptomatic cases to symptomatic cases.</td>
<td headers="Default value" class="gt_row gt_left">0.25</td></tr>
    <tr><td headers="Argument" class="gt_row gt_left">frac_symp</td>
<td headers="Description" class="gt_row gt_left">The proportion of cases that eventually develop symptoms.</td>
<td headers="Default value" class="gt_row gt_left">0.8</td></tr>
    <tr><td headers="Argument" class="gt_row gt_left">ifr</td>
<td headers="Description" class="gt_row gt_left">Infection fatality rate provided either as a single value or as a vector of the same length as the number of age categories. Use the function 'age_to_ifr' to calculate a COVID-like IFR from a vector of ages.</td>
<td headers="Default value" class="gt_row gt_left">age_to_ifr(get_age_median())</td></tr>
    <tr><td headers="Argument" class="gt_row gt_left">hosp_mortality</td>
<td headers="Description" class="gt_row gt_left">The probability of death given a case is admitted to hospital, either as a single value or as a vector of the same length as the number of age categories. The inverse of the number of cases admitted to hospital per death.</td>
<td headers="Default value" class="gt_row gt_left">1/seq(20, 5, length = 16)</td></tr>
    <tr><td headers="Argument" class="gt_row gt_left">hosp_protection_death</td>
<td headers="Description" class="gt_row gt_left">Given a case requires hospitalisation, the proportion of deaths admission to hospital averts.</td>
<td headers="Default value" class="gt_row gt_left">0.75</td></tr>
    <tr><td headers="Argument" class="gt_row gt_left">hosp_duration</td>
<td headers="Description" class="gt_row gt_left">The mean duration of stay in the hospital in days, either as a single value or as a vector of the same length as the number of age categories.</td>
<td headers="Default value" class="gt_row gt_left">seq(7, 21, length = 16)</td></tr>
    <tr><td headers="Argument" class="gt_row gt_left">hosp_capacity</td>
<td headers="Description" class="gt_row gt_left">Total hospital bed capacity given as a proportion of the population.</td>
<td headers="Default value" class="gt_row gt_left">0.0025</td></tr>
    <tr><td headers="Argument" class="gt_row gt_left">comm_mortality</td>
<td headers="Description" class="gt_row gt_left">The probability of death of cases that remain in the community, either as a single value or as a vector of the same length as the number of age categories.</td>
<td headers="Default value" class="gt_row gt_left">0</td></tr>
    <tr><td headers="Argument" class="gt_row gt_left">vax_rate</td>
<td headers="Description" class="gt_row gt_left">The daily rate of vaccination as a proportion of the population.</td>
<td headers="Default value" class="gt_row gt_left">0</td></tr>
    <tr><td headers="Argument" class="gt_row gt_left">vax_infectiousness</td>
<td headers="Description" class="gt_row gt_left">The reduction (as a proportion) in infectioussness of an individual due to vaccination.</td>
<td headers="Default value" class="gt_row gt_left">0.3</td></tr>
    <tr><td headers="Argument" class="gt_row gt_left">vax_infection</td>
<td headers="Description" class="gt_row gt_left">The protection (as a proportion) against infection provided by vaccination.</td>
<td headers="Default value" class="gt_row gt_left">0.5</td></tr>
    <tr><td headers="Argument" class="gt_row gt_left">vax_hosp</td>
<td headers="Description" class="gt_row gt_left">The protection (as a proportion) against hospitalisation provided by vaccination, given infection.</td>
<td headers="Default value" class="gt_row gt_left">0.5</td></tr>
    <tr><td headers="Argument" class="gt_row gt_left">vax_death</td>
<td headers="Description" class="gt_row gt_left">The protection (as a proportion) against death provided by vaccination, given hospitalisation.</td>
<td headers="Default value" class="gt_row gt_left">0.8</td></tr>
    <tr><td headers="Argument" class="gt_row gt_left">isolation_adherence</td>
<td headers="Description" class="gt_row gt_left">The proportion of symptomatic individuals that adhere to isolation measures.</td>
<td headers="Default value" class="gt_row gt_left">0</td></tr>
    <tr><td headers="Argument" class="gt_row gt_left">isolation_effectiveness</td>
<td headers="Description" class="gt_row gt_left">The reduction in daily transmission potential of a given individual due to adherence to isolation measures.</td>
<td headers="Default value" class="gt_row gt_left">0.8</td></tr>
    <tr><td headers="Argument" class="gt_row gt_left">isolation_delay</td>
<td headers="Description" class="gt_row gt_left">The mean delay from symptom onset to isolation in days.</td>
<td headers="Default value" class="gt_row gt_left">3</td></tr>
    <tr><td headers="Argument" class="gt_row gt_left">social_distancing</td>
<td headers="Description" class="gt_row gt_left">A named vector of length 4 containing the proportion reduction in contacts due to social distancing of 'home', 'school', 'work' and 'other'.</td>
<td headers="Default value" class="gt_row gt_left">c(home = 0, school = 0, work = 0, other = 0)</td></tr>
    <tr><td headers="Argument" class="gt_row gt_left">vax_prioritised</td>
<td headers="Description" class="gt_row gt_left">A logical indicating whether older age groups are vaccinated first.</td>
<td headers="Default value" class="gt_row gt_left">TRUE</td></tr>
    <tr><td headers="Argument" class="gt_row gt_left">hosp_prioritised</td>
<td headers="Description" class="gt_row gt_left">A logical indicating whether older age groups are hospitalised first when hospital capacity is exceeded.</td>
<td headers="Default value" class="gt_row gt_left">TRUE</td></tr>
  </tbody>
  
  
</table>
</div><!--/html_preserve-->

### Running default settings

To run the model using default settings, specify a parameter object `par` and
feed this into the `run_model` function.


```r
## set parameters using defaults
pars <- get_parameters()

## run model using default parameters
output <- run_model(pars)

## look at output
print(output)
```

```
## 
##  [Simex Object]
##  - Days: 1 to 365
##  - Age Categories: age_1 to age_16
##  - Compartments: S_u | E_u | C_u | H_u | R_u | D_u | S_v | E_v | C_v | H_v | R_v | D_v
```

The `output` object is of class `simex` and is a list containing four items:

* `prevalance` is an array with 3 dimensions: time (365 days) x age (16
  categories) x state (12 compartments). The compartments are S (susceptible), E
  (exposed, pre-symptomatic), C (symptomatic in community), H (sympomatic in
  hospital), R (recovered), D (dead). Each comparment is split into unvaccinated
  (with subscript _u) and vaccinated (with subscript _v). Each value in the
  array represents the proportion of the population in that given age-disease
  compartment on a given day.
* `deltas` is an array with the same dimensions as `prevalence`. Each value
  represents the change in a given age-disease compartment from the previous
  day.
* `incidence` is an array with the same dimensions as `prevalence`. Each value
  represents the new additions to a given age-disease comparment on a given
  day. For the exposed category E, this represents incidence of new infections,
  for the hospitalised category H this represents new hospital admissions, and
  for the dead category D this represents new deaths.
* `pars` contains the parameter set initially fed into `run_model`.

To visualise the results, use the generic `plot` function defined for the
`simex` class. Below, we first visualise prevalence and then incidence,
specified using the `what` argument.


```r
## visualise prevalence
plot(output, what = "prevalence")
```

<div class="figure" style="text-align: center">
<img src="figure/unnamed-chunk-5-1.png" alt="plot of chunk unnamed-chunk-5"  />
<p class="caption">plot of chunk unnamed-chunk-5</p>
</div>

```r
## visualise incidence
plot(output, what = "incidence")
```

<div class="figure" style="text-align: center">
<img src="figure/unnamed-chunk-5-2.png" alt="plot of chunk unnamed-chunk-5"  />
<p class="caption">plot of chunk unnamed-chunk-5</p>
</div>

The outputs can be extracted in `tibble` form using the `extract` function, once
again using the `what` argument to specify whether prevalence or incidence is
extracted. 


```r
## extract prevalence
extract(output, what = "prevalence")
```

```
## # A tibble: 4,380 × 4
##      day compartment vax          value
##    <dbl> <fct>       <lgl>        <dbl>
##  1     1 S           FALSE 1.00        
##  2     1 E           FALSE 0           
##  3     1 C           FALSE 0.0000000469
##  4     1 H           FALSE 0           
##  5     1 R           FALSE 0           
##  6     1 D           FALSE 0           
##  7     1 S           TRUE  0           
##  8     1 E           TRUE  0           
##  9     1 C           TRUE  0           
## 10     1 H           TRUE  0           
## # ℹ 4,370 more rows
```

### Modelling a single intervention

We use vaccination as an example intervention. Referencing the table above, we
can see that vaccination rate is specified using the `vax_rate` argument and
set it to 0.5% of the population per day.


```r
## define vaccination rate
pars <- get_parameters(vax_rate = 0.005)

## run model
output <- run_model(pars)

## visualise prevalence
plot(output)
```

<div class="figure" style="text-align: center">
<img src="figure/unnamed-chunk-7-1.png" alt="plot of chunk unnamed-chunk-7"  />
<p class="caption">plot of chunk unnamed-chunk-7</p>
</div>

We can see that the daily increase in number of vaccinated individuals, as
well as the impact on infection and disease severity.


### Specifying an initial state

The default initial state begins with an entirely susceptible, unvaccinated
population and a single infection. We can also specify a custom initial state by
passing a matrix specifying the number of individuals in each age-infection
compartment. In the example below, we extract the initial state from the
previous run, and modify the compartments so half the susceptible population is
assigned to the vaccinated compartment.


```r
## extract starting point from previous run
state <- output$prevalence[1,,]

## assign half of susceptibles to vaccinated
state[,"S_u"] <- state[,"S_v"] <- state[,"S_u"]/2

## run model
output <- run_model(pars, init_state = state)

## visualise prevalence
plot(output)
```

<div class="figure" style="text-align: center">
<img src="figure/unnamed-chunk-8-1.png" alt="plot of chunk unnamed-chunk-8"  />
<p class="caption">plot of chunk unnamed-chunk-8</p>
</div>

We can see that the simulation now begins with a 50% vaccinated population,
significantly reducing the size and impact of the pandemic.

### Timed interventions, multiple interventions

Sometime we only want to introduce interventions at a certain time, or we want
to model multiple, successive interventions. We can do this easily by generating
a named list of parameters, where the name gives the time that parameter set
should be used from. In the example below, we introduce isolation measures with
an adherence of 50% on the 125th day.


```r
## introduce isolation on the 125th day
parlist <- list(
  "1" = get_parameters(),
  "125" = get_parameters(isolation_adherence = 0.5)
)

## run model
output <- run_model(parlist)

## visualise prevalence
plot(output)
```

<div class="figure" style="text-align: center">
<img src="figure/unnamed-chunk-9-1.png" alt="plot of chunk unnamed-chunk-9"  />
<p class="caption">plot of chunk unnamed-chunk-9</p>
</div>

Comparing this figure with the first model run with no interventions, we can see
the proportion of deaths drops from about 0.7% to 0.4%; a reduction in deaths of
more than 40%!

### Comparing scenarios

It is useful to directly compare different scenarios visually. The
`vis_comarison` function does exactly this, and accepts a named list of `simex`
objects. In the example below, we generate a named list of lists that compares
the default scenario (no interventions) with the a scenario where isolation is
introduced on the 125th day.
	

```r
## define two scenarios, one without intervention and one with isolation
parlists <- list(
  "No intervention" = get_parameters(),
  "Isolation on day 125" = list(
    "1" = get_parameters(),
    "125" = get_parameters(isolation_adherence = 0.5)
  )
)

## run model across set of parameter lists
outputs <- lapply(parlists, run_model)

## compare scenarios
vis_comparison(outputs)
```

<div class="figure" style="text-align: center">
<img src="figure/unnamed-chunk-10-1.png" alt="plot of chunk unnamed-chunk-10"  />
<p class="caption">plot of chunk unnamed-chunk-10</p>
</div>

Contributors
------------
- [Finlay Campbell](https://github.com/finlaycampbell) (campbellf@who.int)
- Prabasaj Paul (ppaul@who.int)

**Maintainer:** Finlay Campbell