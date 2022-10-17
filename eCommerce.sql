-- Criação do banco de dados para o cenário de E-commerce
create database ecommerce;
use ecommerce;

-- Criar tabela Cliente
create table clients(
	idClient int auto_increment primary key not null,
    fName varchar(10) not null,
    mInit char(3),
    lName varchar(20),
    CPF char(11) not null,
    address varchar(255),
    birthDate date,
    constraint unique_cpf_cliente unique (CPF)   
);
alter table clients auto_increment=1;
-- desc clients;

-- Criar tabela Produto
create table products(
	idProduct int auto_increment primary key not null,
    pName varchar(30) not null,
    valor decimal(10,2) not null default 0,
    classificationKids bool not null,
    category enum('Eletrônico','Vestimenta','Brinquedos','Alimentos','Móveis') default 'Eletrônico',
    avaliation float default 0,
    size varchar(10)
);
alter table products auto_increment=1;
-- desc products;

-- Criar tabela Pedido
create table orders(
	idOrder int auto_increment primary key not null,
    idOrderClient int,
    ordersStatus enum ('Enviado', 'Entregue', 'Processando', 'Em andamento') default 'Processando' not null,
	ordersDescription varchar(255),
    freight decimal(10,2) default 0,
    constraint fk_orders_client foreign key (idOrderClient) references clients(idClient)
);
alter table orders auto_increment=1;
-- desc orders;

-- Criar tabela Pagamento
create table payments(
	idPayment int auto_increment primary key not null,
    idOrder int,
    typePayment enum('Boleto','Cartão','Transferência') default 'Cartão',
    installmentPayment int default 1,
    constraint fk_payments_order foreign key (idOrder) references orders(idOrder)
);
alter table payments auto_increment=1;
-- desc payments;

-- Criar tabela Estoque
create table storages(
	idStorages int auto_increment primary key not null,
	location varchar(45),
    quantity int default 0
);
alter table storages auto_increment=1;
-- desc storages;

-- Criar tabela Fornecedor
create table supplier(
	idSupplier int auto_increment primary key not null,
	socialName varchar(60) not null,
    CNPJ char(14) not null,
    contact varchar(20),
    contactNumber varchar(15),
    location varchar(255),
    constraint unique_supplier unique (CNPJ)
);
alter table supplier auto_increment=1;
-- desc supplier;

-- Criar tabela Revendedor
create table seller(
	idSeller int auto_increment primary key not null,
	socialName varchar(60) not null,
    CNPJ char(14),
    CPF char(9),
    contact varchar(20),
    contactNumber varchar(15),
    location varchar(255),
    constraint unique_cnpj_seller unique (CNPJ),
    constraint unique_cpf_seller unique (CPF)
);
alter table seller auto_increment=1;
-- desc seller;

-- Criar tabela Produtos x Vendedor
create table productSeller(
	idPSeSeller int,
    idPSeProduct int,
    pSeQuantity int default 1,
    primary key (idPSeSeller, idPSeProduct),
    constraint fk_pse_seller foreign key (idPSeSeller) references seller(idSeller),
    constraint fk_pse_product foreign key (idPSeProduct) references products(idProduct)
);
-- desc productSeller;

-- Criar tabela Produtos x Pedido
create table productOrder(
	idPOProduct int,
    idPOOrder int,
    pOQuantity int default 1,
    pOStatus enum ('Disponível','Sem estoque') default 'Disponível',
    primary key (idPOProduct, idPOOrder),
    constraint fk_po_order foreign key (idPOOrder) references orders(idOrder),
    constraint fk_po_product foreign key (idPOProduct) references Products(idProduct)
);
-- desc productOrder;

-- Criar tabela Produtos x Estoque
create table productStorage(
	idPStProduct int,
    idPStStorage int,
    primary key (idPStProduct, idPStStorage),
    constraint fk_pst_storage foreign key (idPStStorage) references storages(idStorages),
    constraint fk_pst_product foreign key (idPStProduct) references Products(idProduct)
);
-- desc productStorage;

-- Criar tabela Produtos x Fornecedor
create table productSupplier(
	idPSuProduct int,
    idPSuSupplier int,
    primary key (idPSuProduct, idPSuSupplier),
    constraint fk_psu_storage foreign key (idPSuSupplier) references supplier(idSupplier),
    constraint fk_psu_product foreign key (idPSuProduct) references Products(idProduct)
);
-- desc productSupplier;

-- show tables;
-- show databases;
-- use information_schema;
-- show tables;
-- select * from referential_constraints where constraint_schema = 'ecommerce';
