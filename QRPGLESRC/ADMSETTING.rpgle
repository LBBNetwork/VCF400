     FSETTINGS  UF   E           K DISK
     FSETUPSCR  CF   E             WORKSTN
     DSTN              S              9A
     DSTNVAL           S              9A
     C*-----------------------------------------------
     C     *LOVAL        SETLL     SETTINGS
     C                   DOU       %EOF(SETTINGS)
     C                   READ      SETTINGS
     C                   MOVEL     SETTING       STN
     C                   IF        STN = 'PASSWORD'
     C                   MOVEL     VALUE         INPWD
     C                   ENDIF
     C                   IF        STN = 'ALWVOTE'
     C                   MOVEL     VALUE         INALWVOTE
     C                   ENDIF
     C                   ENDDO
     C
     C                   EXFMT     SETUPMAIN
     C*                  EXSR      ADDTODB
     C
     C     *LOVAL        SETLL     SETTINGS
     C                   DOU       %EOF(SETTINGS)
     C                   READ      SETTINGSR
     C                   MOVEL     SETTING       STN
     C                   IF        STN = 'PASSWORD'
     C                   MOVEL     INPWD         VALUE
     C                   UPDATE    SETTINGSR
     C                   ENDIF
     C                   IF        STN = 'ALWVOTE'
     C                   MOVEL     INALWVOTE     VALUE
     C                   UPDATE    SETTINGSR
     C                   ENDIF
     C                   ENDDO
     C
     C                   MOVEL     *ON           *INLR
     C                   RETURN
     C*----------------------------------------------------
     C     ADDTODB       BEGSR
     C*                  MOVEL     INCMT         GUESTCMT
     C*                  WRITE     GUESTBKRCD
     C                   ENDSR
