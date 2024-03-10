000100 230813      FVOTINGDB  UF A E           K DISK                                         
000200 230814      FEXHBDB    IF   E           K DISK                                         
000300 230815      FAWARDDB   IF   E           K DISK                                         
000301 231220      FSETTINGS  IF   E           K DISK                                         
000400 230904      FVOTESCR   CF   E             WORKSTN                                      
000401 231220      DSTN              S              9A                                        
000402 231220      DSTNVAL           S              9A                                        
000500 230904      DUSERPRF          S              9A                                        
000600 230815      DCHECKOK          S              1P 0                                      
000700 230810      DSUCCESS          C                   CONST('You have voted successfully') 
000800 230813      DERRBLKBG         C                   CONST('Must enter badge number')     
000900 230813      DERRBLKEX         C                   CONST('Must enter Exhibit ID')       
001000 230813      DERRBLKAW         C                   CONST('Must enter Award ID')         
001100 230813      DERREXIST         C                   CONST('You have already voted.')     
001200 230813      DERRENTER         C                   CONST('Use F5 key to submit')        
001300 230815      DERRPROHB         C                   CONST('Exhibit ineligible for award')
001400 230815      DERRNOEXB         C                   CONST('Exhibit does not exist')      
001500 230815      DERRNOAWD         C                   CONST('Award does not exist.')       
001600 230904      DERRDBG1          C                   CONST('DBG: MM2024 parm')            
001700 230904      DERRDBG2          C                   CONST('DBG: other parm')             
001800 230904      C*-----------------------------------------------                          
001900 230904      C     *ENTRY        PLIST                                                  
002000 230904      C                   PARM                    LAUNCH            9            
002100 230813      C*-----------------------------------------------                          
002200 230904      C                   EXSR      CHKPARM                                      
002201 231220      C                   EXSR      CHKALWVOTE                                   
002202 231220      C                                                                          
002300 230813      C                   DOW       *IN05 = *OFF                                 
002400 230810      C                   EXFMT     VOTE1                                        
002500 230813      C*                                                                         
002600 230813      C                   IF        INPUTBADGE = *ZERO                           
002700 230813      C                   EVAL      ERRLINE = ERRBLKBG                           
002800 230813      C                   EVAL      *IN05 = *OFF                                 
002900 230813      C                   ENDIF                                                  
003000 230813      C*                                                                         
003100 230815      C                   IF        INPUTAWARD = *ZERO                           
003200 230813      C                   EVAL      ERRLINE = ERRBLKAW                           
003300 230813      C                   EVAL      *IN05 = *OFF                                 
003400 230813      C                   ENDIF                                                  
003500 230813      C*                                                                         
003600 230904      C                   IF        INEXHB    = *ZERO                            
003700 230813      C                   EVAL      ERRLINE = ERRBLKEX                           
003800 230813      C                   EVAL      *IN05 = *OFF                                 
003900 230813      C                   ENDIF                                                  
003901 231220      C                                                                          
003902 231220      C                   IF        INEXHB    = 'DAVE'                           
003903 231220      C                   EXSR      DODAVE                                       
003904 231220      C                   ENDIF                                                  
004000 230813      C*                                                                         
004100 230813      C                   IF        *IN12 = *ON                                  
004200 230813      C                   MOVEL     *ON           *INLR                          
004300 230813      C                   RETURN                                                 
004400 230813      C                   ENDIF                                                  
004500 230813      C*                                                                         
004600 230813      C                   ENDDO                                                  
004700 230813      C                   EXSR      ADDTODB                                      
004800 230813      C*----------------------------------------------------                     
004900 230813      C     ADDTODB       BEGSR                                                  
005000 230815      C                   MOVEL     0             CHECKOK                        
005100 230813      C                   EVAL      *IN05 = *OFF                                 
005200 230813      C     INPUTBADGE    CHAIN     VOTINGREC                          95        
005300 230813      C                   IF        *IN95 = *OFF                                 
005400 230813      C                   EVAL      ERRLINE = ERREXIST                           
005401 231220      C                   ELSE                                                   
005402 231220      C                   ADD       1             CHECKOK                        
005500 230814      C                   ENDIF                                                  
005600 230813      C                   READ      VOTINGDB                               90    
005700 230904      C     INEXHB        SETLL     EXHBREC                                      
005800 230815      C                   READ      EXHBDB                                       
005900 230815      C*                                                                         
006000 230815      C                   IF        ELIGIBLE = 0                                 
006100 230814      C                   EVAL      ERRLINE = ERRPROHB                           
006200 230815      C                   ELSE                                                   
006300 230815      C                   ADD       1             CHECKOK                        
006400 230815      C                   ENDIF                                                  
006500 230815      C*                                                                         
006600 230904      C     INEXHB        CHAIN     EXHBREC                            93        
006700 230815      C                   IF        *IN93 = *OFF                                 
006800 230815      C                   ADD       1             CHECKOK                        
006900 230815      C                   ELSE                                                   
007000 230815      C                   EVAL      ERRLINE = ERRNOEXB                           
007100 230815      C                   ENDIF                                                  
007200 230815      C*                                                                         
007300 230815      C     INPUTAWARD    CHAIN     AWARDRCD                           94        
007400 230815      C                   IF        *IN94 = *OFF                                 
007500 230815      C                   ADD       1             CHECKOK                        
007600 230815      C                   ELSE                                                   
007700 230815      C                   EVAL      ERRLINE = ERRNOAWD                           
007800 230815      C                   ENDIF                                                  
007900 230815      C*                                                                         
008000 231220      C                   IF        CHECKOK = 4                                  
008100 230810      C                   MOVEL     INPUTBADGE    BADGENBR                       
008200 230810      C                   MOVEL     INPUTAWARD    AWARDNBR                       
008300 230904      C                   MOVEL     INEXHB        EXHBNBR                        
008400 230813      C                   WRITE     VOTINGREC                                    
008401 240310      C                   CALL      'PRTLSTVOTE'                                 
008500 230813      C                   EXSR      ENDVOTE                                      
008600 230813      C                   ENDIF                                                  
008700 230813      C                   ENDSR                                                  
008800 230820      C*-------------------------------------------------------                  
008900 230820      C     CHKPARM       BEGSR                                                  
009000 230904      C                   MOVEL     LAUNCH        USERPRF                        
009100 230904      C                   IF        USERPRF = 'MM2024'                           
009200 230904      C*TODO: Don't make this IF block hardcoded                                 
009300 230904      C*This line left blank. If SECOFR profile passed,                          
009400 230904      C*allow any Exhibit ID to be entered.                                      
009500 230904      C                   ELSE                                                   
009600 230904      C                   MOVEL     USERPRF       INEXHB                         
009700 230904      C                   MOVEL     *ON           *IN70                          
009800 230904      C                   ENDIF                                                  
009900 230820      C                   ENDSR                                                  
009901 231220      C*-------------------------------------------------------                  
009902 231220      C     CHKALWVOTE    BEGSR                                                  
009903 231220      C     *LOVAL        SETLL     SETTINGS                                     
009904 231220      C                   DOU       %EOF(SETTINGS)                               
009905 231220      C                   READ      SETTINGS                                     
009906 231220      C                   MOVEL     SETTING       STN                            
009907 231220      C                   IF        STN = 'ALWVOTE'                              
009908 231220      C                   MOVEL     VALUE         STNVAL                         
009909 231220      C                   ENDIF                                                  
009910 231220      C                   ENDDO                                                  
009911 231220      C                                                                          
009912 231220      C                   IF        STNVAL = 'N'                                 
009913 231220      C                   EXFMT     ENDOFCON                                     
009914 231220      C                   MOVEL     *ON           *INLR                          
009915 231220      C                   RETURN                                                 
009916 231220      C                   ENDIF                                                  
009917 231220      C                   ENDSR                                                  
010000 230813      C*-------------------------------------------------------                  
010001 231220      C     DODAVE        BEGSR                                                  
010002 231220      C                   EXFMT     DAVE                                         
010003 231220      C                   MOVEL     *ON           *INLR                          
010004 231220      C                   RETURN                                                 
010005 231220      C                   ENDSR                                                  
010006 231220      C*-------------------------------------------------------                  
010100 230813      C     ENDVOTE       BEGSR                                                  
010200 230813      C                   EXFMT     VOTEEND                                      
010201 231220      C*                  CALL      'PRTLSTVOTE'                                 
010300 230813      C                   MOVEL     *ON           *INLR                          
010400 230813      C                   RETURN                                                 
010500 230813      C                   ENDSR                                                  
