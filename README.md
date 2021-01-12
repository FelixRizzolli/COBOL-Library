# COBOL-Library
 This repository contains several COPIES and program templates that can be very useful for developing COBOL programs.

# Templates

## TPL-BAT1.cob
The program reads information from two files, merges them and creates a report with control break which is written to an output file.


# COPIES
| COPY name | description  |
|-----------|--------------|
| ERRB      | This COPY contains several PICTUREs which are needed for error handling and also in the general program flow. |
| ERRBWS    | This COPY contains standard routines for error handling. |
| IFILEFC   | Standard copy for using an input file in the ENVIROMENT DIVISION -> INPUT-OUTPUT SECTION -> FILE-CONTOL with fixed record length. |
| IFILEFCW  | Standard copy for using an Windows input file in the ENVIROMENT DIVISION -> INPUT-OUTPUT SECTION -> FILE-CONTOL.
| IFILEFD   | Standard copy for using an input file in the DATA DIVISION -> FILE SECTION with a fixed record length.|
| IFILEFDV  | Standard copy for using an input file in the DIVISION -> FILE SECTION with variable record length. |
| IFILEFDW  | Standard copy for using an Windows input file in the DATA DIVISION -> FILE SECTION. |
| IFILESE   | Standard copy with standard routines for using an input file. |
| IFILESED  | Standard copy with standard routines for using an input file with option MISSING DD. |
| IFILEWS   | Standard copy with PICTUREs for using an input file in the DATA DIVISION -> WORKING-STORAGE SECTION for data sets with fixed record length |
| IFILEWSD  | Standard copy with PICTUREs for using an input file in the DATA DIVISION -> WORKING-STORAGE SECTION with option MISSING DD. |
| IFILEWSV  | Standard copy with PICTUREs for using an input file in the DATA DIVISION -> WORKING-STORAGE SECTION for data sets with variable record length |