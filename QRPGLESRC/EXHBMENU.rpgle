     FEXHBDB    IF   E           K DISK
     FSETTINGS  IF   E             DISK
     FEXHBMENUSCCF   E             WORKSTN
     DUSERPROF         S              9A
     DEXITPSWRD        S              9A
     DCHKLRN400        S              1P 0
     C     *ENTRY        PLIST
     C                   PARM                    LAUNCH            9
     C*-----------------------------------------------------------------------
     C*                  MOVEL     LAUNCH        PARMOUT
     C                   EXSR      CHKPARM
     C                   EXSR      GETPSWRD
     C                   EXFMT     MENU
     C
     C                   IF        INOPT = 1
     C                   CALL      'VCF/VOTESTUB'
     C                   ENDIF
     C
     C                   IF        INOPT = 2
     C                   EXSR      DOLRN400
     C                   ENDIF
     C
     C                   IF        INOPT = 3
     C                   CALL      'ADDGBSTUB'
     C                   ENDIF
     C
     C                   IF        INOPT = 4
     C                   CALL      'READGBSTUB'
     C                   ENDIF
     C
     C                   IF        INOPT = 7
     C                   EXSR      ADMKIOSK
     C                   ENDIF
     C*------------------------------------------------------------------------
     C     DOLRN400      BEGSR
     C                   IF        CHKLRN400 = 1
     C                   CALL      'LRN400STUB'
     C                   ENDIF
     C                   ENDSR
     C*------------------------------------------------------------------------
     C     ADMKIOSK      BEGSR
     C                   EXFMT     ADMPSWRD
     C                   IF        INPWD = EXITPSWRD
     C                   MOVEL     *ON           *INLR
     C                   RETURN
     C                   ENDIF
     C                   ENDSR
     C*-------------------------------------------------------------------------
     C     GETPSWRD      BEGSR
     C     *START        SETLL     SETTINGS
     C                   READ      SETTINGS
     C                   MOVEL     VALUE         EXITPSWRD
     C                   ENDSR
     C*-------------------------------------------------------------------------
     C     CHKPARM       BEGSR
     C                   MOVEL     LAUNCH        USERPROF
     C     USERPROF      SETLL     EXHBREC
     C                   READ      EXHBDB
     C                   MOVEL     EXHBTITLE     OUTTITLE
     C                   MOVEL     EXHBITOR      OUTNAME
     C                   MOVEL     EXHBCITY      OUTCITY
     C                   MOVEL     EXHBSTATE     OUTSTATE
     C                   MOVEL     EXHBDESC      OUTDESC
     C                   MOVEL     ENLRN400      CHKLRN400
     C
     C                   IF        CHKLRN400 = 1
     C                   EVAL      *IN40 = *OFF
     C                   ELSE
     C                   EVAL      *IN40 = *ON
     C                   ENDIF
     C
     C                   ENDSR
