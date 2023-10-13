create database ecommerce;
use ecommerce;

CREATE TABLE productos (
    id INT AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(50),
    descripcion TEXT,
    precio DECIMAL(10,2),
    categoria VARCHAR(50),
    url VARCHAR(250),
    PRIMARY KEY (id)
);

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT NOT NULL,
    isAdmin BOOLEAN,
    firstName VARCHAR(50),
    lastname VARCHAR(50),
    email VARCHAR(100),
    address VARCHAR(100),
    password VARCHAR(100),
    telephone VARCHAR(50),
    PRIMARY KEY (id)
);

CREATE TABLE Orders (
    id INT AUTO_INCREMENT NOT NULL,
    user_id INT,
    total_price DECIMAL(10 , 2 ),
    shipping_type ENUM('retiro por el local', 'envío a domicilio'),
    shipping_address VARCHAR(255),
    PRIMARY KEY (id),
    FOREIGN KEY (user_id)
        REFERENCES usuarios (id)
);

CREATE TABLE OrderDetails (
    id INT AUTO_INCREMENT NOT NULL,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10 , 2 ),
    PRIMARY KEY (id),
    FOREIGN KEY (order_id)
        REFERENCES Orders (id),
    FOREIGN KEY (product_id)
        REFERENCES productos (id)
);

INSERT INTO usuarios (isAdmin, firstName, lastname, email, address, password, telephone)
VALUES ('1', 'Oscar', 'Marmeli', 'oscarmarmeli@gmail.com', 'El Mensú 56 - Villa Libertad', '12345', '3754659457');

INSERT INTO productos (nombre, descripcion, precio, categoria, url)
VALUES ('PARRILLA PARANÁ', 'Una parrilla tradicional para desarrollar sus capacidades culinarias.
        Posee una parrilla de hierros redondos enlozados y a continuación un brasero para encender
        con facilidad el carbón o la leña, sobre este se puede colocar una plancha o wok donde cocinar
        vegetales, filetes, provoletas, etc. Tiene una tapa ideal para hacer pizzas a la parrilla o para días ventosos. El piso y los laterales
        están compuestos de ladrillos de refractarios que le suman durabilidad a la parrilla y un mejor
        rendimiento al calor logrado. Montada sobre un carro con ruedas para poder trasladarla al lugar de su preferencia.
        En la base del carro hay un estante de madera para apoyar los elementos que desee.
        Ofrecemos como adicional una Plancha Ñuke que se puede usar sobre la parrilla o sobre el brasero
        y una funda para protegerla del sol y la lluvia.', 65400, 'PARRILLAS MEDIANAS', 'https://productosnuke.com.ar/wp-content/uploads/2021/04/Parillaparana-nueva.png');

INSERT INTO productos (nombre, descripcion, precio, categoria, url)
VALUES ('PARRILLA DELTA', 'Una parrilla tradicional para desarrollar sus capacidades culinarias. Posee una parrilla de hierros redondos enlozados y a continuación un brasero para encender con facilidad el carbón o la leña, sobre este se puede colocar una plancha o wok donde cocinar vegetales, filetes, provoletas, etc. Tiene una tapa ideal para hacer pizzas a la parrilla o para días ventosos. El piso y los laterales están compuestos de ladrillos de refractarios que le suman durabilidad a la parrilla y un mejor rendimiento al calor logrado. Montada sobre un carro con ruedas para poder trasladarla al lugar de su preferencia. En la base del carro hay un estante de madera para apoyar los elementos que desee. Ofrecemos como adicional una Plancha Ñuke que se puede usar sobre la parrilla o sobre el brasero y una funda para protegerla del sol y la lluvia.', 52800, 'PARRILLAS MEDIANAS', 'https://productosnuke.com.ar/wp-content/uploads/2022/09/deltaMesa-de-trabajo-1.png');

INSERT INTO productos (nombre, descripcion, precio, categoria, url)
VALUES ('PARRILLA PUMA', 'Una parrilla tradicional para desarrollar sus capacidades culinarias. Posee una parrilla de hierros redondos enlozados y a continuación un brasero para encender con facilidad el carbón o la leña, sobre este se puede colocar una plancha o wok donde cocinar vegetales, filetes, provoletas, etc. Tiene una tapa ideal para hacer pizzas a la parrilla o para días ventosos. El piso y los laterales están compuestos de ladrillos de refractarios que le suman durabilidad a la parrilla y un mejor rendimiento al calor logrado. Montada sobre un carro con ruedas para poder trasladarla al lugar de su preferencia. En la base del carro hay un estante de madera para apoyar los elementos que desee. Ofrecemos como adicional una Plancha Ñuke que se puede usar sobre la parrilla o sobre el brasero y una funda para protegerla del sol y la lluvia.', 69999, 'PARRILLAS MEDIANAS', 'https://productosnuke.com.ar/wp-content/uploads/2022/09/Mesa-de-trabajo-1.png');

INSERT INTO productos (nombre, descripcion, precio, categoria, url)
VALUES ('HORNO 60 CON CARRO', 'Horno a leña de calor envolvente. En la cámara de combustión de refractarios se quema la leña y sus gases los cuales chocan con el deflector y se dirijen hacia los laterales y luego hacia el techo por donde sale por la chimenea, de esta forma envuelve el calor al horno interno el cual esta enlozado y tiene una salida de vapor de cocción, viene con dos parrillas y una asadera. Viene en tres versiones, para embutir, con y sin carro.', 72900, 'HORNOS MEDIANOS', 'https://productosnuke.com.ar/wp-content/uploads/2022/03/Horno-60-con-Carro.png');

INSERT INTO productos (nombre, descripcion, precio, categoria, url)
VALUES ('HORNO 90 CON CARRO', 'Horno a leña de calor envolvente. En la cámara de combustión de refractarios se quema la leña y sus gases los cuales chocan con el deflector y se dirijen hacia los laterales y luego hacia el techo por donde sale por la chimenea, de esta forma envuelve el calor al horno interno el cual esta enlozado y tiene una salida de vapor de cocción, viene con dos parrillas y una asadera. Viene en tres versiones, para embutir, con y sin carro.', 77700, 'HORNOS MEDIANOS', 'https://productosnuke.com.ar/wp-content/uploads/2022/03/Horno-60-con-Carro-1.png');

INSERT INTO productos (nombre, descripcion, precio, categoria, url)
VALUES ('HORNO 90 DE EMBUTIR', 'Horno a leña de calor envolvente. En la cámara de combustión de refractarios se quema la leña y sus gases los cuales chocan con el deflector y se dirijen hacia los laterales y luego hacia el techo por donde sale por la chimenea, de esta forma envuelve el calor al horno interno el cual esta enlozado y tiene una salida de vapor de cocción, viene con dos parrillas y una asadera. Viene en tres versiones, para embutir, con y sin carro.', 61900, 'HORNOS MEDIANOS', 'https://productosnuke.com.ar/wp-content/uploads/2019/06/horno-embutir-90.jpg');