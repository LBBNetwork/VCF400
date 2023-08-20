000100 230813      FVOTINGDB  UF A E             DISK                                         
000200 230810      FVOTESCR   CF   E             WORKSTN                                      
000300 230810      DSUCCESS          C                   CONST('You have voted successfully') 
000301 230813      DERRBLANK         C                   CONST('Must fill out all fields')    
000302 230813      DERREXIST         C                   CONST('You have already voted.')     
000400 230810      C                   EXFMT     VOTE1                                        
000401 230813      C                   IF        INPUTBADGE = *ZERO                           
000402 230813      C                   EVAL      ERRLINE = ERRBLANK                           
000403 230813      C*                  MOVE      *ON           *INLR                          
000404 230813      C*                  RETURN                                                 
000405 230813      C                   ENDIF                                                  
000500 230813      C                   READ      VOTINGDB                               90    
000600 230810      C                   MOVEL     INPUTBADGE    BADGENBR                       
000700 230810      C                   MOVEL     INPUTAWARD    AWARDNBR                       
000800 230810      C                   MOVEL     INPUTEXHB     EXHBNBR                        
000900 230813      C                   WRITE     VOTINGREC                                    
001000 230810      C                   MOVE      *ON           *INLR                          
001100 230810      C                   RETURN                                                 
