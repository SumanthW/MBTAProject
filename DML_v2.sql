--NEEDS rearranging
--LINE STATION CONNECTIONS DML
INSERT INTO line_station_connections(connection_id,line_id,station_id)
select 1,1,1 from dual union all
select 2,1,2 from dual union all
select 3,1,3 from dual union all
select 4,1,4 from dual union all
select 5,1,5 from dual union all
select 6,1,6 from dual union all
select 7,1,7 from dual union all
select 8,1,8 from dual union all
select 9,1,9 from dual union all
select 10,1,10 from dual union all
select 11,1,11 from dual union all
select 12,1,12 from dual union all
select 13,1,13 from dual union all
select 14,1,14 from dual union all
select 15,1,15 from dual union all
select 16,1,16 from dual union all
select 17,1,17 from dual union all
select 18,1,18 from dual union all
select 19,1,19 from dual union all
select 20,2,20 from dual union all
select 21,2,21 from dual union all
select 22,2,22 from dual union all
select 23,2,23 from dual union all
select 24,2,24 from dual union all
select 25,2,25 from dual union all
select 26,2,26 from dual union all
select 27,2,27 from dual union all
select 28,2,28 from dual union all
select 29,2,29 from dual union all
select 30,2,30 from dual union all
select 31,2,31 from dual union all
select 32,3,9 from dual union all
select 33,3,29 from dual union all
select 34,3,32 from dual union all
select 35,3,33 from dual union all
select 36,3,34 from dual union all
select 37,3,35 from dual union all
select 38,3,36 from dual union all
select 39,3,37 from dual union all
select 40,3,38 from dual union all
select 41,3,39 from dual union all
select 42,3,40 from dual union all
select 43,3,41 from dual union all
select 44,3,42 from dual union all
select 45,3,43 from dual union all
select 46,3,44 from dual union all
select 47,3,45 from dual union all
select 48,3,46 from dual union all
select 49,3,47 from dual union all
select 50,3,48 from dual union all
select 51,4,10 from dual union all
select 52,4,26 from dual union all
select 53,4,49 from dual union all
select 54,4,50 from dual union all
select 55,4,51 from dual union all
select 56,4,52 from dual union all
select 57,4,53 from dual union all
select 58,4,54 from dual union all
select 59,4,55 from dual union all
select 60,4,56 from dual union all
select 61,4,57 from dual union all
select 62,4,58 from dual union all
select 63,4,59 from dual union all
select 64,4,60 from dual union all
select 65,4,61 from dual union all
select 66,5,62 from dual union all
select 67,5,63 from dual union all
select 68,5,64 from dual union all
select 69,5,65 from dual union all
select 70,5,66 from dual union all
select 71,5,67 from dual union all
select 72,5,68 from dual union all
select 73,5,69 from dual union all
select 74,5,70 from dual union all
select 75,5,71 from dual union all
select 76,6,8 from dual union all
select 77,6,30 from dual union all
select 78,6,37 from dual union all
select 79,6,38 from dual union all
select 80,6,72 from dual union all
select 81,6,73 from dual union all
select 82,6,74 from dual union all
select 83,6,75 from dual union all
select 84,6,76 from dual union all
select 85,7,8 from dual union all
select 86,7,30 from dual union all
select 87,7,72 from dual union all
select 88,7,73 from dual union all
select 89,7,74 from dual union all
select 90,7,77 from dual union all
select 91,7,78 from dual union all
select 92,7,79 from dual union all
select 93,7,80 from dual union all
select 94,7,81 from dual union all
select 95,7,82 from dual union all
select 96,7,83 from dual union all
select 97,7,84 from dual union all
select 98,7,85 from dual union all
select 99,7,86 from dual union all
select 100,7,87 from dual union all
select 101,7,88 from dual union all
select 102,7,89 from dual union all
select 103,7,90 from dual union all
select 104,7,91 from dual union all
select 105,7,92 from dual union all
select 106,7,93 from dual union all
select 107,8,8 from dual union all
select 108,8,30 from dual union all
select 109,8,72 from dual union all
select 110,8,73 from dual union all
select 111,8,74 from dual union all
select 112,8,90 from dual union all
select 113,8,91 from dual union all
select 114,8,92 from dual union all
select 115,8,93 from dual union all
select 116,8,94 from dual union all
select 117,8,95 from dual union all
select 118,8,96 from dual union all
select 119,8,97 from dual union all
select 120,8,98 from dual union all
select 121,8,99 from dual union all
select 122,8,100 from dual;

--Lines DML
insert into LINE (line_id,transit_id,name, start_date)
select 1,1,'Red Line', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 2,1,'Blue Line', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 3,1,'Orange Line', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 4,1,'Silver Line', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 5,1,'Green-B Line', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 6,1,'Green-C Line', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 7,1,'Green-D Line', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 8,1,'Green-E Line', to_date('29-01-2000','dd-mm-yyyy') from dual;

--Stations DML
insert into STATION (station_id,name, construction_date)
select 1,'Alewife', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 2,'Davis', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 3,'Porter', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 4,'Harvard', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 5,'Central', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 6,'Kendall/MIT', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 7,'Charles/MGH', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 8,'Park St', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 9,'Downtown Crossing', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 10,'South Station', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 11,'Broadway', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 12,'Andrew', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 13,'JFK/UMass', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 14,'North Quincy', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 15,'Wollaston', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 16,'Quincy Center', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 17,'Quincy Adams', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 18,'Braintree', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 19,'Ashmont', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 20,'Wonderland', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 21,'Revere Beach', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 22,'Beachmont', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 23,'Suffolk Downs', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 24,'Orient Heights', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 25,'Wood Island', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 26,'Airport', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 27,'Maverick', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 28,'Aquarium', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 29,'State St', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 30,'Government Center', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 31,'Bowdoin', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 32,'Oak Grove', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 33,'Malden Center', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 34,'Wellington', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 35,'Sullivan Square', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 36,'Community College', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 37,'North Station', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 38,'Haymarket', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 39,'Chinatown', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 40,'Tufts Medical Center', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 41,'Back Bay', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 42,'Mass Ave', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 43,'Ruggles', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 44,'Roxbury Crossing', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 45,'Jackson Square', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 46,'Stony Brook', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 47,'Green St', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 48,'Forest Hills', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 49,'Courthouse', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 50,'World Trade Center', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 51,'Silver Line Way', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 52,'Terminal A', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 53,'Terminal B - Stop 1', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 54,'Terminal B - Stop 2', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 55,'Terminal C - Stop 1', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 56,'Terminal C - Stop 2', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 57,'Terminal E - Stop 1', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 58,'Terminal E - Stop 2', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 59,'Harborview', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 60,'Chelsea', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 61,'East Boston', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 62,'Boston College', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 63,'South St', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 64,'Chestnut Hill Ave', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 65,'Chiswick Rd', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 66,'Sutherland Rd', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 67,'Washington St', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 68,'Tappan St', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 69,'Dean Rd', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 70,'Englewood Ave', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 71,'Cleveland Circle', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 72,'Boylston', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 73,'Arlington', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 74,'Copley', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 75,'Hynes Convention Center', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 76,'Kenmore', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 77,'Riverside', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 78,'Woodland', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 79,'Waban', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 80,'Eliot', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 81,'Newton Highlands', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 82,'Newton Centre', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 83,'Chestnut Hill', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 84,'Reservoir', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 85,'Beaconsfield', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 86,'Brookline Hills', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 87,'Brookline Village', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 88,'Longwood', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 89,'Fenway', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 90,'Northeastern University', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 91,'Museum of Fine Arts', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 92,'Symphony', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 93,'Prudential', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 94,'Heath Street', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 95,'Back of the Hill', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 96,'Riverway', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 97,'Mission Park', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 98,'Fenwood Road', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 99,'Brigham Circle', to_date('29-01-2000','dd-mm-yyyy') from dual union all
select 100,'Longwood Medical Area', to_date('29-01-2000','dd-mm-yyyy') from dual;

