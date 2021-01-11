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
            ==:V1:== BY ==IFILE001==
            ==:V2:== BY =='IO/IFILE001.txt'==.
       COPY 'LIB/FILE/OFILEFCW.cob' REPLACING 
            ==:V1:== BY ==OFILE001==
            ==:V2:== BY =='IO/OFILE001.txt'==.

      *****************************************************************
       DATA DIVISION.
      *****************************************************************
       FILE SECTION.
      *===============================================================*
       COPY 'LIB/FILE/IFILEFDW.cob' REPLACING 
            ==:V1:== BY ==IFILE001==
            ==:V2:== BY ==80==.
       COPY 'LIB/FILE/OFILEFDW.cob' REPLACING 
            ==:V1:== BY ==OFILE001==
            ==:V2:== BY ==80==.

      *****************************************************************
       WORKING-STORAGE SECTION.
      *===============================================================*
      *---------------------------------------------------------------*
      * INPUT IFILE001                                                *
      *---------------------------------------------------------------*
       COPY 'LIB/FILE/IFILEWS.cob' REPLACING ==:V1:== BY ==IFILE001==.
       01 IFILE001-REC.
        02 IFILE001-DATA            PIC X(7).
           
      *---------------------------------------------------------------*
      * OUTPUT OFILE001                                               *
      *---------------------------------------------------------------*
       COPY 'LIB/FILE/OFILEWS.cob' REPLACING ==:V1:== BY ==OFILE001==.
       01 OFILE001-REC.
        02 OFILE001-DATA            PIC X(7).

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

           PERFORM IFILE001-READ
           PERFORM UNTIL (IFILE001-EOF)
              DISPLAY IFILE001-DATA
              IF (IFILE001-DATA NOT = SPACES) THEN
                 MOVE IFILE001-DATA TO OFILE001-DATA
                 PERFORM OFILE001-WRITE
              END-IF
              PERFORM IFILE001-READ
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
           PERFORM FILE-OPEN-INPUT-IFILE001
           PERFORM FILE-OPEN-OUTPUT-OFILE001

           .
       PGM-INIT-EXIT. EXIT.



      *****************************************************************
       IFILE001-READ SECTION.
      *===============================================================*
           PERFORM FILE-READ-IFILE001
           IF (NOT IFILE001-EOF) THEN
              MOVE IFILE001-RECORD TO IFILE001-REC
           END-IF
           .
       IFILE001-READ-EXIT. EXIT.   


      
      *****************************************************************
       OFILE001-WRITE SECTION.
      *===============================================================*
           MOVE OFILE001-REC TO OFILE001-RECORD
           PERFORM FILE-WRITE-OFILE001
           .
       OFILE001-WRITE-EXIT. EXIT.   
      

           
      *****************************************************************
       PGM-FINISH SECTION.
      *===============================================================*
      
      *---------------------------------------------------------------*
      * CLOSE FILES                                                   *
      *---------------------------------------------------------------*
           PERFORM FILE-CLOSE-IFILE001
           PERFORM FILE-CLOSE-OFILE001
      
      *---------------------------------------------------------------*
      * MESSAGES                                                      *
      *---------------------------------------------------------------*
           DISPLAY 'INPUT IFILE001......: ' IFILE001-COUNT
           DISPLAY 'OUTPUT OFILE001.....: ' OFILE001-COUNT
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
            ==:V1:== BY ==IFILE001==
            ==:V2:== BY =='IO/IFILE001.txt'==.
       COPY 'LIB/FILE/OFILESE.cob' REPLACING 
            ==:V1:== BY ==OFILE001==
            ==:V2:== BY =='IO/OFILE001.txt'==.
      
      *****************************************************************
       END PROGRAM TPL-BAT1.
      *****************************************************************
