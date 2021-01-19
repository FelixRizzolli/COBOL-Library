       CREPO1-OPEN SECTION.                                            
      *===============================================================*
           INITIALIZE CREPO1CA                                          
           MOVE 'O' TO CREPO1CA-ACTION      

           CALL CREPO1 
             USING CREPO1CA 
           END-CALL                
                            
           IF (CREPO1CA-RC NOT = '000') THEN                                                        
             MOVE CREPO1CA-RC TO PGM-ERR-RC                            
             STRING 'CREPO1:' CREPO1CA-RC ' ' CREPO1CA-MSG              
               DELIMITED BY SIZE 
               INTO PGM-ERR-MSG1                      
             PERFORM PGM-ERR                                            
           END-IF                                                      
           .                                                            
       CREPO1-OPEN-EXIT. EXIT.                                          
      *****************************************************************
       CREPO1-WRITE SECTION.                                            
      *===============================================================*
           MOVE 'W' TO CREPO1CA-ACTION   

           CALL CREPO1 
             USING CREPO1CA   
           END-CALL          

           IF (CREPO1CA-RC NOT = '000') THEN                                                        
             MOVE CREPO1CA-RC TO PGM-ERR-RC                            
             STRING 'CREPO1:' CREPO1CA-RC ' ' CREPO1CA-MSG              
               DELIMITED BY 
               SIZE INTO PGM-ERR-MSG1                      
             PERFORM PGM-ERR                                            
           END-IF                                                      
           .                                                            
       CREPO1-WRITE-EXIT. EXIT.                                        
      *****************************************************************
       CREPO1-CLOSE SECTION.                                            
      *===============================================================*
           MOVE 'C' TO CREPO1CA-ACTION    

           CALL CREPO1 
             USING CREPO1CA        
           END-CALL                          
           .                                                            
       CREPO1-CLOSE-EXIT. EXIT.      
