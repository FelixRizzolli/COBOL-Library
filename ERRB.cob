      *****************************************************************
       PGM-ERR SECTION.                                                
      *===============================================================*                                         
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
       DISPLAY-PGM-START SECTION.                                      
      *===============================================================*                                   
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
