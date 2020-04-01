using System;
using Npgsql;

class Solution931b
{
	static void Main(string[] args)
	{
        //Boolean bSessionInfo = false;
        Boolean bSessionInfo = true;
        // Connect to PostgreSQL  database
        //NpgsqlConnection dbconn = new NpgsqlConnection("Server=127.0.0.1; User Id = your_kui654; " + " Password = segeg; Database = uis; Port = 5433");
        NpgsqlConnection dbconn = new NpgsqlConnection("Server=127.0.0.1; User Id = postgres; " + " Password = postgres; Database = uis; Port = 5432");

        try
        {
            dbconn.Open();


            if (bSessionInfo)
            {
                Console.Write("Connection properties {0}\t{1}\t{2} \n", dbconn.ProcessID, dbconn.Port, dbconn.Host);
                Console.Write("Connection properties {0}\t{1}\t{2} \n", dbconn.PostgreSqlVersion, dbconn.UserName, dbconn.UseSslStream);
            }
            Console.WriteLine();

            Console.WriteLine("Solution 9-3-1 b");
            Console.WriteLine("Entering new pc model");
            Console.WriteLine();



            //b Manufacturer
            Console.Write("Enter manufacturer (string) []: ");
            string opb_manufacturer = Console.ReadLine();

            //b model
            int opb_model = 0;
            string in_sa = string.Empty;
            do
            {
                Console.Write("Enter model (int) []: ");
                in_sa = Console.ReadLine();
            } while (!int.TryParse(in_sa, out opb_model));

            //b speed
            float fopb_speed = 0;
            in_sa = string.Empty;
            do
            {
                Console.Write("Enter speed (float) []: ");
                in_sa = Console.ReadLine();
            } while (!float.TryParse(in_sa, out fopb_speed));


            //b ram
            int opb_ram = 0;
            in_sa = string.Empty;
            do
            {
                Console.Write("Enter ram (int): ");
                in_sa = Console.ReadLine();
            } while (!int.TryParse(in_sa, out opb_ram));

            //b hd
            int opb_hd = 0;
            in_sa = string.Empty;
            do
            {
                Console.Write("Enter hd (int) []: ");
                in_sa = Console.ReadLine();
            } while (!int.TryParse(in_sa, out opb_hd));

            //b price
            int opb_price = 0;
            in_sa = string.Empty;
            do
            {
                Console.Write("Enter price (int) []: ");
                in_sa = Console.ReadLine();
            } while (!int.TryParse(in_sa, out opb_price));

            Console.Write("Chosen model {0} \n", opb_model);
            Console.WriteLine("Manufacturer: {0}\tModel: {1}\tspeed: {2}\tram: {3}\thd: {4}\tPrice: {5} \n"
            , opb_manufacturer, opb_model, fopb_speed, opb_ram, opb_hd, opb_price);
            Console.WriteLine();


            NpgsqlCommand cmdb = new NpgsqlCommand("SELECT pc.model, speed, ram, hd, price, maker" +
                                                   "\nFROM pc.pc pc, pc.product p" +
                                                   "\nWHERE pc.model = p.model" +
                                                   "\nAND p.model = :model\n;"
                  , dbconn);

            cmdb.Parameters.Add(new NpgsqlParameter("model", NpgsqlTypes.NpgsqlDbType.Integer));
            cmdb.Parameters[0].Value = opb_model;
            cmdb.Parameters[0].Value = 2003;

           // Fetch existing models 
            NpgsqlDataReader drb = cmdb.ExecuteReader();
            if (bSessionInfo)
            {
                Console.Write("B-depth {0}\t recordsaffected {1}\t fieldcount {2} \n", drb.Depth, drb.RecordsAffected, drb.FieldCount);
                Console.Write("B-hasRows {0}\t statements {1} \n", drb.HasRows, drb.Statements);
                Console.WriteLine();
            }

        while (drb.Read())
                Console.Write("{0}\t{1}\t{2}\t{3}\t{4}\t{5} \n", drb[0], drb[1], drb[2], drb[3], drb[4], drb[5]);
            drb.Close();



            drb = cmdb.ExecuteReader();
            if (drb.Read())
            {
                Console.Write("Model {0} exists \n", drb[0]);
                Console.Write("{0}\t{1}\t{2}\t{3}\t{4}\t{5} \n", drb[0], drb[1], drb[2], drb[3], drb[4], drb[5]);
                drb.Close();

            }
            else
            {
                Console.Write("Inserting Model {0}  \n", opb_model);
                drb.Close();

                try
                {
                    NpgsqlTransaction tranb = dbconn.BeginTransaction();

                    NpgsqlCommand cmdb2 = new NpgsqlCommand("INSERT INTO pc.product (maker, model, type) " +
                                                            "VALUES (:maker,:model,'pc');"
                           //"VALUES ('G',2030,'pc');" 
                          , dbconn);
                    cmdb2.Parameters.Add(new NpgsqlParameter("maker", NpgsqlTypes.NpgsqlDbType.Text));
                    cmdb2.Parameters.Add(new NpgsqlParameter("model", NpgsqlTypes.NpgsqlDbType.Integer));
                    cmdb2.Parameters[0].Value = opb_manufacturer;//'G';
                    cmdb2.Parameters[1].Value = opb_model;//2030;

                    cmdb2.ExecuteNonQuery();

                    NpgsqlCommand cmdb3 = new NpgsqlCommand("INSERT INTO pc.pc(model, speed, ram, hd, price) " +
                                                            "VALUES (:model,:speed, :ram, :hd, :price);"
                          //"VALUES(2030, 2.12, 4096, 2048, 2522);" 
                          , dbconn);
                    cmdb3.Parameters.Add(new NpgsqlParameter("model", NpgsqlTypes.NpgsqlDbType.Integer));
                    cmdb3.Parameters.Add(new NpgsqlParameter("speed", NpgsqlTypes.NpgsqlDbType.Double));
                    cmdb3.Parameters.Add(new NpgsqlParameter("ram", NpgsqlTypes.NpgsqlDbType.Integer));
                    cmdb3.Parameters.Add(new NpgsqlParameter("hd", NpgsqlTypes.NpgsqlDbType.Integer));
                    cmdb3.Parameters.Add(new NpgsqlParameter("price", NpgsqlTypes.NpgsqlDbType.Integer));
                    cmdb3.Parameters[0].Value = opb_model;//2030;
                    cmdb3.Parameters[1].Value = fopb_speed;//2.12;
                    cmdb3.Parameters[2].Value = opb_ram;//096;
                    cmdb3.Parameters[3].Value = opb_hd;//2048;
                    cmdb3.Parameters[4].Value = opb_price;//2522;

                    cmdb3.ExecuteNonQuery();

                    cmdb.Parameters[0].Value = opb_model;//2030;
                    drb = cmdb.ExecuteReader();
                    while (drb.Read())
                        Console.Write("{0}\t{1}\t{2}\t{3}\t{4}\t{5} \n", drb[0], drb[1], drb[2], drb[3], drb[4], drb[5]);
                    drb.Close();

                    tranb.Rollback();
                    //tranb.Commit();
                }
                catch (Exception ex)
                {
                    Console.WriteLine("G-Insertion failed with exception");
                    Console.WriteLine(ex.Message);
                    throw;
                }


            }



            Console.WriteLine("F-Press any key to exit.");
            Console.ReadKey(); //keep console window open in debug mode

            dbconn.Close();
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.Message);
            Console.WriteLine("H-Press enter to exit.");
            //throw;
        }
    }
}
