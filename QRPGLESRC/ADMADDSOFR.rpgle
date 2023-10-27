000100 231023      FSECOFRS   UF A E           K DISK                                         
000200 230820      FGUESTBKSCRCF   E             WORKSTN                                      
000300 230823      DID               S              4P 0                                      
000400 230826      DCHECKOK          S              1P 0                                      
000500 230826      DHIDEY            C                   CONST('Y')                           
000600 230826      DHIDEN            C                   CONST('N')                           
000700 230826      DERRCMTID         C                   CONST('Must enter CommentID')        
000800 230826      DERRYN            C                   CONST('Must type Y or N')            
000900 230826      DSTSOK            C                   CONST('Status updated')              
001000 230820      C*-----------------------------------------------                          
001100 230820      C     *ENTRY        PLIST                                                  
001200 230820      C                   PARM                    LAUNCH           20            
001300 230813      C*-----------------------------------------------                          
001400 230826      C                   EXSR      CHKPARM                                      
001500 230826      C                   EXSR      READDB                                       
001600 230826      C                   DOW       *IN05 = *OFF                                 
001700 230826      C                   EXFMT     HIDECMT                                      
001800 230813      C*                                                                         
001900 230826      C                   IF        *IN12 = *ON                                  
002000 230826      C                   MOVEL     *ON           *INLR                          
002100 230826      C                   RETURN                                                 
002200 230826      C                   ENDIF                                                  
002300 230813      C*                                                                         
002400 230813      C                   ENDDO                                                  
002500 230826      C                   EXSR      HIDECMTSR                                    
002600 230813      C*----------------------------------------------------                     
002700 230826      C     READDB        BEGSR                                                  
002800 230826      C                   EVAL      *IN05 = *OFF                                 
002900 230826      C     ID            SETLL     GUESTBKRCD                                   
003000 230826      C                   READ      GUESTBKDB                                    
003100 230826      C                   MOVEL     ID            HIDECMTID                      
003200 230826      C                   MOVEL     GUESTNAME     OUTNAME                        
003300 230826      C                   MOVEL     GUESTCMT      OUTCMT                         
003400 230826      C                   MOVEL     VISIBLE       CURRHIDE                       
003500 230813      C                   ENDSR                                                  
003600 230826      C*-------------------------------------------------------                  
003700 230826      C     HIDECMTSR     BEGSR                                                  
003800 230826      C                   EVAL      *IN05 = *OFF                                 
003900 230826      C                   EVAL      CHECKOK = 0                                  
004000 230826      C*                                                                         
004100 230826      C                   IF        INHIDEYN = 'Y'                               
004200 230826      C                   MOVEL     HIDEY         VISIBLE                        
004300 230826      C                   UPDATE    GUESTBKRCD                                   
004400 230826      C                   ADD       1             CHECKOK                        
004500 230826      C                   MOVEL     STSOK         ERRLINE                        
004600 230826      C                   ENDIF                                                  
004700 230826      C*                                                                         
004800 230826      C                   IF        INHIDEYN = 'N'                               
004900 230826      C                   MOVEL     HIDEN         VISIBLE                        
005000 230826      C                   UPDATE    GUESTBKRCD                                   
005100 230826      C                   ADD       1             CHECKOK                        
005200 230826      C                   MOVEL     STSOK         ERRLINE                        
005300 230826      C                   ENDIF                                                  
005400 230826      C*                                                                         
005500 230826      C                   IF        CHECKOK = 0                                  
005600 230826      C                   MOVEL     ERRYN         ERRLINE                        
005700 230826      C                   ENDIF                                                  
005800 230826      C                   ENDSR                                                  
005900 231023      C*-------------------------------------------------------                  
006000 231023      C     CHKUSRPRF     BEGSR                                                  
006100 231023      C*TODO: Logic for validating passed userprofile is found in                
006200 231023      C*SECOFRS file                                                             
006300 231023      C                   ENDSR                                                  
006400 230820      C*-------------------------------------------------------                  
006500 230820      C     CHKPARM       BEGSR                                                  
006600 230826      C                   MOVEL     LAUNCH        ID                             
006700 230820      C                   ENDSR                                                  
