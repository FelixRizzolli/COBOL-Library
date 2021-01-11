       FILE-OPEN-OUTPUT-:V1: SECTION.                                  
      *===============================================================*
           OPEN OUTPUT :V1:                                            
           IF :V1:-ERROR                                              
           THEN                                                        
             MOVE '999' TO PGM-ERR-RC                                  
             STRING 'ERROR OPEN OUTPUT ' :V2:                          
               DELIMITED BY SIZE INTO PGM-ERR-MSG1                    
             END-STRING                                                
             STRING 'FILE STATUS: ' :V1:-STATUS                        
               DELIMITED BY SIZE INTO PGM-ERR-MSG2                    
             END-STRING                                                
             MOVE ' ' TO PGM-ERR-MSG3                                  
             PERFORM PGM-ERR                                          
           END-IF                                                      
           .                                                          
       FILE-OPEN-OUTPUT-:V1:-EXIT. EXIT.                              
       FILE-WRITE-:V1: SECTION.                                        
      *===============================================================*
           WRITE :V1:-RECORD                                          
           IF :V1:-ERROR                                              
           THEN                                                        
             MOVE '999' TO PGM-ERR-RC                                  
             STRING 'ERROR WRITE ' :V2:                                
               DELIMITED BY SIZE INTO PGM-ERR-MSG1                    
             END-STRING                                                
             STRING 'FILE STATUS: ' :V1:-STATUS                        
               DELIMITED BY SIZE INTO PGM-ERR-MSG2                    
             END-STRING                                                
             MOVE ' ' TO PGM-ERR-MSG3                                  
             PERFORM PGM-ERR                                          
           END-IF                                                      
           IF :V1:-OK                                                  
             THEN ADD 1 TO :V1:-COUNT                                  
           END-IF                                                      
           .                                                          
       FILE-WRITE-:V1:-EXIT. EXIT.                                    
      *****************************************************************
       FILE-CLOSE-:V1: SECTION.                                        
      *===============================================================*
           CLOSE :V1:                                                  
           .                                                          
       FILE-CLOSE-:V1:-EXIT. EXIT.   
