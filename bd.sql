CREATE TABLE Usuario (
	rut VARCHAR(20) NOT NULL,
	id_usuario NUMBER NOT NULL PRIMARY KEY, --nueva clave primaria y atributo nuevo
	contraseña VARCHAR(20) NOT NULL,
	nombre VARCHAR(20) NOT NULL,
	tipo VARCHAR(20) NOT NULL,
	comision NUMBER NOT NULL	
);

CREATE TABLE Venta (
	id_venta NUMBER NOT NULL PRIMARY KEY,
	id_cliente NUMBER NOT NULL,
	id_usuario NUMBER NOT NULL,
	monto_total NUMBER NOT NULL,
	fecha TIMESTAMP NOT NULL,
	hora TIMESTAMP NOT NULL
);

CONSTRAINT Venta_fk_Cliente FOREIGN KEY (id_cliente) REFERENCES Cliente (id_cliente) ON DELETE CASCADE

CREATE TABLE Cliente (
	rut VARCHAR(20) NOT NULL PRIMARY KEY,
	nombre VARCHAR(20) NOT NULL,
	id_cliente NUMBER NOT NULL --nuevo atributo
);

CREATE TABLE DetalleVenta (
	id_detalle NUMBER NOT NULL PRIMARY KEY,
	id_venta NUMBER NOT NULL,
	id_producto NUMBER NOT NULL, 
	cantidad NUMBER NOT NULL
);

CONSTRAINT DetalleVenta_fk_Venta FOREIGN KEY (id_venta) REFERENCES Venta (id_venta) ON DELETE CASCADE
CONSTRAINT DetalleVenta_fk_Producto FOREIGN KEY (id_producto) REFERENCES Producto (id_producto) ON DELETE CASCADE

CREATE TABLE Producto (
	id_producto NUMBER NOT NULL PRIMARY KEY,
	nombrep VARCHAR(30) NOT NULL,  --nuevo atributo
	stock NUMBER NOT NULL,
	descripcion VARCHAR(20) NOT NULL,
	categoria VARCHAR(20) NOT NULL,
	precio NUMBER NOT NULL
);

CREATE TABLE DetalleCompra (
	id_detalle NUMBER NOT NULL PRIMARY KEY,
	id_compra NUMBER NOT NULL,
	id_producto NUMBER NOT NULL,
	cantidad NUMBER NOT NULL,
	precio NUMBER NOT NULL
);

CONSTRAINT DetalleCompra_fk_Producto FOREIGN KEY (id_producto) REFERENCES Producto (id_producto) ON DELETE CASCADE
CONSTRAINT DetalleCompra_fk_Compra FOREIGN KEY (id_compra) REFERENCES Compra (id_compra) ON DELETE CASCADE

CREATE TABLE Compra (
	id_compra NUMBER NOT NULL PRIMARY KEY,
	monto_total NUMBER NOT NULL,
	fecha DATE NOT NULL,
	hora TIMESTAMP NOT NULL,
);
CREATE SEQUENCE secuencia START WITH 1 INCREMENT BY 1 NOMAXVALUE;

CREATE TRIGGER InsertarUsuarioNuevo
  BEFORE INSERT ON Usuario FOR EACH ROW
  DECLARE
    coincidencias NUMBER
    
  BEGIN
     coincidencias:=0
     
     SELECT COUNT(*) INTO coincidencias FROM Usuario WHERE Usuario.rut=:new.rut
     CASE
     WHEN coincidencias >=1 THEN
        raise_application_error(-20001, 'El RUT ingresado ya existe!.')
     ELSE
       SELECT secuencia.nextval INTO new.id_usuario FROM Dual
     END CASE

  END

CREATE TRIGGER TablaCliente
	BEFORE INSERT ON Cliente FOR EACH ROW
	BEGIN
		SELECT secuencia.nextval INTO new.id_cliente FROM Dual
	END

CREATE TRIGGER TablaCompra
	BEFORE INSERT ON Compra FOR EACH ROW
	BEGIN
	    SELECT secuencia.nextval INTO new.id_compra FROM DuaL
	END
	
