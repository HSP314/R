library(haven) # Read SAS data
library(dplyr) # Manipulate data
library(tidyr) # Manipulate data
library(r2rtf) # Reporting in RTF format
library(table1)
library(stringr)
library(tools)

# Set the working directory to the directory containing your file
setwd("/Users/Documents/R_Programming") #add location for output file

adsl <- read_sas("/Users/Documents/R_Programming/adsl.sas7bdat")
adsl <- data.frame(adsl)

head(adsl)

# Now you have a new dataset containing only the rows where actarm is not missing
adsl1 <- adsl #%>%
# Add additional filters if needed such as population/subbroups
#  filter(ARMNRS != "SCREEN FAILURE")

head(adsl1)



ana <- adsl1 %>%
  mutate(
    SEX = factor(SEX, c("F", "M"), c("Female", "Male")),
    RACE = toTitleCase(tolower(RACE))
  )

tbl <- table1(~ SEX + AGE + RACE | TRT01P, data = ana)
tbl

tbl_base <- tbl %>%
  as.data.frame() %>%
  as_tibble() %>%
  mutate(across(
    everything(),
    ~ str_replace_all(.x, intToUtf8(160), " ")
  ))


names(tbl_base) <- str_replace_all(names(tbl_base), intToUtf8(160), " ")
tbl_base



colheader1 <- paste(names(tbl_base), collapse = "|")
colheader2 <- paste(tbl_base[1, ], collapse = "|")
rel_width <- c(2.5, rep(1, 4))

tbl_base[-1, ] %>%
  rtf_title(
    "Baseline Characteristics of Participants",
    "(All Participants Randomized)"
  ) %>%
  rtf_colheader(colheader1,
                col_rel_width = rel_width
  ) %>%
  rtf_colheader(colheader2,
                border_top = "",
                col_rel_width = rel_width
  ) %>%
  rtf_body(
    col_rel_width = rel_width,
    text_justification = c("l", rep("c", 4)),
    text_indent_first = -240,
    text_indent_left = 180
  ) %>%
 rtf_encode() %>%
write_rtf("/Users/Documents/R_Programming/tlf_base.rtf")


tlf_base