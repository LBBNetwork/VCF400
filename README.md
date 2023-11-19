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
* Create admin tool for setting passwords
* Create admin tool for setting VCF security officers (SECOFRS PF)
* Enforce password logout in EXHBMENU, SECOFR login on all admin tools
* Add password stubs to "Sign Off" and "Admin Tools" on menu VCFMAIN
* Create CL stub for ADMCRTEXHB so you don't have to manually type CALL ADMCRTEXHB PARM... all the time
* Update EXHBMENU to show 4th menu option - "Tour This Exhibit" controlled by flag in EXHBDB
* Update EXHBDB to add field for LEARN/400 support
