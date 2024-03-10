000100 230902      FEXHBDB    IF   E           K DISK                                         
000101 240104      FSETTINGS  IF   E             DISK                                         
000200 230902      FEXHBMENUSCCF   E             WORKSTN                                      
000300 230902      DUSERPROF         S              9A                                        
000301 231219      DEXITPSWRD        S              9A                                        
000302 240310      DCHKALWVOTE       S              1P 0                                      
000400 231209      DCHKLRN400        S              1P 0                                      
000500 230820      C     *ENTRY        PLIST                                                  
000600 230902      C                   PARM                    LAUNCH            9            
000700 230902      C*-----------------------------------------------------------------------  
000800 230902      C*                  MOVEL     LAUNCH        PARMOUT                        
000900 230902      C                   EXSR      CHKPARM                                      
000901 231219      C                   EXSR      GETPSWRD                                     
001000 230902      C                   EXFMT     MENU                                         
001100 231020      C                                                                          
001200 231020      C                   IF        INOPT = 1                                    
001300 240310      C                   EXSR      DOVOTE                                       
001400 231020      C                   ENDIF                                                  
001500 231020      C                                                                          
001600 231020      C                   IF        INOPT = 2                                    
001700 231209      C                   EXSR      DOLRN400                                     
001800 231020      C                   ENDIF                                                  
001900 231020      C                                                                          
002000 231020      C                   IF        INOPT = 3                                    
002100 231205      C                   CALL      'ADDGBSTUB'                                  
002200 231020      C                   ENDIF                                                  
002300 231205      C                                                                          
002400 231205      C                   IF        INOPT = 4                                    
002500 231205      C                   CALL      'READGBSTUB'                                 
002600 231205      C                   ENDIF                                                  
002700 231020      C                                                                          
002800 231020      C                   IF        INOPT = 7                                    
002900 231020      C                   EXSR      ADMKIOSK                                     
003000 231020      C                   ENDIF                                                  
003001 240310      C*------------------------------------------------------------------------ 
003002 240310      C     DOVOTE        BEGSR                                                  
003003 240310      C                   IF        CHKALWVOTE = 1                               
003004 240310      C                   CALL      'VOTESTUB'                                   
003005 240310      C                   ENDIF                                                  
003006 240310      C                   ENDSR                                                  
003100 230902      C*------------------------------------------------------------------------ 
003200 231209      C     DOLRN400      BEGSR                                                  
003300 231209      C                   IF        CHKLRN400 = 1                                
003400 231209      C                   CALL      'LRN400STUB'                                 
003500 231209      C                   ENDIF                                                  
003600 231209      C                   ENDSR                                                  
003700 231209      C*------------------------------------------------------------------------ 
003800 231020      C     ADMKIOSK      BEGSR                                                  
003900 231219      C                   EXFMT     ADMPSWRD                                     
004000 231219      C                   IF        INPWD = EXITPSWRD                            
004100 231020      C                   MOVEL     *ON           *INLR                          
004200 231020      C                   RETURN                                                 
004201 231219      C                   ENDIF                                                  
004300 231020      C                   ENDSR                                                  
004301 231219      C*-------------------------------------------------------------------------
004302 231219      C     GETPSWRD      BEGSR                                                  
004303 240104      C     *START        SETLL     SETTINGS                                     
004304 231219      C                   READ      SETTINGS                                     
004306 231219      C                   MOVEL     VALUE         EXITPSWRD                      
004309 231219      C                   ENDSR                                                  
004400 231020      C*-------------------------------------------------------------------------
004500 230902      C     CHKPARM       BEGSR                                                  
004600 230902      C                   MOVEL     LAUNCH        USERPROF                       
004700 230902      C     USERPROF      SETLL     EXHBREC                                      
004800 230902      C                   READ      EXHBDB                                       
004900 230902      C                   MOVEL     EXHBTITLE     OUTTITLE                       
005000 230902      C                   MOVEL     EXHBITOR      OUTNAME                        
005100 230902      C                   MOVEL     EXHBCITY      OUTCITY                        
005200 230902      C                   MOVEL     EXHBSTATE     OUTSTATE                       
005300 230902      C                   MOVEL     EXHBDESC      OUTDESC                        
005301 240310      C                   MOVEL     ELIGIBLE      CHKALWVOTE                     
005400 231209      C                   MOVEL     ENLRN400      CHKLRN400                      
005401 240310      C                                                                          
005402 240310      C                   IF        CHKALWVOTE = 1                               
005403 240310      C                   EVAL      *IN41 = *OFF                                 
005404 240310      C                   ELSE                                                   
005405 240310      C                   EVAL      *IN41 = *ON                                  
005406 240310      C                   ENDIF                                                  
005500 231209      C                                                                          
005600 231209      C                   IF        CHKLRN400 = 1                                
005700 231209      C                   EVAL      *IN40 = *OFF                                 
005800 231209      C                   ELSE                                                   
005900 231209      C                   EVAL      *IN40 = *ON                                  
006000 231209      C                   ENDIF                                                  
006100 231209      C                                                                          
006200 230902      C                   ENDSR                                                  