--RECHARGE DEVICE DML
insert into RECHARGE_DEVICE(recharge_device_id, station_id, status)
select 1,14,'Active' from dual union all
select 2,32,'Active' from dual union all
select 3,63,'Active' from dual union all
select 4,53,'Active' from dual union all
select 5,85,'Active' from dual union all
select 6,50,'Active' from dual union all
select 7,91,'Active' from dual union all
select 8,10,'Inactive' from dual union all
select 9,40,'Active' from dual union all
select 10,96,'Active' from dual union all
select 11,29,'Active' from dual union all
select 12,5,'Active' from dual union all
select 13,22,'Active' from dual union all
select 14,15,'Active' from dual union all
select 15,88,'Inactive' from dual union all
select 16,51,'Active' from dual union all
select 17,94,'Active' from dual union all
select 18,97,'Active' from dual union all
select 19,64,'Active' from dual union all
select 20,75,'Active' from dual union all
select 21,97,'Active' from dual union all
select 22,34,'Inactive' from dual union all
select 23,36,'Active' from dual union all
select 24,71,'Active' from dual union all
select 25,69,'Active' from dual union all
select 26,62,'Active' from dual union all
select 27,13,'Active' from dual union all
select 28,53,'Active' from dual union all
select 29,69,'Inactive' from dual union all
select 30,77,'Active' from dual union all
select 31,63,'Active' from dual union all
select 32,26,'Active' from dual union all
select 33,17,'Active' from dual union all
select 34,26,'Active' from dual union all
select 35,48,'Active' from dual union all
select 36,18,'Inactive' from dual union all
select 37,17,'Active' from dual union all
select 38,58,'Active' from dual union all
select 39,71,'Active' from dual union all
select 40,3,'Active' from dual union all
select 41,7,'Active' from dual union all
select 42,28,'Active' from dual union all
select 43,97,'Inactive' from dual union all
select 44,48,'Active' from dual union all
select 45,71,'Active' from dual union all
select 46,11,'Active' from dual union all
select 47,74,'Active' from dual union all
select 48,51,'Active' from dual union all
select 49,57,'Active' from dual union all
select 50,15,'Inactive' from dual union all
select 51,52,'Active' from dual union all
select 52,47,'Active' from dual union all
select 53,53,'Active' from dual union all
select 54,20,'Active' from dual union all
select 55,75,'Active' from dual union all
select 56,82,'Active' from dual union all
select 57,93,'Inactive' from dual union all
select 58,75,'Active' from dual union all
select 59,6,'Active' from dual union all
select 60,54,'Active' from dual union all
select 61,27,'Active' from dual union all
select 62,55,'Active' from dual union all
select 63,35,'Active' from dual union all
select 64,56,'Inactive' from dual union all
select 65,22,'Active' from dual union all
select 66,76,'Active' from dual union all
select 67,23,'Active' from dual union all
select 68,37,'Active' from dual union all
select 69,73,'Active' from dual union all
select 70,59,'Active' from dual union all
select 71,52,'Inactive' from dual union all
select 72,100,'Active' from dual union all
select 73,25,'Active' from dual union all
select 74,61,'Active' from dual union all
select 75,22,'Active' from dual union all
select 76,68,'Active' from dual union all
select 77,45,'Active' from dual union all
select 78,10,'Inactive' from dual union all
select 79,22,'Active' from dual union all
select 80,26,'Active' from dual union all
select 81,75,'Active' from dual union all
select 82,64,'Active' from dual union all
select 83,99,'Active' from dual union all
select 84,23,'Active' from dual union all
select 85,96,'Inactive' from dual union all
select 86,38,'Active' from dual union all
select 87,8,'Active' from dual union all
select 88,10,'Active' from dual union all
select 89,1,'Active' from dual union all
select 90,53,'Active' from dual union all
select 91,72,'Active' from dual union all
select 92,43,'Inactive' from dual union all
select 93,13,'Active' from dual union all
select 94,6,'Active' from dual union all
select 95,57,'Active' from dual union all
select 96,28,'Active' from dual union all
select 97,4,'Active' from dual union all
select 98,19,'Active' from dual union all
select 99,84,'Inactive' from dual union all
select 100,43,'Active' from dual union all
select 101,70,'Active' from dual union all
select 102,26,'Active' from dual union all
select 103,51,'Active' from dual union all
select 104,81,'Active' from dual union all
select 105,75,'Active' from dual union all
select 106,73,'Inactive' from dual union all
select 107,15,'Active' from dual union all
select 108,97,'Active' from dual union all
select 109,29,'Active' from dual union all
select 110,96,'Active' from dual union all
select 111,8,'Active' from dual union all
select 112,68,'Active' from dual union all
select 113,39,'Inactive' from dual union all
select 114,6,'Active' from dual union all
select 115,76,'Active' from dual union all
select 116,23,'Active' from dual union all
select 117,92,'Active' from dual union all
select 118,43,'Active' from dual union all
select 119,65,'Active' from dual union all
select 120,23,'Inactive' from dual union all
select 121,29,'Active' from dual union all
select 122,93,'Active' from dual union all
select 123,79,'Active' from dual union all
select 124,84,'Active' from dual union all
select 125,65,'Active' from dual union all
select 126,10,'Active' from dual union all
select 127,28,'Inactive' from dual union all
select 128,28,'Active' from dual union all
select 129,79,'Active' from dual union all
select 130,6,'Active' from dual union all
select 131,11,'Active' from dual union all
select 132,14,'Active' from dual union all
select 133,35,'Active' from dual union all
select 134,72,'Inactive' from dual union all
select 135,7,'Active' from dual union all
select 136,50,'Active' from dual union all
select 137,37,'Active' from dual union all
select 138,14,'Active' from dual union all
select 139,19,'Active' from dual union all
select 140,24,'Active' from dual union all
select 141,35,'Inactive' from dual union all
select 142,15,'Active' from dual union all
select 143,78,'Active' from dual union all
select 144,39,'Active' from dual union all
select 145,58,'Active' from dual union all
select 146,47,'Active' from dual union all
select 147,65,'Active' from dual union all
select 148,5,'Inactive' from dual union all
select 149,48,'Active' from dual union all
select 150,23,'Active' from dual union all
select 151,50,'Active' from dual union all
select 152,32,'Active' from dual union all
select 153,13,'Active' from dual union all
select 154,63,'Active' from dual union all
select 155,28,'Inactive' from dual union all
select 156,34,'Active' from dual union all
select 157,35,'Active' from dual union all
select 158,78,'Active' from dual union all
select 159,9,'Active' from dual union all
select 160,54,'Active' from dual union all
select 161,78,'Active' from dual union all
select 162,25,'Active' from dual union all
select 163,11,'Active' from dual union all
select 164,63,'Active' from dual union all
select 165,68,'Active' from dual union all
select 166,13,'Active' from dual union all
select 167,19,'Inactive' from dual union all
select 168,74,'Active' from dual union all
select 169,19,'Active' from dual union all
select 170,94,'Active' from dual union all
select 171,46,'Active' from dual union all
select 172,26,'Active' from dual union all
select 173,56,'Active' from dual union all
select 174,43,'Inactive' from dual union all
select 175,60,'Active' from dual union all
select 176,86,'Active' from dual union all
select 177,41,'Active' from dual union all
select 178,44,'Active' from dual union all
select 179,88,'Active' from dual union all
select 180,12,'Active' from dual union all
select 181,31,'Inactive' from dual union all
select 182,77,'Active' from dual union all
select 183,59,'Active' from dual union all
select 184,91,'Active' from dual union all
select 185,68,'Active' from dual union all
select 186,38,'Active' from dual union all
select 187,48,'Active' from dual union all
select 188,70,'Inactive' from dual union all
select 189,50,'Active' from dual union all
select 190,15,'Active' from dual union all
select 191,4,'Active' from dual union all
select 192,15,'Active' from dual union all
select 193,38,'Active' from dual union all
select 194,30,'Active' from dual union all
select 195,86,'Active' from dual union all
select 196,3,'Active' from dual union all
select 197,27,'Active' from dual union all
select 198,95,'Active' from dual union all
select 199,13,'Active' from dual union all
select 200,76,'Inactive' from dual union all
select 201,42,'Active' from dual union all
select 202,11,'Active' from dual union all
select 203,30,'Active' from dual union all
select 204,4,'Active' from dual union all
select 205,64,'Active' from dual union all
select 206,10,'Active' from dual union all
select 207,18,'Inactive' from dual union all
select 208,53,'Active' from dual union all
select 209,7,'Active' from dual union all
select 210,16,'Active' from dual union all
select 211,46,'Active' from dual union all
select 212,66,'Active' from dual union all
select 213,54,'Active' from dual union all
select 214,67,'Inactive' from dual union all
select 215,46,'Active' from dual union all
select 216,46,'Active' from dual union all
select 217,61,'Active' from dual union all
select 218,58,'Active' from dual union all
select 219,33,'Active' from dual union all
select 220,18,'Active' from dual union all
select 221,27,'Inactive' from dual union all
select 222,22,'Active' from dual union all
select 223,89,'Active' from dual union all
select 224,56,'Active' from dual union all
select 225,24,'Active' from dual union all
select 226,33,'Active' from dual union all
select 227,29,'Active' from dual union all
select 228,83,'Active' from dual union all
select 229,38,'Active' from dual union all
select 230,73,'Active' from dual union all
select 231,62,'Active' from dual union all
select 232,81,'Active' from dual union all
select 233,54,'Inactive' from dual union all
select 234,18,'Active' from dual union all
select 235,16,'Active' from dual union all
select 236,95,'Active' from dual union all
select 237,86,'Active' from dual union all
select 238,76,'Active' from dual union all
select 239,44,'Active' from dual union all
select 240,74,'Inactive' from dual union all
select 241,52,'Active' from dual union all
select 242,93,'Active' from dual union all
select 243,35,'Active' from dual union all
select 244,4,'Active' from dual union all
select 245,81,'Active' from dual union all
select 246,49,'Active' from dual union all
select 247,60,'Inactive' from dual union all
select 248,98,'Active' from dual union all
select 249,87,'Active' from dual union all
select 250,19,'Active' from dual union all
select 251,20,'Active' from dual union all
select 252,54,'Active' from dual union all
select 253,18,'Active' from dual union all
select 254,2,'Inactive' from dual union all
select 255,31,'Active' from dual union all
select 256,64,'Active' from dual union all
select 257,43,'Active' from dual union all
select 258,58,'Active' from dual union all
select 259,86,'Active' from dual union all
select 260,3,'Active' from dual union all
select 261,82,'Active' from dual union all
select 262,79,'Active' from dual union all
select 263,34,'Active' from dual union all
select 264,60,'Active' from dual union all
select 265,33,'Active' from dual union all
select 266,61,'Inactive' from dual union all
select 267,60,'Active' from dual union all
select 268,40,'Active' from dual union all
select 269,43,'Active' from dual union all
select 270,89,'Active' from dual union all
select 271,21,'Active' from dual union all
select 272,14,'Active' from dual union all
select 273,51,'Inactive' from dual union all
select 274,67,'Active' from dual union all
select 275,21,'Active' from dual union all
select 276,9,'Active' from dual union all
select 277,70,'Active' from dual union all
select 278,49,'Active' from dual union all
select 279,54,'Active' from dual union all
select 280,11,'Inactive' from dual union all
select 281,51,'Active' from dual union all
select 282,48,'Active' from dual union all
select 283,36,'Active' from dual union all
select 284,55,'Active' from dual union all
select 285,74,'Active' from dual union all
select 286,92,'Active' from dual union all
select 287,46,'Inactive' from dual union all
select 288,96,'Active' from dual union all
select 289,75,'Active' from dual union all
select 290,2,'Active' from dual union all
select 291,96,'Active' from dual union all
select 292,68,'Active' from dual union all
select 293,55,'Active' from dual union all
select 294,77,'Inactive' from dual;

