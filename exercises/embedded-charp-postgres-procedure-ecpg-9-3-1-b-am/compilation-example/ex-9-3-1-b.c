/* Processed by ecpg (11.6) */
/* These include files are added by the preprocessor */
#include <ecpglib.h>
#include <ecpgerrno.h>
#include <sqlca.h>
/* End of automatic include section */

#line 1 "ex-9-3-1-b.pgc"
// UIS, 2020 - Jan Rolandsen
// Exercise 9.3.1.b  (C language)

/* Using the Embedded SQL C Preprocessor (ECPG) in PostgreSQL
    On my Windows 10 computer, using PostgreSQL 12.2, I can compile my ecpg program as follows:
    
    ecpg ex-9-3-1-b.pgc
    cc -I  "c:/Program Files/PostgreSQL/12/include" -c  ex-9-3-1-b.c
    cc -o  ex-9-3-1-b  ex-9-3-1-b.o  -L "c:/Program Files/PostgreSQL/12/lib" -l ecpg

    and now I can run my program:
    ex-9-3-1-b.exe
*/

#include <stdio.h>
#include <stdlib.h>


#line 1 "/Applications/Postgres.app/Contents/Versions/11/include/sqlca.h"
#ifndef POSTGRES_SQLCA_H
#define POSTGRES_SQLCA_H

#ifndef PGDLLIMPORT
#if  defined(WIN32) || defined(__CYGWIN__)
#define PGDLLIMPORT __declspec (dllimport)
#else
#define PGDLLIMPORT
#endif							/* __CYGWIN__ */
#endif							/* PGDLLIMPORT */

#define SQLERRMC_LEN	150

#ifdef __cplusplus
extern "C"
{
#endif

struct sqlca_t
{
	char		sqlcaid[8];
	long		sqlabc;
	long		sqlcode;
	struct
	{
		int			sqlerrml;
		char		sqlerrmc[SQLERRMC_LEN];
	}			sqlerrm;
	char		sqlerrp[8];
	long		sqlerrd[6];
	/* Element 0: empty						*/
	/* 1: OID of processed tuple if applicable			*/
	/* 2: number of rows processed				*/
	/* after an INSERT, UPDATE or				*/
	/* DELETE statement					*/
	/* 3: empty						*/
	/* 4: empty						*/
	/* 5: empty						*/
	char		sqlwarn[8];
	/* Element 0: set to 'W' if at least one other is 'W'	*/
	/* 1: if 'W' at least one character string		*/
	/* value was truncated when it was			*/
	/* stored into a host variable.             */

	/*
	 * 2: if 'W' a (hopefully) non-fatal notice occurred
	 */	/* 3: empty */
	/* 4: empty						*/
	/* 5: empty						*/
	/* 6: empty						*/
	/* 7: empty						*/

	char		sqlstate[5];
};

struct sqlca_t *ECPGget_sqlca(void);

#ifndef POSTGRES_ECPG_INTERNAL
#define sqlca (*ECPGget_sqlca())
#endif

#ifdef __cplusplus
}
#endif

#endif

#line 18 "ex-9-3-1-b.pgc"

/* exec sql whenever sqlerror  sqlprint ; */
#line 19 "ex-9-3-1-b.pgc"


