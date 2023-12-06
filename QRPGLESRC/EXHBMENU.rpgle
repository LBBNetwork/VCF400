     FEXHBDB    IF   E           K DISK
     FEXHBMENUSCCF   E             WORKSTN
     DUSERPROF         S              9A
     C     *ENTRY        PLIST
     C                   PARM                    LAUNCH            9
     C*-----------------------------------------------------------------------
     C*                  MOVEL     LAUNCH        PARMOUT
     C                   EXSR      CHKPARM
     C                   EXFMT     MENU
     C
     C                   IF        INOPT = 1
     C                   CALL      'VCF/VOTESTUB'
     C                   ENDIF
     C
     C                   IF        INOPT = 2
     C* todo: add logic for learn/400 nonsense
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
     C     ADMKIOSK      BEGSR
     C*******************EXFMT     ADMPSWRD
     C*******************IF        PSWRD = 'MAGIC'
     C                   MOVEL     *ON           *INLR
     C                   RETURN
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
     C                   ENDSR
