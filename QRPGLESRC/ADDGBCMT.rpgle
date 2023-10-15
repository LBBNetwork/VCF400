000100 230820      FGUESTBKDB UF A E           K DISK                                         
000200 230814      FEXHBDB    IF   E           K DISK                                         
000300 230820      FGUESTBKSCRCF   E             WORKSTN                                      
000400 230823      DID               S              4P 0                                      
000500 230904      DUSERPRF          S              9A                                        
000600 230820      DSUCCESS          C                   CONST('Thanks for commenting')       
000700 230826      DVISYES           C                   CONST('Y')                           
000800 230823      DERREXID          C                   CONST('Must enter Exhibit ID')       
000900 231015      DERRNOCMT         C                   CONST('Must enter a comment')        
001000 231015      DERREXIST         C                   CONST('Exhibit not found')           
001100 230820      C*-----------------------------------------------                          
001200 230820      C     *ENTRY        PLIST                                                  
001300 230820      C                   PARM                    LAUNCH           20            
001400 230813      C*-----------------------------------------------                          
001500 230813      C                   DOW       *IN05 = *OFF                                 
001600 230823      C                   EXSR      CHKPARM                                      
001700 230823      C                   EXFMT     ADDCMT                                       
001800 230813      C*                                                                         
001900 230904      C                   IF        INID     = *BLANK                            
002000 230823      C                   EVAL      ERRLINE = ERREXID                            
002100 230813      C                   EVAL      *IN05 = *OFF                                 
002200 230813      C                   ENDIF                                                  
002300 230813      C*                                                                         
002400 230823      C                   IF        INCMT = *BLANK                               
002500 230823      C                   EVAL      ERRLINE = ERRNOCMT                           
002600 230813      C                   EVAL      *IN05 = *OFF                                 
002700 230813      C                   ENDIF                                                  
002800 230813      C*                                                                         
002900 230813      C                   IF        *IN12 = *ON                                  
003000 230813      C                   MOVEL     *ON           *INLR                          
003100 230813      C                   RETURN                                                 
003200 230813      C                   ENDIF                                                  
003300 230813      C*                                                                         
003400 230813      C                   ENDDO                                                  
003500 230813      C                   EXSR      ADDTODB                                      
003600 230813      C*----------------------------------------------------                     
003700 230813      C     ADDTODB       BEGSR                                                  
003800 230823      C                   MOVEL     0             ID                             
003900 230813      C                   EVAL      *IN05 = *OFF                                 
004000 230823      C                   READ      GUESTBKDB                              90    
004100 230823      C     *IN90         DOWEQ     *OFF                                         
004200 230823      C                   READ      GUESTBKDB                              90    
004300 230823      C                   ENDDO                                                  
004400 230823      C                   MOVEL     CMTID         ID                             
004500 230823      C                   ADD       1             ID                             
004600 230823      C                   MOVEL     ID            CMTID                          
004700 230823      C                   MOVEL     INNAME        GUESTNAME                      
004800 230904      C                   MOVEL     INID          EXHBID                         
004900 230823      C                   MOVEL     INCMT         GUESTCMT                       
005000 230826      C                   MOVEL     VISYES        VISIBLE                        
005100 230823      C                   WRITE     GUESTBKRCD                                   
005200 230826      C                   EXFMT     ENDCMT                                       
005300 230823      C                   EXSR      ENDADDGB                                     
005400 230813      C                   ENDSR                                                  
005500 230820      C*-------------------------------------------------------                  
005600 230820      C     CHKPARM       BEGSR                                                  
005700 230904      C                   MOVEL     LAUNCH        USERPRF                        
005800 230904      C                   IF        USERPRF = 'MM2024'                           
005900 230904      C                                                                          
006000 230904      C                   ELSE                                                   
006100 230904      C                   MOVEL     USERPRF       INID                           
006200 230904      C                   MOVEL     *ON           *IN70                          
006300 230904      C                   ENDIF                                                  
006400 230820      C                   ENDSR                                                  
006500 230826      C*-------------------------------------------------------                  
006600 230820      C     ENDADDGB      BEGSR                                                  
006700 230823      C*                  EXFMT     VOTEEND                                      
006800 230813      C                   MOVEL     *ON           *INLR                          
006900 230813      C                   RETURN                                                 
007000 230813      C                   ENDSR                                                  
