# COBOL-Library
 This repository contains several COPIES and program templates that can be very useful for developing COBOL programs.

# Templates

## TPL-BAT1.cob - Control Break
The program reads information from two files, merges them and creates a report with control break which is written to an output file.

## TPL-BAT1.cob - Cobol Report Writer
Implements the same program logic as TPL-BAT1.cob with the COBOL Report Writer.

# COPIES

## Error handling
| COPY name | description  |
|-----------|--------------|
| ERRB      | This COPY contains several PICTUREs which are needed for error handling and also in the general program flow. |
| ERRBWS    | This COPY contains standard routines for error handling. |

## IO

### Input
| COPY name | description  |
|-----------|--------------|
| IFILEFC   | Standard copy for using an input file in the ENVIROMENT DIVISION -> INPUT-OUTPUT SECTION -> FILE-CONTOL with fixed record length. |
| IFILEFCW  | Standard copy for using an Windows input file in the ENVIROMENT DIVISION -> INPUT-OUTPUT SECTION -> FILE-CONTOL. |
| IFILEFD   | Standard copy for using an input file in the DATA DIVISION -> FILE SECTION with a fixed record length. |
| IFILEFDV  | Standard copy for using an input file in the DIVISION -> FILE SECTION with variable record length. |
| IFILEFDW  | Standard copy for using an Windows input file in the DATA DIVISION -> FILE SECTION. |
| IFILESE   | Standard copy with standard routines for using an input file. |
| IFILESED  | Standard copy with standard routines for using an input file with option MISSING DD. |
| IFILEWS   | Standard copy with PICTUREs for using an input file in the DATA DIVISION -> WORKING-STORAGE SECTION for data sets with fixed record length. |
| IFILEWSD  | Standard copy with PICTUREs for using an input file in the DATA DIVISION -> WORKING-STORAGE SECTION with option MISSING DD. |
| IFILEWSV  | Standard copy with PICTUREs for using an input file in the DATA DIVISION -> WORKING-STORAGE SECTION for data sets with variable record length. |


### Output
| COPY name | description  |
|-----------|--------------|
| OFILEFC   | Standard copy for using an output file in the ENVIROMENT DIVISION -> INPUT-OUTPUT SECTION -> FILE-CONTOL. |
| OFILEFCW  | Standard copy for using an Windows output file in the ENVIROMENT DIVISION -> INPUT-OUTPUT SECTION -> FILE-CONTOL. |
| OFILEFD   | Standard copy for using an output file in the DATA DIVISION -> FILE SECTION with a fixed record length. |
| OFILEFDV  | Standard copy for using an output file in the DIVISION -> FILE SECTION with variable record length. |
| OFILEFDW  | Standard copy for using an Windows output file in the DATA DIVISION -> FILE SECTION. |
| OFILESE   | tandard copy with standard routines for using an output file. |
| OFILEWS   | Standard copy with PICTUREs for using an output file in the DATA DIVISION -> WORKING-STORAGE SECTION for data sets with fixed record length. |
| OFILEWSV  | Standard copy with PICTUREs for using an output file in the DATA DIVISION -> WORKING-STORAGE SECTION for data sets with variable record length. |

### COBOL Report Writer
| COPY name | description  |
|-----------|--------------|
| CREPO1CA  | Contains the variable declaration for communication area of the subprogram CREPO1. |
| CREPO1SE  | Contains several functions for working with the COBOL Report Writer. |
| CREPO1WS  | Contains several copys and variable declarations which are useful for working with the COBOL Report Writer. |

# Subprograms
| Subprogram name | description  |
|-----------------|--------------|
| CREPO1          | Contains several functions for working with the COBOL Report Writer |