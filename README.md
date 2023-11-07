# VCF400
 AS/400 Application for Vintage Computer Festival

 Licensed under the Pirate License, see LICENSE.TXT for more details

Source Layout:

* QDDSSRC: 	This library contains the data description spec for the voting database, guestbook database, LEARN/400 strings, and misc settings
* QMNUSRC:	This library contains the source for all menus
* QSDASRC:	This library contains the DDS for all RPG screen descriptions
* QRLUSRC:      This library contains the DDS for output specifications

* QRPGLESRC:	This library contains the RPG IV/ILE source code for all applications
* QCLSRC:       This library contains the CL source for helper programs (think batch/shell script)


To-do List:

* (RPG) ADDGBCMT: EXHBID is now respected on launch!
* (RPG) ADDVOTE: Now respects passed USRPRF parm at launch!
* (RPG) ADMSETTING: Not started. Monolithic program to specify application settings, Guestbook/400 comment visibility?
* (RPG) READGBCMT: Basics are working. Can read comments from GUESTBKDB and display them to screen. Also respects VISIBLE field in DB and hides comments if an admin disabled that comment from view. If not launched as SECOFR USRPRF, comments are private. Still want that scrolling SFL though.
* (RPG) EXHBMENU: Now launches other programs. Add kiosk escape hatch password and fix up some screen layout bugs next.
* (RPG) PRINTER: Actually learn how to make printer files work and print stuff. This will be important to the voting and guestbook systems.
* (CL) STUBs: Completed. Probably shouldn't change unless I do something wild.
