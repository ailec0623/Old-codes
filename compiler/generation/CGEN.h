/****************************************************
 * 1509853V-I011-0026
 * 1509853M-I011-0040
 * Date:2017.10.27
****************************************************/


#ifndef _CGEN_H_
#define _CGEN_H_
#include "globals.h"
/* Procedure codeGen generates code to a code
 * file by traversal of the syntax tree. The
 * second parameter (codefile) is the file name
 * of the code file, and is used to print the
 * file name as a comment in the code file
 */
void codeGen(TreeNode * syntaxTree, char * codefile);

#endif
