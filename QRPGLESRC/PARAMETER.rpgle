000100 230820       *Open Display File TESTSUITE, this contains our display fields            
000200 230820      FTESTSUITE CF   E             WORKSTN                                      
000300 230820       *Set up our parameter list, this is roughly equivalent to argc and argv in
000400 230820      C     *ENTRY        PLIST                                                  
000500 230820      C                   PARM                    LAUNCH           20            
000600 230820       *Copy the contents of our LAUNCH parm into field PARMOUT defined in TESTSU
000700 230820      C                   MOVEL     LAUNCH        PARMOUT                        
000800 230820       *Now we show the TESTPARM screen from TESTSUITE                           
000900 230820      C                   EXFMT     TESTPARM                                     
001000 230820       *Free memory and exit program (return to caller)                          
001100 230820      C                   MOVEL     *ON           *INLR                          
001200 230820      C                   RETURN                                                 