void findLaptops () {

    // connecting ...
    { ECPGconnect(__LINE__, 0, "pcdb@localhost:5432" , "postgres" , "uis" , NULL, 0); 
#line 24 "ex-9-3-1-b.pgc"

if (sqlca.sqlcode < 0) sqlprint();}
#line 24 "ex-9-3-1-b.pgc"
         // user and password
    if (sqlca.sqlcode) {
       printf (" Error: %s\n", sqlca.sqlerrm.sqlerrmc);     // the ECPG signal method
       exit (1);                                            // exit and signal error
    }

	/* exec sql begin declare section */
		                  // given by user via section below
		   
		   
		      
		    
		                   
		                    
	
#line 31 "ex-9-3-1-b.pgc"
 int minRam , minHd , result ;
 
#line 32 "ex-9-3-1-b.pgc"
 float minSpeed , minScreen ;
 
#line 33 "ex-9-3-1-b.pgc"
 char model [ 5 ] , maker [ 2 ] ;
 
#line 34 "ex-9-3-1-b.pgc"
 int ram , hd , screen , speed , price ;
 
#line 35 "ex-9-3-1-b.pgc"
 const char * stmt = "SELECT L.model, L.speed, L.ram, L.hd, L.screen, L.price, P.maker " "FROM Laptop L, Product P WHERE L.speed >= ? AND L.ram >= ? AND L.hd >= ? " "  AND L.screen >= ? AND L.model = P.model ;" ;
/* exec sql end declare section */
#line 38 "ex-9-3-1-b.pgc"


    // If the last SQL statement was successful, then sqlca.sqlerrd[1] contains the OID of the processed row, if applicable, 
    // and sqlca.sqlerrd[2] contains the number of processed or returned rows, if applicable to the command.
    
    printf ("Query:\n");
    
	/* Ask user for maximum price and minimum values of speed, ram, hd size, screen size */
	printf("Enter minimum value of speed: ");       scanf("%f", &minSpeed);
	printf("Enter minimum value of ram: ");         scanf("%d", &minRam);
	printf("Enter minimum value of hd size: ");     scanf("%d", &minHd);
	printf("Enter minimum value of screen size: "); scanf("%f", &minScreen);

	{ ECPGprepare(__LINE__, NULL, 0, "query1", stmt);
#line 51 "ex-9-3-1-b.pgc"

if (sqlca.sqlcode < 0) sqlprint();}
#line 51 "ex-9-3-1-b.pgc"

	/* declare cursor1 cursor for $1 */
#line 52 "ex-9-3-1-b.pgc"

	{ ECPGdo(__LINE__, 0, 1, NULL, 0, ECPGst_normal, "declare cursor1 cursor for $1", 
	ECPGt_char_variable,(ECPGprepared_statement(NULL, "query1", __LINE__)),(long)1,(long)1,(1)*sizeof(char), 
	ECPGt_NO_INDICATOR, NULL , 0L, 0L, 0L, 
	ECPGt_float,&(minSpeed),(long)1,(long)1,sizeof(float), 
	ECPGt_NO_INDICATOR, NULL , 0L, 0L, 0L, 
	ECPGt_int,&(minRam),(long)1,(long)1,sizeof(int), 
	ECPGt_NO_INDICATOR, NULL , 0L, 0L, 0L, 
	ECPGt_int,&(minHd),(long)1,(long)1,sizeof(int), 
	ECPGt_NO_INDICATOR, NULL , 0L, 0L, 0L, 
	ECPGt_float,&(minScreen),(long)1,(long)1,sizeof(float), 
	ECPGt_NO_INDICATOR, NULL , 0L, 0L, 0L, ECPGt_EOIT, ECPGt_EORT);
#line 53 "ex-9-3-1-b.pgc"

if (sqlca.sqlcode < 0) sqlprint();}
#line 53 "ex-9-3-1-b.pgc"


    /* When end of result set reached, break out of while loop.
       Observe: In the C language 0 is FALSE, and everything else is TRUE */
    while (1) {  // run forever
	  	{ ECPGdo(__LINE__, 0, 1, NULL, 0, ECPGst_normal, "fetch next cursor1", ECPGt_EOIT, 
	ECPGt_char,(model),(long)5,(long)1,(5)*sizeof(char), 
	ECPGt_NO_INDICATOR, NULL , 0L, 0L, 0L, 
	ECPGt_float,&(minSpeed),(long)1,(long)1,sizeof(float), 
	ECPGt_NO_INDICATOR, NULL , 0L, 0L, 0L, 
	ECPGt_int,&(minRam),(long)1,(long)1,sizeof(int), 
	ECPGt_NO_INDICATOR, NULL , 0L, 0L, 0L, 
	ECPGt_int,&(minHd),(long)1,(long)1,sizeof(int), 
	ECPGt_NO_INDICATOR, NULL , 0L, 0L, 0L, 
	ECPGt_float,&(minScreen),(long)1,(long)1,sizeof(float), 
	ECPGt_NO_INDICATOR, NULL , 0L, 0L, 0L, 
	ECPGt_int,&(price),(long)1,(long)1,sizeof(int), 
	ECPGt_NO_INDICATOR, NULL , 0L, 0L, 0L, 
	ECPGt_char,(maker),(long)2,(long)1,(2)*sizeof(char), 
	ECPGt_NO_INDICATOR, NULL , 0L, 0L, 0L, ECPGt_EORT);
#line 58 "ex-9-3-1-b.pgc"

if (sqlca.sqlcode < 0) sqlprint();}
#line 58 "ex-9-3-1-b.pgc"

        // When end of resultSet is reached, break out of the while loop
        // If a warning or error occurred, then sqlca.sqlcode will be negative and sqlca.sqlstate will be different from "00000". 
        if (sqlca.sqlcode) break;       // break only if sqlca.sqlcode <> 0
            
		printf ("maker: %s, model: %s, speed: %.2f, ram: %d, hd: %d, screen: %.1f, price: %d\n",
			    maker, model, minSpeed, minRam, minHd, minScreen, price) ;
	}
	
	{ ECPGdo(__LINE__, 0, 1, NULL, 0, ECPGst_normal, "close cursor1", ECPGt_EOIT, ECPGt_EORT);
#line 67 "ex-9-3-1-b.pgc"

if (sqlca.sqlcode < 0) sqlprint();}
#line 67 "ex-9-3-1-b.pgc"
    // release resource (memory)
	{ ECPGdeallocate(__LINE__, 0, NULL, "query1");
#line 68 "ex-9-3-1-b.pgc"

if (sqlca.sqlcode < 0) sqlprint();}
#line 68 "ex-9-3-1-b.pgc"

    
    // disconnecting ...
    { ECPGdisconnect(__LINE__, "ALL");
#line 71 "ex-9-3-1-b.pgc"

if (sqlca.sqlcode < 0) sqlprint();}
#line 71 "ex-9-3-1-b.pgc"

}

/* run main program: */
int main () {
    
    findLaptops () ;
    return 0 ;      // exit and signal ok
}


/*   This query will return 3 rows:
	    SELECT L.model, L.speed, L.ram, L.hd, L.screen, L.price, P.maker
		 FROM Laptop L, Product P
		 WHERE L.model = P.model 
		    AND L.speed >= 2.0
		 	AND L.ram >= 500
		 	AND L.hd >= 100
		 	AND L.screen >= 14.5 ;
*/