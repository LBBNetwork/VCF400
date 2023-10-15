000100 230820      FGUESTBKDB UF A E           K DISK                                         
000200 230814      FEXHBDB    IF   E           K DISK                                         
000300 230820      FGUESTBKSCRCF   E             WORKSTN                                      
000400 230823      DID               S              4P 0                                      
000500 230904      DUSERPRF          S              9A                                        
000600 230826      DERRCMTID         C                   CONST('Must enter CommentID')        
000700 230826      DERRHNAME         C                   CONST('Name Hidden')                 
000800 230904      DERRPNAME         C                   CONST('Private Comment')             
000900 231015      DERREXIST         C                   CONST('Exhibit not found')           
001000 231015      DERRHCMT          C                   CONST('This comment hidden by an +   
001100 231015      D                                            admin - offensive content.')  
001200 231015      DERRPRIV          C                   CONST('This comment is not part of + 
001300 231015      D                                            this guestbook.             ')
001400 230820      C*-----------------------------------------------                          
001500 230820      C     *ENTRY        PLIST                                                  
001600 230820      C                   PARM                    LAUNCH           20            
001700 230813      C*-----------------------------------------------                          
001800 230826      C                   EXSR      CHKPARM                                      
001900 230826      C                   DOW       *IN05 = *OFF                                 
002000 230826      C                   EXSR      GETTLCMT                                     
002100 230825      C                   EXFMT     READCMT                                      
002200 230813      C*                                                                         
002300 230826      C                   IF        INCMTID  = *ZERO                             
002400 230826      C                   EVAL      ERRLINE = ERRCMTID                           
002500 230826      C                   ENDIF                                                  
002600 230826      C                   IF        *IN12 = *ON                                  
002700 230826      C                   MOVEL     *ON           *INLR                          
002800 230826      C                   RETURN                                                 
002900 230826      C                   ENDIF                                                  
003000 230813      C*                                                                         
003100 230813      C                   ENDDO                                                  
003200 230826      C                   EXSR      READDB                                       
003300 230813      C*----------------------------------------------------                     
003400 230826      C     READDB        BEGSR                                                  
003500 230826      C                   EVAL      *IN05 = *OFF                                 
003600 230826      C     INCMTID       SETLL     GUESTBKRCD                                   
003700 230826      C                   READ      GUESTBKDB                                    
003800 230826      C                   IF        VISIBLE = 'N'                                
003900 230826      C                   MOVEL     ERRHNAME      OUTNAME                        
004000 230826      C                   MOVEL     ERRHCMT       OUTCMT                         
004100 230826      C                   ELSE                                                   
004200 231015      C                   IF        EXHBID = USERPRF OR USERPRF = 'MM2024'       
004300 230826      C                   MOVEL     GUESTNAME     OUTNAME                        
004400 230826      C                   MOVEL     GUESTCMT      OUTCMT                         
004500 230904      C                   ELSE                                                   
004600 230904      C                   MOVEL     ERRPRIV       OUTCMT                         
004700 230904      C                   ENDIF                                                  
004800 230904      C                   ENDIF                                                  
004900 230813      C                   ENDSR                                                  
005000 230826      C*-------------------------------------------------------                  
005100 230826      C     GETTLCMT      BEGSR                                                  
005200 230826      C                   READ      GUESTBKDB                              92    
005300 230826      C     *IN92         DOWEQ     *OFF                                         
005400 230826      C                   READ      GUESTBKDB                              92    
005500 230826      C                   ENDDO                                                  
005600 230826      C*                  EVAL      WTFCMTNUM = CMTID                            
005700 230826      C                   MOVEL     CMTID         WTFCMTNUM                      
005800 230826      C                   ENDSR                                                  
005900 230820      C*-------------------------------------------------------                  
006000 230820      C     CHKPARM       BEGSR                                                  
006100 230904      C                   MOVEL     LAUNCH        USERPRF                        
006200 230904      C                   EVAL      ERRLINE = USERPRF                            
006300 230820      C                   ENDSR                                                  
