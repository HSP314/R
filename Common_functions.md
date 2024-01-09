# Common Functions for Generating Tables, Listings, and Figures in R

The list of functions below contains commonly used functions for generating tables, listings, and figures in R. Additional functions can be referenced in package documentation.

## Package: haven (Import and Export 'SPSS,' 'Stata,' and 'SAS' Files)

### Documentation: [haven Package Documentation](https://cloud.r-project.org/web/packages/haven/haven.pdf)

#### Reading and Writing Functions
- `read_sas()`: Read SAS file
- `read_xpt()`: Read XPT file
- `write_xpt()`: Write XPT file

#### Addressing Missing/NA Values for R Dataframes
- `tagged_na()`: Converts various missing data values to binary

## Package: dplyr (A Grammar of Data Manipulation)

### Documentation: [dplyr Package Documentation](https://cloud.r-project.org/web/packages/dplyr/dplyr.pdf)

#### Common Data Manipulation Functions
- `mutate()`: Add new variables into an existing dataset; various sub-functions to create new variables
- `select()`: Select variables based on names from the dataset
- `filter()`: Filter the dataset based on conditions; sub-functions include: by, group_by, operators (>, >=, ==, &, is.na(), between(), etc.)
- `summarise()`: Create descriptive summaries; sub-functions include: mean, median, sd, IQR, mad, min, max, first, last, nth, n, d_distinct, any, all
- `arrange()`: Sort the dataset based on conditions; sub-functions include: by_group, desc (sort descending)
