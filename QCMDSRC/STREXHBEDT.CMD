             QSYS/CMD   PROMPT('START THE EXHIBIT EDITOR')
             QSYS/PARM  KWD(PASSWORD) TYPE(*CHAR) LEN(9)           +
                          MIN(1) PROMPT('ANY TEXT    ') /* 'Do not +
                          change - not implemented' */
             QSYS/PARM  KWD(EXHBNAME) TYPE(*NAME) LEN(9) MIN(1) +
             PROMPT('EXHIBIT NAME')