--TRANSACTION DEVICE DML
INSERT INTO TRANSACTION_DEVICE(transaction_device_id,station_id,line_id,status)
select 1,1,1,'Active' from dual union all
select 2,2,1,'Active' from dual union all
select 3,3,1,'Active' from dual union all
select 4,4,1,'Active' from dual union all
select 5,5,1,'Active' from dual union all
select 6,6,1,'Active' from dual union all
select 7,7,1,'Active' from dual union all
select 8,8,1,'Active' from dual union all
select 9,9,1,'Active' from dual union all
select 10,10,1,'Active' from dual union all
select 11,11,1,'Active' from dual union all
select 12,12,1,'Active' from dual union all
select 13,13,1,'Active' from dual union all
select 14,14,1,'Active' from dual union all
select 15,15,1,'Active' from dual union all
select 16,16,1,'Active' from dual union all
select 17,17,1,'Active' from dual union all
select 18,18,1,'Active' from dual union all
select 19,19,1,'Active' from dual union all
select 20,20,2,'Active' from dual union all
select 21,21,2,'Active' from dual union all
select 22,22,2,'Active' from dual union all
select 23,23,2,'Active' from dual union all
select 24,24,2,'Active' from dual union all
select 25,25,2,'Active' from dual union all
select 26,26,2,'Active' from dual union all
select 27,27,2,'Active' from dual union all
select 28,28,2,'Active' from dual union all
select 29,29,2,'Active' from dual union all
select 30,30,2,'Active' from dual union all
select 31,31,2,'Active' from dual union all
select 32,9,3,'Active' from dual union all
select 33,29,3,'Active' from dual union all
select 34,32,3,'Active' from dual union all
select 35,33,3,'Active' from dual union all
select 36,34,3,'Active' from dual union all
select 37,35,3,'Active' from dual union all
select 38,36,3,'Active' from dual union all
select 39,37,3,'Active' from dual union all
select 40,38,3,'Active' from dual union all
select 41,39,3,'Active' from dual union all
select 42,40,3,'Active' from dual union all
select 43,41,3,'Active' from dual union all
select 44,42,3,'Active' from dual union all
select 45,43,3,'Active' from dual union all
select 46,44,3,'Active' from dual union all
select 47,45,3,'Active' from dual union all
select 48,46,3,'Active' from dual union all
select 49,47,3,'Active' from dual union all
select 50,48,3,'Active' from dual union all
select 51,10,4,'Active' from dual union all
select 52,26,4,'Active' from dual union all
select 53,49,4,'Active' from dual union all
select 54,50,4,'Active' from dual union all
select 55,51,4,'Active' from dual union all
select 56,52,4,'Active' from dual union all
select 57,53,4,'Active' from dual union all
select 58,54,4,'Active' from dual union all
select 59,55,4,'Active' from dual union all
select 60,56,4,'Active' from dual union all
select 61,57,4,'Active' from dual union all
select 62,58,4,'Active' from dual union all
select 63,59,4,'Active' from dual union all
select 64,60,4,'Active' from dual union all
select 65,61,4,'Active' from dual union all
select 66,62,5,'Active' from dual union all
select 67,63,5,'Active' from dual union all
select 68,64,5,'Active' from dual union all
select 69,65,5,'Active' from dual union all
select 70,66,5,'Active' from dual union all
select 71,67,5,'Active' from dual union all
select 72,68,5,'Active' from dual union all
select 73,69,5,'Active' from dual union all
select 74,70,5,'Active' from dual union all
select 75,71,5,'Active' from dual union all
select 76,8,6,'Active' from dual union all
select 77,30,6,'Active' from dual union all
select 78,37,6,'Active' from dual union all
select 79,38,6,'Active' from dual union all
select 80,72,6,'Active' from dual union all
select 81,73,6,'Active' from dual union all
select 82,74,6,'Active' from dual union all
select 83,75,6,'Active' from dual union all
select 84,76,6,'Active' from dual union all
select 85,8,7,'Active' from dual union all
select 86,30,7,'Active' from dual union all
select 87,72,7,'Active' from dual union all
select 88,73,7,'Active' from dual union all
select 89,74,7,'Active' from dual union all
select 90,77,7,'Active' from dual union all
select 91,78,7,'Active' from dual union all
select 92,79,7,'Active' from dual union all
select 93,80,7,'Active' from dual union all
select 94,81,7,'Active' from dual union all
select 95,82,7,'Active' from dual union all
select 96,83,7,'Active' from dual union all
select 97,84,7,'Active' from dual union all
select 98,85,7,'Active' from dual union all
select 99,86,7,'Active' from dual union all
select 100,87,7,'Active' from dual union all
select 101,88,7,'Active' from dual union all
select 102,89,7,'Active' from dual union all
select 103,90,7,'Active' from dual union all
select 104,91,7,'Active' from dual union all
select 105,92,7,'Active' from dual union all
select 106,93,7,'Active' from dual union all
select 107,8,8,'Active' from dual union all
select 108,30,8,'Active' from dual union all
select 109,72,8,'Active' from dual union all
select 110,73,8,'Active' from dual union all
select 111,74,8,'Active' from dual union all
select 112,90,8,'Active' from dual union all
select 113,91,8,'Active' from dual union all
select 114,92,8,'Active' from dual union all
select 115,93,8,'Active' from dual union all
select 116,94,8,'Active' from dual union all
select 117,95,8,'Active' from dual union all
select 118,96,8,'Active' from dual union all
select 119,97,8,'Active' from dual union all
select 120,98,8,'Active' from dual union all
select 121,99,8,'Active' from dual union all
select 122,100,8,'Active' from dual union all
select 123,1,1,'Active' from dual union all
select 124,2,1,'Active' from dual union all
select 125,3,1,'Active' from dual union all
select 126,4,1,'Active' from dual union all
select 127,5,1,'Active' from dual union all
select 128,6,1,'Active' from dual union all
select 129,7,1,'Active' from dual union all
select 130,8,1,'Active' from dual union all
select 131,9,1,'Active' from dual union all
select 132,10,1,'Active' from dual union all
select 133,11,1,'Active' from dual union all
select 134,12,1,'Active' from dual union all
select 135,13,1,'Active' from dual union all
select 136,14,1,'Active' from dual union all
select 137,15,1,'Active' from dual union all
select 138,16,1,'Active' from dual union all
select 139,17,1,'Active' from dual union all
select 140,18,1,'Active' from dual union all
select 141,19,1,'Active' from dual union all
select 142,20,2,'Active' from dual union all
select 143,21,2,'Active' from dual union all
select 144,22,2,'Active' from dual union all
select 145,23,2,'Active' from dual union all
select 146,24,2,'Active' from dual union all
select 147,25,2,'Active' from dual union all
select 148,26,2,'Active' from dual union all
select 149,27,2,'Active' from dual union all
select 150,28,2,'Active' from dual union all
select 151,29,2,'Active' from dual union all
select 152,30,2,'Active' from dual union all
select 153,31,2,'Active' from dual union all
select 154,9,3,'Active' from dual union all
select 155,29,3,'Active' from dual union all
select 156,32,3,'Active' from dual union all
select 157,33,3,'Active' from dual union all
select 158,34,3,'Active' from dual union all
select 159,35,3,'Active' from dual union all
select 160,36,3,'Active' from dual union all
select 161,37,3,'Active' from dual union all
select 162,38,3,'Active' from dual union all
select 163,39,3,'Active' from dual union all
select 164,40,3,'Active' from dual union all
select 165,41,3,'Active' from dual union all
select 166,42,3,'Active' from dual union all
select 167,43,3,'Active' from dual union all
select 168,44,3,'Active' from dual union all
select 169,45,3,'Active' from dual union all
select 170,46,3,'Active' from dual union all
select 171,47,3,'Active' from dual union all
select 172,48,3,'Active' from dual union all
select 173,10,4,'Active' from dual union all
select 174,26,4,'Active' from dual union all
select 175,49,4,'Active' from dual union all
select 176,50,4,'Active' from dual union all
select 177,51,4,'Active' from dual union all
select 178,52,4,'Active' from dual union all
select 179,53,4,'Active' from dual union all
select 180,54,4,'Active' from dual union all
select 181,55,4,'Active' from dual union all
select 182,56,4,'Active' from dual union all
select 183,57,4,'Active' from dual union all
select 184,58,4,'Active' from dual union all
select 185,59,4,'Active' from dual union all
select 186,60,4,'Active' from dual union all
select 187,61,4,'Active' from dual union all
select 188,62,5,'Active' from dual union all
select 189,63,5,'Active' from dual union all
select 190,64,5,'Active' from dual union all
select 191,65,5,'Active' from dual union all
select 192,66,5,'Active' from dual union all
select 193,67,5,'Active' from dual union all
select 194,68,5,'Active' from dual union all
select 195,69,5,'Active' from dual union all
select 196,70,5,'Active' from dual union all
select 197,71,5,'Active' from dual union all
select 198,8,6,'Active' from dual union all
select 199,30,6,'Active' from dual union all
select 200,37,6,'Active' from dual union all
select 201,38,6,'Active' from dual union all
select 202,72,6,'Active' from dual union all
select 203,73,6,'Active' from dual union all
select 204,74,6,'Active' from dual union all
select 205,75,6,'Active' from dual union all
select 206,76,6,'Active' from dual union all
select 207,8,7,'Active' from dual union all
select 208,30,7,'Active' from dual union all
select 209,72,7,'Active' from dual union all
select 210,73,7,'Active' from dual union all
select 211,74,7,'Active' from dual union all
select 212,77,7,'Active' from dual union all
select 213,78,7,'Active' from dual union all
select 214,79,7,'Active' from dual union all
select 215,80,7,'Active' from dual union all
select 216,81,7,'Active' from dual union all
select 217,82,7,'Active' from dual union all
select 218,83,7,'Active' from dual union all
select 219,84,7,'Active' from dual union all
select 220,85,7,'Active' from dual union all
select 221,86,7,'Active' from dual union all
select 222,87,7,'Active' from dual union all
select 223,88,7,'Active' from dual union all
select 224,89,7,'Active' from dual union all
select 225,90,7,'Active' from dual union all
select 226,91,7,'Active' from dual union all
select 227,92,7,'Active' from dual union all
select 228,93,7,'Active' from dual union all
select 229,8,8,'Active' from dual union all
select 230,30,8,'Active' from dual union all
select 231,72,8,'Active' from dual union all
select 232,73,8,'Active' from dual union all
select 233,74,8,'Active' from dual union all
select 234,90,8,'Active' from dual union all
select 235,91,8,'Active' from dual union all
select 236,92,8,'Active' from dual union all
select 237,93,8,'Active' from dual union all
select 238,94,8,'Active' from dual union all
select 239,95,8,'Active' from dual union all
select 240,96,8,'Active' from dual union all
select 241,97,8,'Active' from dual union all
select 242,98,8,'Active' from dual union all
select 243,99,8,'Active' from dual union all
select 244,100,8,'Active' from dual union all
select 245,1,1,'Inactive' from dual union all
select 246,2,1,'Inactive' from dual union all
select 247,3,1,'Inactive' from dual union all
select 248,4,1,'Inactive' from dual union all
select 249,5,1,'Inactive' from dual union all
select 250,6,1,'Inactive' from dual union all
select 251,7,1,'Inactive' from dual union all
select 252,8,1,'Inactive' from dual union all
select 253,9,1,'Inactive' from dual union all
select 254,10,1,'Inactive' from dual union all
select 255,11,1,'Inactive' from dual union all
select 256,12,1,'Inactive' from dual union all
select 257,13,1,'Inactive' from dual union all
select 258,14,1,'Inactive' from dual union all
select 259,15,1,'Inactive' from dual union all
select 260,16,1,'Inactive' from dual union all
select 261,17,1,'Inactive' from dual union all
select 262,18,1,'Inactive' from dual union all
select 263,19,1,'Inactive' from dual union all
select 264,20,2,'Inactive' from dual union all
select 265,21,2,'Inactive' from dual union all
select 266,22,2,'Inactive' from dual union all
select 267,23,2,'Inactive' from dual union all
select 268,24,2,'Inactive' from dual union all
select 269,25,2,'Inactive' from dual union all
select 270,26,2,'Inactive' from dual union all
select 271,27,2,'Inactive' from dual union all
select 272,28,2,'Inactive' from dual union all
select 273,29,2,'Inactive' from dual union all
select 274,30,2,'Inactive' from dual union all
select 275,31,2,'Inactive' from dual union all
select 276,9,3,'Inactive' from dual union all
select 277,29,3,'Inactive' from dual union all
select 278,32,3,'Inactive' from dual union all
select 279,33,3,'Inactive' from dual union all
select 280,34,3,'Inactive' from dual union all
select 281,35,3,'Inactive' from dual union all
select 282,36,3,'Inactive' from dual union all
select 283,37,3,'Inactive' from dual union all
select 284,38,3,'Inactive' from dual union all
select 285,39,3,'Inactive' from dual union all
select 286,40,3,'Inactive' from dual union all
select 287,41,3,'Inactive' from dual union all
select 288,42,3,'Inactive' from dual union all
select 289,43,3,'Inactive' from dual union all
select 290,44,3,'Inactive' from dual union all
select 291,45,3,'Inactive' from dual union all
select 292,46,3,'Inactive' from dual union all
select 293,47,3,'Inactive' from dual union all
select 294,48,3,'Inactive' from dual union all
select 295,10,4,'Inactive' from dual union all
select 296,26,4,'Inactive' from dual union all
select 297,49,4,'Inactive' from dual union all
select 298,50,4,'Inactive' from dual union all
select 299,51,4,'Inactive' from dual union all
select 300,52,4,'Inactive' from dual union all
select 301,53,4,'Inactive' from dual union all
select 302,54,4,'Inactive' from dual union all
select 303,55,4,'Inactive' from dual union all
select 304,56,4,'Inactive' from dual union all
select 305,57,4,'Inactive' from dual union all
select 306,58,4,'Inactive' from dual union all
select 307,59,4,'Inactive' from dual union all
select 308,60,4,'Inactive' from dual union all
select 309,61,4,'Inactive' from dual union all
select 310,62,5,'Inactive' from dual union all
select 311,63,5,'Inactive' from dual union all
select 312,64,5,'Inactive' from dual union all
select 313,65,5,'Inactive' from dual union all
select 314,66,5,'Inactive' from dual union all
select 315,67,5,'Inactive' from dual union all
select 316,68,5,'Inactive' from dual union all
select 317,69,5,'Inactive' from dual union all
select 318,70,5,'Inactive' from dual union all
select 319,71,5,'Inactive' from dual union all
select 320,8,6,'Inactive' from dual union all
select 321,30,6,'Inactive' from dual union all
select 322,37,6,'Inactive' from dual union all
select 323,38,6,'Inactive' from dual union all
select 324,72,6,'Inactive' from dual union all
select 325,73,6,'Inactive' from dual union all
select 326,74,6,'Inactive' from dual union all
select 327,75,6,'Inactive' from dual union all
select 328,76,6,'Inactive' from dual union all
select 329,8,7,'Inactive' from dual union all
select 330,30,7,'Inactive' from dual union all
select 331,72,7,'Inactive' from dual union all
select 332,73,7,'Inactive' from dual union all
select 333,74,7,'Inactive' from dual union all
select 334,77,7,'Inactive' from dual union all
select 335,78,7,'Inactive' from dual union all
select 336,79,7,'Inactive' from dual union all
select 337,80,7,'Inactive' from dual union all
select 338,81,7,'Inactive' from dual union all
select 339,82,7,'Inactive' from dual union all
select 340,83,7,'Inactive' from dual union all
select 341,84,7,'Inactive' from dual union all
select 342,85,7,'Inactive' from dual union all
select 343,86,7,'Inactive' from dual union all
select 344,87,7,'Inactive' from dual union all
select 345,88,7,'Inactive' from dual union all
select 346,89,7,'Inactive' from dual union all
select 347,90,7,'Inactive' from dual union all
select 348,91,7,'Inactive' from dual union all
select 349,92,7,'Inactive' from dual union all
select 350,93,7,'Inactive' from dual union all
select 351,8,8,'Inactive' from dual union all
select 352,30,8,'Inactive' from dual union all
select 353,72,8,'Inactive' from dual union all
select 354,73,8,'Inactive' from dual union all
select 355,74,8,'Inactive' from dual union all
select 356,90,8,'Inactive' from dual union all
select 357,91,8,'Inactive' from dual union all
select 358,92,8,'Inactive' from dual union all
select 359,93,8,'Inactive' from dual union all
select 360,94,8,'Inactive' from dual union all
select 361,95,8,'Inactive' from dual union all
select 362,96,8,'Inactive' from dual union all
select 363,97,8,'Inactive' from dual union all
select 364,98,8,'Inactive' from dual union all
select 365,99,8,'Inactive' from dual union all
select 366,100,8,'Inactive' from dual union all
select 367,1,1,'Active' from dual union all
select 368,2,1,'Active' from dual union all
select 369,3,1,'Active' from dual union all
select 370,4,1,'Active' from dual union all
select 371,5,1,'Active' from dual union all
select 372,6,1,'Active' from dual union all
select 373,7,1,'Active' from dual union all
select 374,8,1,'Active' from dual union all
select 375,9,1,'Active' from dual union all
select 376,10,1,'Active' from dual union all
select 377,11,1,'Active' from dual union all
select 378,12,1,'Active' from dual union all
select 379,13,1,'Active' from dual union all
select 380,14,1,'Active' from dual union all
select 381,15,1,'Active' from dual union all
select 382,16,1,'Active' from dual union all
select 383,17,1,'Active' from dual union all
select 384,18,1,'Active' from dual union all
select 385,19,1,'Active' from dual union all
select 386,20,2,'Active' from dual union all
select 387,21,2,'Active' from dual union all
select 388,22,2,'Active' from dual union all
select 389,23,2,'Active' from dual union all
select 390,24,2,'Active' from dual union all
select 391,25,2,'Active' from dual union all
select 392,26,2,'Active' from dual union all
select 393,27,2,'Active' from dual union all
select 394,28,2,'Active' from dual union all
select 395,29,2,'Active' from dual union all
select 396,30,2,'Active' from dual union all
select 397,31,2,'Active' from dual union all
select 398,9,3,'Active' from dual union all
select 399,29,3,'Active' from dual union all
select 400,32,3,'Active' from dual union all
select 401,33,3,'Active' from dual union all
select 402,34,3,'Active' from dual union all
select 403,35,3,'Active' from dual union all
select 404,36,3,'Active' from dual union all
select 405,37,3,'Active' from dual union all
select 406,38,3,'Active' from dual union all
select 407,39,3,'Active' from dual union all
select 408,40,3,'Active' from dual union all
select 409,41,3,'Active' from dual union all
select 410,42,3,'Active' from dual union all
select 411,43,3,'Active' from dual union all
select 412,44,3,'Active' from dual union all
select 413,45,3,'Active' from dual union all
select 414,46,3,'Active' from dual union all
select 415,47,3,'Active' from dual union all
select 416,48,3,'Active' from dual union all
select 417,10,4,'Active' from dual union all
select 418,26,4,'Active' from dual union all
select 419,49,4,'Active' from dual union all
select 420,50,4,'Active' from dual union all
select 421,51,4,'Active' from dual union all
select 422,52,4,'Active' from dual union all
select 423,53,4,'Active' from dual union all
select 424,54,4,'Active' from dual union all
select 425,55,4,'Active' from dual union all
select 426,56,4,'Active' from dual union all
select 427,57,4,'Active' from dual union all
select 428,58,4,'Active' from dual union all
select 429,59,4,'Active' from dual union all
select 430,60,4,'Active' from dual union all
select 431,61,4,'Active' from dual union all
select 432,62,5,'Active' from dual union all
select 433,63,5,'Active' from dual union all
select 434,64,5,'Active' from dual union all
select 435,65,5,'Active' from dual union all
select 436,66,5,'Active' from dual union all
select 437,67,5,'Active' from dual union all
select 438,68,5,'Active' from dual union all
select 439,69,5,'Active' from dual union all
select 440,70,5,'Active' from dual union all
select 441,71,5,'Active' from dual union all
select 442,8,6,'Active' from dual union all
select 443,30,6,'Active' from dual union all
select 444,37,6,'Active' from dual union all
select 445,38,6,'Active' from dual union all
select 446,72,6,'Active' from dual union all
select 447,73,6,'Active' from dual union all
select 448,74,6,'Active' from dual union all
select 449,75,6,'Active' from dual union all
select 450,76,6,'Active' from dual union all
select 451,8,7,'Active' from dual union all
select 452,30,7,'Active' from dual union all
select 453,72,7,'Active' from dual union all
select 454,73,7,'Active' from dual union all
select 455,74,7,'Active' from dual union all
select 456,77,7,'Active' from dual union all
select 457,78,7,'Active' from dual union all
select 458,79,7,'Active' from dual union all
select 459,80,7,'Active' from dual union all
select 460,81,7,'Active' from dual union all
select 461,82,7,'Active' from dual union all
select 462,83,7,'Active' from dual union all
select 463,84,7,'Active' from dual union all
select 464,85,7,'Active' from dual union all
select 465,86,7,'Active' from dual union all
select 466,87,7,'Active' from dual union all
select 467,88,7,'Active' from dual union all
select 468,89,7,'Active' from dual union all
select 469,90,7,'Active' from dual union all
select 470,91,7,'Active' from dual union all
select 471,92,7,'Active' from dual union all
select 472,93,7,'Active' from dual union all
select 473,8,8,'Active' from dual union all
select 474,30,8,'Active' from dual union all
select 475,72,8,'Active' from dual union all
select 476,73,8,'Active' from dual union all
select 477,74,8,'Active' from dual union all
select 478,90,8,'Active' from dual union all
select 479,91,8,'Active' from dual union all
select 480,92,8,'Active' from dual union all
select 481,93,8,'Active' from dual union all
select 482,94,8,'Active' from dual union all
select 483,95,8,'Active' from dual union all
select 484,96,8,'Active' from dual union all
select 485,97,8,'Active' from dual union all
select 486,98,8,'Active' from dual union all
select 487,99,8,'Active' from dual union all
select 488,100,8,'Active' from dual union all
select 489,1,1,'Active' from dual union all
select 490,2,1,'Active' from dual union all
select 491,3,1,'Active' from dual union all
select 492,4,1,'Active' from dual union all
select 493,5,1,'Active' from dual union all
select 494,6,1,'Active' from dual union all
select 495,7,1,'Active' from dual union all
select 496,8,1,'Active' from dual union all
select 497,9,1,'Active' from dual union all
select 498,10,1,'Active' from dual union all
select 499,11,1,'Active' from dual union all
select 500,12,1,'Active' from dual union all
select 501,13,1,'Active' from dual union all
select 502,14,1,'Active' from dual union all
select 503,15,1,'Active' from dual union all
select 504,16,1,'Active' from dual union all
select 505,17,1,'Active' from dual union all
select 506,18,1,'Active' from dual union all
select 507,19,1,'Active' from dual union all
select 508,20,2,'Active' from dual union all
select 509,21,2,'Active' from dual union all
select 510,22,2,'Active' from dual union all
select 511,23,2,'Active' from dual union all
select 512,24,2,'Active' from dual union all
select 513,25,2,'Active' from dual union all
select 514,26,2,'Active' from dual union all
select 515,27,2,'Active' from dual union all
select 516,28,2,'Active' from dual union all
select 517,29,2,'Active' from dual union all
select 518,30,2,'Active' from dual union all
select 519,31,2,'Active' from dual union all
select 520,9,3,'Active' from dual union all
select 521,29,3,'Active' from dual union all
select 522,32,3,'Active' from dual union all
select 523,33,3,'Active' from dual union all
select 524,34,3,'Active' from dual union all
select 525,35,3,'Active' from dual union all
select 526,36,3,'Active' from dual union all
select 527,37,3,'Active' from dual union all
select 528,38,3,'Active' from dual union all
select 529,39,3,'Active' from dual union all
select 530,40,3,'Active' from dual union all
select 531,41,3,'Active' from dual union all
select 532,42,3,'Active' from dual union all
select 533,43,3,'Active' from dual union all
select 534,44,3,'Active' from dual union all
select 535,45,3,'Active' from dual union all
select 536,46,3,'Active' from dual union all
select 537,47,3,'Active' from dual union all
select 538,48,3,'Active' from dual union all
select 539,10,4,'Active' from dual union all
select 540,26,4,'Active' from dual union all
select 541,49,4,'Active' from dual union all
select 542,50,4,'Active' from dual union all
select 543,51,4,'Active' from dual union all
select 544,52,4,'Active' from dual union all
select 545,53,4,'Active' from dual union all
select 546,54,4,'Active' from dual union all
select 547,55,4,'Active' from dual union all
select 548,56,4,'Active' from dual union all
select 549,57,4,'Active' from dual union all
select 550,58,4,'Active' from dual union all
select 551,59,4,'Active' from dual union all
select 552,60,4,'Active' from dual union all
select 553,61,4,'Active' from dual union all
select 554,62,5,'Active' from dual union all
select 555,63,5,'Active' from dual union all
select 556,64,5,'Active' from dual union all
select 557,65,5,'Active' from dual union all
select 558,66,5,'Active' from dual union all
select 559,67,5,'Active' from dual union all
select 560,68,5,'Active' from dual union all
select 561,69,5,'Active' from dual union all
select 562,70,5,'Active' from dual union all
select 563,71,5,'Active' from dual union all
select 564,8,6,'Active' from dual union all
select 565,30,6,'Active' from dual union all
select 566,37,6,'Active' from dual union all
select 567,38,6,'Active' from dual union all
select 568,72,6,'Active' from dual union all
select 569,73,6,'Active' from dual union all
select 570,74,6,'Active' from dual union all
select 571,75,6,'Active' from dual union all
select 572,76,6,'Active' from dual union all
select 573,8,7,'Active' from dual union all
select 574,30,7,'Active' from dual union all
select 575,72,7,'Active' from dual union all
select 576,73,7,'Active' from dual union all
select 577,74,7,'Active' from dual union all
select 578,77,7,'Active' from dual union all
select 579,78,7,'Active' from dual union all
select 580,79,7,'Active' from dual union all
select 581,80,7,'Active' from dual union all
select 582,81,7,'Active' from dual union all
select 583,82,7,'Active' from dual union all
select 584,83,7,'Active' from dual union all
select 585,84,7,'Active' from dual union all
select 586,85,7,'Active' from dual union all
select 587,86,7,'Active' from dual union all
select 588,87,7,'Active' from dual union all
select 589,88,7,'Active' from dual union all
select 590,89,7,'Active' from dual union all
select 591,90,7,'Active' from dual union all
select 592,91,7,'Active' from dual union all
select 593,92,7,'Active' from dual union all
select 594,93,7,'Active' from dual union all
select 595,8,8,'Active' from dual union all
select 596,30,8,'Active' from dual union all
select 597,72,8,'Active' from dual union all
select 598,73,8,'Active' from dual union all
select 599,74,8,'Active' from dual union all
select 600,90,8,'Active' from dual union all
select 601,91,8,'Active' from dual union all
select 602,92,8,'Active' from dual union all
select 603,93,8,'Active' from dual union all
select 604,94,8,'Active' from dual union all
select 605,95,8,'Active' from dual union all
select 606,96,8,'Active' from dual union all
select 607,97,8,'Active' from dual union all
select 608,98,8,'Active' from dual union all
select 609,99,8,'Active' from dual union all
select 610,100,8,'Active' from dual;

