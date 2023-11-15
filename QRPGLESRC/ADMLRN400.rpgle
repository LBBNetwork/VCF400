     FSECOFRS   IF   E           K DISK
     FLRN400STR UF A E           K DISK
     FLRN400SCR CF   E             WORKSTN
     DCURPAGENBR       S              4P 0
     C*---------------------------------------------------------------------
     C*    *ENTRY        PLIST
     C*                  PARM                    LAUNCH            9
     C*                  PARM                    EXHIBIT           9
     C*-----------------------------------------------------------------------
     C                   EXFMT     MAINADMIN
     C
     C                   READ      LRN400STR
     C                   MOVEL     PAGENBR       CURPAGENBR
     C                   ADD       1             CURPAGENBR
     C
     C                   IF        *IN05 = *ON
     C                   ADD       1             CURPAGENBR
     C                   ENDIF
     C
     C                   MOVEL     CURPAGENBR    PAGENBR
     C                   MOVEL     INCONTENT     CONTENT
     C                   MOVEL     INEXTRA       EXTRA
     C                   WRITE     LRN400RCD
     C
     C                   MOVEL     *ON           *INLR
     C                   RETURN
     C*---------------------------------------------------------------------
     C     WRITEEXHB     BEGSR
     C                   ENDSR
     C*------------------------------------------------------------------------
     C     DELRCD        BEGSR
     C                   ENDSR
     C*---------------------------------------------------------------------
     C     CHKOFRS       BEGSR
     C                   ENDSR
     C*------------------------------------------------------------------------
     C     CHKPARM       BEGSR
     C*                  MOVEL     LAUNCH        USERPROF
     C*                  MOVEL     EXHIBIT       EDTEXHB
     C*TODO HERE: Logic to do the stuff to validate user is
     C*a SECOFR in the SECOFRS file
     C                   ENDSR
