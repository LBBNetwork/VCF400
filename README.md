# VCF400
 AS/400 Application for Vintage Computer Festival

 Licensed under the Pirate License, see LICENSE.TXT for more details

Source Layout:

* QDDSSRC: 	This library contains the data description spec for the voting database, guestbook database, LEARN/400 strings, and misc settings
* QMNUSRC:	This library contains the source for all menus
* QRPGLESRC:	This library contains the RPG IV/ILE source code for all applications
* QSDASRC:	This library contains the DDS for all RPG screen descriptions


To-do List:

* (RPG) ADDGBCMT: Finish up enforcement of EXHBID parm; do not let user change EXHBID field unless parm 999 (Assume SECOFR) was specified
* (RPG) ADDVOTE: Mostly complete, finish enforcement of EXHBID parm, do not let user change EXHBID field unless parm 999 (Assume SECOFR) was specified
* (RPG) ADMSETTING: Not started. Monolithic program to specify application settings, Guestbook/400 comment visibility?
* (RPG) READGBCMT: Basics are working, can read a CMTID from user and pull CMTID from DB. Needs more functionality, need to let users see a list of comments and print them. Enforce EXHBID locking, do not allow an unrelated exhibit to read comments for other exhibits unless you run as 999 (Assume SECOFR). Also needs to obey the VISIBLE field in the guestbook DB; display error message if a comment has been hidden