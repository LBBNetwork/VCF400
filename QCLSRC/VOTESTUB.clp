000100 230904                                                                                 
000200 230904              QSYS/PGM                                                           
000300 230904              QSYS/DCL   VAR(&PROFILE) TYPE(*CHAR) LEN(10)                       
000400 230904              QSYS/RTVJOBA CURUSER(&PROFILE)                                     
000401 240310              QSYS/CALL  PGM(VCF/NTRSTIT)                                        
000500 230904              QSYS/CALL  PGM(VCF/ADDVOTE)  PARM(&PROFILE)                        
000600 230904              QSYS/ENDPGM                                                        
