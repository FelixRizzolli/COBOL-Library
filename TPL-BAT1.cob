       IDENTIFICATION DIVISION.
       PROGRAM-ID. TPL-BAT1.
      *****************************************************************
      * TPL-BAT1: TEMPLATE FOR COBOL BATCH-PROGRAMMS WITH I/O         *
      *===============================================================*
      * VERSION: V01.00.00 - 08.01.2021 - 11:45 / URIZF               *
      *===============================================================*
      * IN THIS TEMPLATE, RECORDS FROM A TEXT FILE ARE READ IN,       * 
      * PROCESSED, AND THE PROCESSED RECORDS ARE WRITTEN TO AN OUTPUT * 
      * file.                                                         *                                                  
      *                                                               *
      * INPUT:                                                        *
      * ======                                                        *
      *                                                               *
      * OUTPUT:                                                       *
      * =======                                                       *
      *                                                               *
      * PROCERSSING:                                                  *
      * ============                                                  *
      *                                                               *
      *===============================================================*
      * AUTHOR: FELIX RIZZOLLI (FR)                        08.01.2021 *
      *===============================================================*
      * CHANGES:                                                      *
      *---------------------------------------------------------------*
      * XX000-V00.00.00            NN                      DD.MM.YYYY *
      *---------------------------------------------------------------*
      *===============================================================*
      * COPYRIGHT: FELIX RIZZOLLI                                     *
      *****************************************************************
       ENVIRONMENT DIVISION.
      *****************************************************************
       CONFIGURATION SECTION.
      *===============================================================*
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

      *****************************************************************
       INPUT-OUTPUT SECTION.
      *===============================================================*

       FILE-CONTROL.
      *---------------------------------------------------------------*
       COPY 'LIB/FILE/IFILEFCW.cob' REPLACING 
            ==:V1:== BY ==ICOMP==
            ==:V2:== BY =='IO/companies.txt'==.
       COPY 'LIB/FILE/IFILEFCW.cob' REPLACING 
            ==:V1:== BY ==ISABB==
            ==:V2:== BY =='IO/stateabb.txt'==.
       COPY 'LIB/FILE/OFILEFCW.cob' REPLACING 
            ==:V1:== BY ==OREPORT==
            ==:V2:== BY =='IO/OREPORT.txt'==.

      *****************************************************************
       DATA DIVISION.
      *****************************************************************
       FILE SECTION.
      *===============================================================*
       COPY 'LIB/FILE/IFILEFDW.cob' REPLACING 
            ==:V1:== BY ==ICOMP==
            ==:V2:== BY ==80==.
       COPY 'LIB/FILE/IFILEFDW.cob' REPLACING 
            ==:V1:== BY ==ISABB==
            ==:V2:== BY ==80==.
       COPY 'LIB/FILE/OFILEFDW.cob' REPLACING 
            ==:V1:== BY ==OREPORT==
            ==:V2:== BY ==80==.

      *****************************************************************
       WORKING-STORAGE SECTION.
      *===============================================================*
      *---------------------------------------------------------------*
      * INPUT ICOMP = COMPANIES GROWTH TABLE                          *
      *---------------------------------------------------------------*
       COPY 'LIB/FILE/IFILEWS.cob' REPLACING ==:V1:== BY ==ICOMP==.
       01 ICOMP-REC.
           05 ICOMP-NAME               PIC X(38).
           05 ICOMP-STATE              PIC X(2).
           05 ICOMP-INDUSTRY           PIC X(23).
           05 ICOMP-GROWTH             PIC 9(5).
          
      *---------------------------------------------------------------*
      * INPUT ISABB = USA STATE ABBREVITATIONS TABLE                  *
      *---------------------------------------------------------------*
       COPY 'LIB/FILE/IFILEWS.cob' REPLACING ==:V1:== BY ==ISABB==.
       01 ISABB-REC.
           05 ISABB-ABB                  PIC X(2).
           05 ISABB-STATE                PIC X(14).
           05 FILLER                     PIC X(64).
           
      *---------------------------------------------------------------*
      * OUTPUT OREPORT                                                *
      *---------------------------------------------------------------*
       COPY 'LIB/FILE/OFILEWS.cob' REPLACING ==:V1:== BY ==OREPORT==.
       01 OREPORT-REC.
           05 OREPORT-DATA            PIC X(80).
           
      *-[ HEADINGS ]--------------------------------------------------*
       01 OREPORT-H1.
           05 FILLER                  PIC X(3)    VALUE '-> '.
           05 OREPORT-H1-INDUSTRY     PIC X(23).
           05 FILLER                  PIC X(54)   VALUE SPACES.
        
       01 OREPORT-H2.
           05 OREPORT-H2-COMPANY      PIC X(7)    VALUE 'COMPANY'.
           05 FILLER                  PIC X(32)   VALUE ALL SPACES.
           05 OREPORT-H2-STATE        PIC X(5)    VALUE 'STATE'.
           05 FILLER                  PIC X(10)   VALUE ALL SPACES.
           05 OREPORT-H3-INDUSTRY     PIC X(6)    VALUE 'GROWTH'.     
           05 FILLER                  PIC X(23)   VALUE SPACES.
           
      *-[ HORIZONTAL ROW ]--------------------------------------------*
       01 OREPORT-HR1.
           05 FILLER                  PIC X(80)   VALUE ALL '='.  
           
       01 OREPORT-HR2.
           05 FILLER                  PIC X(80)   VALUE ALL '-'.  
        
      *-[ RECORD ]----------------------------------------------------*
       01 OREPORT-R1.
           05 OREPORT-R1-COMPANY      PIC X(38).
           05 FILLER                  PIC X(1)    VALUE SPACES.
           05 OREPORT-R1-STATE        PIC X(14).
           05 FILLER                  PIC X(1)    VALUE SPACES.
           05 OREPORT-R1-GROWTH       PIC Z.ZZ9,9.
           05 FILLER                  PIC X(1)    VALUE '%'.
           05 FILLER                  PIC X(18)   VALUE SPACES.
           
      *-[ FOOTER ]----------------------------------------------------*
       01 OREPORT-F1.
           05 FILLER                  PIC X(52)   VALUE SPACES.
           05 FILLER      PIC X(10)   VALUE ALL '-'.
           05 FILLER                  PIC X(18)   VALUE SPACES.
           
       01 OREPORT-F2.
           05 FILLER                  PIC X(52)   VALUE SPACES.
           05 OREPORT-F2-TGROWTH      PIC ZZZ.ZZ9,9.
           05 FILLER                  PIC X(1)    VALUE '%'.
           05 FILLER                  PIC X(18)   VALUE SPACES.
 
      *---------------------------------------------------------------*
      * TABLES                                                        *
      *---------------------------------------------------------------* 
       01 STATE-ABBREVITATIONS.
           05 TAB-SABB-MAX            PIC S9(9) BINARY.
           05 TAB-SABB-DIM            PIC S9(9) BINARY  VALUE 99.
           05 TAB-SABB                OCCURS 1   TO           99
                                      DEPENDING  ON  TAB-SABB-MAX.
                10 TAB-SABB-ABB       PIC X(2).
                10 TAB-SABB-STATE     PIC X(14).
                                      
                                
      
      *---------------------------------------------------------------*
      * TEMPORARY                                                     *
      *---------------------------------------------------------------* 
       01 COUNTER.
           05 TMP-I-TABLE             PIC S9(9) BINARY.
           
       01 TOTALS.
           05 TMP-TOTAL-GROWTH        PIC 9(7).
           
       01 SWITCHES.
           05 TMP-SW-INDUSTRY         PIC X(23).
      
      *---------------------------------------------------------------*
      * COPIES                                                        *
      *---------------------------------------------------------------*
       COPY 'LIB/ERR/ERRBWS.cob'.

      *****************************************************************
       PROCEDURE DIVISION.
      *****************************************************************
       MAIN SECTION.
      *===============================================================*
           PERFORM PGM-INIT

           PERFORM ICOMP-READ
           PERFORM UNTIL (ICOMP-EOF)
              PERFORM INDUSTRY-INIT
              PERFORM UNTIL (ICOMP-EOF) 
                         OR (ICOMP-INDUSTRY NOT = TMP-SW-INDUSTRY)
                PERFORM INDUSTRY-PROC
                PERFORM ICOMP-READ
              END-PERFORM
              PERFORM INDUSTRY-END
           END-PERFORM.

           PERFORM PGM-END
           .
       MAIN-EXIT. EXIT.



      *****************************************************************
       PGM-INIT SECTION.
      *===============================================================*
      
      *---------------------------------------------------------------*
      * INITIALIZE VARIABLES                                          *
      *---------------------------------------------------------------*
           MOVE 'TPL-BAT1'                           TO PGM-NAME
           MOVE 'TEMPLATE FOR COBOL BATCH-PROGRAMMS WITH I/O' 
             TO PGM-DESCRIPTION
      *    END-MOVE
           MOVE ZERO                                 TO PGM-END-RC
      
      *---------------------------------------------------------------*
      * OPEN FILES                                                    *
      *---------------------------------------------------------------*
           PERFORM FILE-OPEN-INPUT-ICOMP
           PERFORM FILE-OPEN-INPUT-ISABB
           PERFORM FILE-OPEN-OUTPUT-OREPORT
           
      *---------------------------------------------------------------*
      * IMPORT STATE ABBREVITATIONS                                   *
      *---------------------------------------------------------------*
           PERFORM ISABB-READ
           PERFORM VARYING TMP-I-TABLE FROM 1 BY 1
                     UNTIL (ISABB-EOF)
              ADD  1           TO TAB-SABB-MAX
              IF (TAB-SABB-MAX > TAB-SABB-DIM)
                 MOVE '999'                      TO PGM-ERR-RC
                 MOVE 'TABLE OVERFLOW: TAB-SABB' TO PGM-ERR-MSG1
                 PERFORM PGM-ERR
              END-IF 
              
              MOVE ISABB-ABB   TO TAB-SABB-ABB(TAB-SABB-MAX)
              MOVE ISABB-STATE TO TAB-SABB-STATE(TAB-SABB-MAX)
              
              PERFORM ISABB-READ
           END-PERFORM
           
           .
       PGM-INIT-EXIT. EXIT.



      *****************************************************************
       INDUSTRY-INIT SECTION.
      *===============================================================*
           MOVE ICOMP-INDUSTRY   TO OREPORT-H1-INDUSTRY
           MOVE ICOMP-INDUSTRY   TO TMP-SW-INDUSTRY
      
      *---------------------------------------------------------------*
      * WRITE HEADINGS                                                *
      *---------------------------------------------------------------*
           IF (OREPORT-COUNT NOT = 0) THEN
              MOVE SPACES        TO OREPORT-REC
              PERFORM OREPORT-WRITE
           END-IF.
      
           MOVE OREPORT-H1       TO OREPORT-REC
           PERFORM OREPORT-WRITE
           
           MOVE OREPORT-HR1      TO OREPORT-REC
           PERFORM OREPORT-WRITE
           
           MOVE OREPORT-H2       TO OREPORT-REC
           PERFORM OREPORT-WRITE
           
           MOVE OREPORT-HR2      TO OREPORT-REC
           PERFORM OREPORT-WRITE
           
           .
       INDUSTRY-INIT-EXIT. EXIT.
      *****************************************************************
       INDUSTRY-PROC SECTION.
      *===============================================================*
           MOVE ICOMP-NAME       TO OREPORT-R1-COMPANY
           MOVE ICOMP-GROWTH     TO OREPORT-R1-GROWTH
           ADD  ICOMP-GROWTH     TO TMP-TOTAL-GROWTH
           
      *    SEARCH STATE
           MOVE SPACES           TO OREPORT-R1-STATE
           PERFORM VARYING TMP-I-TABLE FROM 1 BY 1
                     UNTIL (TMP-I-TABLE > TAB-SABB-MAX)
             IF (TAB-SABB-ABB(TMP-I-TABLE) = ICOMP-STATE) THEN
                MOVE TAB-SABB-STATE(TMP-I-TABLE) TO OREPORT-R1-STATE
             END-IF
           END-PERFORM
           IF (OREPORT-R1-STATE = SPACES) THEN
              MOVE ICOMP-STATE   TO OREPORT-R1-STATE
           END-IF
           
           
      *---------------------------------------------------------------*
      * WRITE RECORD                                                  *
      *---------------------------------------------------------------*
           MOVE OREPORT-R1       TO OREPORT-REC
           PERFORM OREPORT-WRITE
           
           .
       INDUSTRY-PROC-EXIT. EXIT.
      *****************************************************************
       INDUSTRY-END SECTION.
      *===============================================================*
           MOVE TMP-TOTAL-GROWTH TO OREPORT-F2-TGROWTH
           MOVE ZEROES           TO TMP-TOTAL-GROWTH
      
      *---------------------------------------------------------------*
      * WRITE FOOTER                                                  *
      *---------------------------------------------------------------*
           MOVE OREPORT-F1       TO OREPORT-REC
           PERFORM OREPORT-WRITE
           
           MOVE OREPORT-F2       TO OREPORT-REC
           PERFORM OREPORT-WRITE
           .
       INDUSTRY-END-EXIT. EXIT.



      *****************************************************************
       ICOMP-READ SECTION.
      *===============================================================*
           PERFORM FILE-READ-ICOMP
           IF (NOT ICOMP-EOF) THEN
              MOVE ICOMP-RECORD TO ICOMP-REC
           END-IF
           .
       ICOMP-READ-EXIT. EXIT.   
      *****************************************************************
       ISABB-READ SECTION.
      *===============================================================*
           PERFORM FILE-READ-ISABB
           IF (NOT ISABB-EOF) THEN
              MOVE ISABB-RECORD TO ISABB-REC
           END-IF
           .
       ISABB-READ-EXIT. EXIT.   


      
      *****************************************************************
       OREPORT-WRITE SECTION.
      *===============================================================*
           MOVE OREPORT-REC TO OREPORT-RECORD
           PERFORM FILE-WRITE-OREPORT
           .
       OREPORT-WRITE-EXIT. EXIT.   
      

           
      *****************************************************************
       PGM-FINISH SECTION.
      *===============================================================*
      
      *---------------------------------------------------------------*
      * CLOSE FILES                                                   *
      *---------------------------------------------------------------*
           PERFORM FILE-CLOSE-ICOMP
           PERFORM FILE-CLOSE-ISABB
           PERFORM FILE-CLOSE-OREPORT
      
      *---------------------------------------------------------------*
      * MESSAGES                                                      *
      *---------------------------------------------------------------*
           DISPLAY 'INPUT ICOMP.........: ' ICOMP-COUNT
           DISPLAY 'INPUT ISABB.........: ' ISABB-COUNT
           DISPLAY 'OUTPUT OREPORT......: ' OREPORT-COUNT
           MOVE FUNCTION CURRENT-DATE TO PGM-DATE
           DISPLAY PGM-NAME ' ENDE.......: '
             PGM-DATE(1:4) '.' PGM-DATE(5:2) '.' PGM-DATE(7:2) ' '
             PGM-DATE(9:2) ':' PGM-DATE(11:2) ':' PGM-DATE(13:2) ' '
      *    END-DISPLAY
           .
       PGM-FINISH-EXIT. EXIT.



      *****************************************************************
       PGM-END SECTION.
      *===============================================================*
           PERFORM PGM-FINISH.
           IF (PGM-END-RC > '004') THEN
              DISPLAY 'ERROR'
           ELSE
              PERFORM DISPLAY-PGM-END
              MOVE PGM-END-RC TO RETURN-CODE
           END-IF
           GOBACK
           .
       PGM-END-EXIT. EXIT.

      *****************************************************************
      * COPIES                                                        *
      *===============================================================*
       COPY 'LIB/ERR/ERRB'.
       COPY 'LIB/FILE/IFILESE.cob' REPLACING 
            ==:V1:== BY ==ICOMP==
            ==:V2:== BY =='IO/companies.txt'==.
       COPY 'LIB/FILE/IFILESE.cob' REPLACING 
            ==:V1:== BY ==ISABB==
            ==:V2:== BY =='IO/stateabb.txt'==.
       COPY 'LIB/FILE/OFILESE.cob' REPLACING 
            ==:V1:== BY ==OREPORT==
            ==:V2:== BY =='IO/OREPORT.txt'==.
      
      *****************************************************************
       END PROGRAM TPL-BAT1.
      *****************************************************************
