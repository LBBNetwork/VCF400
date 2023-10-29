     FSECOFRS   IF   E           K DISK
     FEXHBDB    UF A E           K DISK
     FEXHBMENUSCCF   E             WORKSTN
     DNEWOREDT         S              1P 0
     DALWEXIT          S              1P 0
     DERRSTS           S              1P 0
     DDLTACTIV         S              1P 0
     DUSERPROF         S              9A
     DEDTEXHB          S              9A
     DEMPTY            C                   CONST('          ')
     DERREXIST         C                   CONST('Error - USRPRF exists')
     DERRNF            C                   CONST('USRPRF not found, creating +
     D                                            new')
     DERRNODEL         C                   CONST('Not found - not deleted')
     DERRDELOK         C                   CONST('USRPRF was deleted from DB')
     DERRBLANK         C                   CONST('USRPRF cannot be blank     ')
     C*---------------------------------------------------------------------
     C     *ENTRY        PLIST
     C                   PARM                    LAUNCH            9
     C                   PARM                    EXHIBIT           9
     C*-----------------------------------------------------------------------
     C                   MOVEL     0             NEWOREDT
     C                   MOVEL     0             ERRSTS
     C                   MOVEL     0             DLTACTIV
     C
     C                   EXSR      CHKPARM
     C                   EXSR      LOADEXHB
     C
     C                   DOW       ALWEXIT = *ZERO
     C                   MOVEL     0             DLTACTIV
     C                   EXFMT     ADMCREATE
     C
     C                   IF        ERRSTS = 1
     C                   EVAL      ERRLINE = ERREXIST
     C                   ENDIF
     C
     C                   IF        ERRSTS = 2
     C                   EVAL      ERRLINE = ERRNF
     C                   ENDIF
     C
     C                   IF        ERRSTS = 3
     C                   EVAL      ERRLINE = ERRNODEL
     C                   ENDIF
     C
     C                   IF        ERRSTS = 4
     C                   EVAL      ERRLINE = ERRDELOK
     C                   ENDIF
     C
     C                   IF        ERRSTS = 5
     C                   EVAL      ERRLINE = ERRBLANK
     C                   ENDIF
     C
     C                   IF        *IN05 = *ON
     C                   EXSR      DELRCD
     C                   EVAL      *IN05 = *OFF
     C                   MOVEL     1             DLTACTIV
     C                   ENDIF
     C
     C                   IF        *IN12 = *ON
     C                   MOVEL     *ON           *INLR
     C                   RETURN
     C                   ENDIF
     C
     C                   IF        DLTACTIV  = *ZERO
     C                   EXSR      WRITEEXHB
     C                   ENDIF
     C                   ENDDO
     C
     C                   MOVEL     *ON           *INLR
     C                   RETURN
     C*---------------------------------------------------------------------
     C     LOADEXHB      BEGSR
     C                   IF        EDTEXHB = 'NONE'
     C*                    *Do nothing. Assume new (NEWOREDT = 0)
     C                   ELSE
     C     EDTEXHB       CHAIN     EXHBREC                            95
     C                   IF        *IN95 = *OFF
     C                   READE     EXHBDB
     C                   MOVEL     EXHBTITLE     INTITLE
     C                   MOVEL     EXHBITOR      INNAME
     C                   MOVEL     EXHBCITY      INCITY
     C                   MOVEL     EXHBSTATE     INSTATE
     C                   MOVEL     EXHBDESC      INDESC
     C                   MOVEL     ELIGIBLE      INELIGIBLE
     C                   MOVEL     EXHUSRPRF     INUSRPRF
     C                   MOVEL     EXHBDBID      INEXHBID
     C                   MOVEL     1             NEWOREDT
     C                   ELSE
     C                   MOVEL     EDTEXHB       INUSRPRF
     C                   MOVEL     2             ERRSTS
     C                   MOVEL     0             NEWOREDT
     C                   EVAL      ERRLINE = ERRNF
     C                   ENDIF
     C                   ENDIF
     C                   ENDSR
     C*---------------------------------------------------------------------
     C     WRITEEXHB     BEGSR
     C                   IF        INUSRPRF = *BLANK
     C                   MOVEL     5             ERRSTS
     C                   EVAL      ERRLINE = ERRBLANK
     C                   LEAVESR
     C                   ENDIF
     C
     C     EDTEXHB       SETLL     EXHBREC
     C                   READ      EXHBDB
     C                   MOVEL     INTITLE       EXHBTITLE
     C                   MOVEL     INNAME        EXHBITOR
     C                   MOVEL     INCITY        EXHBCITY
     C                   MOVEL     INSTATE       EXHBSTATE
     C                   MOVEL     INDESC        EXHBDESC
     C                   MOVEL     INELIGIBLE    ELIGIBLE
     C                   MOVEL     INUSRPRF      EXHUSRPRF
     C                   MOVEL     INEXHBID      EXHBDBID
     C                   IF        NEWOREDT = 0
     C     INUSRPRF      CHAIN     EXHBREC                            96
     C                   IF        *IN96 = *OFF
     C                   MOVEL     1             ERRSTS
     C                   EVAL      ERRLINE = ERREXIST
     C                   ELSE
     C                   WRITE     EXHBREC
     C                   MOVEL     1             ALWEXIT
     C                   ENDIF
     C                   ELSE
     C                   UPDATE    EXHBREC
     C                   MOVEL     1             ALWEXIT
     C                   ENDIF
     C                   ENDSR
     C*------------------------------------------------------------------------
     C     DELRCD        BEGSR
     C                   IF        INUSRPRF = *BLANK
     C                   MOVEL     5             ERRSTS
     C                   EVAL      ERRLINE = ERRBLANK
     C                   LEAVESR
     C                   ENDIF
     C
     C     INUSRPRF      CHAIN     EXHBREC                            97
     C                   IF        *IN97 = *OFF
     C                   EVAL      DLTEXHNAM = INUSRPRF
     C                   EXFMT     ADMDELETE
     C
     C*                  MOVEL     INUSRPRF      DLTEXHBNAM
     C
     C                   IF        *IN12 = *ON
     C                   EVAL      *IN12 = *OFF
     C                   LEAVESR
     C                   ENDIF
     C
     C                   DELETE    EXHBREC
     C                   MOVEL     4             ERRSTS
     C                   EVAL      ERRLINE = ERRDELOK
     C                   EVAL      INUSRPRF = EMPTY
     C
     C                   ELSE
     C                   MOVEL     3             ERRSTS
     C                   EVAL      ERRLINE = ERRNODEL
     C                   LEAVESR
     C                   ENDIF
     C
     C                   ENDSR
     C*---------------------------------------------------------------------
     C     CHKOFRS       BEGSR
     C                   ENDSR
     C*------------------------------------------------------------------------
     C     CHKPARM       BEGSR
     C                   MOVEL     LAUNCH        USERPROF
     C                   MOVEL     EXHIBIT       EDTEXHB
     C*TODO HERE: Logic to do the stuff to validate user is
     C*a SECOFR in the SECOFRS file
     C                   ENDSR
