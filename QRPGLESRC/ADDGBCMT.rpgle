000100 230813      FVOTINGDB  UF A E           K DISK                                         
000200 230814      FEXHBDB    IF   E           K DISK                                         
000300 230815      FAWARDDB   IF   E           K DISK                                         
000400 230810      FVOTESCR   CF   E             WORKSTN                                      
000500 230815      DCHECKOK          S              1P 0                                      
000600 230810      DSUCCESS          C                   CONST('You have voted successfully') 
000700 230813      DERRBLKBG         C                   CONST('Must enter badge number')     
000800 230813      DERRBLKEX         C                   CONST('Must enter Exhibit ID')       
000900 230813      DERRBLKAW         C                   CONST('Must enter Award ID')         
001000 230813      DERREXIST         C                   CONST('You have already voted.')     
001100 230813      DERRENTER         C                   CONST('Use F5 key to submit')        
001200 230815      DERRPROHB         C                   CONST('Exhibit ineligible for award')
001300 230815      DERRNOEXB         C                   CONST('Exhibit does not exist')      
001400 230815      DERRNOAWD         C                   CONST('Award does not exist.')       
001500 230813      C*-----------------------------------------------                          
001600 230813      C                   DOW       *IN05 = *OFF                                 
001700 230810      C                   EXFMT     VOTE1                                        
001800 230813      C*                                                                         
001900 230813      C                   IF        INPUTBADGE = *ZERO                           
002000 230813      C                   EVAL      ERRLINE = ERRBLKBG                           
002100 230813      C                   EVAL      *IN05 = *OFF                                 
002200 230813      C                   ENDIF                                                  
002300 230813      C*                                                                         
002400 230815      C                   IF        INPUTAWARD = *ZERO                           
002500 230813      C                   EVAL      ERRLINE = ERRBLKAW                           
002600 230813      C                   EVAL      *IN05 = *OFF                                 
002700 230813      C                   ENDIF                                                  
002800 230813      C*                                                                         
002900 230813      C                   IF        INPUTEXHB = *ZERO                            
003000 230813      C                   EVAL      ERRLINE = ERRBLKEX                           
003100 230813      C                   EVAL      *IN05 = *OFF                                 
003200 230813      C                   ENDIF                                                  
003300 230813      C*                                                                         
003400 230813      C                   IF        *IN12 = *ON                                  
003500 230813      C                   MOVEL     *ON           *INLR                          
003600 230813      C                   RETURN                                                 
003700 230813      C                   ENDIF                                                  
003800 230813      C*                                                                         
003900 230813      C                   ENDDO                                                  
004000 230813      C                   EXSR      ADDTODB                                      
004100 230813      C*----------------------------------------------------                     
004200 230813      C     ADDTODB       BEGSR                                                  
004300 230815      C                   MOVEL     0             CHECKOK                        
004400 230813      C                   EVAL      *IN05 = *OFF                                 
004500 230813      C     INPUTBADGE    CHAIN     VOTINGREC                          95        
004600 230813      C                   IF        *IN95 = *OFF                                 
004700 230813      C                   EVAL      ERRLINE = ERREXIST                           
004800 230814      C                   ENDIF                                                  
004900 230813      C                   READ      VOTINGDB                               90    
005000 230815      C     INPUTEXHB     SETLL     EXHBREC                                      
005100 230815      C                   READ      EXHBDB                                       
005200 230815      C*                                                                         
005300 230815      C                   IF        ELIGIBLE = 0                                 
005400 230814      C                   EVAL      ERRLINE = ERRPROHB                           
005500 230815      C                   ELSE                                                   
005600 230815      C                   ADD       1             CHECKOK                        
005700 230815      C                   ENDIF                                                  
005800 230815      C*                                                                         
005900 230815      C     INPUTEXHB     CHAIN     EXHBREC                            93        
006000 230815      C                   IF        *IN93 = *OFF                                 
006100 230815      C                   ADD       1             CHECKOK                        
006200 230815      C                   ELSE                                                   
006300 230815      C                   EVAL      ERRLINE = ERRNOEXB                           
006400 230815      C                   ENDIF                                                  
006500 230815      C*                                                                         
006600 230815      C     INPUTAWARD    CHAIN     AWARDRCD                           94        
006700 230815      C                   IF        *IN94 = *OFF                                 
006800 230815      C                   ADD       1             CHECKOK                        
006900 230815      C                   ELSE                                                   
007000 230815      C                   EVAL      ERRLINE = ERRNOAWD                           
007100 230815      C                   ENDIF                                                  
007200 230815      C*                                                                         
007300 230815      C                   IF        CHECKOK = 3                                  
007400 230810      C                   MOVEL     INPUTBADGE    BADGENBR                       
007500 230810      C                   MOVEL     INPUTAWARD    AWARDNBR                       
007600 230810      C                   MOVEL     INPUTEXHB     EXHBNBR                        
007700 230813      C                   WRITE     VOTINGREC                                    
007800 230813      C                   EXSR      ENDVOTE                                      
007900 230813      C                   ENDIF                                                  
008000 230813      C                   ENDSR                                                  
008100 230820      C*-------------------------------------------------------                  
008200 230820      C     CHKPARM       BEGSR                                                  
008300 230820      C*                  TODO! Validate passed launch parms                     
008400 230820      C                   ENDSR                                                  
008500 230813      C*-------------------------------------------------------                  
008600 230813      C     ENDVOTE       BEGSR                                                  
008700 230813      C                   EXFMT     VOTEEND                                      
008800 230813      C                   MOVEL     *ON           *INLR                          
008900 230813      C                   RETURN                                                 
009000 230813      C                   ENDSR                                                  
