/*
 Navicat Premium Data Transfer

 Source Server         : Localhost
 Source Server Type    : MySQL
 Source Server Version : 50710 (5.7.10-log)
 Source Host           : localhost:3306
 Source Schema         : conecta_taller_db

 Target Server Type    : MySQL
 Target Server Version : 50710 (5.7.10-log)
 File Encoding         : 65001

 Date: 30/07/2025 16:07:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for anfitriona_asignaciones
-- ----------------------------
DROP TABLE IF EXISTS `anfitriona_asignaciones`;
CREATE TABLE `anfitriona_asignaciones`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_anfitriona` int(11) NOT NULL,
  `mes` int(2) NOT NULL,
  `anio` int(4) NOT NULL,
  `cantidad_asignada` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_anfitriona_periodo`(`id_anfitriona`, `mes`, `anio`) USING BTREE,
  CONSTRAINT `fk_aa_anfitriona` FOREIGN KEY (`id_anfitriona`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of anfitriona_asignaciones
-- ----------------------------
INSERT INTO `anfitriona_asignaciones` VALUES (1, 3, 7, 2025, 4);

-- ----------------------------
-- Table structure for cliente_emails
-- ----------------------------
DROP TABLE IF EXISTS `cliente_emails`;
CREATE TABLE `cliente_emails`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id_cliente`(`id_cliente`, `email`) USING BTREE,
  CONSTRAINT `cliente_emails_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cliente_emails
-- ----------------------------
INSERT INTO `cliente_emails` VALUES (1, 1, 'ignacio.v@email.com');
INSERT INTO `cliente_emails` VALUES (2, 2, 'caro.rojas@email.com');
INSERT INTO `cliente_emails` VALUES (8, 3, 'laura.c@emailpropio.com');
INSERT INTO `cliente_emails` VALUES (3, 3, 'ricardo.m@email.com');
INSERT INTO `cliente_emails` VALUES (4, 4, 'j.torres@email.com');
INSERT INTO `cliente_emails` VALUES (5, 4, 'javiera.personal@email.com');
INSERT INTO `cliente_emails` VALUES (9, 4, 'matias.soto@emailpropio.com');
INSERT INTO `cliente_emails` VALUES (6, 5, 'lucho.castro@email.com');
INSERT INTO `cliente_emails` VALUES (10, 5, 'vale.guzman@emailpropio.com');
INSERT INTO `cliente_emails` VALUES (11, 6, 'benja.reyes@emailpropio.com');
INSERT INTO `cliente_emails` VALUES (7, 6, 'sofia.n@email.com');
INSERT INTO `cliente_emails` VALUES (25, 23, 'daniela.h@emailpersonal.com');
INSERT INTO `cliente_emails` VALUES (26, 24, 'jmunoz@emailtrabajo.com');
INSERT INTO `cliente_emails` VALUES (28, 26, 'fernando.silva@emailtrabajo.com');
INSERT INTO `cliente_emails` VALUES (29, 27, 'rocio.v@emailpersonal.com');
INSERT INTO `cliente_emails` VALUES (31, 28, 'elena.g.trabajo@email.com');
INSERT INTO `cliente_emails` VALUES (30, 28, 'elena.g@email.com');
INSERT INTO `cliente_emails` VALUES (32, 29, 'pedro.r@email.com');
INSERT INTO `cliente_emails` VALUES (33, 30, 'sofia.p@email.com');
INSERT INTO `cliente_emails` VALUES (34, 31, 'jorgeroa@gmail.com');
INSERT INTO `cliente_emails` VALUES (35, 32, 'claudiapinto@gmail.com');

-- ----------------------------
-- Table structure for cliente_kilometrajes
-- ----------------------------
DROP TABLE IF EXISTS `cliente_kilometrajes`;
CREATE TABLE `cliente_kilometrajes`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) NOT NULL,
  `id_vehiculo` int(11) NULL DEFAULT NULL,
  `kilometraje` int(11) NOT NULL,
  `fecha_lectura` date NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_cliente`(`id_cliente`) USING BTREE,
  INDEX `fk_kilometrajes_vehiculo`(`id_vehiculo`) USING BTREE,
  CONSTRAINT `cliente_kilometrajes_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_kilometrajes_vehiculo` FOREIGN KEY (`id_vehiculo`) REFERENCES `vehiculos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cliente_kilometrajes
-- ----------------------------
INSERT INTO `cliente_kilometrajes` VALUES (1, 1, 1, 22500, '2025-07-20');
INSERT INTO `cliente_kilometrajes` VALUES (2, 3, 3, 10500, '2024-11-15');
INSERT INTO `cliente_kilometrajes` VALUES (3, 3, 3, 19800, '2025-05-20');
INSERT INTO `cliente_kilometrajes` VALUES (4, 4, 4, 50, '2025-01-16');
INSERT INTO `cliente_kilometrajes` VALUES (5, 5, 5, 45200, '2025-07-01');
INSERT INTO `cliente_kilometrajes` VALUES (6, 1, 1, 9850, '2023-06-20');
INSERT INTO `cliente_kilometrajes` VALUES (7, 2, 2, 19500, '2024-05-10');
INSERT INTO `cliente_kilometrajes` VALUES (8, 5, 5, 21500, '2021-12-01');
INSERT INTO `cliente_kilometrajes` VALUES (9, 3, 4, 55000, '2025-06-10');
INSERT INTO `cliente_kilometrajes` VALUES (10, 4, 5, 32000, '2025-07-01');
INSERT INTO `cliente_kilometrajes` VALUES (11, 5, 6, 21000, '2025-05-15');
INSERT INTO `cliente_kilometrajes` VALUES (12, 6, 7, 41000, '2025-07-20');
INSERT INTO `cliente_kilometrajes` VALUES (26, 23, 24, 48000, '2025-05-20');
INSERT INTO `cliente_kilometrajes` VALUES (27, 24, 25, 29500, '2025-07-10');
INSERT INTO `cliente_kilometrajes` VALUES (28, 25, 26, 8500, '2025-07-28');
INSERT INTO `cliente_kilometrajes` VALUES (29, 26, 27, 98000, '2025-04-10');
INSERT INTO `cliente_kilometrajes` VALUES (30, 27, 28, 15000, '2025-06-05');
INSERT INTO `cliente_kilometrajes` VALUES (31, 28, 30, 15000, '2024-05-01');
INSERT INTO `cliente_kilometrajes` VALUES (32, 28, 30, 28000, '2025-07-25');
INSERT INTO `cliente_kilometrajes` VALUES (33, 28, 31, 60000, '2024-12-01');
INSERT INTO `cliente_kilometrajes` VALUES (34, 29, 32, 500, '2025-07-28');
INSERT INTO `cliente_kilometrajes` VALUES (35, 30, 33, 35000, '2024-06-01');
INSERT INTO `cliente_kilometrajes` VALUES (36, 31, 34, 15000, '2025-07-30');
INSERT INTO `cliente_kilometrajes` VALUES (37, 32, 35, 42000, '2025-07-30');
INSERT INTO `cliente_kilometrajes` VALUES (38, 32, 35, 55000, '2025-07-30');

-- ----------------------------
-- Table structure for cliente_telefonos
-- ----------------------------
DROP TABLE IF EXISTS `cliente_telefonos`;
CREATE TABLE `cliente_telefonos`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) NOT NULL,
  `telefono` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id_cliente`(`id_cliente`, `telefono`) USING BTREE,
  CONSTRAINT `cliente_telefonos_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cliente_telefonos
-- ----------------------------
INSERT INTO `cliente_telefonos` VALUES (1, 1, '+56987654321');
INSERT INTO `cliente_telefonos` VALUES (2, 2, '+56912345678');
INSERT INTO `cliente_telefonos` VALUES (8, 3, '+56910102020');
INSERT INTO `cliente_telefonos` VALUES (3, 3, '+56911112222');
INSERT INTO `cliente_telefonos` VALUES (9, 4, '+56930304040');
INSERT INTO `cliente_telefonos` VALUES (4, 4, '+56933334444');
INSERT INTO `cliente_telefonos` VALUES (6, 5, '+56228765432');
INSERT INTO `cliente_telefonos` VALUES (10, 5, '+56950506060');
INSERT INTO `cliente_telefonos` VALUES (5, 5, '+56955556666');
INSERT INTO `cliente_telefonos` VALUES (11, 6, '+56970708080');
INSERT INTO `cliente_telefonos` VALUES (7, 6, '+56977778888');
INSERT INTO `cliente_telefonos` VALUES (25, 23, '+56988776655');
INSERT INTO `cliente_telefonos` VALUES (26, 24, '+56911223344');
INSERT INTO `cliente_telefonos` VALUES (28, 26, '+56988990011');
INSERT INTO `cliente_telefonos` VALUES (29, 27, '+56922334455');
INSERT INTO `cliente_telefonos` VALUES (31, 28, '+56233445566');
INSERT INTO `cliente_telefonos` VALUES (30, 28, '+56911223300');
INSERT INTO `cliente_telefonos` VALUES (32, 29, '+56998765432');
INSERT INTO `cliente_telefonos` VALUES (33, 30, '+56976543210');
INSERT INTO `cliente_telefonos` VALUES (34, 31, '+56959112273');
INSERT INTO `cliente_telefonos` VALUES (35, 32, '+56959112273');

-- ----------------------------
-- Table structure for clientes
-- ----------------------------
DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_cliente` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rut_cliente` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_sucursal` int(11) NULL DEFAULT NULL,
  `id_propietario_cartera` int(11) NULL DEFAULT NULL,
  `origen` enum('venta','postventa','otro') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_venta_vehiculo` date NULL DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `rut_cliente`(`rut_cliente`) USING BTREE,
  INDEX `id_sucursal`(`id_sucursal`) USING BTREE,
  INDEX `fk_cliente_propietario`(`id_propietario_cartera`) USING BTREE,
  CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursales` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cliente_propietario` FOREIGN KEY (`id_propietario_cartera`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of clientes
-- ----------------------------
INSERT INTO `clientes` VALUES (1, 'Ignacio Valenzuela', '18.123.456-7', 1, NULL, 'postventa', NULL, '2025-07-28 23:32:06');
INSERT INTO `clientes` VALUES (2, 'Carolina Rojas', '19.876.543-2', 1, NULL, 'venta', NULL, '2025-07-28 23:32:06');
INSERT INTO `clientes` VALUES (3, 'Ricardo Morales', '15.555.444-3', 1, NULL, 'postventa', NULL, '2025-06-10 10:00:00');
INSERT INTO `clientes` VALUES (4, 'Javiera Torres', '20.111.222-K', 2, NULL, 'venta', '2025-01-15', '2025-01-15 11:30:00');
INSERT INTO `clientes` VALUES (5, 'Luis Castro', '12.345.678-9', 1, NULL, 'postventa', NULL, '2025-07-01 09:00:00');
INSERT INTO `clientes` VALUES (6, 'Sofia Nuñez', '21.987.654-3', 2, NULL, 'otro', NULL, '2025-05-20 15:00:00');
INSERT INTO `clientes` VALUES (23, 'Daniela Herrera', '16.123.789-K', 1, 3, '', NULL, '2025-07-29 20:11:59');
INSERT INTO `clientes` VALUES (24, 'Javier Muñoz', '15.987.654-3', 1, 3, '', NULL, '2025-07-29 20:11:59');
INSERT INTO `clientes` VALUES (25, 'Camila Diaz', '21.111.444-7', 1, 3, '', NULL, '2025-07-29 20:11:59');
INSERT INTO `clientes` VALUES (26, 'Fernando Silva', '12.876.543-2', 1, 3, '', NULL, '2025-07-29 20:11:59');
INSERT INTO `clientes` VALUES (27, 'Rocio Vargas', '22.333.111-9', 1, 3, '', NULL, '2025-07-29 20:11:59');
INSERT INTO `clientes` VALUES (28, 'Elena Gutiérrez', '23.456.789-0', 1, 3, 'postventa', NULL, '2025-07-20 09:00:00');
INSERT INTO `clientes` VALUES (29, 'Pedro Ramírez', '24.987.654-1', 2, 3, 'venta', '2025-01-01', '2025-01-01 10:00:00');
INSERT INTO `clientes` VALUES (30, 'Sofía Pérez', '25.123.456-2', 1, 3, 'postventa', NULL, '2025-06-15 14:30:00');
INSERT INTO `clientes` VALUES (31, 'Jorge', '14166631-2', 1, 3, '', NULL, '2025-07-30 10:25:40');
INSERT INTO `clientes` VALUES (32, 'Claudia', '15353325-3', 1, 3, '', NULL, '2025-07-30 10:30:06');

-- ----------------------------
-- Table structure for comunas
-- ----------------------------
DROP TABLE IF EXISTS `comunas`;
CREATE TABLE `comunas`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_provincia` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_comunas_provincia`(`id_provincia`) USING BTREE,
  CONSTRAINT `fk_comunas_provincia` FOREIGN KEY (`id_provincia`) REFERENCES `provincias` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 345 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comunas
-- ----------------------------
INSERT INTO `comunas` VALUES (1, 'Arica', 1);
INSERT INTO `comunas` VALUES (2, 'Camarones', 1);
INSERT INTO `comunas` VALUES (3, 'General Lagos', 2);
INSERT INTO `comunas` VALUES (4, 'Putre', 2);
INSERT INTO `comunas` VALUES (5, 'Alto Hospicio', 3);
INSERT INTO `comunas` VALUES (6, 'Iquique', 3);
INSERT INTO `comunas` VALUES (7, 'Camiña', 4);
INSERT INTO `comunas` VALUES (8, 'Colchane', 4);
INSERT INTO `comunas` VALUES (9, 'Huara', 4);
INSERT INTO `comunas` VALUES (10, 'Pica', 4);
INSERT INTO `comunas` VALUES (11, 'Pozo Almonte', 4);
INSERT INTO `comunas` VALUES (12, 'Antofagasta', 5);
INSERT INTO `comunas` VALUES (13, 'Mejillones', 5);
INSERT INTO `comunas` VALUES (14, 'Sierra Gorda', 5);
INSERT INTO `comunas` VALUES (15, 'Taltal', 5);
INSERT INTO `comunas` VALUES (16, 'Calama', 6);
INSERT INTO `comunas` VALUES (17, 'Ollagüe', 6);
INSERT INTO `comunas` VALUES (18, 'San Pedro de Atacama', 6);
INSERT INTO `comunas` VALUES (19, 'María Elena', 7);
INSERT INTO `comunas` VALUES (20, 'Tocopilla', 7);
INSERT INTO `comunas` VALUES (21, 'Chañaral', 8);
INSERT INTO `comunas` VALUES (22, 'Diego de Almagro', 8);
INSERT INTO `comunas` VALUES (23, 'Caldera', 9);
INSERT INTO `comunas` VALUES (24, 'Copiapó', 9);
INSERT INTO `comunas` VALUES (25, 'Tierra Amarilla', 9);
INSERT INTO `comunas` VALUES (26, 'Alto del Carmen', 10);
INSERT INTO `comunas` VALUES (27, 'Freirina', 10);
INSERT INTO `comunas` VALUES (28, 'Huasco', 10);
INSERT INTO `comunas` VALUES (29, 'Vallenar', 10);
INSERT INTO `comunas` VALUES (30, 'Canela', 11);
INSERT INTO `comunas` VALUES (31, 'Illapel', 11);
INSERT INTO `comunas` VALUES (32, 'Los Vilos', 11);
INSERT INTO `comunas` VALUES (33, 'Salamanca', 11);
INSERT INTO `comunas` VALUES (34, 'Andacollo', 12);
INSERT INTO `comunas` VALUES (35, 'Coquimbo', 12);
INSERT INTO `comunas` VALUES (36, 'La Higuera', 12);
INSERT INTO `comunas` VALUES (37, 'La Serena', 12);
INSERT INTO `comunas` VALUES (38, 'Paihuano', 12);
INSERT INTO `comunas` VALUES (39, 'Vicuña', 12);
INSERT INTO `comunas` VALUES (40, 'Combarbalá', 13);
INSERT INTO `comunas` VALUES (41, 'Monte Patria', 13);
INSERT INTO `comunas` VALUES (42, 'Ovalle', 13);
INSERT INTO `comunas` VALUES (43, 'Punitaqui', 13);
INSERT INTO `comunas` VALUES (44, 'Río Hurtado', 13);
INSERT INTO `comunas` VALUES (45, 'Isla de Pascua', 14);
INSERT INTO `comunas` VALUES (46, 'Calle Larga', 15);
INSERT INTO `comunas` VALUES (47, 'Los Andes', 15);
INSERT INTO `comunas` VALUES (48, 'Rinconada', 15);
INSERT INTO `comunas` VALUES (49, 'San Esteban', 15);
INSERT INTO `comunas` VALUES (50, 'Limache', 16);
INSERT INTO `comunas` VALUES (51, 'Olmué', 16);
INSERT INTO `comunas` VALUES (52, 'Quilpué', 16);
INSERT INTO `comunas` VALUES (53, 'Villa Alemana', 16);
INSERT INTO `comunas` VALUES (54, 'Cabildo', 17);
INSERT INTO `comunas` VALUES (55, 'La Ligua', 17);
INSERT INTO `comunas` VALUES (56, 'Papudo', 17);
INSERT INTO `comunas` VALUES (57, 'Petorca', 17);
INSERT INTO `comunas` VALUES (58, 'Zapallar', 17);
INSERT INTO `comunas` VALUES (59, 'Hijuelas', 18);
INSERT INTO `comunas` VALUES (60, 'La Calera', 18);
INSERT INTO `comunas` VALUES (61, 'La Cruz', 18);
INSERT INTO `comunas` VALUES (62, 'Nogales', 18);
INSERT INTO `comunas` VALUES (63, 'Quillota', 18);
INSERT INTO `comunas` VALUES (64, 'Algarrobo', 19);
INSERT INTO `comunas` VALUES (65, 'Cartagena', 19);
INSERT INTO `comunas` VALUES (66, 'El Quisco', 19);
INSERT INTO `comunas` VALUES (67, 'El Tabo', 19);
INSERT INTO `comunas` VALUES (68, 'San Antonio', 19);
INSERT INTO `comunas` VALUES (69, 'Santo Domingo', 19);
INSERT INTO `comunas` VALUES (70, 'Catemu', 20);
INSERT INTO `comunas` VALUES (71, 'Llay-Llay', 20);
INSERT INTO `comunas` VALUES (72, 'Panquehue', 20);
INSERT INTO `comunas` VALUES (73, 'Putaendo', 20);
INSERT INTO `comunas` VALUES (74, 'San Felipe', 20);
INSERT INTO `comunas` VALUES (75, 'Santa María', 20);
INSERT INTO `comunas` VALUES (76, 'Casablanca', 21);
INSERT INTO `comunas` VALUES (77, 'Concón', 21);
INSERT INTO `comunas` VALUES (78, 'Juan Fernández', 21);
INSERT INTO `comunas` VALUES (79, 'Puchuncaví', 21);
INSERT INTO `comunas` VALUES (80, 'Quintero', 21);
INSERT INTO `comunas` VALUES (81, 'Valparaíso', 21);
INSERT INTO `comunas` VALUES (82, 'Viña del Mar', 21);
INSERT INTO `comunas` VALUES (83, 'Colina', 22);
INSERT INTO `comunas` VALUES (84, 'Lampa', 22);
INSERT INTO `comunas` VALUES (85, 'Tiltil', 22);
INSERT INTO `comunas` VALUES (86, 'Pirque', 23);
INSERT INTO `comunas` VALUES (87, 'Puente Alto', 23);
INSERT INTO `comunas` VALUES (88, 'San José de Maipo', 23);
INSERT INTO `comunas` VALUES (89, 'Buin', 24);
INSERT INTO `comunas` VALUES (90, 'Calera de Tango', 24);
INSERT INTO `comunas` VALUES (91, 'Paine', 24);
INSERT INTO `comunas` VALUES (92, 'San Bernardo', 24);
INSERT INTO `comunas` VALUES (93, 'Alhué', 25);
INSERT INTO `comunas` VALUES (94, 'Curacaví', 25);
INSERT INTO `comunas` VALUES (95, 'María Pinto', 25);
INSERT INTO `comunas` VALUES (96, 'Melipilla', 25);
INSERT INTO `comunas` VALUES (97, 'San Pedro', 25);
INSERT INTO `comunas` VALUES (98, 'Cerrillos', 26);
INSERT INTO `comunas` VALUES (99, 'Cerro Navia', 26);
INSERT INTO `comunas` VALUES (100, 'Conchalí', 26);
INSERT INTO `comunas` VALUES (101, 'El Bosque', 26);
INSERT INTO `comunas` VALUES (102, 'Estación Central', 26);
INSERT INTO `comunas` VALUES (103, 'Huechuraba', 26);
INSERT INTO `comunas` VALUES (104, 'Independencia', 26);
INSERT INTO `comunas` VALUES (105, 'La Cisterna', 26);
INSERT INTO `comunas` VALUES (106, 'La Florida', 26);
INSERT INTO `comunas` VALUES (107, 'La Granja', 26);
INSERT INTO `comunas` VALUES (108, 'La Pintana', 26);
INSERT INTO `comunas` VALUES (109, 'La Reina', 26);
INSERT INTO `comunas` VALUES (110, 'Las Condes', 26);
INSERT INTO `comunas` VALUES (111, 'Lo Barnechea', 26);
INSERT INTO `comunas` VALUES (112, 'Lo Espejo', 26);
INSERT INTO `comunas` VALUES (113, 'Lo Prado', 26);
INSERT INTO `comunas` VALUES (114, 'Macul', 26);
INSERT INTO `comunas` VALUES (115, 'Maipú', 26);
INSERT INTO `comunas` VALUES (116, 'Ñuñoa', 26);
INSERT INTO `comunas` VALUES (117, 'Pedro Aguirre Cerda', 26);
INSERT INTO `comunas` VALUES (118, 'Peñalolén', 26);
INSERT INTO `comunas` VALUES (119, 'Providencia', 26);
INSERT INTO `comunas` VALUES (120, 'Pudahuel', 26);
INSERT INTO `comunas` VALUES (121, 'Quilicura', 26);
INSERT INTO `comunas` VALUES (122, 'Quinta Normal', 26);
INSERT INTO `comunas` VALUES (123, 'Recoleta', 26);
INSERT INTO `comunas` VALUES (124, 'Renca', 26);
INSERT INTO `comunas` VALUES (125, 'San Joaquín', 26);
INSERT INTO `comunas` VALUES (126, 'San Miguel', 26);
INSERT INTO `comunas` VALUES (127, 'San Ramón', 26);
INSERT INTO `comunas` VALUES (128, 'Santiago', 26);
INSERT INTO `comunas` VALUES (129, 'Vitacura', 26);
INSERT INTO `comunas` VALUES (130, 'El Monte', 27);
INSERT INTO `comunas` VALUES (131, 'Isla de Maipo', 27);
INSERT INTO `comunas` VALUES (132, 'Padre Hurtado', 27);
INSERT INTO `comunas` VALUES (133, 'Peñaflor', 27);
INSERT INTO `comunas` VALUES (134, 'Talagante', 27);
INSERT INTO `comunas` VALUES (135, 'Codegua', 28);
INSERT INTO `comunas` VALUES (136, 'Coínco', 28);
INSERT INTO `comunas` VALUES (137, 'Coltauco', 28);
INSERT INTO `comunas` VALUES (138, 'Doñihue', 28);
INSERT INTO `comunas` VALUES (139, 'Graneros', 28);
INSERT INTO `comunas` VALUES (140, 'Las Cabras', 28);
INSERT INTO `comunas` VALUES (141, 'Machalí', 28);
INSERT INTO `comunas` VALUES (142, 'Malloa', 28);
INSERT INTO `comunas` VALUES (143, 'Mostazal', 28);
INSERT INTO `comunas` VALUES (144, 'Olivar', 28);
INSERT INTO `comunas` VALUES (145, 'Peumo', 28);
INSERT INTO `comunas` VALUES (146, 'Pichidegua', 28);
INSERT INTO `comunas` VALUES (147, 'Quinta de Tilcoco', 28);
INSERT INTO `comunas` VALUES (148, 'Rancagua', 28);
INSERT INTO `comunas` VALUES (149, 'Rengo', 28);
INSERT INTO `comunas` VALUES (150, 'Requínoa', 28);
INSERT INTO `comunas` VALUES (151, 'San Vicente de Tagua Tagua', 28);
INSERT INTO `comunas` VALUES (152, 'La Estrella', 29);
INSERT INTO `comunas` VALUES (153, 'Litueche', 29);
INSERT INTO `comunas` VALUES (154, 'Marchihue', 29);
INSERT INTO `comunas` VALUES (155, 'Navidad', 29);
INSERT INTO `comunas` VALUES (156, 'Paredones', 29);
INSERT INTO `comunas` VALUES (157, 'Pichilemu', 29);
INSERT INTO `comunas` VALUES (158, 'Chépica', 30);
INSERT INTO `comunas` VALUES (159, 'Chimbarongo', 30);
INSERT INTO `comunas` VALUES (160, 'Lolol', 30);
INSERT INTO `comunas` VALUES (161, 'Nancagua', 30);
INSERT INTO `comunas` VALUES (162, 'Palmilla', 30);
INSERT INTO `comunas` VALUES (163, 'Peralillo', 30);
INSERT INTO `comunas` VALUES (164, 'Placilla', 30);
INSERT INTO `comunas` VALUES (165, 'Pumanque', 30);
INSERT INTO `comunas` VALUES (166, 'San Fernando', 30);
INSERT INTO `comunas` VALUES (167, 'Santa Cruz', 30);
INSERT INTO `comunas` VALUES (168, 'Cauquenes', 31);
INSERT INTO `comunas` VALUES (169, 'Chanco', 31);
INSERT INTO `comunas` VALUES (170, 'Pelluhue', 31);
INSERT INTO `comunas` VALUES (171, 'Curicó', 32);
INSERT INTO `comunas` VALUES (172, 'Hualañé', 32);
INSERT INTO `comunas` VALUES (173, 'Licantén', 32);
INSERT INTO `comunas` VALUES (174, 'Molina', 32);
INSERT INTO `comunas` VALUES (175, 'Rauco', 32);
INSERT INTO `comunas` VALUES (176, 'Romeral', 32);
INSERT INTO `comunas` VALUES (177, 'Sagrada Familia', 32);
INSERT INTO `comunas` VALUES (178, 'Teno', 32);
INSERT INTO `comunas` VALUES (179, 'Vichuquén', 32);
INSERT INTO `comunas` VALUES (180, 'Colbún', 33);
INSERT INTO `comunas` VALUES (181, 'Linares', 33);
INSERT INTO `comunas` VALUES (182, 'Longaví', 33);
INSERT INTO `comunas` VALUES (183, 'Parral', 33);
INSERT INTO `comunas` VALUES (184, 'Retiro', 33);
INSERT INTO `comunas` VALUES (185, 'San Javier', 33);
INSERT INTO `comunas` VALUES (186, 'Villa Alegre', 33);
INSERT INTO `comunas` VALUES (187, 'Yerbas Buenas', 33);
INSERT INTO `comunas` VALUES (188, 'Constitución', 34);
INSERT INTO `comunas` VALUES (189, 'Curepto', 34);
INSERT INTO `comunas` VALUES (190, 'Empedrado', 34);
INSERT INTO `comunas` VALUES (191, 'Maule', 34);
INSERT INTO `comunas` VALUES (192, 'Pelarco', 34);
INSERT INTO `comunas` VALUES (193, 'Pencahue', 34);
INSERT INTO `comunas` VALUES (194, 'Río Claro', 34);
INSERT INTO `comunas` VALUES (195, 'San Clemente', 34);
INSERT INTO `comunas` VALUES (196, 'San Rafael', 34);
INSERT INTO `comunas` VALUES (197, 'Talca', 34);
INSERT INTO `comunas` VALUES (198, 'Bulnes', 35);
INSERT INTO `comunas` VALUES (199, 'Chillán', 35);
INSERT INTO `comunas` VALUES (200, 'Chillán Viejo', 35);
INSERT INTO `comunas` VALUES (201, 'El Carmen', 35);
INSERT INTO `comunas` VALUES (202, 'Pemuco', 35);
INSERT INTO `comunas` VALUES (203, 'Pinto', 35);
INSERT INTO `comunas` VALUES (204, 'Quillón', 35);
INSERT INTO `comunas` VALUES (205, 'San Ignacio', 35);
INSERT INTO `comunas` VALUES (206, 'Yungay', 35);
INSERT INTO `comunas` VALUES (207, 'Cobquecura', 36);
INSERT INTO `comunas` VALUES (208, 'Coelemu', 36);
INSERT INTO `comunas` VALUES (209, 'Ninhue', 36);
INSERT INTO `comunas` VALUES (210, 'Portezuelo', 36);
INSERT INTO `comunas` VALUES (211, 'Quirihue', 36);
INSERT INTO `comunas` VALUES (212, 'Ránquil', 36);
INSERT INTO `comunas` VALUES (213, 'Treguaco', 36);
INSERT INTO `comunas` VALUES (214, 'San Carlos', 37);
INSERT INTO `comunas` VALUES (215, 'San Fabián', 37);
INSERT INTO `comunas` VALUES (216, 'San Nicolás', 37);
INSERT INTO `comunas` VALUES (217, 'Arauco', 38);
INSERT INTO `comunas` VALUES (218, 'Cañete', 38);
INSERT INTO `comunas` VALUES (219, 'Contulmo', 38);
INSERT INTO `comunas` VALUES (220, 'Curanilahue', 38);
INSERT INTO `comunas` VALUES (221, 'Lebu', 38);
INSERT INTO `comunas` VALUES (222, 'Los Álamos', 38);
INSERT INTO `comunas` VALUES (223, 'Tirúa', 38);
INSERT INTO `comunas` VALUES (224, 'Alto Biobío', 39);
INSERT INTO `comunas` VALUES (225, 'Antuco', 39);
INSERT INTO `comunas` VALUES (226, 'Cabrero', 39);
INSERT INTO `comunas` VALUES (227, 'Laja', 39);
INSERT INTO `comunas` VALUES (228, 'Los Ángeles', 39);
INSERT INTO `comunas` VALUES (229, 'Mulchén', 39);
INSERT INTO `comunas` VALUES (230, 'Nacimiento', 39);
INSERT INTO `comunas` VALUES (231, 'Negrete', 39);
INSERT INTO `comunas` VALUES (232, 'Quilaco', 39);
INSERT INTO `comunas` VALUES (233, 'Quilleco', 39);
INSERT INTO `comunas` VALUES (234, 'San Rosendo', 39);
INSERT INTO `comunas` VALUES (235, 'Santa Bárbara', 39);
INSERT INTO `comunas` VALUES (236, 'Tucapel', 39);
INSERT INTO `comunas` VALUES (237, 'Yumbel', 39);
INSERT INTO `comunas` VALUES (238, 'Chiguayante', 40);
INSERT INTO `comunas` VALUES (239, 'Concepción', 40);
INSERT INTO `comunas` VALUES (240, 'Coronel', 40);
INSERT INTO `comunas` VALUES (241, 'Florida', 40);
INSERT INTO `comunas` VALUES (242, 'Hualpén', 40);
INSERT INTO `comunas` VALUES (243, 'Hualqui', 40);
INSERT INTO `comunas` VALUES (244, 'Lota', 40);
INSERT INTO `comunas` VALUES (245, 'Penco', 40);
INSERT INTO `comunas` VALUES (246, 'San Pedro de la Paz', 40);
INSERT INTO `comunas` VALUES (247, 'Santa Juana', 40);
INSERT INTO `comunas` VALUES (248, 'Talcahuano', 40);
INSERT INTO `comunas` VALUES (249, 'Tomé', 40);
INSERT INTO `comunas` VALUES (250, 'Carahue', 41);
INSERT INTO `comunas` VALUES (251, 'Cholchol', 41);
INSERT INTO `comunas` VALUES (252, 'Cunco', 41);
INSERT INTO `comunas` VALUES (253, 'Curarrehue', 41);
INSERT INTO `comunas` VALUES (254, 'Freire', 41);
INSERT INTO `comunas` VALUES (255, 'Galvarino', 41);
INSERT INTO `comunas` VALUES (256, 'Gorbea', 41);
INSERT INTO `comunas` VALUES (257, 'Lautaro', 41);
INSERT INTO `comunas` VALUES (258, 'Loncoche', 41);
INSERT INTO `comunas` VALUES (259, 'Melipeuco', 41);
INSERT INTO `comunas` VALUES (260, 'Nueva Imperial', 41);
INSERT INTO `comunas` VALUES (261, 'Padre las Casas', 41);
INSERT INTO `comunas` VALUES (262, 'Perquenco', 41);
INSERT INTO `comunas` VALUES (263, 'Pitrufquén', 41);
INSERT INTO `comunas` VALUES (264, 'Pucón', 41);
INSERT INTO `comunas` VALUES (265, 'Saavedra', 41);
INSERT INTO `comunas` VALUES (266, 'Temuco', 41);
INSERT INTO `comunas` VALUES (267, 'Teodoro Schmidt', 41);
INSERT INTO `comunas` VALUES (268, 'Toltén', 41);
INSERT INTO `comunas` VALUES (269, 'Vilcún', 41);
INSERT INTO `comunas` VALUES (270, 'Villarrica', 41);
INSERT INTO `comunas` VALUES (271, 'Angol', 42);
INSERT INTO `comunas` VALUES (272, 'Collipulli', 42);
INSERT INTO `comunas` VALUES (273, 'Curacautín', 42);
INSERT INTO `comunas` VALUES (274, 'Ercilla', 42);
INSERT INTO `comunas` VALUES (275, 'Lonquimay', 42);
INSERT INTO `comunas` VALUES (276, 'Los Sauces', 42);
INSERT INTO `comunas` VALUES (277, 'Lumaco', 42);
INSERT INTO `comunas` VALUES (278, 'Purén', 42);
INSERT INTO `comunas` VALUES (279, 'Renaico', 42);
INSERT INTO `comunas` VALUES (280, 'Traiguén', 42);
INSERT INTO `comunas` VALUES (281, 'Victoria', 42);
INSERT INTO `comunas` VALUES (282, 'Futrono', 43);
INSERT INTO `comunas` VALUES (283, 'La Unión', 43);
INSERT INTO `comunas` VALUES (284, 'Lago Ranco', 43);
INSERT INTO `comunas` VALUES (285, 'Río Bueno', 43);
INSERT INTO `comunas` VALUES (286, 'Corral', 44);
INSERT INTO `comunas` VALUES (287, 'Lanco', 44);
INSERT INTO `comunas` VALUES (288, 'Los Lagos', 44);
INSERT INTO `comunas` VALUES (289, 'Máfil', 44);
INSERT INTO `comunas` VALUES (290, 'Mariquina', 44);
INSERT INTO `comunas` VALUES (291, 'Paillaco', 44);
INSERT INTO `comunas` VALUES (292, 'Panguipulli', 44);
INSERT INTO `comunas` VALUES (293, 'Valdivia', 44);
INSERT INTO `comunas` VALUES (294, 'Ancud', 45);
INSERT INTO `comunas` VALUES (295, 'Castro', 45);
INSERT INTO `comunas` VALUES (296, 'Chonchi', 45);
INSERT INTO `comunas` VALUES (297, 'Curaco de Vélez', 45);
INSERT INTO `comunas` VALUES (298, 'Dalcahue', 45);
INSERT INTO `comunas` VALUES (299, 'Puqueldón', 45);
INSERT INTO `comunas` VALUES (300, 'Queilén', 45);
INSERT INTO `comunas` VALUES (301, 'Quellón', 45);
INSERT INTO `comunas` VALUES (302, 'Quemchi', 45);
INSERT INTO `comunas` VALUES (303, 'Quinchao', 45);
INSERT INTO `comunas` VALUES (304, 'Calbuco', 46);
INSERT INTO `comunas` VALUES (305, 'Cochamó', 46);
INSERT INTO `comunas` VALUES (306, 'Fresia', 46);
INSERT INTO `comunas` VALUES (307, 'Frutillar', 46);
INSERT INTO `comunas` VALUES (308, 'Llanquihue', 46);
INSERT INTO `comunas` VALUES (309, 'Los Muermos', 46);
INSERT INTO `comunas` VALUES (310, 'Maullín', 46);
INSERT INTO `comunas` VALUES (311, 'Puerto Montt', 46);
INSERT INTO `comunas` VALUES (312, 'Puerto Varas', 46);
INSERT INTO `comunas` VALUES (313, 'Osorno', 47);
INSERT INTO `comunas` VALUES (314, 'Puerto Octay', 47);
INSERT INTO `comunas` VALUES (315, 'Purranque', 47);
INSERT INTO `comunas` VALUES (316, 'Puyehue', 47);
INSERT INTO `comunas` VALUES (317, 'Río Negro', 47);
INSERT INTO `comunas` VALUES (318, 'San Juan de la Costa', 47);
INSERT INTO `comunas` VALUES (319, 'San Pablo', 47);
INSERT INTO `comunas` VALUES (320, 'Chaitén', 48);
INSERT INTO `comunas` VALUES (321, 'Futaleufú', 48);
INSERT INTO `comunas` VALUES (322, 'Hualaihué', 48);
INSERT INTO `comunas` VALUES (323, 'Palena', 48);
INSERT INTO `comunas` VALUES (324, 'Aysén', 49);
INSERT INTO `comunas` VALUES (325, 'Cisnes', 49);
INSERT INTO `comunas` VALUES (326, 'Guaitecas', 49);
INSERT INTO `comunas` VALUES (327, 'Cochrane', 50);
INSERT INTO `comunas` VALUES (328, 'O\'Higgins', 50);
INSERT INTO `comunas` VALUES (329, 'Tortel', 50);
INSERT INTO `comunas` VALUES (330, 'Coyhaique', 51);
INSERT INTO `comunas` VALUES (331, 'Lago Verde', 51);
INSERT INTO `comunas` VALUES (332, 'Chile Chico', 52);
INSERT INTO `comunas` VALUES (333, 'Río Ibáñez', 52);
INSERT INTO `comunas` VALUES (334, 'Cabo de Hornos', 53);
INSERT INTO `comunas` VALUES (335, 'Antártica', 53);
INSERT INTO `comunas` VALUES (336, 'Laguna Blanca', 54);
INSERT INTO `comunas` VALUES (337, 'Punta Arenas', 54);
INSERT INTO `comunas` VALUES (338, 'Río Verde', 54);
INSERT INTO `comunas` VALUES (339, 'San Gregorio', 54);
INSERT INTO `comunas` VALUES (340, 'Porvenir', 55);
INSERT INTO `comunas` VALUES (341, 'Primavera', 55);
INSERT INTO `comunas` VALUES (342, 'Timaukel', 55);
INSERT INTO `comunas` VALUES (343, 'Natales', 56);
INSERT INTO `comunas` VALUES (344, 'Torres del Paine', 56);

-- ----------------------------
-- Table structure for gestiones
-- ----------------------------
DROP TABLE IF EXISTS `gestiones`;
CREATE TABLE `gestiones`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) NOT NULL,
  `id_vehiculo` int(11) NULL DEFAULT NULL,
  `id_servicio_asociado` int(11) NULL DEFAULT NULL,
  `id_anfitriona_asignada` int(11) NULL DEFAULT NULL,
  `id_jefe_creador` int(11) NOT NULL,
  `motivo_contacto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` enum('pendiente','contactado','no_contesta','agendado','finalizado') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pendiente',
  `notas` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_cliente`(`id_cliente`) USING BTREE,
  INDEX `id_servicio_asociado`(`id_servicio_asociado`) USING BTREE,
  INDEX `id_anfitriona_asignada`(`id_anfitriona_asignada`) USING BTREE,
  INDEX `id_jefe_creador`(`id_jefe_creador`) USING BTREE,
  INDEX `fk_gestiones_vehiculo`(`id_vehiculo`) USING BTREE,
  CONSTRAINT `fk_gestiones_vehiculo` FOREIGN KEY (`id_vehiculo`) REFERENCES `vehiculos` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `gestiones_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `gestiones_ibfk_2` FOREIGN KEY (`id_servicio_asociado`) REFERENCES `servicios` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `gestiones_ibfk_3` FOREIGN KEY (`id_anfitriona_asignada`) REFERENCES `usuarios` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `gestiones_ibfk_4` FOREIGN KEY (`id_jefe_creador`) REFERENCES `usuarios` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gestiones
-- ----------------------------
INSERT INTO `gestiones` VALUES (1, 1, 1, 1, 3, 2, 'Llamar para agendar mantención de 20.000 KM', 'pendiente', NULL, '2025-07-29 15:29:21', '2025-07-29 17:45:56');
INSERT INTO `gestiones` VALUES (2, 2, 2, NULL, 3, 2, 'Llamar para ofrecer revisión de puntos de seguridad', 'pendiente', NULL, '2025-07-29 15:29:21', '2025-07-29 17:45:56');
INSERT INTO `gestiones` VALUES (3, 3, 3, 1, 3, 2, 'Coordinar mantención de 20.000 KM', 'agendado', 'Cliente agendó para el 15/08. Se envió confirmación.', '2025-07-29 10:00:00', '2025-07-29 17:45:56');
INSERT INTO `gestiones` VALUES (4, 4, 4, 3, 3, 2, 'Ofrecer primer cambio de aceite (venta nueva)', 'contactado', 'Cliente indica que aún es muy pronto, volver a llamar en 3 meses.', '2025-02-20 11:00:00', '2025-07-29 17:45:56');
INSERT INTO `gestiones` VALUES (5, 4, NULL, NULL, 3, 2, 'Llamada de seguimiento post-venta', 'finalizado', 'Cliente satisfecha con el vehículo, sin problemas que reportar.', '2025-02-01 12:00:00', '2025-07-29 17:41:09');
INSERT INTO `gestiones` VALUES (6, 5, 5, 4, 3, 2, 'Cliente reporta ruido en los frenos', 'pendiente', 'Asignado para contacto urgente.', '2025-07-29 11:30:00', '2025-07-29 17:45:56');
INSERT INTO `gestiones` VALUES (7, 6, 6, NULL, 3, 2, 'Llamar para actualizar datos y ofrecer revisión gratuita', 'no_contesta', 'Primer intento de llamada, no contesta. Reintentar mañana.', '2025-07-28 16:00:00', '2025-07-29 17:45:56');
INSERT INTO `gestiones` VALUES (8, 2, NULL, NULL, 3, 2, 'Llamar para agendar clientes con 20.000 km', 'pendiente', NULL, '2025-07-29 18:13:47', '2025-07-29 18:13:47');
INSERT INTO `gestiones` VALUES (9, 3, NULL, NULL, 3, 2, 'Llamar para agendar clientes con 20.000 km', 'pendiente', NULL, '2025-07-29 18:13:47', '2025-07-29 18:13:47');
INSERT INTO `gestiones` VALUES (10, 1, NULL, NULL, 3, 2, 'Llamado', 'pendiente', NULL, '2025-07-29 18:34:32', '2025-07-29 18:34:32');
INSERT INTO `gestiones` VALUES (11, 5, NULL, NULL, 3, 2, 'Llamado', 'pendiente', NULL, '2025-07-29 18:34:32', '2025-07-29 18:34:32');
INSERT INTO `gestiones` VALUES (12, 1, 1, 7, 3, 2, 'Mantención de 10.000 KM realizada', 'finalizado', 'Servicio completado sin novedades.', '2023-06-25 11:00:00', '2025-07-29 18:43:22');
INSERT INTO `gestiones` VALUES (13, 2, 2, 7, 3, 2, 'Mantención de 10.000 KM realizada', 'finalizado', 'Cliente consultó por cambio de neumáticos a futuro.', '2023-10-15 14:30:00', '2025-07-29 18:43:22');
INSERT INTO `gestiones` VALUES (14, 2, 2, 3, 3, 2, 'Cambio de aceite y filtro intermedio', 'finalizado', 'Realizado a petición del cliente.', '2024-04-20 09:00:00', '2025-07-29 18:43:22');
INSERT INTO `gestiones` VALUES (15, 3, 3, 7, 3, 2, 'Mantención de 10.000 KM realizada', 'finalizado', 'OK.', '2022-09-01 16:00:00', '2025-07-29 18:43:22');
INSERT INTO `gestiones` VALUES (16, 5, 5, 8, 3, 2, 'Mantención de 20.000 KM realizada', 'finalizado', 'Se recomendaron nuevas pastillas de freno para el próximo servicio.', '2021-12-10 12:00:00', '2025-07-29 18:43:22');
INSERT INTO `gestiones` VALUES (17, 5, 5, 6, 3, 2, 'Alineación y Balanceo', 'finalizado', 'Cliente solicitó el servicio por vibración en el volante.', '2023-03-05 10:00:00', '2025-07-29 18:43:22');
INSERT INTO `gestiones` VALUES (18, 6, 6, 7, 3, 2, 'Mantención de 10.000 KM', 'finalizado', 'Servicio completado.', '2024-02-15 11:45:00', '2025-07-29 18:43:22');
INSERT INTO `gestiones` VALUES (22, 18, NULL, 8, 3, 2, 'Mantención de 40.000 KM', 'finalizado', NULL, '2024-11-15 10:00:00', '2025-07-29 20:08:02');
INSERT INTO `gestiones` VALUES (23, 19, NULL, 7, 3, 2, 'Mantención de 10.000 KM', 'finalizado', NULL, '2023-09-01 11:00:00', '2025-07-29 20:08:02');
INSERT INTO `gestiones` VALUES (24, 19, NULL, 1, 3, 2, 'Mantención de 20.000 KM', 'finalizado', NULL, '2024-10-22 15:00:00', '2025-07-29 20:08:02');
INSERT INTO `gestiones` VALUES (25, 21, NULL, 5, 3, 2, 'Diagnóstico de motor', 'finalizado', NULL, '2024-01-15 14:00:00', '2025-07-29 20:08:02');
INSERT INTO `gestiones` VALUES (26, 21, NULL, 2, 3, 2, 'Cambio completo de frenos', 'finalizado', NULL, '2024-08-30 16:00:00', '2025-07-29 20:08:02');
INSERT INTO `gestiones` VALUES (27, 22, NULL, 7, 3, 2, 'Mantención 10.000 KM', 'finalizado', NULL, '2024-09-10 12:00:00', '2025-07-29 20:08:02');
INSERT INTO `gestiones` VALUES (28, 23, 24, 8, 3, 2, 'Mantención de 40.000 KM', 'finalizado', NULL, '2024-11-15 10:00:00', '2025-07-29 20:11:59');
INSERT INTO `gestiones` VALUES (29, 24, 25, 7, 3, 2, 'Mantención de 10.000 KM', 'finalizado', NULL, '2023-09-01 11:00:00', '2025-07-29 20:11:59');
INSERT INTO `gestiones` VALUES (30, 24, 25, 1, 3, 2, 'Mantención de 20.000 KM', 'agendado', NULL, '2024-10-22 15:00:00', '2025-07-29 20:11:59');
INSERT INTO `gestiones` VALUES (31, 26, 27, 5, 3, 2, 'Diagnóstico de motor', 'finalizado', NULL, '2024-01-15 14:00:00', '2025-07-29 20:11:59');
INSERT INTO `gestiones` VALUES (32, 26, 27, 2, 3, 2, 'Cambio completo de frenos', 'contactado', NULL, '2024-08-30 16:00:00', '2025-07-29 20:11:59');
INSERT INTO `gestiones` VALUES (33, 27, 28, 7, 3, 2, 'Mantención 10.000 KM', 'finalizado', NULL, '2024-09-10 12:00:00', '2025-07-29 20:11:59');
INSERT INTO `gestiones` VALUES (34, 28, 30, 7, 3, 2, 'Mantención 10.000 KM', 'finalizado', 'Realizada en tiempo y forma.', '2024-02-10 10:00:00', '2025-07-29 20:25:17');
INSERT INTO `gestiones` VALUES (35, 28, 30, 1, 3, 2, 'Mantención 20.000 KM', 'finalizado', 'Cliente consultó por neumáticos.', '2025-01-05 11:30:00', '2025-07-29 20:25:17');
INSERT INTO `gestiones` VALUES (36, 28, 31, 8, 3, 2, 'Mantención 40.000 KM', 'finalizado', 'Vehículo secundario, revisión completa.', '2024-07-15 09:00:00', '2025-07-29 20:25:17');
INSERT INTO `gestiones` VALUES (37, 29, 32, 3, 3, 2, 'Primer cambio de aceite', 'pendiente', 'Vehículo nuevo, aún no requiere servicio.', '2025-07-29 15:00:00', '2025-07-29 20:25:17');
INSERT INTO `gestiones` VALUES (38, 30, 33, 1, 3, 2, 'Mantención 20.000 KM', 'finalizado', 'Servicio realizado sin problemas.', '2023-05-10 14:00:00', '2025-07-29 20:25:17');
INSERT INTO `gestiones` VALUES (39, 30, 33, NULL, 3, 2, 'Llamada de seguimiento', 'contactado', 'Cliente satisfecho.', '2024-01-20 10:00:00', '2025-07-29 20:25:17');
INSERT INTO `gestiones` VALUES (40, 23, NULL, NULL, 3, 3, 'Campaña Mantencion', 'contactado', 'Contesto pero le faltan 1000 km aun', '2025-07-30 16:02:06', '2025-07-30 16:02:06');
INSERT INTO `gestiones` VALUES (41, 23, NULL, NULL, 3, 3, 'Campaña Mantencion', 'finalizado', '', '2025-07-30 16:06:16', '2025-07-30 16:06:16');

-- ----------------------------
-- Table structure for lista_clientes
-- ----------------------------
DROP TABLE IF EXISTS `lista_clientes`;
CREATE TABLE `lista_clientes`  (
  `id_lista` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  PRIMARY KEY (`id_lista`, `id_cliente`) USING BTREE,
  INDEX `fk_lc_cliente`(`id_cliente`) USING BTREE,
  CONSTRAINT `fk_lc_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_lc_lista` FOREIGN KEY (`id_lista`) REFERENCES `listas` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lista_clientes
-- ----------------------------
INSERT INTO `lista_clientes` VALUES (1, 1);
INSERT INTO `lista_clientes` VALUES (3, 1);
INSERT INTO `lista_clientes` VALUES (5, 1);
INSERT INTO `lista_clientes` VALUES (1, 2);
INSERT INTO `lista_clientes` VALUES (3, 2);
INSERT INTO `lista_clientes` VALUES (4, 2);
INSERT INTO `lista_clientes` VALUES (1, 3);
INSERT INTO `lista_clientes` VALUES (3, 3);
INSERT INTO `lista_clientes` VALUES (4, 3);
INSERT INTO `lista_clientes` VALUES (1, 4);
INSERT INTO `lista_clientes` VALUES (10, 4);
INSERT INTO `lista_clientes` VALUES (1, 5);
INSERT INTO `lista_clientes` VALUES (3, 5);
INSERT INTO `lista_clientes` VALUES (5, 5);
INSERT INTO `lista_clientes` VALUES (1, 6);
INSERT INTO `lista_clientes` VALUES (10, 6);
INSERT INTO `lista_clientes` VALUES (11, 6);

-- ----------------------------
-- Table structure for listas
-- ----------------------------
DROP TABLE IF EXISTS `listas`;
CREATE TABLE `listas`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_lista` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `criterios` json NOT NULL COMMENT 'Almacena los filtros usados para crear la lista',
  `id_creador` int(11) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` enum('creada','asignada') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'creada',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_listas_creador`(`id_creador`) USING BTREE,
  CONSTRAINT `fk_listas_creador` FOREIGN KEY (`id_creador`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of listas
-- ----------------------------
INSERT INTO `listas` VALUES (1, 'Clientes > 1 Año Antigüedad', '{\"tipo\": \"Clientes > 1 Año Antigüedad\"}', 2, '2025-07-29 17:58:45', 'creada');
INSERT INTO `listas` VALUES (3, 'Clientes > 2 Años Antigüedad', '{\"tipo\": \"Clientes > 2 Años Antigüedad\", \"valor\": \"2\"}', 2, '2025-07-29 18:02:40', 'creada');
INSERT INTO `listas` VALUES (4, 'Próximos Mant. 20.000 KM', '{\"tipo\": \"Próximos Mant. 20.000 KM\", \"valor\": \"20000\"}', 2, '2025-07-29 18:13:12', 'asignada');
INSERT INTO `listas` VALUES (5, 'Clientes > 2 Años Antigüedad', '{\"tipo\": \"Clientes > 2 Años Antigüedad\", \"valor\": \"2\"}', 2, '2025-07-29 18:33:09', 'asignada');
INSERT INTO `listas` VALUES (10, 'Personalizada - 2025-07-29 23:16', '{\"id_sucursal\": \"2\"}', 2, '2025-07-29 19:16:03', 'creada');
INSERT INTO `listas` VALUES (11, 'Personalizada - 2025-07-29 23:18', '{\"id_marca\": \"6\"}', 2, '2025-07-29 19:18:24', 'creada');

-- ----------------------------
-- Table structure for marcas
-- ----------------------------
DROP TABLE IF EXISTS `marcas`;
CREATE TABLE `marcas`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `nombre`(`nombre`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of marcas
-- ----------------------------
INSERT INTO `marcas` VALUES (4, 'Chevrolet');
INSERT INTO `marcas` VALUES (7, 'Ford');
INSERT INTO `marcas` VALUES (2, 'Hyundai');
INSERT INTO `marcas` VALUES (3, 'Kia');
INSERT INTO `marcas` VALUES (5, 'Nissan');
INSERT INTO `marcas` VALUES (6, 'Suzuki');
INSERT INTO `marcas` VALUES (1, 'Toyota');
INSERT INTO `marcas` VALUES (8, 'Volkswagen');

-- ----------------------------
-- Table structure for modelos
-- ----------------------------
DROP TABLE IF EXISTS `modelos`;
CREATE TABLE `modelos`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_marca` int(11) NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_modelos_marca`(`id_marca`) USING BTREE,
  CONSTRAINT `fk_modelos_marca` FOREIGN KEY (`id_marca`) REFERENCES `marcas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of modelos
-- ----------------------------
INSERT INTO `modelos` VALUES (1, 1, 'Yaris');
INSERT INTO `modelos` VALUES (2, 1, 'Corolla');
INSERT INTO `modelos` VALUES (3, 1, 'Hilux');
INSERT INTO `modelos` VALUES (4, 1, 'RAV4');
INSERT INTO `modelos` VALUES (5, 2, 'Tucson');
INSERT INTO `modelos` VALUES (6, 2, 'Accent');
INSERT INTO `modelos` VALUES (7, 2, 'Santa Fe');
INSERT INTO `modelos` VALUES (8, 2, 'i10');
INSERT INTO `modelos` VALUES (9, 3, 'Morning');
INSERT INTO `modelos` VALUES (10, 3, 'Rio');
INSERT INTO `modelos` VALUES (11, 3, 'Sportage');
INSERT INTO `modelos` VALUES (12, 3, 'Seltos');
INSERT INTO `modelos` VALUES (13, 4, 'Onix');
INSERT INTO `modelos` VALUES (14, 4, 'Sail');
INSERT INTO `modelos` VALUES (15, 4, 'Tracker');
INSERT INTO `modelos` VALUES (16, 4, 'Silverado');
INSERT INTO `modelos` VALUES (17, 5, 'Versa');
INSERT INTO `modelos` VALUES (18, 5, 'Kicks');
INSERT INTO `modelos` VALUES (19, 5, 'Qashqai');
INSERT INTO `modelos` VALUES (20, 5, 'Navara');
INSERT INTO `modelos` VALUES (21, 6, 'Swift');
INSERT INTO `modelos` VALUES (22, 6, 'Baleno');
INSERT INTO `modelos` VALUES (23, 6, 'Grand Vitara');
INSERT INTO `modelos` VALUES (24, 6, 'Jimny');

-- ----------------------------
-- Table structure for pautas_mantencion
-- ----------------------------
DROP TABLE IF EXISTS `pautas_mantencion`;
CREATE TABLE `pautas_mantencion`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_modelo` int(11) NOT NULL,
  `kilometraje` int(11) NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `precio` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_modelo_km`(`id_modelo`, `kilometraje`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pautas_mantencion
-- ----------------------------
INSERT INTO `pautas_mantencion` VALUES (1, 1, 10000, 'Cambio de aceite y filtro de motor. Revisión de 25 puntos de seguridad.', 120000);
INSERT INTO `pautas_mantencion` VALUES (2, 1, 20000, 'Mantención completa: Aceite, filtro de motor, filtro de aire, filtro de polen. Rotación de neumáticos.', 250000);
INSERT INTO `pautas_mantencion` VALUES (3, 5, 10000, 'Cambio de aceite sintético y filtro. Revisión de frenos.', 150000);
INSERT INTO `pautas_mantencion` VALUES (4, 5, 20000, 'Mantención completa: Aceite, todos los filtros, bujías. Alineación y balanceo.', 320000);

-- ----------------------------
-- Table structure for provincias
-- ----------------------------
DROP TABLE IF EXISTS `provincias`;
CREATE TABLE `provincias`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_region` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_provincias_region`(`id_region`) USING BTREE,
  CONSTRAINT `fk_provincias_region` FOREIGN KEY (`id_region`) REFERENCES `regiones` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of provincias
-- ----------------------------
INSERT INTO `provincias` VALUES (1, 'Arica', 1);
INSERT INTO `provincias` VALUES (2, 'Parinacota', 1);
INSERT INTO `provincias` VALUES (3, 'Iquique', 2);
INSERT INTO `provincias` VALUES (4, 'Tamarugal', 2);
INSERT INTO `provincias` VALUES (5, 'Antofagasta', 3);
INSERT INTO `provincias` VALUES (6, 'El Loa', 3);
INSERT INTO `provincias` VALUES (7, 'Tocopilla', 3);
INSERT INTO `provincias` VALUES (8, 'Chañaral', 4);
INSERT INTO `provincias` VALUES (9, 'Copiapó', 4);
INSERT INTO `provincias` VALUES (10, 'Huasco', 4);
INSERT INTO `provincias` VALUES (11, 'Choapa', 5);
INSERT INTO `provincias` VALUES (12, 'Elqui', 5);
INSERT INTO `provincias` VALUES (13, 'Limarí', 5);
INSERT INTO `provincias` VALUES (14, 'Isla de Pascua', 6);
INSERT INTO `provincias` VALUES (15, 'Los Andes', 6);
INSERT INTO `provincias` VALUES (16, 'Marga Marga', 6);
INSERT INTO `provincias` VALUES (17, 'Petorca', 6);
INSERT INTO `provincias` VALUES (18, 'Quillota', 6);
INSERT INTO `provincias` VALUES (19, 'San Antonio', 6);
INSERT INTO `provincias` VALUES (20, 'San Felipe de Aconcagua', 6);
INSERT INTO `provincias` VALUES (21, 'Valparaíso', 6);
INSERT INTO `provincias` VALUES (22, 'Chacabuco', 7);
INSERT INTO `provincias` VALUES (23, 'Cordillera', 7);
INSERT INTO `provincias` VALUES (24, 'Maipo', 7);
INSERT INTO `provincias` VALUES (25, 'Melipilla', 7);
INSERT INTO `provincias` VALUES (26, 'Santiago', 7);
INSERT INTO `provincias` VALUES (27, 'Talagante', 7);
INSERT INTO `provincias` VALUES (28, 'Cachapoal', 8);
INSERT INTO `provincias` VALUES (29, 'Cardenal Caro', 8);
INSERT INTO `provincias` VALUES (30, 'Colchagua', 8);
INSERT INTO `provincias` VALUES (31, 'Cauquenes', 9);
INSERT INTO `provincias` VALUES (32, 'Curicó', 9);
INSERT INTO `provincias` VALUES (33, 'Linares', 9);
INSERT INTO `provincias` VALUES (34, 'Talca', 9);
INSERT INTO `provincias` VALUES (35, 'Diguillín', 10);
INSERT INTO `provincias` VALUES (36, 'Itata', 10);
INSERT INTO `provincias` VALUES (37, 'Punilla', 10);
INSERT INTO `provincias` VALUES (38, 'Arauco', 11);
INSERT INTO `provincias` VALUES (39, 'Biobío', 11);
INSERT INTO `provincias` VALUES (40, 'Concepción', 11);
INSERT INTO `provincias` VALUES (41, 'Cautín', 12);
INSERT INTO `provincias` VALUES (42, 'Malleco', 12);
INSERT INTO `provincias` VALUES (43, 'Ranco', 13);
INSERT INTO `provincias` VALUES (44, 'Valdivia', 13);
INSERT INTO `provincias` VALUES (45, 'Chiloé', 14);
INSERT INTO `provincias` VALUES (46, 'Llanquihue', 14);
INSERT INTO `provincias` VALUES (47, 'Osorno', 14);
INSERT INTO `provincias` VALUES (48, 'Palena', 14);
INSERT INTO `provincias` VALUES (49, 'Aysén', 15);
INSERT INTO `provincias` VALUES (50, 'Capitán Prat', 15);
INSERT INTO `provincias` VALUES (51, 'Coyhaique', 15);
INSERT INTO `provincias` VALUES (52, 'General Carrera', 15);
INSERT INTO `provincias` VALUES (53, 'Antártica Chilena', 16);
INSERT INTO `provincias` VALUES (54, 'Magallanes', 16);
INSERT INTO `provincias` VALUES (55, 'Tierra del Fuego', 16);
INSERT INTO `provincias` VALUES (56, 'Última Esperanza', 16);

-- ----------------------------
-- Table structure for regiones
-- ----------------------------
DROP TABLE IF EXISTS `regiones`;
CREATE TABLE `regiones`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of regiones
-- ----------------------------
INSERT INTO `regiones` VALUES (1, 'Arica y Parinacota');
INSERT INTO `regiones` VALUES (2, 'Tarapacá');
INSERT INTO `regiones` VALUES (3, 'Antofagasta');
INSERT INTO `regiones` VALUES (4, 'Atacama');
INSERT INTO `regiones` VALUES (5, 'Coquimbo');
INSERT INTO `regiones` VALUES (6, 'Valparaíso');
INSERT INTO `regiones` VALUES (7, 'Metropolitana de Santiago');
INSERT INTO `regiones` VALUES (8, 'Libertador General Bernardo O\'Higgins');
INSERT INTO `regiones` VALUES (9, 'Maule');
INSERT INTO `regiones` VALUES (10, 'Ñuble');
INSERT INTO `regiones` VALUES (11, 'Biobío');
INSERT INTO `regiones` VALUES (12, 'La Araucanía');
INSERT INTO `regiones` VALUES (13, 'Los Ríos');
INSERT INTO `regiones` VALUES (14, 'Los Lagos');
INSERT INTO `regiones` VALUES (15, 'Aysén del General Carlos Ibáñez del Campo');
INSERT INTO `regiones` VALUES (16, 'Magallanes y de la Antártica Chilena');

-- ----------------------------
-- Table structure for servicios
-- ----------------------------
DROP TABLE IF EXISTS `servicios`;
CREATE TABLE `servicios`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_servicio` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of servicios
-- ----------------------------
INSERT INTO `servicios` VALUES (1, 'Mantención 20.000 KM');
INSERT INTO `servicios` VALUES (2, 'Cambio de Frenos');
INSERT INTO `servicios` VALUES (3, 'Cambio de Aceite y Filtro');
INSERT INTO `servicios` VALUES (4, 'Revisión Sistema de Frenos');
INSERT INTO `servicios` VALUES (5, 'Diagnóstico con Scanner');
INSERT INTO `servicios` VALUES (6, 'Alineación y Balanceo');
INSERT INTO `servicios` VALUES (7, 'Mantención 10.000 KM');
INSERT INTO `servicios` VALUES (8, 'Mantención 20.000 KM');

-- ----------------------------
-- Table structure for sucursales
-- ----------------------------
DROP TABLE IF EXISTS `sucursales`;
CREATE TABLE `sucursales`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `direccion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `id_comuna` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_sucursales_comuna`(`id_comuna`) USING BTREE,
  CONSTRAINT `fk_sucursales_comuna` FOREIGN KEY (`id_comuna`) REFERENCES `comunas` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sucursales
-- ----------------------------
INSERT INTO `sucursales` VALUES (1, 'Conecta - Sede Central', 'Av. Prat 199, Piso 2', 239);
INSERT INTO `sucursales` VALUES (2, 'Conecta - Taller Los Ángeles', 'Av. Alemania 850', 228);

-- ----------------------------
-- Table structure for temp_import_data
-- ----------------------------
DROP TABLE IF EXISTS `temp_import_data`;
CREATE TABLE `temp_import_data`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `row_index` int(11) NOT NULL,
  `nombre_cliente` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `rut_cliente` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `telefono` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `patente` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `marca` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `modelo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `kilometraje` int(11) NULL DEFAULT NULL,
  `region` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `import_status` enum('OK','ERROR') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'OK',
  `import_errors` json NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_session_id`(`session_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of temp_import_data
-- ----------------------------

-- ----------------------------
-- Table structure for usuarios
-- ----------------------------
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_usuario` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre_completo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rol` enum('jefe_taller','anfitriona','admin') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Nombre del archivo del avatar',
  `id_sucursal` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `nombre_usuario`(`nombre_usuario`) USING BTREE,
  INDEX `fk_usuarios_sucursal`(`id_sucursal`) USING BTREE,
  CONSTRAINT `fk_usuarios_sucursal` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursales` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of usuarios
-- ----------------------------
INSERT INTO `usuarios` VALUES (1, 'admin@conecta.cl', '$2y$10$YBUZLtsunx8URO4MR1lVrOA0yXAwApLS80SaTlcTYsFnG6E9jUrtW', 'Administrador General', 'admin', NULL, NULL);
INSERT INTO `usuarios` VALUES (2, 'jefetaller@conecta.cl', '$2y$10$YBUZLtsunx8URO4MR1lVrOA0yXAwApLS80SaTlcTYsFnG6E9jUrtW', 'Jefe de Taller Conce', 'jefe_taller', 'avatar_2_1753825152.png', 1);
INSERT INTO `usuarios` VALUES (3, 'anfitriona@conecta.cl', '$2y$10$YBUZLtsunx8URO4MR1lVrOA0yXAwApLS80SaTlcTYsFnG6E9jUrtW', 'Anfitriona Conce', 'anfitriona', 'avatar_3_1753824961.png', 1);

-- ----------------------------
-- Table structure for vehiculos
-- ----------------------------
DROP TABLE IF EXISTS `vehiculos`;
CREATE TABLE `vehiculos`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) NOT NULL,
  `patente` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_marca` int(11) NULL DEFAULT NULL,
  `id_modelo` int(11) NULL DEFAULT NULL,
  `anio` int(4) NULL DEFAULT NULL,
  `fecha_compra` date NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `patente`(`patente`) USING BTREE,
  INDEX `fk_vehiculos_cliente`(`id_cliente`) USING BTREE,
  INDEX `fk_vehiculos_marca`(`id_marca`) USING BTREE,
  INDEX `fk_vehiculos_modelo`(`id_modelo`) USING BTREE,
  CONSTRAINT `fk_vehiculos_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_vehiculos_marca` FOREIGN KEY (`id_marca`) REFERENCES `marcas` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_vehiculos_modelo` FOREIGN KEY (`id_modelo`) REFERENCES `modelos` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vehiculos
-- ----------------------------
INSERT INTO `vehiculos` VALUES (1, 1, 'ABCD-01', 1, 1, 2022, '2022-07-15');
INSERT INTO `vehiculos` VALUES (2, 2, 'EFGH-02', 2, 5, 2023, '2023-01-20');
INSERT INTO `vehiculos` VALUES (3, 3, 'IJKL-03', 5, 17, 2021, '2021-11-05');
INSERT INTO `vehiculos` VALUES (4, 4, 'MNOP-04', 3, 9, 2024, '2024-02-10');
INSERT INTO `vehiculos` VALUES (5, 5, 'QRST-05', 4, 13, 2020, '2020-05-30');
INSERT INTO `vehiculos` VALUES (6, 6, 'UVWX-06', 6, 21, 2023, '2023-08-25');
INSERT INTO `vehiculos` VALUES (7, 4, 'YZAB-07', 1, 3, 2024, '2024-03-01');
INSERT INTO `vehiculos` VALUES (8, 3, 'RTPL-20', 7, NULL, 2019, '2019-05-10');
INSERT INTO `vehiculos` VALUES (9, 4, 'JKGH-45', 8, NULL, 2021, '2021-03-15');
INSERT INTO `vehiculos` VALUES (10, 5, 'ZXCV-11', 4, 15, 2022, '2022-09-01');
INSERT INTO `vehiculos` VALUES (11, 6, 'MNBV-78', 6, 22, 2020, '2020-11-20');
INSERT INTO `vehiculos` VALUES (24, 23, 'PDRT-55', 2, 6, 2020, '2020-10-05');
INSERT INTO `vehiculos` VALUES (25, 24, 'LKWX-81', 3, 11, 2022, '2022-08-18');
INSERT INTO `vehiculos` VALUES (26, 25, 'HGFD-12', 5, 18, 2024, '2024-03-01');
INSERT INTO `vehiculos` VALUES (27, 26, 'GHYT-99', 1, 3, 2018, '2018-06-20');
INSERT INTO `vehiculos` VALUES (28, 27, 'DFGR-23', 4, 14, 2023, '2023-12-01');
INSERT INTO `vehiculos` VALUES (30, 28, 'ZXCV-08', 1, 2, 2023, '2023-08-01');
INSERT INTO `vehiculos` VALUES (31, 28, 'QWER-09', 2, 6, 2020, '2020-03-10');
INSERT INTO `vehiculos` VALUES (32, 29, 'ASDF-10', 3, 10, 2025, '2025-01-01');
INSERT INTO `vehiculos` VALUES (33, 30, 'GHJK-11', 4, 14, 2021, '2021-07-20');
INSERT INTO `vehiculos` VALUES (34, 31, 'JXXT23', 4, 13, NULL, '2025-07-30');
INSERT INTO `vehiculos` VALUES (35, 32, 'RTFR23', 2, 6, NULL, '2025-07-30');

-- ----------------------------
-- Procedure structure for validate_import_data
-- ----------------------------
DROP PROCEDURE IF EXISTS `validate_import_data`;
delimiter ;;
CREATE PROCEDURE `validate_import_data`(IN p_session_id VARCHAR(255))
BEGIN
    -- Validaciones de campos obligatorios
    UPDATE `temp_import_data` SET `import_status` = 'ERROR', `import_errors` = JSON_ARRAY_APPEND(COALESCE(`import_errors`, '[]'), '$', 'Faltan datos (nombre, rut, email, telefono, patente, marca, modelo).') 
    WHERE `session_id` = p_session_id AND (nombre_cliente IS NULL OR rut_cliente IS NULL OR email IS NULL OR telefono IS NULL OR patente IS NULL OR marca IS NULL OR modelo IS NULL);

    -- Validar formato de RUT
    UPDATE `temp_import_data` SET `import_status` = 'ERROR', `import_errors` = JSON_ARRAY_APPEND(COALESCE(`import_errors`, '[]'), '$', 'Formato de RUT inválido.') 
    WHERE `session_id` = p_session_id AND `rut_cliente` NOT REGEXP '^[0-9]{1,2}\\.[0-9]{3}\\.[0-9]{3}-[0-9Kk]$' AND `import_status` = 'OK';

    -- Validar formato de Email
    UPDATE `temp_import_data` SET `import_status` = 'ERROR', `import_errors` = JSON_ARRAY_APPEND(COALESCE(`import_errors`, '[]'), '$', 'Formato de Email inválido.') 
    WHERE `session_id` = p_session_id AND `email` NOT REGEXP '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$' AND `import_status` = 'OK';

    -- Validar duplicados (RUT, Email, Patente) en el sistema existente
    UPDATE `temp_import_data` t JOIN `clientes` c ON t.rut_cliente = c.rut_cliente SET t.`import_status` = 'ERROR', t.`import_errors` = JSON_ARRAY_APPEND(COALESCE(t.`import_errors`, '[]'), '$', 'El RUT ya existe.') WHERE t.`session_id` = p_session_id AND t.`import_status` = 'OK';
    UPDATE `temp_import_data` t JOIN `cliente_emails` ce ON t.email = ce.email SET t.`import_status` = 'ERROR', t.`import_errors` = JSON_ARRAY_APPEND(COALESCE(t.`import_errors`, '[]'), '$', 'El Email ya existe.') WHERE t.`session_id` = p_session_id AND t.`import_status` = 'OK';
    UPDATE `temp_import_data` t JOIN `vehiculos` v ON t.patente = v.patente SET t.`import_status` = 'ERROR', t.`import_errors` = JSON_ARRAY_APPEND(COALESCE(t.`import_errors`, '[]'), '$', 'La Patente ya existe.') WHERE t.`session_id` = p_session_id AND t.`import_status` = 'OK';
    
    -- Validar que la región exista (si se proporcionó)
    UPDATE `temp_import_data` t LEFT JOIN `regiones` r ON t.region = r.nombre
    SET t.`import_status` = 'ERROR', t.`import_errors` = JSON_ARRAY_APPEND(COALESCE(t.`import_errors`, '[]'), '$', 'La Región no existe.')
    WHERE t.`session_id` = p_session_id AND t.region IS NOT NULL AND r.id IS NULL AND t.`import_status` = 'OK';
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