--WALLET DML
select 1,'Card', to_date('23-NOV-24','dd-MON-yy'), to_date('06-OCT-21','dd-MON-yy'),'Active' from dual union all
select 2,'Ticket', to_date('22-MAY-23','dd-MON-yy'), to_date('19-MAR-23','dd-MON-yy'),'Active' from dual union all
select 3,'Card', to_date('23-AUG-25','dd-MON-yy'), to_date('03-AUG-20','dd-MON-yy'),'Active' from dual union all
select 4,'Ticket', to_date('06-MAY-23','dd-MON-yy'), to_date('23-MAR-23','dd-MON-yy'),'Active' from dual union all
select 5,'Card', to_date('15-DEC-25','dd-MON-yy'), to_date('15-JUN-22','dd-MON-yy'),'Active' from dual union all
select 6,'Ticket', to_date('25-JAN-23','dd-MON-yy'), to_date('17-OCT-22','dd-MON-yy'),'Active' from dual union all
select 7,'Card', to_date('29-NOV-23','dd-MON-yy'), to_date('12-APR-22','dd-MON-yy'),'Active' from dual union all
select 8,'Ticket', to_date('21-JUL-22','dd-MON-yy'), to_date('25-JAN-22','dd-MON-yy'),'Active' from dual union all
select 9,'Card', to_date('11-OCT-23','dd-MON-yy'), to_date('30-APR-21','dd-MON-yy'),'Active' from dual union all
select 10,'Ticket', to_date('10-APR-23','dd-MON-yy'), to_date('15-MAR-23','dd-MON-yy'),'Active' from dual union all
select 11,'Card', to_date('20-MAR-24','dd-MON-yy'), to_date('06-JAN-22','dd-MON-yy'),'Active' from dual union all
select 12,'Ticket', to_date('12-FEB-23','dd-MON-yy'), to_date('29-NOV-22','dd-MON-yy'),'Active' from dual union all
select 13,'Card', to_date('30-JUL-24','dd-MON-yy'), to_date('03-OCT-19','dd-MON-yy'),'Active' from dual union all
select 14,'Ticket', to_date('13-SEP-22','dd-MON-yy'), to_date('21-FEB-22','dd-MON-yy'),'Active' from dual union all
select 15,'Card', to_date('16-AUG-23','dd-MON-yy'), to_date('13-DEC-22','dd-MON-yy'),'Active' from dual union all
select 16,'Ticket', to_date('02-MAY-23','dd-MON-yy'), to_date('17-MAR-23','dd-MON-yy'),'Active' from dual union all
select 17,'Card', to_date('09-APR-23','dd-MON-yy'), to_date('05-MAY-22','dd-MON-yy'),'Active' from dual union all
select 18,'Ticket', to_date('25-JAN-23','dd-MON-yy'), to_date('12-OCT-22','dd-MON-yy'),'Active' from dual union all
select 19,'Card', to_date('26-JAN-24','dd-MON-yy'), to_date('10-SEP-21','dd-MON-yy'),'Active' from dual union all
select 20,'Ticket', to_date('02-JUL-22','dd-MON-yy'), to_date('23-NOV-21','dd-MON-yy'),'Active' from dual union all
select 21,'Card', to_date('10-JAN-24','dd-MON-yy'), to_date('10-OCT-20','dd-MON-yy'),'Active' from dual union all
select 22,'Ticket', to_date('16-APR-23','dd-MON-yy'), to_date('23-MAR-23','dd-MON-yy'),'Active' from dual union all
select 23,'Card', to_date('31-JUL-25','dd-MON-yy'), to_date('29-OCT-20','dd-MON-yy'),'Active' from dual union all
select 24,'Ticket', to_date('25-JAN-23','dd-MON-yy'), to_date('30-NOV-22','dd-MON-yy'),'Active' from dual union all
select 25,'Card', to_date('26-MAY-24','dd-MON-yy'), to_date('24-OCT-21','dd-MON-yy'),'Active' from dual union all
select 26,'Ticket', to_date('24-AUG-22','dd-MON-yy'), to_date('02-FEB-22','dd-MON-yy'),'Active' from dual union all
select 27,'Card', to_date('21-MAY-25','dd-MON-yy'), to_date('17-AUG-21','dd-MON-yy'),'Active' from dual union all
select 28,'Ticket', to_date('19-MAY-23','dd-MON-yy'), to_date('19-MAR-23','dd-MON-yy'),'Active' from dual union all
select 29,'Card', to_date('09-APR-24','dd-MON-yy'), to_date('03-JAN-23','dd-MON-yy'),'Active' from dual union all
select 30,'Ticket', to_date('01-FEB-23','dd-MON-yy'), to_date('20-JAN-23','dd-MON-yy'),'Active' from dual union all
select 31,'Card', to_date('27-APR-23','dd-MON-yy'), to_date('19-NOV-21','dd-MON-yy'),'Active' from dual union all
select 32,'Ticket', to_date('09-JUN-22','dd-MON-yy'), to_date('08-APR-22','dd-MON-yy'),'Active' from dual union all
select 33,'Card', to_date('20-NOV-24','dd-MON-yy'), to_date('05-AUG-20','dd-MON-yy'),'Active' from dual union all
select 34,'Ticket', to_date('05-MAY-23','dd-MON-yy'), to_date('23-MAR-23','dd-MON-yy'),'Active' from dual union all
select 35,'Card', to_date('19-NOV-24','dd-MON-yy'), to_date('24-JUN-22','dd-MON-yy'),'Active' from dual union all
select 36,'Ticket', to_date('28-FEB-23','dd-MON-yy'), to_date('26-NOV-22','dd-MON-yy'),'Active' from dual union all
select 37,'Card', to_date('14-JAN-24','dd-MON-yy'), to_date('12-SEP-20','dd-MON-yy'),'Active' from dual union all
select 38,'Ticket', to_date('19-SEP-22','dd-MON-yy'), to_date('07-MAR-22','dd-MON-yy'),'Active' from dual union all
select 39,'Card', to_date('08-FEB-24','dd-MON-yy'), to_date('03-JUN-21','dd-MON-yy'),'Active' from dual union all
select 40,'Ticket', to_date('19-MAY-23','dd-MON-yy'), to_date('16-MAR-23','dd-MON-yy'),'Active' from dual union all
select 41,'Card', to_date('02-OCT-23','dd-MON-yy'), to_date('09-MAR-22','dd-MON-yy'),'Active' from dual union all
select 42,'Ticket', to_date('08-FEB-23','dd-MON-yy'), to_date('04-OCT-22','dd-MON-yy'),'Active' from dual union all
select 43,'Card', to_date('02-MAR-24','dd-MON-yy'), to_date('05-JAN-21','dd-MON-yy'),'Active' from dual union all
select 44,'Ticket', to_date('08-AUG-22','dd-MON-yy'), to_date('09-FEB-22','dd-MON-yy'),'Active' from dual union all
select 45,'Card', to_date('02-MAY-24','dd-MON-yy'), to_date('03-DEC-20','dd-MON-yy'),'Active' from dual union all
select 46,'Ticket', to_date('18-MAY-23','dd-MON-yy'), to_date('18-MAR-23','dd-MON-yy'),'Active' from dual union all
select 47,'Card', to_date('23-FEB-25','dd-MON-yy'), to_date('09-JUL-21','dd-MON-yy'),'Active' from dual union all
select 48,'Ticket', to_date('29-JAN-23','dd-MON-yy'), to_date('08-OCT-22','dd-MON-yy'),'Active' from dual union all
select 49,'Card', to_date('27-MAY-24','dd-MON-yy'), to_date('18-JAN-23','dd-MON-yy'),'Active' from dual union all
select 50,'Ticket', to_date('31-AUG-22','dd-MON-yy'), to_date('30-JAN-22','dd-MON-yy'),'Active' from dual union all
select 51,'Card', to_date('24-AUG-23','dd-MON-yy'), to_date('07-MAR-22','dd-MON-yy'),'Active' from dual union all
select 52,'Ticket', to_date('21-MAY-23','dd-MON-yy'), to_date('20-MAR-23','dd-MON-yy'),'Active' from dual union all
select 53,'Card', to_date('09-NOV-25','dd-MON-yy'), to_date('29-APR-22','dd-MON-yy'),'Active' from dual union all
select 54,'Ticket', to_date('13-FEB-23','dd-MON-yy'), to_date('10-JAN-23','dd-MON-yy'),'Active' from dual union all
select 55,'Card', to_date('26-JUL-23','dd-MON-yy'), to_date('25-OCT-19','dd-MON-yy'),'Active' from dual union all
select 56,'Ticket', to_date('04-AUG-22','dd-MON-yy'), to_date('13-JAN-22','dd-MON-yy'),'Active' from dual union all
select 57,'Card', to_date('28-JUN-24','dd-MON-yy'), to_date('20-JUL-21','dd-MON-yy'),'Active' from dual union all
select 58,'Ticket', to_date('21-MAY-23','dd-MON-yy'), to_date('17-MAR-23','dd-MON-yy'),'Active' from dual union all
select 59,'Card', to_date('07-AUG-25','dd-MON-yy'), to_date('15-MAY-22','dd-MON-yy'),'Active' from dual union all
select 60,'Ticket', to_date('28-FEB-23','dd-MON-yy'), to_date('22-JAN-23','dd-MON-yy'),'Active' from dual union all
select 61,'Card', to_date('30-APR-24','dd-MON-yy'), to_date('12-NOV-20','dd-MON-yy'),'Active' from dual union all
select 62,'Ticket', to_date('24-JUN-22','dd-MON-yy'), to_date('22-FEB-22','dd-MON-yy'),'Active' from dual union all
select 63,'Card', to_date('07-SEP-25','dd-MON-yy'), to_date('02-MAY-22','dd-MON-yy'),'Active' from dual union all
select 64,'Ticket', to_date('18-APR-23','dd-MON-yy'), to_date('20-MAR-23','dd-MON-yy'),'Active' from dual union all
select 65,'Card', to_date('12-JAN-25','dd-MON-yy'), to_date('25-JUN-22','dd-MON-yy'),'Active' from dual union all
select 66,'Ticket', to_date('12-FEB-23','dd-MON-yy'), to_date('28-NOV-22','dd-MON-yy'),'Active' from dual union all
select 67,'Card', to_date('16-APR-23','dd-MON-yy'), to_date('31-AUG-19','dd-MON-yy'),'Active' from dual union all
select 68,'Ticket', to_date('22-AUG-22','dd-MON-yy'), to_date('18-MAR-22','dd-MON-yy'),'Active' from dual union all
select 69,'Card', to_date('04-MAR-25','dd-MON-yy'), to_date('04-FEB-22','dd-MON-yy'),'Active' from dual union all
select 70,'Ticket', to_date('28-MAR-23','dd-MON-yy'), to_date('16-MAR-23','dd-MON-yy'),'Active' from dual union all
select 71,'Card', to_date('30-MAR-24','dd-MON-yy'), to_date('01-DEC-20','dd-MON-yy'),'Active' from dual union all
select 72,'Ticket', to_date('26-JAN-23','dd-MON-yy'), to_date('12-OCT-22','dd-MON-yy'),'Active' from dual union all
select 73,'Card', to_date('08-NOV-23','dd-MON-yy'), to_date('02-OCT-19','dd-MON-yy'),'Active' from dual union all
select 74,'Ticket', to_date('06-AUG-22','dd-MON-yy'), to_date('14-JAN-22','dd-MON-yy'),'Active' from dual union all
select 75,'Card', to_date('17-OCT-25','dd-MON-yy'), to_date('04-MAY-22','dd-MON-yy'),'Active' from dual union all
select 76,'Ticket', to_date('18-MAY-23','dd-MON-yy'), to_date('18-MAR-23','dd-MON-yy'),'Active' from dual union all
select 77,'Card', to_date('03-DEC-24','dd-MON-yy'), to_date('21-MAR-23','dd-MON-yy'),'Active' from dual union all
select 78,'Ticket', to_date('07-FEB-23','dd-MON-yy'), to_date('17-JAN-23','dd-MON-yy'),'Active' from dual union all
select 79,'Card', to_date('14-MAR-24','dd-MON-yy'), to_date('13-NOV-21','dd-MON-yy'),'Active' from dual union all
select 80,'Ticket', to_date('11-JUN-22','dd-MON-yy'), to_date('06-JAN-22','dd-MON-yy'),'Active' from dual union all
select 81,'Card', to_date('16-NOV-24','dd-MON-yy'), to_date('16-APR-22','dd-MON-yy'),'Active' from dual union all
select 82,'Ticket', to_date('29-APR-23','dd-MON-yy'), to_date('21-MAR-23','dd-MON-yy'),'Active' from dual union all
select 83,'Card', to_date('22-FEB-25','dd-MON-yy'), to_date('27-MAR-21','dd-MON-yy'),'Active' from dual union all
select 84,'Ticket', to_date('09-FEB-23','dd-MON-yy'), to_date('03-JAN-23','dd-MON-yy'),'Active' from dual union all
select 85,'Card', to_date('08-APR-23','dd-MON-yy'), to_date('21-FEB-19','dd-MON-yy'),'Active' from dual union all
select 86,'Ticket', to_date('07-JUL-22','dd-MON-yy'), to_date('05-MAR-22','dd-MON-yy'),'Active' from dual union all
select 87,'Card', to_date('31-AUG-23','dd-MON-yy'), to_date('20-MAR-22','dd-MON-yy'),'Active' from dual union all
select 88,'Ticket', to_date('17-MAY-23','dd-MON-yy'), to_date('22-MAR-23','dd-MON-yy'),'Active' from dual union all
select 89,'Card', to_date('20-MAY-24','dd-MON-yy'), to_date('22-AUG-22','dd-MON-yy'),'Active' from dual union all
select 90,'Ticket', to_date('01-FEB-23','dd-MON-yy'), to_date('16-OCT-22','dd-MON-yy'),'Active' from dual union all
select 91,'Card', to_date('13-FEB-24','dd-MON-yy'), to_date('15-JAN-22','dd-MON-yy'),'Active' from dual union all
select 92,'Ticket', to_date('13-SEP-22','dd-MON-yy'), to_date('26-FEB-22','dd-MON-yy'),'Active' from dual;

--RECHARGE DML
INSERT INTO RECHARGE (recharge_id, value_of_transaction, wallet_id, transaction_time, recharge_type, recharge_device_id)
select 1,2.9,2, to_date('15-MAR-23','dd-MON-yy'),'Ride',1 from dual union all
select 2,2.9,2, to_date('14-MAR-23','dd-MON-yy'),'Ride',1 from dual union all
select 3,18.2,33, to_date('11-MAY-21','dd-MON-yy'),'Top-up',66 from dual union all
select 4,2.9,82, to_date('29-SEP-21','dd-MON-yy'),'Ride',138 from dual union all
select 5,5.8,26, to_date('23-OCT-21','dd-MON-yy'),'Ride',61 from dual union all
select 6,90,27, to_date('08-APR-22','dd-MON-yy'),'Pass',166 from dual union all
select 7,16,9, to_date('02-DEC-21','dd-MON-yy'),'Top-up',54 from dual union all
select 8,10,77, to_date('03-DEC-21','dd-MON-yy'),'Pass',108 from dual union all
select 9,9.1,27, to_date('08-MAR-21','dd-MON-yy'),'Top-up',34 from dual union all
select 10,2.9,48, to_date('09-JAN-22','dd-MON-yy'),'Ride',172 from dual union all
select 11,5.8,86, to_date('23-MAY-21','dd-MON-yy'),'Ride',178 from dual union all
select 12,90,5, to_date('25-AUG-20','dd-MON-yy'),'Pass',154 from dual union all
select 13,8,51, to_date('26-JUL-21','dd-MON-yy'),'Top-up',118 from dual union all
select 14,10,59, to_date('05-AUG-21','dd-MON-yy'),'Pass',32 from dual union all
select 15,10.7,75, to_date('21-NOV-22','dd-MON-yy'),'Top-up',91 from dual union all
select 16,2.9,26, to_date('14-MAR-23','dd-MON-yy'),'Ride',38 from dual union all
select 17,5.8,24, to_date('24-NOV-21','dd-MON-yy'),'Ride',75 from dual union all
select 18,90,91, to_date('13-JAN-23','dd-MON-yy'),'Pass',27 from dual union all
select 19,6.5,59, to_date('21-DEC-20','dd-MON-yy'),'Top-up',144 from dual union all
select 20,10,59, to_date('04-SEP-22','dd-MON-yy'),'Pass',95 from dual union all
select 21,23.9,73, to_date('15-SEP-22','dd-MON-yy'),'Top-up',62 from dual union all
select 22,2.9,46, to_date('27-FEB-21','dd-MON-yy'),'Ride',184 from dual union all
select 23,5.8,48, to_date('17-OCT-20','dd-MON-yy'),'Ride',128 from dual union all
select 24,90,65, to_date('04-DEC-21','dd-MON-yy'),'Pass',100 from dual union all
select 25,30.3,7, to_date('01-FEB-22','dd-MON-yy'),'Top-up',51 from dual union all
select 26,10,93, to_date('13-FEB-22','dd-MON-yy'),'Pass',184 from dual union all
select 27,41.5,81, to_date('04-SEP-20','dd-MON-yy'),'Top-up',155 from dual union all
select 28,2.9,6, to_date('07-AUG-21','dd-MON-yy'),'Ride',147 from dual union all
select 29,5.8,56, to_date('02-APR-21','dd-MON-yy'),'Ride',135 from dual union all
select 30,90,13, to_date('02-JAN-23','dd-MON-yy'),'Pass',61 from dual union all
select 31,39.5,49, to_date('07-JUN-21','dd-MON-yy'),'Top-up',97 from dual union all
select 32,10,11, to_date('17-AUG-20','dd-MON-yy'),'Pass',28 from dual union all
select 33,34.1,83, to_date('18-APR-21','dd-MON-yy'),'Top-up',2 from dual union all
select 34,2.9,98, to_date('17-AUG-20','dd-MON-yy'),'Ride',94 from dual union all
select 35,5.8,42, to_date('02-FEB-23','dd-MON-yy'),'Ride',189 from dual union all
select 36,90,79, to_date('29-AUG-21','dd-MON-yy'),'Pass',76 from dual union all
select 37,7.5,31, to_date('04-NOV-21','dd-MON-yy'),'Top-up',63 from dual union all
select 38,10,95, to_date('04-NOV-20','dd-MON-yy'),'Pass',35 from dual union all
select 39,23.5,9, to_date('11-SEP-21','dd-MON-yy'),'Top-up',40 from dual union all
select 40,2.9,46, to_date('25-NOV-22','dd-MON-yy'),'Ride',26 from dual union all
select 41,5.8,4, to_date('15-MAY-21','dd-MON-yy'),'Ride',189 from dual union all
select 42,90,57, to_date('29-AUG-20','dd-MON-yy'),'Pass',148 from dual union all
select 43,6.4,95, to_date('03-JAN-21','dd-MON-yy'),'Top-up',147 from dual union all
select 44,10,43, to_date('30-AUG-22','dd-MON-yy'),'Pass',18 from dual union all
select 45,29.4,55, to_date('21-NOV-22','dd-MON-yy'),'Top-up',22 from dual union all
select 46,2.9,84, to_date('24-FEB-22','dd-MON-yy'),'Ride',113 from dual union all
select 47,5.8,66, to_date('13-MAR-21','dd-MON-yy'),'Ride',68 from dual union all
select 48,90,83, to_date('06-AUG-20','dd-MON-yy'),'Pass',26 from dual union all
select 49,26,37, to_date('15-NOV-22','dd-MON-yy'),'Top-up',182 from dual union all
select 50,10,83, to_date('26-FEB-23','dd-MON-yy'),'Pass',128 from dual union all
select 51,46.7,7, to_date('22-APR-22','dd-MON-yy'),'Top-up',157 from dual union all
select 52,2.9,12, to_date('09-MAR-21','dd-MON-yy'),'Ride',74 from dual union all
select 53,5.8,16, to_date('20-SEP-21','dd-MON-yy'),'Ride',97 from dual union all
select 54,90,59, to_date('29-SEP-20','dd-MON-yy'),'Pass',97 from dual union all
select 55,49.7,31, to_date('04-JUN-22','dd-MON-yy'),'Top-up',86 from dual union all
select 56,10,17, to_date('26-NOV-20','dd-MON-yy'),'Pass',38 from dual union all
select 57,24.1,95, to_date('16-JUL-20','dd-MON-yy'),'Top-up',156 from dual union all
select 58,2.9,50, to_date('05-OCT-20','dd-MON-yy'),'Ride',14 from dual union all
select 59,5.8,72, to_date('19-AUG-20','dd-MON-yy'),'Ride',190 from dual union all
select 60,90,49, to_date('29-APR-21','dd-MON-yy'),'Pass',89 from dual union all
select 61,27.6,89, to_date('18-MAY-21','dd-MON-yy'),'Top-up',57 from dual union all
select 62,10,51, to_date('03-JUL-22','dd-MON-yy'),'Pass',75 from dual union all
select 63,45,21, to_date('21-SEP-21','dd-MON-yy'),'Top-up',48 from dual union all
select 64,2.9,36, to_date('17-NOV-22','dd-MON-yy'),'Ride',50 from dual union all
select 65,5.8,58, to_date('07-JUN-21','dd-MON-yy'),'Ride',38 from dual union all
select 66,90,35, to_date('28-JAN-22','dd-MON-yy'),'Pass',155 from dual union all
select 67,1.4,49, to_date('23-JAN-22','dd-MON-yy'),'Top-up',181 from dual union all
select 68,10,41, to_date('05-OCT-21','dd-MON-yy'),'Pass',9 from dual union all
select 69,37,85, to_date('27-NOV-20','dd-MON-yy'),'Top-up',3 from dual union all
select 70,2.9,6, to_date('11-NOV-21','dd-MON-yy'),'Ride',112 from dual union all
select 71,5.8,80, to_date('10-NOV-21','dd-MON-yy'),'Ride',107 from dual union all
select 72,90,69, to_date('14-APR-22','dd-MON-yy'),'Pass',63 from dual union all
select 73,20.6,45, to_date('28-DEC-20','dd-MON-yy'),'Top-up',19 from dual union all
select 74,10,25, to_date('25-FEB-22','dd-MON-yy'),'Pass',29 from dual union all
select 75,5.6,41, to_date('07-NOV-22','dd-MON-yy'),'Top-up',145 from dual union all
select 76,2.9,100, to_date('17-AUG-20','dd-MON-yy'),'Ride',24 from dual union all
select 77,5.8,42, to_date('21-AUG-20','dd-MON-yy'),'Ride',85 from dual union all
select 78,90,73, to_date('23-FEB-23','dd-MON-yy'),'Pass',70 from dual union all
select 79,6.5,41, to_date('23-AUG-20','dd-MON-yy'),'Top-up',130 from dual union all
select 80,10,15, to_date('10-FEB-23','dd-MON-yy'),'Pass',162 from dual union all
select 81,34.5,93, to_date('12-SEP-20','dd-MON-yy'),'Top-up',188 from dual union all
select 82,2.9,60, to_date('21-FEB-21','dd-MON-yy'),'Ride',46 from dual union all
select 83,5.8,90, to_date('22-JUL-22','dd-MON-yy'),'Ride',167 from dual union all
select 84,90,57, to_date('16-FEB-23','dd-MON-yy'),'Pass',153 from dual union all
select 85,34,79, to_date('21-MAR-21','dd-MON-yy'),'Top-up',155 from dual union all
select 86,10,95, to_date('07-FEB-22','dd-MON-yy'),'Pass',191 from dual union all
select 87,47,31, to_date('19-DEC-20','dd-MON-yy'),'Top-up',166 from dual union all
select 88,2.9,68, to_date('09-JAN-23','dd-MON-yy'),'Ride',56 from dual union all
select 89,5.8,2, to_date('10-OCT-21','dd-MON-yy'),'Ride',93 from dual union all
select 90,90,67, to_date('05-FEB-21','dd-MON-yy'),'Pass',33 from dual union all
select 91,16.5,15, to_date('06-MAY-21','dd-MON-yy'),'Top-up',30 from dual union all
select 92,10,39, to_date('12-JUN-21','dd-MON-yy'),'Pass',47 from dual union all
select 93,41.1,69, to_date('11-JAN-22','dd-MON-yy'),'Top-up',142 from dual union all
select 94,2.9,14, to_date('25-OCT-21','dd-MON-yy'),'Ride',147 from dual union all
select 95,5.8,18, to_date('03-JAN-23','dd-MON-yy'),'Ride',155 from dual union all
select 96,90,93, to_date('15-JUL-21','dd-MON-yy'),'Pass',84 from dual union all
select 97,43.5,71, to_date('06-APR-22','dd-MON-yy'),'Top-up',2 from dual union all
select 98,10,23, to_date('14-JUL-20','dd-MON-yy'),'Pass',25 from dual union all
select 99,12.9,89, to_date('17-MAY-21','dd-MON-yy'),'Top-up',80 from dual union all
select 100,2.9,20, to_date('23-APR-21','dd-MON-yy'),'Ride',139 from dual union all
select 101,5.8,94, to_date('04-FEB-23','dd-MON-yy'),'Ride',86 from dual union all
select 102,90,97, to_date('07-JUL-21','dd-MON-yy'),'Pass',127 from dual union all
select 103,42.6,73, to_date('30-JAN-23','dd-MON-yy'),'Top-up',157 from dual union all
select 104,10,59, to_date('18-FEB-23','dd-MON-yy'),'Pass',144 from dual union all
select 105,44.1,25, to_date('12-JUL-21','dd-MON-yy'),'Top-up',185 from dual union all
select 106,2.9,36, to_date('20-MAR-22','dd-MON-yy'),'Ride',26 from dual union all
select 107,5.8,20, to_date('13-OCT-21','dd-MON-yy'),'Ride',22 from dual union all
select 108,90,81, to_date('22-FEB-22','dd-MON-yy'),'Pass',53 from dual union all
select 109,17,67, to_date('22-MAR-23','dd-MON-yy'),'Top-up',76 from dual union all
select 110,10,19, to_date('09-MAY-21','dd-MON-yy'),'Pass',32 from dual union all
select 111,48.2,75, to_date('17-JAN-21','dd-MON-yy'),'Top-up',142 from dual union all
select 112,2.9,66, to_date('25-MAY-21','dd-MON-yy'),'Ride',129 from dual union all
select 113,5.8,26, to_date('23-DEC-21','dd-MON-yy'),'Ride',143 from dual union all
select 114,90,13, to_date('18-OCT-20','dd-MON-yy'),'Pass',84 from dual union all
select 115,30.6,11, to_date('10-AUG-21','dd-MON-yy'),'Top-up',52 from dual union all
select 116,10,81, to_date('10-AUG-21','dd-MON-yy'),'Pass',137 from dual union all
select 117,40.8,55, to_date('18-APR-22','dd-MON-yy'),'Top-up',63 from dual union all
select 118,2.9,78, to_date('28-JUN-21','dd-MON-yy'),'Ride',121 from dual union all
select 119,5.8,8, to_date('15-MAR-23','dd-MON-yy'),'Ride',81 from dual union all
select 120,90,23, to_date('02-FEB-21','dd-MON-yy'),'Pass',64 from dual union all
select 121,41.7,49, to_date('07-OCT-21','dd-MON-yy'),'Top-up',171 from dual union all
select 122,10,31, to_date('21-AUG-22','dd-MON-yy'),'Pass',155 from dual union all
select 123,6.4,25, to_date('18-JAN-23','dd-MON-yy'),'Top-up',185 from dual union all
select 124,2.9,72, to_date('06-OCT-20','dd-MON-yy'),'Ride',189 from dual union all
select 125,5.8,56, to_date('11-NOV-22','dd-MON-yy'),'Ride',49 from dual union all
select 126,90,71, to_date('30-AUG-22','dd-MON-yy'),'Pass',134 from dual union all
select 127,2.2,49, to_date('17-MAR-21','dd-MON-yy'),'Top-up',73 from dual union all
select 128,10,43, to_date('20-JAN-21','dd-MON-yy'),'Pass',128 from dual union all
select 129,5.2,87, to_date('20-FEB-23','dd-MON-yy'),'Top-up',151 from dual union all
select 130,2.9,58, to_date('13-AUG-21','dd-MON-yy'),'Ride',81 from dual union all
select 131,5.8,34, to_date('11-OCT-20','dd-MON-yy'),'Ride',59 from dual union all
select 132,90,41, to_date('09-MAR-22','dd-MON-yy'),'Pass',8 from dual union all
select 133,33.2,67, to_date('11-OCT-21','dd-MON-yy'),'Top-up',84 from dual union all
select 134,10,35, to_date('09-NOV-20','dd-MON-yy'),'Pass',174 from dual union all
select 135,44.3,35, to_date('07-JUL-22','dd-MON-yy'),'Top-up',136 from dual union all
select 136,2.9,46, to_date('26-APR-21','dd-MON-yy'),'Ride',100 from dual union all
select 137,5.8,70, to_date('12-JUL-22','dd-MON-yy'),'Ride',55 from dual union all
select 138,90,21, to_date('21-JUL-20','dd-MON-yy'),'Pass',35 from dual union all
select 139,13.1,59, to_date('11-MAY-21','dd-MON-yy'),'Top-up',157 from dual union all
select 140,10,49, to_date('06-JUN-22','dd-MON-yy'),'Pass',118 from dual union all
select 141,11,39, to_date('12-SEP-20','dd-MON-yy'),'Top-up',33 from dual union all
select 142,2.9,90, to_date('28-FEB-22','dd-MON-yy'),'Ride',141 from dual union all
select 143,5.8,14, to_date('07-APR-22','dd-MON-yy'),'Ride',68 from dual union all
select 144,90,65, to_date('08-JUL-22','dd-MON-yy'),'Pass',148 from dual union all
select 145,3.7,39, to_date('14-OCT-21','dd-MON-yy'),'Top-up',112 from dual union all
select 146,10,55, to_date('22-NOV-21','dd-MON-yy'),'Pass',159 from dual union all
select 147,43.7,63, to_date('23-MAY-22','dd-MON-yy'),'Top-up',14 from dual union all
select 148,2.9,56, to_date('13-JUL-20','dd-MON-yy'),'Ride',13 from dual union all
select 149,5.8,86, to_date('02-NOV-22','dd-MON-yy'),'Ride',186 from dual union all
select 150,90,17, to_date('24-JUN-21','dd-MON-yy'),'Pass',136 from dual union all
select 151,39.7,11, to_date('24-JAN-21','dd-MON-yy'),'Top-up',141 from dual union all
select 152,10,99, to_date('09-DEC-20','dd-MON-yy'),'Pass',152 from dual union all
select 153,3.3,19, to_date('04-AUG-20','dd-MON-yy'),'Top-up',5 from dual union all
select 154,2.9,36, to_date('06-SEP-21','dd-MON-yy'),'Ride',97 from dual union all
select 155,5.8,76, to_date('16-JAN-21','dd-MON-yy'),'Ride',16 from dual union all
select 156,90,51, to_date('04-MAY-21','dd-MON-yy'),'Pass',21 from dual union all
select 157,30.2,69, to_date('28-FEB-21','dd-MON-yy'),'Top-up',71 from dual union all
select 158,10,97, to_date('27-FEB-23','dd-MON-yy'),'Pass',10 from dual union all
select 159,18.4,87, to_date('13-FEB-21','dd-MON-yy'),'Top-up',12 from dual union all
select 160,2.9,16, to_date('31-MAR-21','dd-MON-yy'),'Ride',10 from dual union all
select 161,5.8,50, to_date('01-FEB-23','dd-MON-yy'),'Ride',40 from dual union all
select 162,90,33, to_date('03-JUL-21','dd-MON-yy'),'Pass',138 from dual union all
select 163,23.1,85, to_date('28-AUG-22','dd-MON-yy'),'Top-up',36 from dual union all
select 164,10,81, to_date('17-DEC-20','dd-MON-yy'),'Pass',68 from dual union all
select 165,4,57, to_date('26-SEP-21','dd-MON-yy'),'Top-up',48 from dual union all
select 166,2.9,58, to_date('25-DEC-20','dd-MON-yy'),'Ride',76 from dual union all
select 167,5.8,10, to_date('08-FEB-21','dd-MON-yy'),'Ride',21 from dual union all
select 168,90,83, to_date('27-DEC-22','dd-MON-yy'),'Pass',167 from dual union all
select 169,30.7,85, to_date('20-SEP-22','dd-MON-yy'),'Top-up',171 from dual union all
select 170,10,5, to_date('19-OCT-21','dd-MON-yy'),'Pass',75 from dual union all
select 171,38.7,81, to_date('01-MAR-22','dd-MON-yy'),'Top-up',99 from dual union all
select 172,2.9,54, to_date('31-MAR-22','dd-MON-yy'),'Ride',173 from dual union all
select 173,5.8,30, to_date('12-FEB-22','dd-MON-yy'),'Ride',98 from dual union all
select 174,90,13, to_date('20-JAN-22','dd-MON-yy'),'Pass',108 from dual union all
select 175,28.9,31, to_date('18-SEP-20','dd-MON-yy'),'Top-up',134 from dual union all
select 176,10,19, to_date('09-NOV-22','dd-MON-yy'),'Pass',175 from dual union all
select 177,41.5,89, to_date('15-AUG-21','dd-MON-yy'),'Top-up',177 from dual union all
select 178,2.9,82, to_date('04-OCT-22','dd-MON-yy'),'Ride',157 from dual union all
select 179,5.8,62, to_date('17-DEC-21','dd-MON-yy'),'Ride',72 from dual union all
select 180,90,61, to_date('16-AUG-20','dd-MON-yy'),'Pass',122 from dual union all
select 181,11.6,85, to_date('13-AUG-21','dd-MON-yy'),'Top-up',179 from dual union all
select 182,10,45, to_date('08-OCT-21','dd-MON-yy'),'Pass',186 from dual union all
select 183,17.1,51, to_date('05-NOV-21','dd-MON-yy'),'Top-up',65 from dual union all
select 184,2.9,68, to_date('11-NOV-22','dd-MON-yy'),'Ride',2 from dual union all
select 185,5.8,58, to_date('12-FEB-21','dd-MON-yy'),'Ride',190 from dual union all
select 186,90,13, to_date('08-APR-21','dd-MON-yy'),'Pass',173 from dual union all
select 187,6.3,33, to_date('22-AUG-21','dd-MON-yy'),'Top-up',191 from dual union all
select 188,10,23, to_date('28-NOV-22','dd-MON-yy'),'Pass',190 from dual union all
select 189,36.7,51, to_date('29-JUL-22','dd-MON-yy'),'Top-up',8 from dual union all
select 190,2.9,74, to_date('31-JUL-20','dd-MON-yy'),'Ride',4 from dual union all
select 191,5.8,50, to_date('11-MAR-23','dd-MON-yy'),'Ride',159 from dual union all
select 192,90,87, to_date('28-FEB-23','dd-MON-yy'),'Pass',128 from dual union all
select 193,32.4,27, to_date('08-NOV-21','dd-MON-yy'),'Top-up',5 from dual union all
select 194,10,59, to_date('21-NOV-21','dd-MON-yy'),'Pass',112 from dual union all
select 195,8.8,91, to_date('09-MAY-22','dd-MON-yy'),'Top-up',70 from dual union all
select 196,2.9,48, to_date('29-SEP-20','dd-MON-yy'),'Ride',102 from dual union all
select 197,5.8,64, to_date('28-JAN-22','dd-MON-yy'),'Ride',188 from dual union all
select 198,90,59, to_date('05-JUN-21','dd-MON-yy'),'Pass',180 from dual union all
select 199,38.8,3, to_date('29-JAN-23','dd-MON-yy'),'Top-up',90 from dual union all
select 200,10,53, to_date('25-DEC-20','dd-MON-yy'),'Pass',132 from dual union all
select 201,48,89, to_date('11-AUG-21','dd-MON-yy'),'Top-up',84 from dual union all
select 202,2.9,64, to_date('14-APR-22','dd-MON-yy'),'Ride',42 from dual union all
select 203,5.8,92, to_date('25-APR-21','dd-MON-yy'),'Ride',154 from dual union all
select 204,90,19, to_date('23-OCT-22','dd-MON-yy'),'Pass',23 from dual union all
select 205,22.4,37, to_date('30-AUG-22','dd-MON-yy'),'Top-up',78 from dual union all
select 206,10,77, to_date('01-JUN-21','dd-MON-yy'),'Pass',29 from dual union all
select 207,47.3,61, to_date('30-OCT-22','dd-MON-yy'),'Top-up',183 from dual union all
select 208,2.9,60, to_date('17-OCT-20','dd-MON-yy'),'Ride',16 from dual union all
select 209,5.8,14, to_date('13-OCT-22','dd-MON-yy'),'Ride',14 from dual union all
select 210,90,21, to_date('18-JUL-20','dd-MON-yy'),'Pass',93 from dual union all
select 211,4.9,5, to_date('27-JAN-21','dd-MON-yy'),'Top-up',50 from dual union all
select 212,10,55, to_date('16-JUN-22','dd-MON-yy'),'Pass',35 from dual union all
select 213,35.6,69, to_date('06-FEB-21','dd-MON-yy'),'Top-up',104 from dual union all
select 214,2.9,42, to_date('07-SEP-20','dd-MON-yy'),'Ride',166 from dual union all
select 215,5.8,36, to_date('01-OCT-21','dd-MON-yy'),'Ride',128 from dual union all
select 216,90,23, to_date('07-FEB-22','dd-MON-yy'),'Pass',23 from dual union all
select 217,48.3,65, to_date('12-SEP-21','dd-MON-yy'),'Top-up',150 from dual union all
select 218,10,67, to_date('09-SEP-21','dd-MON-yy'),'Pass',152 from dual union all
select 219,21.1,41, to_date('06-OCT-20','dd-MON-yy'),'Top-up',35 from dual union all
select 220,2.9,88, to_date('30-SEP-22','dd-MON-yy'),'Ride',180 from dual union all
select 221,5.8,38, to_date('26-JUL-20','dd-MON-yy'),'Ride',122 from dual union all
select 222,90,39, to_date('08-DEC-22','dd-MON-yy'),'Pass',89 from dual union all
select 223,22.5,69, to_date('30-MAR-22','dd-MON-yy'),'Top-up',101 from dual union all
select 224,10,3, to_date('08-JUN-22','dd-MON-yy'),'Pass',27 from dual union all
select 225,28.2,29, to_date('01-OCT-21','dd-MON-yy'),'Top-up',54 from dual union all
select 226,2.9,6, to_date('19-DEC-20','dd-MON-yy'),'Ride',104 from dual union all
select 227,5.8,28, to_date('07-MAR-21','dd-MON-yy'),'Ride',111 from dual union all
select 228,90,59, to_date('25-MAY-21','dd-MON-yy'),'Pass',181 from dual union all
select 229,9.9,37, to_date('19-AUG-21','dd-MON-yy'),'Top-up',166 from dual union all
select 230,10,71, to_date('24-SEP-20','dd-MON-yy'),'Pass',75 from dual union all
select 231,28.5,27, to_date('03-JAN-22','dd-MON-yy'),'Top-up',192 from dual union all
select 232,2.9,12, to_date('25-OCT-20','dd-MON-yy'),'Ride',148 from dual union all
select 233,5.8,64, to_date('23-JUL-20','dd-MON-yy'),'Ride',178 from dual union all
select 234,90,69, to_date('25-APR-22','dd-MON-yy'),'Pass',182 from dual union all
select 235,6,9, to_date('06-JAN-22','dd-MON-yy'),'Top-up',45 from dual union all
select 236,10,45, to_date('09-JAN-22','dd-MON-yy'),'Pass',120 from dual;
