/****************************************************
 * 1509853V-I011-0026
 * 1509853M-I011-0040
 * Date:2017.10.20
****************************************************/


#ifndef _SYMTAB_H_
#define _SYMTAB_H_
#include <stdio.h>
/* Procedure st_insert inserts line numbers and
 * memory locations into the symbol table
 * loc = memory location is inserted only the
 * first time, otherwise ignored
 */
void st_insert( char * name, int lineno, int loc );

/* Function st_lookup returns the memory 
 * location of a variable or -1 if not found
 */
int st_lookup ( char * name );

/* Procedure printSymTab prints a formatted 
 * listing of the symbol table contents 
 * to the listing file
 */
void printSymTab(FILE * listing);

#endif
