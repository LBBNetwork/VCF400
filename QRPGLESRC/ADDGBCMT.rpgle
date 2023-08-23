000100 230820      FGUESTBKDB UF A E           K DISK                                         
000200 230814      FEXHBDB    IF   E           K DISK                                         
000300 230820      FGUESTBKSCRCF   E             WORKSTN                                      
000400 230823      DID               S              4P 0                                      
000500 230820      DSUCCESS          C                   CONST('Thanks for commenting')       
000600 230823      DERREXID          C                   CONST('Must enter Exhibit ID')       
000700 230823      DERRNOCMT         C                   Const('Must enter a comment')        
000800 230820      C*-----------------------------------------------                          
000900 230820      C     *ENTRY        PLIST                                                  
001000 230820      C                   PARM                    LAUNCH           20            
001100 230813      C*-----------------------------------------------                          
001200 230813      C                   DOW       *IN05 = *OFF                                 
001300 230823      C                   EXSR      CHKPARM                                      
001400 230823      C                   EXFMT     ADDCMT                                       
001500 230813      C*                                                                         
001600 230823      C                   IF        INEXHBID = *BLANK                            
001700 230823      C                   EVAL      ERRLINE = ERREXID                            
001800 230813      C                   EVAL      *IN05 = *OFF                                 
001900 230813      C                   ENDIF                                                  
002000 230813      C*                                                                         
002100 230823      C                   IF        INCMT = *BLANK                               
002200 230823      C                   EVAL      ERRLINE = ERRNOCMT                           
002300 230813      C                   EVAL      *IN05 = *OFF                                 
002400 230813      C                   ENDIF                                                  
002500 230813      C*                                                                         
002600 230813      C                   IF        *IN12 = *ON                                  
002700 230813      C                   MOVEL     *ON           *INLR                          
002800 230813      C                   RETURN                                                 
002900 230813      C                   ENDIF                                                  
003000 230813      C*                                                                         
003100 230813      C                   ENDDO                                                  
003200 230813      C                   EXSR      ADDTODB                                      
003300 230813      C*----------------------------------------------------                     
003400 230813      C     ADDTODB       BEGSR                                                  
003500 230823      C                   MOVEL     0             ID                             
003600 230813      C                   EVAL      *IN05 = *OFF                                 
003700 230823      C                   READ      GUESTBKDB                              90    
003800 230823      C     *IN90         DOWEQ     *OFF                                         
003900 230823      C                   READ      GUESTBKDB                              90    
004000 230823      C                   ENDDO                                                  
004100 230823      C                   MOVEL     CMTID         ID                             
004200 230823      C                   ADD       1             ID                             
004300 230823      C                   MOVEL     ID            CMTID                          
004400 230823      C                   MOVEL     INNAME        GUESTNAME                      
004500 230823      C                   MOVEL     INEXHBID      EXHBID                         
004600 230823      C                   MOVEL     INCMT         GUESTCMT                       
004700 230823      C                   WRITE     GUESTBKRCD                                   
004800 230823      C                   EXSR      ENDADDGB                                     
004900 230813      C                   ENDSR                                                  
005000 230820      C*-------------------------------------------------------                  
005100 230820      C     CHKPARM       BEGSR                                                  
005200 230823      C                   MOVEL     LAUNCH        DBGPARM                        
005300 230823      C*    LAUNCH        SETLL     EXHBREC                                91    
005400 230823      C*                  READ      EXHBDB                                       
005500 230823      C*                  MOVEL     DBGEX         EXHBTITLE                      
005600 230820      C                   ENDSR                                                  
005700 230813      C*-------------------------------------------------------                  
005800 230820      C     ENDADDGB      BEGSR                                                  
005900 230823      C*                  EXFMT     VOTEEND                                      
006000 230813      C                   MOVEL     *ON           *INLR                          
006100 230813      C                   RETURN                                                 
006200 230813      C                   ENDSR                                                  
