CREATE TABLE WALLET(wallet_id number GENERATED BY DEFAULT AS IDENTITY, wallet_type ENUM('Card','Ticket'), wallet_expiry date, start_date date, status ENUM('Active','Inactive'), PRIMARY KEY(wallet_id));
CREATE TABLE TICKET(tiket_id number GENERATED BY DEFAULT AS IDENTITY, wallet_id number, rides number, transit_id number, PRIMARY KEY(ticket_id), FOREIGN KEY(wallet_id) REFERENCES WALLET(wallet_id), FOREIGN KEY(transit_id) REFERENCES TRANSIT(transit_id));
