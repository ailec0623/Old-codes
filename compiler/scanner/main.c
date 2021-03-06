/****************************************************
 * 1509853V-I011-0026
 * 1509853M-I011-0040
 * Date:2017.10.10
****************************************************/

#include "globals.h"
#include "scanner.h"

/* allocate global variables */
int lineno = 0;
FILE * source;
FILE * listing;
FILE * code;

/* allocate and set tracing flags */
int EchoSource = TRUE;
int TraceScan = TRUE;
int TraceParse = TRUE; 
int TraceAnalyze = FALSE;
int TraceCode = FALSE;

int Error = FALSE;

void main( int argc, char * argv[] )
{ TreeNode * syntaxTree;
  char pgm[120]; /* source code file name */
  if (argc != 2)
    { fprintf(stderr,"usage: %s <filename>\n",argv[0]);
      exit(1);
    }
  strcpy(pgm,argv[1]) ;
  if (strchr (pgm, '.') == NULL)
     strcat(pgm,".mir");
  source = fopen(pgm,"r");
  if (source==NULL)
  { fprintf(stderr,"File %s not found\n",pgm);
    exit(1);
  }
  listing = stdout; /* send listing to screen */
  fprintf(listing,"\nmirco COMPILATION: %s\n",pgm);

  while (getToken()!=ENDFILE);
}