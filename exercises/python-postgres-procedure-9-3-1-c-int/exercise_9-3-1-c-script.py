# python in the database
# exercise 9.3.1.C International edition
# exercise 9.3.1.A American edition. 
# exercise 3.1.A on page 382 special KU edition

# Ask the user for a price and the pc whose price is closest to the desired price.
# Print the maker, model number, and ram of the pc


# for at der kan vælges frem og tilbage lader jeg resultatsætte være scrollable. 
# så skal jeg have en strategi. Rulle frem, rulle tilbage. Lav en binær søgning med indiceret scroll.
# scrollable resultatsæt kræver en 'named cursor'. På serversiden er det en referenced cursor.
# Em referenced cursor er en stored procedure der giver en reference til en SQl som returparameter.

#AL20190317
#AL20200327 cleaning up
#AL20200327 fjerner teknisk gæld

import psycopg2

def getcon():
    #return psycopg2.connect("dbname='postgres' user='postgres' host='localhost' password='uis'")
    return psycopg2.connect("dbname='develop' user='develop' host='localhost' password=''")

print ("------------------");
print ("-Starting-9-3-1-c-");
print ("------------------");
 
# lav exception clause
try:
    with getcon() as conn:
        try:
            cur = conn.cursor();
            # schema kan sættes her. uncomment.
            cur.execute('set search_path = pc;')
            #cur.execute('set search_path = "$user", public;')
        except psycopg2.Error as e:
            print (e.pgerror);
            print (e.diag.severity);
            print (e.diag.message_primary);
        
        try:
            # kald til stored procedure med et navn til den referenced cursor
            cur.callproc('pc.ref_931c',['pc-scroll']);
        except psycopg2.Error as e:
            #print (e.pgerror);
            print (e.diag.severity);
            print (e.diag.message_primary);
        
        try:
            # kald til den navngivne cursor som scrollable
            cur2 = conn.cursor('pc-scroll', scrollable=True);
        except psycopg2.Error as e:
            print (e.pgerror);
            #print (e.diag.severity);
            #print (e.diag.message_primary);
        
        difference = 10000;
        candidate_model = 0;
        candidate_price = 0;
        candidate_ram = 0;
        candidate_maker = 'none';
        candidate_row = -1;
        # get input
        input_price = 500;

        print();
        print ("input price is fixed to   : ", input_price);
        print();
         
        for record in cur2:
            print ("tuple             :", record);
            print ("                  : difference [ ] ", difference, " abs | | ", abs(record[4]-candidate_price));
            if abs(record[4]-candidate_price) < difference: 
                candidate_model = record[0];
                candidate_ram   = record[3];
                candidate_maker = record[5];
                candidate_row = cur2.rownumber;
                difference = abs(record[4]-candidate_price);
                candidate_price = record[4];
                print(" | | <  [ ]       : Lower.     tuple rownumber: ", cur2.rownumber, " difference [ ] ", difference);
            else:
                print(" | | >= [ ]       : NOT lower. tuple rownumber: ", cur2.rownumber);
                pass;
            
                   
        try:
            if candidate_row > -1:
                cur2.scroll(candidate_row, 'absolute');
                row3 = cur2.fetchone();
                print ("------------------");
                print ("row           :", row3);
                print ("result        : maker ", row3[5], " model ", row3[0], " ram ", row3[3]);
                print ("difference    : ", difference);
                print ("candidate row : ", candidate_row);
                print ("target price  : ", input_price);
            else:
                print("no candidate pc found ");
                pass;

        except psycopg2.Error as e:
            #print (e.pgerror);
            print (e.diag.severity);
            print (e.diag.message_primary);
        except psycopg2.ProgrammingError:
            raise IndexError('No such row')
        
except:
    print("outer-except");
    
print ("------------------");
print ("-Ending---9-3-1-c-");
print ("------------------");
