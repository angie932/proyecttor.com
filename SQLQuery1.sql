create database ventasProducts

use ventasProducts

create table rol (
	idrol int primary key identity(1,1),
	nombre varchar(50),
	fechaRegistro  datetime default getdate()
);

create table menu (
	idmenu int primary key identity(1,1),
    nombre varchar(50),
    icono varchar(50),
    urlMenu varchar(50)
);

create table menurol (
	idMenuRol int primary key identity(1,1),
    idmenu int references menu(idmenu),
    idrol int references rol(idrol)
);

create table usuario (
	idusuario int primary key identity(1,1),
    nombrecompleto varchar(100),
    correo varchar(40),
    idrol int references rol(idrol),
    clave varchar(40),
    esActivo bit default 1,
    fechaRegistro datetime default getdate()
);

create table categoria (
	idcategoria int primary key identity(1,1),
	nombre varchar(50),
	esActivo bit default 1,
	fechaRegistro datetime default getdate()
);  

create table producto (
	idproducto int primary key identity(1,1),
	nombre varchar(100),
	idcategoria int references categoria(idcategoria),
    stock int,
	precio decimal(10,2),
	esActivo bit default 1,
	fechaRegistro datetime default getdate()
);

create table numeroDocumento (
	idNumDocumento int primary key identity(1,1),
	ultimoNum int not null,
	fechaRegistro datetime default getdate()
);

create table venta (
	idventa int primary key identity(1,1),
	numeroDocumento varchar(40),
	tipoPago varchar (50),
	total decimal(10,2),
	fechaRegistro datetime default getdate()
);

create table detalleventa(
	idDetalleventa int primary key identity(1,1),
	idventa int references venta(idventa),
	idproducto int references producto(idproducto),
	cantidad int,
	precio decimal (10,2),
	total decimal (10,2)
);

ALTER AUTHORIZATION ON DATABASE::ventasProducts TO sa;

insert into rol (nombre) values ('Administrador'),('Empleado'),('Supervisor');
insert into usuario (nombrecompleto, correo, idrol,clave) values ('Karen sanchez', 'karen@gmail.com', 1, '12345');
insert into categoria (nombre, esActivo) values 
('Laptops', 1),
('Monitores', 1),
('Teclados', 1),
('Auriculares', 1),
('Memorias', 1),
('Accesorios', 1);
insert into producto (nombre, idcategoria, stock, precio, esActivo) values 
('Laptop samsung book pro', 1, 20, 2500, 1),
('Laptop lenovo ideqa pad', 1, 30, 2200, 1),
('Laptop asus zenbook duo', 1, 30, 2100, 1),
('Monitor teros gaming te-2', 2, 25, 1050, 1),
('Monitor samsung curvo', 2, 15, 1400, 1),
('Monitor huawei gamer', 2, 10, 1350, 1),
('Teclado seisen gamer', 3, 10, 800, 1),
('Teclado antryx gamer', 3, 10, 1000, 1),
('Teclado logitech', 3, 10, 1000, 1),
('Auricular logitech gamer', 4, 15, 800, 1),
('Auricular hyperx gamer', 4, 20, 680, 1),
('Auricular redragon rgb', 4, 25, 950, 1),
('Memoria kingston rgb', 5, 10, 200, 1),
('Ventilador cooler master', 6, 20, 200, 1),
('Mini ventilador lenovo', 6, 15, 200, 1);
insert into menu (nombre, icono, urlMenu) values 
('DashBoard', 'dashboard', '/pages/dashboard'),
('Usuarios', 'group', '/pages/usuarios'),
('Productos', 'collections_bookmark', '/pages/productos'),
('Venta', 'currency_exchange', '/pages/venta'),
('Historial Ventas', 'edit_note', '/pages/historial_venta'),
('Reportes', 'receipt', '/pages/reportes');
insert into menurol(idmenu, idrol) values 
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1);

--menus para empleado
insert into menurol(idmenu, idrol) values 
(4, 2),
(5, 2);

--menu para supervisor
insert into menurol(idmenu, idrol) values 
(3, 3),
(4, 3),
(5, 3),
(6, 3);
insert into numeroDocumento(ultimoNum, fechaRegistro) values (0, getdate());

select * from numeroDocumento;
select * from menurol;
select * from menu;
select * from producto;
select * from categoria;
select * from usuario;
select * from rol;