use ecommerce;

show tables;

desc clients;
insert into clients (fName, mInit, lName, CPF, address, birthDate) values
		('Maria','M','Silva','123456789','Rua Silva de parta 29, Carangola - Cidade das Flores','1980-01-01'),
		('Matheus','O','Pimentel','987654321','Rua Alameda 289, Centro - Cidade das Flores','1981-01-01'),
        ('Ricardo','F','Silva','45678913','Rua Alameda Vinha 1009, Centro - Cidade das Flores','1982-01-01'),
        ('Julia','S','França','789123456','Rua Laranjeiras 861, Centro - Cidade das Flores','1983-01-01'),
        ('Roberta','G','Assis','98745631','Avenida Koller 19, Centro - Cidade das Flores','1984-01-01'),
        ('Isabela','M','Cruz','654789123','Rua Alameda das Flores 28, Centro - Cidade das Flores','1985-01-01');
 select * from clients;
 
desc products;
insert into products (pName, classificationKids, category, avaliation, size, valor) values
		('Fone de ouvido',false,'Eletrônico','4',null,'49'),
        ('Barbie Elsa',true,'Brinquedos','3',null,'179'),
        ('Body Carters',true,'Vestimenta','5',null,'89'),
        ('Microfone Vedo',false,'Eletrônico','4',null,'69'),
        ('Sofá Retrátil',false,'Móveis','3','3x57x80','999'),
        ('Farinha de Arroz',false,'Alimentos','2',null,'6'),
        ('Fire Stick Amazon',false,'Eletrônico','3',null,'199');
select * from products;

desc orders;
insert into orders (idOrder, idOrderClient, ordersStatus, ordersDescription, freight) values
		(1,7,'Processando','compra via aplicativo','10'),
		(2,9,'Em andamento','compra via aplicativo','20'),
        (3,10,'Entregue',null,'5'),
        (4,12,'Enviado','compra via website','15');
select * from orders;

desc productOrder;
insert into productOrder (idPOProduct, idPOOrder, pOQuantity, pOStatus) values
		(1,1,2,null),
        (2,1,1,null),
        (3,2,1,null);
select * from productOrder;

desc storages;
insert into storages (location, quantity) values
		('Rio de Janeiro',1000),
        ('Rio de Janeiro',500),
        ('São Paulo',10),
        ('São Paulo',100),
        ('São Paulo',10),
        ('Brasília',60);
select * from storages;

desc productstorage;
insert into productstorage (idPStProduct, idPStStorage) values
		(1,2),
        (2,6);
select * from productstorage;

desc supplier;
insert into supplier (socialName, CNPJ, contact, contactNumber, location) values
		('Almeida e Filhos', 12345678913456,'Sr.Almeida','21985474','São Paulo'),
        ('Eletrônicos Silva', 85451964943457,'Sra.Silva','21985484','Rio de Janeiro'),
        ('Almeida Valma', 93456789394695,'Sra.Valma','21975474','Belo Horizonte');
select * from supplier;       
 
desc productSupplier;
insert into productSupplier (idPSuProduct, idPSuSupplier) values
		(1,4),
        (2,4),
        (3,5),
        (4,6),
        (5,6);
select * from productSupplier;      

desc seller;
insert into seller (socialName, CNPJ, CPF, location, contact, contactNumber) values
		('Tech Eletronics',12345678964321,null,'Rio de Janeiro','Diego',219946287),
        ('Botique Durgas',null,123456783,'Rio de Janeiro','Lucas',219567895),
        ('Kids Wolrd',45678912365485,null,'São Paulo','Matheus',1198657484);
select * from seller;

desc productSeller;
insert into productSeller (idPSeSeller, idPSeProduct, pSeQuantity) values
		(10,6,80),
		(12,7,10);
select * from productSeller;

select count(*) from clients;
select * from clients c, orders o 
	where c.idClient = o.idOrderClient;
select fName, lName, idOrder, ordersStatus 
	from clients c, orders o 
	where c.idClient = o.idOrderClient;
select concat(fName,' ',lName) as Client, idOrder as Request, ordersStatus as Status 
	from clients c, orders o 
    where c.idClient = o.idOrderClient;
select * from clients c, orders o 
	where c.idClient = o.idOrderClient 
    group by idOrder;
select * from clients
	Left Outer Join orders 
    ON idClient = idOrderClient;
select * from clients
	Inner Join orders on idClient = idOrderClient
    Inner Join productOrder on idPOOrder = idOrder;