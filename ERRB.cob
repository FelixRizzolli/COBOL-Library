      *****************************************************************
       PGM-ERR SECTION.                                                
      *===============================================================*
           PERFORM PGM-VERS                                            
           DISPLAY PGM-NAME ' **********   E R R O R   **********'     
           DISPLAY PGM-NAME ' COMPILED ' PGM-VERSION                   
           DISPLAY PGM-NAME ' ' PGM-ERR-RC ' ' PGM-ERR-MSG1            
           DISPLAY PGM-NAME ' ' PGM-ERR-MSG2                           
           DISPLAY PGM-NAME ' ' PGM-ERR-MSG3                           
           DISPLAY PGM-NAME ' **********   E R R O R   **********'     
           MOVE PGM-ERR-RC   TO PGM-END-RC                             
           MOVE PGM-ERR-MSG1 TO PGM-END-MSG1                           
           PERFORM PGM-END                                             
           .                                                           
       PGM-ERR-EXIT. EXIT.                                             



      *****************************************************************
       PGM-VERS SECTION.                                               
      *===============================================================*
           MOVE WHEN-COMPILED       TO PGM-VERSION-2                   
           MOVE 'GH.EF.CD IJ:KL:MN' TO PGM-VERSION                     
           INSPECT PGM-VERSION                                         
             CONVERTING 'EF1GH2CDIJ3KL4MN5'                            
             TO         PGM-VERSION-2                                  
      *    END-INSPECT
           .                                                           
       PGM-VERS-EXIT. EXIT.                                            



      *****************************************************************
       DISPLAY-PGM-START SECTION.                                      
      *===============================================================*
           PERFORM PGM-VERS                                            
           MOVE FUNCTION CURRENT-DATE TO PGM-DATE                      
                                                                       
           DISPLAY PGM-NAME ' STARTED....:'                            
             PGM-DATE(7:2) '.' PGM-DATE(5:2) '.' PGM-DATE(1:4) ' '     
             PGM-DATE(9:2) ':' PGM-DATE(11:2) ':' PGM-DATE(13:2) ' '   
             ' COMPILED ' PGM-VERSION                                  
           DISPLAY PGM-NAME ' ' PGM-DESCRIPTION                        
           DISPLAY '****************************************'          
                   '****************************************'          
      *    END-DISPLAY
           DISPLAY ' '                                                 
           .                                                           
       DISPLAY-PGM-START-EXIT. EXIT.                                   



      *****************************************************************
       DISPLAY-PGM-END SECTION.                                        
      *===============================================================*
           MOVE FUNCTION CURRENT-DATE TO PGM-DATE                      
           DISPLAY ' '                                                 
           DISPLAY '****************************************'          
                   '****************************************'          
           DISPLAY PGM-NAME ' ENDED......:'                            
             PGM-DATE(7:2) '.' PGM-DATE(5:2) '.' PGM-DATE(1:4) ' '     
             PGM-DATE(9:2) ':' PGM-DATE(11:2) ':' PGM-DATE(13:2)       
      *    END-DISPLAY
           .                                                           
       DISPLAY-PGM-END-EXIT. EXIT.                                     



      *****************************************************************
       SCHREIBE-APP-LOG SECTION.                                       
      *===============================================================*
           PERFORM CHECK-APP-LOG                                       
           IF (SW-ALOG-DRUCKEN = 'J') THEN                               
             IF (ALEVEL >= '1') THEN                                          
               IF (APP-LOG-MSG1 NOT = SPACES) THEN                            
                 MOVE SPACES TO APP-LOG-CMSG                           
                 STRING PGM-NAME ' > ' APP-LOG-MSG1                    
                   DELIMITED BY SIZE 
                   INTO APP-LOG-CMSG                 
                 END-STRING                                            
                 PERFORM DISPLAY-USRLOG                                
                 MOVE SPACES TO APP-LOG-MSG1                           
               END-IF                                                  
             END-IF                                                    
             IF (ALEVEL >= '2') THEN                                         
               IF (APP-LOG-MSG2 NOT = SPACES) THEN                           
                 MOVE SPACES TO APP-LOG-CMSG                           
                 STRING PGM-NAME ' => ' APP-LOG-MSG2                   
                   DELIMITED BY SIZE 
                   INTO APP-LOG-CMSG                 
                 END-STRING                                            
                 PERFORM DISPLAY-USRLOG                                
                 MOVE SPACES TO APP-LOG-MSG2                           
               END-IF                                                  
             END-IF                                                    
             IF (ALEVEL >= '3') THEN                                         
               IF (APP-LOG-MSG3 NOT = SPACES) THEN                           
                 MOVE SPACES TO APP-LOG-CMSG                           
                 STRING PGM-NAME ' ==> ' APP-LOG-MSG3                  
                   DELIMITED BY SIZE 
                   INTO APP-LOG-CMSG                 
                 END-STRING                                            
                 PERFORM DISPLAY-USRLOG                                
                 MOVE SPACES TO APP-LOG-MSG3                           
               END-IF                                                  
             END-IF                                                    
           END-IF                                                      
           .                                                           
       SCHREIBE-APP-LOG-EXIT. EXIT.


      *****************************************************************
       SCHREIBE-APP-LOG-LINE SECTION.                                  
      *===============================================================*
           PERFORM CHECK-APP-LOG                                       
           IF (SW-ALOG-DRUCKEN = 'J') THEN                                   
             MOVE SPACES TO APP-LOG-CMSG                               
             STRING PGM-NAME ' ' APP-LOG-LINE                          
               DELIMITED BY SIZE 
               INTO APP-LOG-CMSG                     
             END-STRING                                                
             PERFORM DISPLAY-USRLOG                                    
           END-IF                                                      
           .                                                           
       SCHREIBE-APP-LOG-LINE-EXIT. EXIT.                                                                


      *****************************************************************
       DISPLAY-USRLOG SECTION.                                         
      *===============================================================*
           IF (SW-ALOG-CALL = 'N') THEN                                      
             DISPLAY APP-LOG-CMSG                                      
           ELSE                                                        
             CALL 'CUSRLOG' USING APP-LOG-CMSG                         
               ON EXCEPTION                                            
                 MOVE 'N' TO SW-ALOG-CALL                              
                 DISPLAY APP-LOG-CMSG                                  
             END-CALL                                                  
           END-IF                                                      
           .                                                           
       DISPLAY-USRLOG-EXIT. EXIT.


      *****************************************************************
       CHECK-APP-LOG SECTION.                                          
      *===============================================================*
           IF (SW-ALOG-DRUCKEN = SPACE) THEN                                 
             MOVE 'N'        TO SW-ALOG-DRUCKEN                          
                                                                       
             CALL RZSC01 USING AFUNC                                   
                               AID                                     
                               ADATA                                   
               ON EXCEPTION                                            
                 MOVE SPACES TO ADATA                                  
             END-CALL                                                  
                                                                       
             INSPECT ADATA 
               TALLYING APOS 
               FOR CHARACTERS 
               BEFORE PGM-NAME
      *      END-INSPECT
                                                                       
             IF (APOS < 4096) THEN                                           
               MOVE 'J'                   TO SW-ALOG-DRUCKEN           
               IF (APOS < 4086) THEN                                         
                 ADD 9                    TO APOS                                         
                 MOVE ADATA(APOS:1)       TO ALEVEL                          
               ELSE                                                    
                 MOVE '1'                 TO ALEVEL                    
               END-IF                                                  
             END-IF                                                    
           END-IF                                                      
           .                                                           
       CHECK-APP-LOG-EXIT. EXIT.