      *****************************************************************
       FILE-OPEN-INPUT-:V1: SECTION.                                   
      *===============================================================*
           OPEN INPUT :V1:                                             
           IF (:V1:-ERROR)                                               
           THEN                                                        
             MOVE '999' TO PGM-ERR-RC                                  
             STRING 'ERROR OPEN INPUT ' :V2:                           
               DELIMITED BY SIZE 
               INTO PGM-ERR-MSG1                     
             END-STRING                                                
             STRING 'FILE STATUS: ' :V1:-STATUS                        
               DELIMITED BY SIZE 
               INTO PGM-ERR-MSG2                     
             END-STRING                                                
             MOVE ' ' TO PGM-ERR-MSG3                                  
             PERFORM PGM-ERR                                           
           END-IF                                                      
           .                                                           
       FILE-OPEN-INPUT-:V1:-EXIT. EXIT.                                



      *****************************************************************
       FILE-READ-:V1: SECTION.                                         
      *===============================================================*
           READ :V1:                                                   
           IF (:V1:-ERROR)                                             
           THEN                                                        
             MOVE '999' TO PGM-ERR-RC                                  
             STRING 'ERROR READ ' :V2:                                 
               DELIMITED BY SIZE 
               INTO PGM-ERR-MSG1                     
             END-STRING                                                
             STRING 'FILE STATUS: ' :V1:-STATUS                        
               DELIMITED BY SIZE 
               INTO PGM-ERR-MSG2                     
             END-STRING                                                
             MOVE ' ' TO PGM-ERR-MSG3                                  
             PERFORM PGM-ERR                                           
           END-IF                                                      
           IF (:V1:-OK)                                                  
             THEN ADD 1 TO :V1:-COUNT                                  
           END-IF                                                      
           .                                                           
       FILE-READ-:V1:-EXIT. EXIT.              



      *****************************************************************
       FILE-CLOSE-:V1: SECTION.                                        
      *===============================================================*
           CLOSE :V1:                                                  
           .                                                           
       FILE-CLOSE-:V1:-EXIT. EXIT.                                     