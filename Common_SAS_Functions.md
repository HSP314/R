/* Importing and Exporting SAS Files using haven-like functions */

/* Read SAS file */
proc import datafile="path/to/sas_dataset.sas7bdat" 
            out=my_data dbms=sas replace;
run;

/* Read XPT file */
proc xport in="path/to/xpt_dataset.xpt" out=my_data replace;
run;

/* Write XPT file */
proc export data=my_data outfile="path/to/output.xpt" dbms=xport replace;
run;

/* Addressing Missing/NA Values for SAS Data */

/* Convert various missing data values to binary */
data my_data;
  set my_data;
  tagged_na = (Age = .);
run;

/* Common Data Manipulation Functions using dplyr-like syntax */

/* Add new variables into an existing dataset */
data my_data;
  set my_data;
  new_variable = expression;
run;

/* Select variables based on names from the dataset */
data my_data;
  set my_data (keep=var1 var2);
run;

/* Filter the dataset based on conditions */
data my_data;
  set my_data;
  if condition;
run;

/* Create descriptive summaries */
proc means data=my_data;
  var var1 var2;
run;

/* Sort the dataset based on conditions */
proc sort data=my_data out=sorted_data;
  by variable;
run;

/* Rows: Select rows based on column values */
data my_data;
  set my_data;
  if condition;
run;

/* Rows: Select rows based on location */
data my_data;
  set my_data;
  if _n_ in (1, 2, 3);
run;

/* Rows: Order rows */
proc sort data=my_data out=sorted_data;
  by variable;
run;

/* Columns: Include/Exclude columns */
data my_data;
  set my_data (keep=var1 var2);
run;

/* Columns: Change column name */
data my_data;
  set my_data;
  rename old_column = new_column;
run;

/* Columns: Create new column */
data my_data;
  set my_data;
  new_column = expression;
run;

/* Columns: Change column order */
data my_data;
  set my_data;
  retain new_column order_variable;
run;

/* Groups of rows: Group into a single row for summary */
proc summary data=my_data nway;
  class variable;
  var var1 var2;
  output out=summary_data mean= mean_var1 mean_var2;
run;

/* Additional Data Manipulation using tidyr-like functions (Note: tidyr is not directly available in SAS) */

/* Transpose dataset wide to long */
data long_data;
  set wide_data;
  array var_array(*) var1 var2 var3; /* Specify all variables to be transposed */
  do i = 1 to dim(var_array);
    variable_name = vname(var_array(i));
    variable_value = var_array(i);
    output;
  end;
run;

/* Transpose dataset long to wide */
proc transpose data=long_data out=wide_data prefix=var;
  by ID;
  var variable_value;
run;

/* Rectangling - takes each element in column and creates into rows (Not directly available in SAS) */

/* Rectangling - takes each element in list of column and makes a new column (Not directly available in SAS) */

/* Concatenate and Split column */

/* Split string into rows (Not directly available in SAS) */

/* Split a string into column (Not directly available in SAS) */

/* Combine multiple columns into one (Not directly available in SAS) */