CREATE TRIGGER Editar_Producto
    BEFORE UPDATE ON Producto FOR EACH ROW
    DECLARE
      cantidad NUMBER
      cantidad2 NUMBER
    
    BEGIN
      SELECT COUNT (*) INTO cantidad FROM Producto
      SELECT COUNT (*) INTO cantidad2 FROM Usuario WHERE Usuario.tipo='Administrador'

      CASE
      WHEN cantidad =0 THEN 
      raise_application_error(-20001, 'No existe ningun producto')
      END CASE
      CASE
      WHEN cantidad2 =0 THEN
      raise_application_error(-20001, 'No existe ningun usuario administrador')
      END CASE

    END

CREATE TRIGGER Ingresar_Cliente
    BEFORE INSERT ON Cliente FOR EACH ROW
    DECLARE
      cantidad NUMBER
    
    BEGIN
      SELECT COUNT (*) INTO cantidad FROM Usuario WHERE Usuario.tipo=:'Vendedor'
      CASE
      WHEN cantidad =0 THEN
      raise_application_error(-20001, 'No existe ningun vendedor')
      END CASE
    END
	
CREATE TRIGGER trigger_Compras 
    BEFORE INSERT ON Producto FOR EACH ROW 
    DECLARE
        stockproducto NUMBER
        stocknuevo NUMBER
        coincidencias NUMBER
    BEGIN

        SELECT stock FROM Producto INTO stockproducto WHERE Producto.id_producto=:new.id_producto
        stocknuevo:=new.cantidad+stockproducto 
        UPDATE Producto SET stock=stocknuevo WHERE Producto.id_producto=:new.id_producto 
        SELECT secuencia.nextval INTO new.id_producto FROM Dual

    END

CREATE TRIGGER trigger_Ventas 
    BEFORE INSERT ON Venta FOR EACH ROW 
    DECLARE
         stockproducto NUMBER
         stocknuevo NUMBER
         cantidad1 NUMBER
         cantidad2 NUMBER
         cantidad3 NUMBER

    BEGIN
       
        SELECT COUNT (*) INTO cantidad1 FROM Producto
        SELECT COUNT (*) INTO cantidad2 FROM Usuario WHERE Usuario.tipo='Vendedor'
        SELECT COUNT (*) INTO cantidad3 FROM Cliente
        SELECT stock FROM Producto INTO stockproducto WHERE Producto.id_producto=:new.id_producto 
        
       CASE
        WHEN cantidad1 >=1 THEN  
         CASE
           WHEN cantidad2 >=1 THEN 
           CASE
             WHEN cantidad3 >=1 THEN 
              CASE
               WHEN new.cantidad =< stockproducto THEN  
                  stocknuevo:=stockproducto-new.cantidad 
                  UPDATE Producto SET stock=stocknuevo WHERE Producto.id_producto=:new.id_producto 
                  SELECT secuencia.nextval INTO new.id_venta FROM Dual
               ELSE
               raise_application_error(-20001, 'La cantidad requerida es mayor al stock del producto. La venta no puede realizarse')
               END CASE
              ELSE 
               raise_application_error(-20001, 'No hay ningun cliente ingresado en el sistema')
              END CASE
           ELSE
            raise_application_error(-20001, 'No existe ningun vendedor en el sistema')
           END CASE
         ELSE
           raise_application_error(-20001, 'No existe ningun producto en el sistema')
         END CASE
   END

CREATE VIEW view_VentasCliente AS  
SELECT rut AS rut_cliente, fecha, hora, nombrep AS nombre_producto, cantidad
FROM Cliente, Venta, DetalleVenta, Producto 
WHERE Cliente.id_cliente=Venta.id_cliente 
AND Venta.id_venta=DetalleVenta.id_venta
AND DetalleVenta.id_producto=Producto.id_producto
ORDER BY rut_cliente


CREATE VIEW view_VentasVendedor AS 
SELECT rut AS rut_vendedor, fecha, hora, nombrep AS nombre_producto, cantidad 
FROM Usuario, Venta, DetalleVenta, Producto 
WHERE Usuario.tipo='Vendedor'
AND Usuario.id_usuario=Venta.id_usuario
AND Venta.id_venta=DetalleVenta.id_venta
AND DetalleVenta.id_producto=Producto.id_producto
ORDER BY rut_vendedor






