/****************************************************
 * 1509853V-I011-0026
 * 1509853M-I011-0040
 * Date:2017.10.10
****************************************************/


#ifndef _SCAN_H_
#define _SCAN_H_
#include "globals.h"
/* MAXTOKENLEN is the maximum size of a token */
#define MAXTOKENLEN 40

/* tokenString array stores the lexeme of each token */
extern char tokenString[MAXTOKENLEN+1];

/* function getToken returns the 
 * next token in source file
 */
TokenType getToken(void);


#endif
