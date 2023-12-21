# VCF400
 AS/400 Application for Vintage Computer Festival

 Licensed under the Pirate License, see LICENSE.TXT for more details

 Beta 1 now out! See /SAVF for files

Source Layout:

* QDDSSRC: 	This library contains the data description spec for the voting database, guestbook database, LEARN/400 strings, and misc settings
* QMNUSRC:	This library contains the source for all menus
* QSDASRC:	This library contains the DDS for all RPG screen descriptions
* QRLUSRC:      This library contains the DDS for output specifications
* QRPGLESRC:	This library contains the RPG IV/ILE source code for all applications
* QCLSRC:       This library contains the CL source for helper programs (think batch/shell script)


Beta 2 TODO List:


* Create CL stub for ADMCRTEXHB so you don't have to manually type CALL ADMCRTEXHB PARM... all the time
* Finish ADMSETTING (the only setting right now is the admin password, I think I'm just going to be lazy and set that as a DFU program)
* Add function to ADDVOTE to block execution if voting has ended (Completed)
* Add screen to ADDVOTE to politely inform user that the exhibit is not eligible for awards on launch instead of going through the whole application (Not going to add)
* Add receipt printer support to voting program (now working)

