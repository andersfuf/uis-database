using System;
using Npgsql;

class Solution931a
{
	static void Main(string[] args)
	{
        Boolean bSessionInfo = false;
        // Connect to PostgreSQL  database
		//NpgsqlConnection dbconn = new NpgsqlConnection("Server=127.0.0.1; User Id = your_kui654; " + " Password = segeg; Database = uis; Port = 5433");
		NpgsqlConnection dbconn = new NpgsqlConnection("Server=127.0.0.1; User Id = postgres; " + " Password = postgres; Database = uis; Port = 5432");

		dbconn.Open();
        if (bSessionInfo){
            Console.Write("Connection properties Process ID: {0}\t Port: {1}\t Host: {2} \n", dbconn.ProcessID, dbconn.Port, dbconn.Host);
            Console.Write("Connection properties Postgres SQL version: {0}\t UserName: {1}\t Use SSLStream: {2} \n", dbconn.PostgreSqlVersion, dbconn.UserName, dbconn.UseSslStream);
        }
        Console.WriteLine();

        Console.WriteLine("Solution 9-3-1 a");
        Console.WriteLine();




        //a price
        int opa_max_price = 0;
		string in_sa = string.Empty;
		do
        {  //             E                                    :
            Console.Write("Enter highest price (int) [549-3673]: ");
			in_sa = Console.ReadLine();
		} while (!int.TryParse(in_sa, out opa_max_price));


		//a speed
		float fop_min_speed = 0;
		in_sa = string.Empty;
		do
        {   //             E                                    :
            Console.Write("Enter min speed (float) [1,6-2,16]   : ");
			in_sa = Console.ReadLine();
		} while (!float.TryParse(in_sa, out fop_min_speed));


		//a ram
		int opa_min_ram = 0;
		in_sa = string.Empty;
		do
        {   //             E                                    :
            Console.Write("Enter min ram (int) [512-2048]       : ");
			in_sa = Console.ReadLine();
		} while (!int.TryParse(in_sa, out opa_min_ram));

		//a hd
		int opa_min_hd = 0;
		in_sa = string.Empty;
		do
		{   //             E                                    : 
			Console.Write("Enter min hd (int) [60-240]          : ");
			in_sa = Console.ReadLine();
		} while (!int.TryParse(in_sa, out opa_min_hd));


		//a screen
		float fop_min_screen = 0;
		in_sa = string.Empty;
		do
        {   //             E                                    :
            Console.Write("Enter min screen (float) [13,3-20,1] : ");
			in_sa = Console.ReadLine();
		} while (!float.TryParse(in_sa, out fop_min_screen));
        Console.WriteLine();

        Console.WriteLine("Search criteria:");
        Console.WriteLine("Price: {0}\tspeed: {1}\tram: {2}\thd: {3}\tscreen: {4} \n"
            , opa_max_price, fop_min_speed, opa_min_ram, opa_min_hd, fop_min_screen);
        Console.WriteLine();

        // a prepared statement with bind variables
        NpgsqlCommand cmda = new NpgsqlCommand("SELECT l.model, speed, ram, hd, screen, price, maker" +
		                                       "\nFROM pc.Laptop l, pc.Product p" +
		                                       "\nWHERE l.model = p.model" +
		                                       "\nAND l.price <= :price " +
		                                       "\nAND l.speed >= :speed " +
		                                       "\nAND l.ram >= :ram" +
		                                       "\nAND l.hd >= :hd" +
                                               "\nAND l.screen >= :screen\n" +
                                               "\nORDER BY price desc\n;"
              , dbconn);
        // Adding bind variables
		cmda.Parameters.Add(new NpgsqlParameter("price", NpgsqlTypes.NpgsqlDbType.Integer));
		cmda.Parameters.Add(new NpgsqlParameter("speed", NpgsqlTypes.NpgsqlDbType.Double));
		cmda.Parameters.Add(new NpgsqlParameter("ram", NpgsqlTypes.NpgsqlDbType.Integer));
		cmda.Parameters.Add(new NpgsqlParameter("hd", NpgsqlTypes.NpgsqlDbType.Integer));
		cmda.Parameters.Add(new NpgsqlParameter("screen", NpgsqlTypes.NpgsqlDbType.Double));

        // Setting bind variables
		cmda.Parameters[0].Value = opa_max_price;
		//cmda.Parameters[0].Value = 4000;
		cmda.Parameters[1].Value = fop_min_speed;//1.2;
		cmda.Parameters[2].Value = opa_min_ram;//512;
		cmda.Parameters[3].Value = opa_min_hd;//80;
		cmda.Parameters[4].Value = fop_min_screen;//15.3;

        // Executing a prepared statement
		NpgsqlDataReader dra = cmda.ExecuteReader();
        if (bSessionInfo)
        {
            Console.Write("depth {0}\t recordsaffected {1}\t fieldcount {2} \n", dra.Depth, dra.RecordsAffected, dra.FieldCount);
            Console.Write("depth {0}\t hasRows {1}\t{2} \n", dra.Depth, dra.HasRows, dra.Statements);
        }
        
        Console.Write("Model\tSpeed\tRAM\thd\tScreen\tPrice\tMaker\n");
        while (dra.Read())
			Console.Write("{0}\t{1}\t{2}\t{3}\t{4}\t{5}\t{6} \n", dra[0], dra[1], dra[2], dra[3], dra[4], dra[5], dra[6]);

		dra.Close();


		Console.WriteLine("F-Press any key to exit.");

        Console.ReadKey(); //keep console window open in debug mode

		dbconn.Close();
	}
}
