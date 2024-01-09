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

##### Rows:
- `filter()`: Select rows based on column values
- `slice()`: Select rows based on location
- `arrange()`: Order rows
##### Columns:
- `select()`: Include/Exclude column
- `rename()`: Change column name
- `mutate()`: Create new column
- `relocate()`: Change column order
##### Groups of rows:
- `summarise()`: Group into single row for summary

## Package: tidyr: tidy (Messy Data)

### Documentation: [tidy Package Documentation] (https://cloud.r-project.org/web/packages/tidyr/tidyr.pdf)

#### Additional Data Manipulation: Pivoting, Rectangling, Nesting, Splitting, Combining, Missing values
#### Pivoting
- `pivot_longer()`: Transpose dataset wide to long
- `pivot_wider()`: Transpose dataset long to wide
#### Rectangling (can be used for JSON file formats, metadat programming)
- `unnest_longer`: takes each element in column and creates into rows
- `unnest_wider`: takes each element in list of column and makes new column
- 'hoist()': Apply pivot_wider with selected components
#### Concatenate and Split column 
- `separate_longer_delim()', 'seprate_longer_position()': Split string into rows
- 'separate_wider_delim()', 'separate_wider_position()', separate_wider_regex': Split a string into column
- 'unite()': Combine multiple columns into one

# Updates pending...
#### Missing values https://tidyr.tidyverse.org/reference/index.html
- `mutate()`:
