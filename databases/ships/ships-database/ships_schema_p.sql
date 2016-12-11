-- ships_schema.sql
-- AL20161205 postgres OK

DROP table classes;
CREATE table classes(class varchar(20), type char(2), country varchar(25), numGuns integer, bore integer, displacement integer);

DROP table ships;
CREATE table ships(name varchar(20), class varchar(15), launched integer);

DROP table battles;
CREATE table battles(name varchar(20), dato varchar(10));

DROP table outcomes;
CREATE table outcomes(ship varchar(20), battle varchar(20), result varchar(10));

-- classes metadata
--  bc = Battlecruiser
--  bb = battleship
--

start transaction;
INSERT into classes values('Bismarck', 'bb', 'Germany', 8, 15, 42000);
INSERT into classes values('Iowa', 'bb', 'USA', 9, 16, 46000);
INSERT into classes values('Kongo', 'bc', 'Japan', 8, 14, 32000);
INSERT into classes values('South Dakota', 'bb', 'USA', 9, 16, 37000);
INSERT into classes values('Renown', 'bc', 'Gt. Britain', 6, 15, 32000);
INSERT into classes values('Revenge', 'bb', 'Gt. Britain', 8, 15, 29000);
INSERT into classes values('Mississippi', 'bb', 'USA', 12, 14, 33000);
INSERT into classes values('Yamato', 'bb', 'Japan', 9, 18, 65000);

INSERT into battles values('Denmark Strait', '5/24-27/41');
INSERT into battles values('Guadalcanal', '11/15/42');
INSERT into battles values('North Cape', '12/26/43');
INSERT into battles values('Surigao Strait', '10/25/44');

INSERT into outcomes values('Arizona', 'Pearl Harbor', 'sunk');
INSERT into outcomes values('Bismarck', 'Denmark Strait', 'sunk');
INSERT into outcomes values('California', 'Surigao Strait', 'ok');
INSERT into outcomes values('Duke of York', 'North Cape', 'ok');
INSERT into outcomes values('Fuso', 'Surigao Strait', 'sunk');
INSERT into outcomes values('Hood', 'Denmark Strait', 'sunk');
INSERT into outcomes values('King George V', 'Denmark Strait', 'ok');
INSERT into outcomes values('Kirishima', 'Guadalcanal', 'sunk');
INSERT into outcomes values('Prince of Wales', 'Denmark Strait', 'damaged');
INSERT into outcomes values('Rodney', 'Denmark Strait', 'ok');
INSERT into outcomes values('Scharnhorst', 'North Cape', 'sunk');
INSERT into outcomes values('South Dakota', 'Guadalcanal', 'damaged');
INSERT into outcomes values('Tennessee', 'Surigao Strait', 'ok');
INSERT into outcomes values('Washington', 'Guadalcanal', 'ok');
INSERT into outcomes values('West Virginia', 'Surigao Strait', 'ok');
INSERT into outcomes values('Yamashiro', 'Surigao Strait', 'sunk');

INSERT into ships values('Alabama', 'South Dakota', 1942);
INSERT into ships values('Haruna', 'Kongo', 1915);
INSERT into ships values('Hiei', 'Kongo', 1914);
INSERT into ships values('Idaho', 'Mississippi', 1919);
INSERT into ships values('Iowa', 'Iowa', 1943);
INSERT into ships values('Kirishima', 'Kongo', 1915);
INSERT into ships values('Kongo', 'Kongo', 1913);
INSERT into ships values('Mussouri', 'Iowa', 1944);
INSERT into ships values('Musashi', 'Yamato', 1942);
INSERT into ships values('New Jersey', 'Iowa', 1943);
INSERT into ships values('New Mexico', 'Mississippi', 1918);
INSERT into ships values('Ramillies', 'Revenge', 1917);
INSERT into ships values('Renown', 'Renown', 1916);
INSERT into ships values('Repulse', 'Renown', 1916);
INSERT into ships values('Resolution', 'Revenge', 1916);
INSERT into ships values('Revenge', 'Revenge', 1916);
INSERT into ships values('Royal Oak', 'Revenge', 1916);
INSERT into ships values('Royal Sovereign', 'Revenge', 1916);
INSERT into ships values('South Dakota', 'South Dakota', 1942);
INSERT into ships values('Wisconsin', 'Iowa', 1944);
INSERT into ships values('Yamato', 'Yamato', 1941);
commit;
