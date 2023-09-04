# VCF400
 AS/400 Application for Vintage Computer Festival

 Licensed under the Pirate License, see LICENSE.TXT for more details

Source Layout:

* QDDSSRC: 	This library contains the data description spec for the voting database, guestbook database, LEARN/400 strings, and misc settings
* QMNUSRC:	This library contains the source for all menus
* QRPGLESRC:	This library contains the RPG IV/ILE source code for all applications
* QSDASRC:	This library contains the DDS for all RPG screen descriptions
* QCLSRC:       This library contains the CL source for helper programs (think batch/shell script)


To-do List:

* (RPG) ADDGBCMT: Finish up enforcement of EXHBID parm; do not let user change EXHBID field unless parm 999 (Assume SECOFR) was specified
* (RPG) ADDVOTE: Now respects passed USRPRF parm at launch!
* (RPG) ADMSETTING: Not started. Monolithic program to specify application settings, Guestbook/400 comment visibility?
* (RPG) READGBCMT: Basics are working. Can read comments from GUESTBKDB and display them to screen. Also respects VISIBLE field in DB and hides comments if an admin disabled that comment from view. I want a scrolling SFL though... also need to disable reading other guest's comments unless you're passing 999 to the launch parm
* (RPG) EXHBMENU: Actually make the Exhibitor Menu function for launching other programs
* (CL) STUBs: Completed. Probably shouldn't change unless I do something wild.
