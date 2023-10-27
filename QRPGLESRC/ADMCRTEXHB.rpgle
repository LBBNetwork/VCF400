000100 231024      FSECOFRS   IF   E           K DISK                                         
000200 230902      FEXHBDB    UF A E           K DISK                                         
000300 230902      FEXHBMENUSCCF   E             WORKSTN                                      
000301 231026      DNEWOREDT         S              1P 0                                      
000400 230902      DUSERPROF         S              9A                                        
000500 231024      DEDTEXHB          S              9A                                        
000600 231026      DDBGTST           C                   CONST('1234567890')                  
000700 231024      C*---------------------------------------------------------------------    
000800 230820      C     *ENTRY        PLIST                                                  
000900 230902      C                   PARM                    LAUNCH            9            
001000 231024      C                   PARM                    EXHIBIT           9            
001100 230902      C*-----------------------------------------------------------------------  
001101 231026      C                   MOVEL     0             NEWOREDT                       
001200 231024      C                   EXSR      CHKPARM                                      
001300 231026      C                   EXSR      LOADEXHB                                     
001400 230902      C                   EXFMT     ADMCREATE                                    
001401 231026      C                   EXSR      WRITEEXHB                                    
002800 230820      C                   MOVEL     *ON           *INLR                          
002900 230820      C                   RETURN                                                 
003000 231024      C*---------------------------------------------------------------------    
003100 231024      C     LOADEXHB      BEGSR                                                  
003200 231024      C                   IF        EDTEXHB = 'NONE'                             
003300 231026      C*                    *Do nothing. Assume new (NEWOREDT = 0)               
003400 231024      C                   ELSE                                                   
003500 231024      C*                    *Scan the EXHBDB for a match and load in|            
003501 231026      C                   ADD       1             NEWOREDT                       
003600 231026      C     EDTEXHB       SETLL     EXHBREC                                      
003700 231026      C                   READ      EXHBDB                                       
003800 231026      C                   MOVEL     EXHBTITLE     INTITLE                        
003900 231026      C                   MOVEL     EXHBITOR      INNAME                         
004000 231026      C                   MOVEL     EXHBCITY      INCITY                         
004100 231026      C                   MOVEL     EXHBSTATE     INSTATE                        
004200 231026      C                   MOVEL     EXHBDESC      INDESC                         
004300 231026      C                   MOVEL     ELIGIBLE      INELIGIBLE                     
004400 231026      C                   MOVEL     EXHUSRPRF     INUSRPRF                       
004500 231026      C                   MOVEL     EXHBDBID      INEXHBID                       
004600 231024      C                   ENDIF                                                  
004700 231024      C                   ENDSR                                                  
004701 231026      C*---------------------------------------------------------------------    
004702 231026      C     WRITEEXHB     BEGSR                                                  
004703 231026      C     EDTEXHB       SETLL     EXHBREC                                      
004704 231026      C                   READ      EXHBDB                                       
004705 231026      C                   MOVEL     INTITLE       EXHBTITLE                      
004706 231026      C                   MOVEL     INNAME        EXHBITOR                       
004707 231026      C                   MOVEL     INCITY        EXHBCITY                       
004708 231026      C                   MOVEL     INSTATE       EXHBSTATE                      
004709 231026      C                   MOVEL     INDESC        EXHBDESC                       
004710 231026      C                   MOVEL     INELIGIBLE    ELIGIBLE                       
004711 231026      C                   MOVEL     INUSRPRF      EXHUSRPRF                      
004712 231026      C                   MOVEL     INEXHBID      EXHBDBID                       
004713 231026      C                   IF        NEWOREDT = 0                                 
004714 231026      C                   WRITE     EXHBREC                                      
004715 231026      C                   ELSE                                                   
004716 231026      C                   UPDATE    EXHBREC                                      
004717 231026      C                   ENDIF                                                  
004718 231026      C                   ENDSR                                                  
004800 231024      C*---------------------------------------------------------------------    
004900 231024      C     CHKOFRS       BEGSR                                                  
005000 231024      C                   ENDSR                                                  
005100 230902      C*------------------------------------------------------------------------ 
005200 230902      C     CHKPARM       BEGSR                                                  
005300 231024      C                   MOVEL     LAUNCH        USERPROF                       
005400 231024      C                   MOVEL     EXHIBIT       EDTEXHB                        
005500 231024      C*TODO HERE: Logic to do the stuff to validate user is                     
005600 231024      C*a SECOFR in the SECOFRS file                                             
005700 230902      C                   ENDSR                                                  
