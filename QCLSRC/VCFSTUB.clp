
             QSYS/PGM
             QSYS/DCL   VAR(&PROFILE) TYPE(*CHAR) LEN(10)
             QSYS/RTVJOBA CURUSER(&PROFILE)
             QSYS/CALL  PGM(VCF/EXHBMENU) PARM(&PROFILE)
             QSYS/ENDPGM
