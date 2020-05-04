CREATE OR REPLACE DATABASE enrichment;
USE enrichment;
CREATE TABLE IF NOT EXISTS networks (
	id int(10) unsigned NOT NULL AUTO_INCREMENT, 
	ip_from int(4) unsigned NOT NULL,
	ip_to int(4) unsigned NOT NULL,
	name varchar(128) NOT NULL,
	PRIMARY KEY (id)
);
INSERT INTO networks (ip_from, ip_to, name) VALUES (INET_ATON('16.242.215.0'),INET_ATON('16.242.215.63'),'Infra - GuestNet 15');
INSERT INTO networks (ip_from, ip_to, name) VALUES (INET_ATON('16.242.227.0'),INET_ATON('16.242.227.63'),'Infra - GuestNet 16');
INSERT INTO networks (ip_from, ip_to, name) VALUES (INET_ATON('16.242.231.0'),INET_ATON('16.242.231.63'),'Infra - GuestNet 17');
INSERT INTO networks (ip_from, ip_to, name) VALUES (INET_ATON('16.242.235.0'),INET_ATON('16.242.235.63'),'Infra - GuestNet 18');

#Sample Stored Procedure with SQL query to get network name from IP
DELIMITER //
CREATE PROCEDURE GetNetworkName(
    IN ip varchar(129), OUT network_name varchar(128)
)
BEGIN
    SELECT name INTO network_name FROM networks WHERE ip_from < INET_ATON(ip) AND ip_to > INET_ATON(ip);
END //
DELIMITER ;


# call GetNetworkName('16.242.215.15',@output);
# select @output
#+---------------------+
#| @output             |
#+---------------------+
#| Infra - GuestNet 15 |
#+---------------------+
