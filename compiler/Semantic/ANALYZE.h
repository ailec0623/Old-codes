/****************************************************
 * 1509853V-I011-0026
 * 1509853M-I011-0040
 * Date:2017.10.20
****************************************************/


#ifndef _ANALYZE_H_
#define _ANALYZE_H_
#include "globals.h"
/* Function buildSymtab constructs the symbol 
 * table by preorder traversal of the syntax tree
 */
void buildSymtab(TreeNode *);

/* Procedure typeCheck performs type checking 
 * by a postorder syntax tree traversal
 */
void typeCheck(TreeNode *);

#endif
