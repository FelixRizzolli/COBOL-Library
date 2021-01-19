       IDENTIFICATION DIVISION.                                        
       PROGRAM-ID. CREPO1.                                            
      *****************************************************************
      * TPL-BAT1: TEMPLATE FOR COBOL BATCH-PROGRAMMS WITH I/O         *
      *===============================================================*
      * VERSION: V01.00.00 - 13.01.2021 - 10:30 / URIZF               *
      *===============================================================*
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
      * AUTHOR: FELIX RIZZOLLI (FR)                        13.01.2021 *
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
      *===============================================================*
       INPUT-OUTPUT SECTION.                                            
      *===============================================================*
      
       FILE-CONTROL.           
      *---------------------------------------------------------------* 
       COPY 'LIB/OUTPUT/OFILEFCW.cob' REPLACING 
            ==:V1:== BY ==REPORT1==
            ==:V2:== BY =='IO/REPORT1.txt'==.
      *****************************************************************
       DATA DIVISION.                                                  
      *****************************************************************
       FILE SECTION.                                                    
      *===============================================================*
       FD  REPORT1.                                      
       01  REPORT1-RECORD.                                              
            03 REPORT1-RECORD-ASA       PIC  X(1).                      
            03 REPORT1-RECORD-LINE      PIC  X(132).                    
      *****************************************************************
       WORKING-STORAGE SECTION.                                        
      *===============================================================*
      
      *---------------------------------------------------------------*
      * ERRORHANDLING                                                  
      *---------------------------------------------------------------*   
       COPY 'LIB/ERR/ERRBWS.cob'.                                                
           
      *---------------------------------------------------------------*
      * OUTPUT REPORT1                                                  
      *---------------------------------------------------------------*
       01  REPORT1-STATUS               PIC  X(2).                      
           88 REPORT1-OK                VALUE '00'.                    
           88 REPORT1-ERROR             VALUE '01' THRU '99'.          
      *---------------------------------------------------------------*
      * GLOBAL                                                          
      *---------------------------------------------------------------*
       01  I                            PIC S9(9)    COMP.              
       01  ZZZZ9                        PIC  ZZZZ9.    
                       
      *****************************************************************
       LINKAGE SECTION.                                                
      *===============================================================*
       COPY 'LIB/REPORT/CREPO1CA.cob'.                       
                                  
      *****************************************************************
       PROCEDURE DIVISION USING CREPO1CA.                              
      *****************************************************************
       MAIN SECTION.                                                   
      *===============================================================*                         
           MOVE 'CREPO1'     TO PGM-NAME    
           
           IF  (CREPO1CA-ACTION NOT = 'O')                              
           AND (CREPO1CA-ACTION NOT = 'W')                              
           AND (CREPO1CA-ACTION NOT = 'C') THEN                                                        
             MOVE '999' TO PGM-ERR-RC                                  
             STRING 'INVALID ACTION:' CREPO1CA-ACTION                  
               DELIMITED BY 
               SIZE INTO PGM-ERR-MSG1                    
             PERFORM PGM-ERR                                          
           END-IF        
                                                         
           IF (CREPO1CA-ACTION = 'O') THEN                                                        
             PERFORM OPEN-REPORT1                                      
           END-IF                                             
           IF (CREPO1CA-ACTION = 'W') THEN                                                        
             PERFORM LINE-REPORT1                                      
           END-IF                                               
           IF (CREPO1CA-ACTION = 'C') THEN                                                        
             PERFORM CLOSE-REPORT1                                    
           END-IF             
                                                    
           MOVE '000' TO PGM-END-RC                                    
           MOVE ' '   TO PGM-END-MSG1                                  
           PERFORM PGM-END                                            
           GOBACK                                                      
           .                                                          
       MAIN-EXIT. EXIT.  
           
           
                                                         
      *****************************************************************
       OPEN-REPORT1 SECTION.                                          
      *===============================================================*
           OPEN OUTPUT REPORT1                                          
           IF (REPORT1-ERROR) THEN                                                        
             MOVE '999'                      TO PGM-ERR-RC                                  
             MOVE 'ERROR OPEN INPUT REPORT1' TO PGM-ERR-MSG1   
                      
             STRING 'FILE STATUS: ' REPORT1-STATUS                      
               DELIMITED BY 
               SIZE INTO PGM-ERR-MSG2  
             END-STRING
                                 
             MOVE ' '                        TO PGM-ERR-MSG3                                
             PERFORM PGM-ERR                                            
           END-IF                                                      
           .                                                            
       OPEN-REPORT1-EXIT. EXIT.    
           
           
                                               
      *****************************************************************
       LINE-REPORT1 SECTION.                                            
      *===============================================================*
           IF (CREPO1CA-COUNT-PAGES = 0)                                  
           OR (CREPO1CA-COUNT-LINES = 0)                                  
           OR (CREPO1CA-COUNT-LINES >= CREPO1CA-LINES-PER-PAGE) THEN 
             PERFORM HEADER-REPORT1                                
           END-IF           
                                                      
           MOVE ' '          TO REPORT1-RECORD-ASA                      
           MOVE CREPO1CA-LINE TO REPORT1-RECORD-LINE                    
           PERFORM WRITE-REPORT1                                        
           .                                                            
       LINE-REPORT1-EXIT. EXIT.   
           
           
                                                
      *****************************************************************
       HEADER-REPORT1 SECTION.                                          
      *===============================================================*
           MOVE 0 TO CREPO1CA-COUNT-LINES                              
           ADD  1 TO CREPO1CA-COUNT-PAGES                              
           MOVE CREPO1CA-COUNT-PAGES TO ZZZZ9                          
           PERFORM VARYING I FROM 1 BY 1                                
                     UNTIL (I > CREPO1CA-NUM-HEADERS)                            
             MOVE CREPO1CA-HEADER(I) TO REPORT1-RECORD-LINE    
                     
             IF (I = CREPO1CA-NUM-HEADER-PAGE) THEN 
               MOVE ZZZZ9 TO REPORT1-RECORD-LINE(128:5)            
             END-IF                                        
             IF (I = 1) THEN 
               MOVE '1' TO REPORT1-RECORD-ASA                    
             ELSE 
               MOVE ' ' TO REPORT1-RECORD-ASA                    
             END-IF
                                                                 
             PERFORM WRITE-REPORT1                                    
           END-PERFORM                                                
           .                                                          
       HEADER-REPORT1-EXIT. EXIT.   
           
           
                                              
      *****************************************************************
       WRITE-REPORT1 SECTION.                                          
      *===============================================================*
           WRITE REPORT1-RECORD                                        
           IF (REPORT1-ERROR) THEN                                                        
             MOVE '999' TO PGM-ERR-RC                                  
             MOVE 'ERROR WRITE OUTPUT REPORT1' TO PGM-ERR-MSG1 
          
             STRING 'FILE STATUS: ' REPORT1-STATUS                    
               DELIMITED BY 
               SIZE INTO PGM-ERR-MSG2 
             END-STRING
                                  
             MOVE ' '   TO PGM-ERR-MSG3                                
             PERFORM PGM-ERR                                          
           END-IF                                                      
           ADD 1 TO CREPO1CA-COUNT-RECORDS                            
           ADD 1 TO CREPO1CA-COUNT-LINES                              
           .                                                          
       WRITE-REPORT1-EXIT. EXIT.      
           
           
                                           
      *****************************************************************
       CLOSE-REPORT1 SECTION.                                          
      *===============================================================*
           CLOSE REPORT1                                              
           .                                                          
       CLOSE-REPORT1-EXIT. EXIT.         
           
           
                                        
      
                                                         
      *****************************************************************
       PGM-END SECTION.                                                
      *===============================================================*
           MOVE PGM-END-RC   TO CREPO1CA-RC                            
           MOVE PGM-END-MSG1 TO CREPO1CA-MSG                          
           GOBACK                                                      
           .                                                          
       PGM-END-EXIT. EXIT.     
      *****************************************************************
      * ERRORHANDLING                                                  
      *===============================================================*
       COPY 'LIB/ERR/ERRB.cob'.                                          
      *****************************************************************
