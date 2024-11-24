/*
 Navicat Premium Data Transfer

 Source Server         : SRV_VETERINARIA
 Source Server Type    : MySQL
 Source Server Version : 100618
 Source Host           : 68.178.202.176:3306
 Source Schema         : admin_happypets

 Target Server Type    : MySQL
 Target Server Version : 100618
 File Encoding         : 65001

 Date: 23/11/2024 23:07:41
*/

CREATE DATABASE admin_happypets;

USE admin_happypets;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for archivo
-- ----------------------------
DROP TABLE IF EXISTS `archivo`;
CREATE TABLE `archivo`  (
  `ARC_ID` int NOT NULL AUTO_INCREMENT,
  `ARC_CODIGO` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `ARC_NOMBRE` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `ARC_TIPO` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `ARC_EXTENSION` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `ARC_UBICACION` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `FEC_ACTUAL` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `USU_CODIGO` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ARC_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of archivo
-- ----------------------------

-- ----------------------------
-- Table structure for cita
-- ----------------------------
DROP TABLE IF EXISTS `cita`;
CREATE TABLE `cita`  (
  `CTA_ID` int NOT NULL AUTO_INCREMENT,
  `CTA_CODIGO` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `CTA_FECHORA` datetime NULL DEFAULT NULL,
  `CTA_ESTADO` int NULL DEFAULT 1,
  `CTA_PROPIETARIO` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `EMP_ID` int NULL DEFAULT NULL,
  `FEC_ACTUAL` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `USU_CODIGO` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`CTA_ID`) USING BTREE,
  INDEX `EMP_ID`(`EMP_ID` ASC) USING BTREE,
  CONSTRAINT `cita_ibfk_1` FOREIGN KEY (`EMP_ID`) REFERENCES `empleado` (`EMP_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 181 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cita
-- ----------------------------

-- ----------------------------
-- Table structure for consulta
-- ----------------------------
DROP TABLE IF EXISTS `consulta`;
CREATE TABLE `consulta`  (
  `CON_ID` int NOT NULL AUTO_INCREMENT,
  `CON_CODIGO` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `CON_FECCONSULTA` datetime NULL DEFAULT NULL,
  `CON_SINTOMAS` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `CON_DIAGNOSTICO` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `CON_EXAMENES` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `CON_OBSERVACIONES` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `CON_PESO` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `CON_TEMPERATURA` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `CON_FRECARDIACA` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `EMP_ID` int NULL DEFAULT NULL,
  `EXP_ID` int NULL DEFAULT NULL,
  `FEC_ACTUAL` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `USU_CODIGO` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`CON_ID`) USING BTREE,
  INDEX `EMP_ID`(`EMP_ID` ASC) USING BTREE,
  INDEX `expediente_idcfk_2`(`EXP_ID` ASC) USING BTREE,
  CONSTRAINT `consulta_ibfk_1` FOREIGN KEY (`EMP_ID`) REFERENCES `empleado` (`EMP_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `expediente_idcfk_2` FOREIGN KEY (`EXP_ID`) REFERENCES `expediente` (`EXP_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of consulta
-- ----------------------------

-- ----------------------------
-- Table structure for empleado
-- ----------------------------
DROP TABLE IF EXISTS `empleado`;
CREATE TABLE `empleado`  (
  `EMP_ID` int NOT NULL AUTO_INCREMENT,
  `EMP_CODIGO` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `EMP_NOMBRE` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `EMP_APELLIDO` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `EMP_DIRECCION` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `EMP_TELEFONO` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `EMP_FECNACIMIENTO` date NULL DEFAULT NULL,
  `EMP_FECINGRESO` datetime NULL DEFAULT current_timestamp,
  `EMP_ESTADO` int NULL DEFAULT 1,
  `PUE_ID` int NULL DEFAULT NULL,
  `SUC_ID` int NULL DEFAULT NULL,
  `FEC_ACTUAL` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `USU_CODIGO` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`EMP_ID`) USING BTREE,
  INDEX `SUC_ID`(`SUC_ID` ASC) USING BTREE,
  INDEX `PUE_ID`(`PUE_ID` ASC) USING BTREE,
  CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`SUC_ID`) REFERENCES `sucursal` (`SUC_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `empleado_ibfk_2` FOREIGN KEY (`PUE_ID`) REFERENCES `puesto` (`PUE_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of empleado
-- ----------------------------
INSERT INTO `empleado` VALUES (1, '0000000001', 'Juan', 'Perez', 'Mirador de Santa Tereza, Santa tecla', '25010000', '2024-09-15', '2024-09-15 17:08:30', 1, 1, 1, '2024-09-15 18:07:22', '1');
INSERT INTO `empleado` VALUES (2, '0000000002', 'Jose Antonio', 'Lopez', 'Mejicanos, San Salvador', '79707097', '2024-09-15', '2024-09-15 17:15:50', 1, 2, 1, '2024-09-15 17:32:47', '1');
INSERT INTO `empleado` VALUES (3, '0000000003', 'Jose Manuel', 'Cañas', 'Pórticos de San Ramón, Mejicanos, San Salvador', '76000503', '2024-09-15', '2024-09-15 17:18:05', 1, 3, 1, '2024-09-15 17:32:50', '1');
INSERT INTO `empleado` VALUES (4, '0000000004', 'Pedro', 'Coral', 'Santa Tecla', '76000012', '2024-09-15', '2024-10-01 14:34:51', 1, 3, 1, '2024-10-01 14:35:24', '1');
INSERT INTO `empleado` VALUES (5, '0000000005', 'Paula', 'Davila', 'San Salvador', '76001401', '2024-09-15', '2024-10-01 14:36:20', 1, 3, 1, '2024-10-01 15:36:29', '1');
INSERT INTO `empleado` VALUES (6, '0000000006', 'José', 'Martínez', 'San Salvador, San Salvador', '7012-3456', '1993-04-15', '2024-11-21 22:58:30', 1, 2, 1, NULL, '1');
INSERT INTO `empleado` VALUES (7, '0000000007', 'Carlos', 'Hernández', 'Santa Ana, Santa Ana', '7256-7890', '1991-07-21', '2024-11-21 22:58:30', 1, 3, 1, NULL, '1');
INSERT INTO `empleado` VALUES (8, '0000000008', 'Ana', 'López', 'San Miguel, San Miguel', '6123-4567', '1995-09-10', '2024-11-21 22:58:30', 1, 2, 1, NULL, '1');
INSERT INTO `empleado` VALUES (9, '0000000009', 'María', 'González', 'La Libertad, Santa Tecla', '7456-1234', '1998-03-05', '2024-11-21 22:58:30', 1, 2, 1, NULL, '1');
INSERT INTO `empleado` VALUES (10, '0000000010', 'Juan', 'Pérez', 'Usulután, Usulután', '7689-0123', '1994-11-25', '2024-11-21 22:58:30', 1, 3, 1, NULL, '1');
INSERT INTO `empleado` VALUES (11, '0000000011', 'Luis', 'Cruz', 'Chalatenango, Chalatenango', '6543-2109', '1990-01-18', '2024-11-21 22:58:30', 1, 2, 1, NULL, '1');
INSERT INTO `empleado` VALUES (12, '0000000012', 'Rosa', 'Sánchez', 'Ahuachapán, Ahuachapán', '7234-9876', '1996-12-30', '2024-11-21 22:58:30', 1, 3, 1, NULL, '1');
INSERT INTO `empleado` VALUES (13, '0000000013', 'Carmen', 'Ramírez', 'San Salvador, Mejicanos', '7980-4321', '1992-06-22', '2024-11-21 22:58:30', 1, 2, 1, NULL, '1');
INSERT INTO `empleado` VALUES (14, '0000000014', 'Jorge', 'Ortiz', 'La Unión, La Unión', '7812-5678', '1989-05-14', '2024-11-21 22:58:30', 1, 3, 1, NULL, '1');
INSERT INTO `empleado` VALUES (15, '0000000015', 'Silvia', 'Rivera', 'Morazán, San Francisco Gotera', '7956-8745', '1997-08-03', '2024-11-21 22:58:30', 1, 2, 1, NULL, '1');
INSERT INTO `empleado` VALUES (16, '0000000016', 'David', 'Reyes', 'Cabañas, Sensuntepeque', '7023-5634', '1994-09-09', '2024-11-21 22:58:30', 1, 2, 1, NULL, '1');
INSERT INTO `empleado` VALUES (17, '0000000017', 'Francisco', 'Morales', 'Sonsonate, Sonsonate', '7189-3241', '1995-02-17', '2024-11-21 22:58:30', 1, 3, 1, NULL, '1');
INSERT INTO `empleado` VALUES (18, '0000000018', 'Karla', 'García', 'La Paz, Zacatecoluca', '7023-4532', '1993-12-01', '2024-11-21 22:58:30', 1, 2, 1, NULL, '1');
INSERT INTO `empleado` VALUES (19, '0000000019', 'Javier', 'Flores', 'Cuscatlán, Cojutepeque', '7586-3471', '1991-10-19', '2024-11-21 22:58:30', 1, 3, 1, NULL, '1');
INSERT INTO `empleado` VALUES (20, '0000000020', 'Gabriela', 'Aguilar', 'San Vicente, San Vicente', '7563-8274', '1998-04-11', '2024-11-21 22:58:30', 1, 2, 1, NULL, '1');
INSERT INTO `empleado` VALUES (21, '0000000021', 'Manuel', 'Romero', 'La Libertad, Nueva Cuscatlán', '7345-2837', '1992-07-28', '2024-11-21 22:58:30', 1, 2, 1, NULL, '1');
INSERT INTO `empleado` VALUES (22, '0000000022', 'Claudia', 'Vásquez', 'Santa Ana, Metapán', '7895-6453', '1996-01-22', '2024-11-21 22:58:30', 1, 3, 1, NULL, '1');
INSERT INTO `empleado` VALUES (23, '0000000023', 'Eduardo', 'Chávez', 'San Miguel, Moncagua', '7425-3482', '1990-09-06', '2024-11-21 22:58:30', 1, 3, 1, NULL, '1');
INSERT INTO `empleado` VALUES (24, '0000000024', 'Raúl', 'Castro', 'San Salvador, Ilopango', '7367-4821', '1995-05-30', '2024-11-21 22:59:47', 1, 2, 1, NULL, '1');
INSERT INTO `empleado` VALUES (25, '0000000025', 'Margarita', 'Mejía', 'La Libertad, Antiguo Cuscatlán', '7698-5432', '1993-02-14', '2024-11-21 22:59:47', 1, 3, 1, NULL, '1');

-- ----------------------------
-- Table structure for examen_resultado
-- ----------------------------
DROP TABLE IF EXISTS `examen_resultado`;
CREATE TABLE `examen_resultado`  (
  `EXR_ID` int NOT NULL AUTO_INCREMENT,
  `EXR_CODIGO` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `EXR_FECHORA` datetime NULL DEFAULT NULL,
  `EXR_RESULTADO` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `CON_ID` int NULL DEFAULT NULL,
  `FEC_ACTUAL` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `USU_CODIGO` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`EXR_ID`) USING BTREE,
  CONSTRAINT `examen_resultado_ibfk_1` FOREIGN KEY (`EXR_ID`) REFERENCES `consulta` (`CON_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of examen_resultado
-- ----------------------------

-- ----------------------------
-- Table structure for expediente
-- ----------------------------
DROP TABLE IF EXISTS `expediente`;
CREATE TABLE `expediente`  (
  `EXP_ID` int NOT NULL AUTO_INCREMENT,
  `MAS_ID` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `MAS_NOMBRE` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `MAS_PROPIETARIO` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `MAS_CORREO` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `MAS_GENERO` int NULL DEFAULT NULL,
  `MAS_COLOR` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `MAS_PESO` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `MAS_TEMPERATURA` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `MAS_FRECARDIACA` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `MAS_DIRECCION` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `MAS_TELEFONO` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `MAS_MEDREFERIDO` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `RAZ_ID` int NULL DEFAULT NULL,
  `FEC_ACTUAL` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `USU_CODIGO` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`EXP_ID`) USING BTREE,
  INDEX `RAZ_ID`(`RAZ_ID` ASC) USING BTREE,
  CONSTRAINT `expediente_ibfk_1` FOREIGN KEY (`RAZ_ID`) REFERENCES `raza` (`RAZ_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of expediente
-- ----------------------------
INSERT INTO `expediente` VALUES (1, '00012024', 'ANDY', 'ISRAEL OCHOA', 'israel_ochoa@hotmail.es', 1, 'NEGRO CON BLANCO', '36', '36', '75', 'LOT. SAN ANTONIO, AV. LOS ZAPOTES', '77464608', '', 11, '2024-11-23 20:54:02', '000000001');
INSERT INTO `expediente` VALUES (2, '00022024', 'KAIZALA', 'MAURICIO ALEXANDER SALVADOR QUINTANILLA MONTENEGRO', 'mauricio@ufg.com', 1, 'CHOCOLATE BLANCO', '11.55', '34', '125', 'LOS COBANOS', '22334455', 'MAURICIO ALEXANDER SALVADOR QUINTANILLA MONTENEGRO', 4, '2024-11-23 20:55:47', '000000001');
INSERT INTO `expediente` VALUES (3, '00032024', 'REX', 'RAMIRO LOPEZ', 'israel_ochoa@hotmail.es', 2, 'MARRON', '12', '36', '123', 'LOT. SAN ANTONIO, AV. LOS ZAPOTES', '2323-4567', '', 1, '2024-11-23 20:56:11', '000000001');
INSERT INTO `expediente` VALUES (4, '00042024', 'PERRY', 'LIZBETH GONZALEZ', 'israel_ochoa@hotmail.es', 1, 'BLANCO', '30', '36', '124', 'COLONIA SOLEDAD', '1234-5678', 'MANUEL PAYES', 1, '2024-11-23 20:55:45', '000000001');
INSERT INTO `expediente` VALUES (5, '00052024', 'LACY', 'ERNESTO FUENTES', 'ernesto.fuentes@yahoo.com', 2, 'AMARILLO', '35', '23', '140', 'COLONIA MADRESELVA ANTIGUO CUSCATLAN', '34561243', 'KEVIN SOTO', 1, '2024-11-23 20:55:44', '000000001');
INSERT INTO `expediente` VALUES (6, '00062024', 'PANCHITO', 'MELANIE VALLE', 'israel_ochoa@hotmail.es', 1, 'VERDE', '30', '60', '80', 'LOT. SAN ANTONIO, AV. LOS ZAPOTES', '9685-7412', '', 1, '2024-11-23 20:55:43', '000000001');
INSERT INTO `expediente` VALUES (9, '00072024', 'MADDIE', 'KEVIN MENJIVAR', 'ejemplo@mail.com', 1, 'NEGRO', '2', '36', '110', 'LOT. SAN ANTONIO, AV. LOS ZAPOTES', '22222222', '', 1, '2024-11-23 20:55:42', '000000001');
INSERT INTO `expediente` VALUES (10, '00082024', 'AURO', 'ISRAEL OCHOA', 'israel_ochoa@hotmail.es', 1, 'NEGRO Y BLANCO', '50', '42', '75', 'LOT. SAN ANTONIO, AV. LOS ZAPOTES', '7746-4608', '', 1, '2024-11-11 20:40:58', '000000001');
INSERT INTO `expediente` VALUES (11, '00092024', 'KAPIRO', 'ISRAEL OCHOA', 'israel_ochoa@hotmail.es', 1, 'BLANCO', '35', '45', '75', 'LOT. SAN ANTONIO, AV. LOS ZAPOTES', '7746-4608', 'JUAN PEREZ', 1, '2024-11-11 20:43:26', '000000001');
INSERT INTO `expediente` VALUES (12, '00102024', 'JASON', 'JORGE', 'israel_ochoa@hotmail.es', 1, 'NEGRO', '5', '110', '123', 'LOT. SAN ANTONIO, AV. LOS ZAPOTES', '22202020', 'ALBERTO FERNANDEZ', 1, '2024-11-23 20:54:49', '000000002');
INSERT INTO `expediente` VALUES (13, '00112024', 'BETO', 'FAUSTO SANDOVAL', 'beto@gmail.com', 1, 'BLANCO', '60', '45', '80', 'LOT. SAN ANTONIO, AV. LOS ZAPOTES', '7127-8008', '', 1, '2024-11-23 20:54:53', '000000001');
INSERT INTO `expediente` VALUES (15, '00122024', 'NINA', 'KEVIN MENJIVAR', 'israel_ochoa@hotmail.es', 2, 'BLANCO', '4', '36', '110', 'LOT. SAN ANTONIO, AV. LOS ZAPOTES', '76865700', '', 7, '2024-11-23 20:54:55', '000000002');
INSERT INTO `expediente` VALUES (17, '00132024', 'DUKE', 'DANIEL', 'danielofigueroad@gmail.com', 1, 'CAFE', '30', '27', '125', 'B SAN SEBASTIAN ARMENIA', '2222-2222', '', 1, '2024-11-23 20:55:34', '000000002');
INSERT INTO `expediente` VALUES (18, '00142024', 'NINJA', 'FRED', 'israel_ochoa@hotmail.es', 1, 'AMARILLO', '26', '25', '120', 'B SAN SEBASTIAN ARMENIA', '2323-2323', '', 4, '2024-11-23 20:55:15', '000000002');
INSERT INTO `expediente` VALUES (19, '00152024', 'KITTY', 'DENNIS', 'dennis@gmail.com', 2, 'BLANCO', '25.00', '25', '110', 'B SAN SEBASTIAN ARMENIA', '2222-2222', '', 9, '2024-11-23 20:55:17', '000000001');

-- ----------------------------
-- Table structure for horarios_citas
-- ----------------------------
DROP TABLE IF EXISTS `horarios_citas`;
CREATE TABLE `horarios_citas`  (
  `HOC_ID` int NOT NULL AUTO_INCREMENT,
  `HOC_HORARIO` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`HOC_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of horarios_citas
-- ----------------------------
INSERT INTO `horarios_citas` VALUES (1, '08:00');
INSERT INTO `horarios_citas` VALUES (2, '09:00');
INSERT INTO `horarios_citas` VALUES (3, '10:00');
INSERT INTO `horarios_citas` VALUES (4, '11:00');
INSERT INTO `horarios_citas` VALUES (5, '01:00');
INSERT INTO `horarios_citas` VALUES (6, '02:00');
INSERT INTO `horarios_citas` VALUES (7, '03:00');
INSERT INTO `horarios_citas` VALUES (8, '04:00');

-- ----------------------------
-- Table structure for modulo
-- ----------------------------
DROP TABLE IF EXISTS `modulo`;
CREATE TABLE `modulo`  (
  `MOD_ID` int NOT NULL AUTO_INCREMENT,
  `MOD_CODIGO` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `MOD_NOMBRE` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `FEC_ACTUAL` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `USU_CODIGO` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`MOD_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of modulo
-- ----------------------------
INSERT INTO `modulo` VALUES (1, '0000000001', 'Expediente', '2024-09-16 22:49:52', '1');

-- ----------------------------
-- Table structure for modulo_opcion
-- ----------------------------
DROP TABLE IF EXISTS `modulo_opcion`;
CREATE TABLE `modulo_opcion`  (
  `MOP_ID` int NOT NULL AUTO_INCREMENT,
  `MOD_ID` int NULL DEFAULT NULL,
  `OPC_ID` int NULL DEFAULT NULL,
  `MOP_ESTADO` int NULL DEFAULT 1,
  `FEC_ACTUAL` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `USU_CODIGO` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`MOP_ID`) USING BTREE,
  INDEX `OPC_ID`(`OPC_ID` ASC) USING BTREE,
  INDEX `MOD_ID`(`MOD_ID` ASC) USING BTREE,
  CONSTRAINT `modulo_opcion_ibfk_1` FOREIGN KEY (`OPC_ID`) REFERENCES `opcion` (`OPC_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `modulo_opcion_ibfk_2` FOREIGN KEY (`MOD_ID`) REFERENCES `modulo` (`MOD_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of modulo_opcion
-- ----------------------------
INSERT INTO `modulo_opcion` VALUES (1, 1, 1, 1, '2024-09-16 23:50:45', '1');
INSERT INTO `modulo_opcion` VALUES (2, 1, 2, 1, '2024-09-16 23:51:27', '1');
INSERT INTO `modulo_opcion` VALUES (3, 1, 3, 1, '2024-09-16 23:51:27', '1');
INSERT INTO `modulo_opcion` VALUES (4, 1, 4, 1, '2024-09-16 23:51:27', '1');
INSERT INTO `modulo_opcion` VALUES (5, 1, 5, 1, '2024-09-16 23:51:27', '1');

-- ----------------------------
-- Table structure for opcion
-- ----------------------------
DROP TABLE IF EXISTS `opcion`;
CREATE TABLE `opcion`  (
  `OPC_ID` int NOT NULL AUTO_INCREMENT,
  `OPC_CODIGO` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `OPC_NOMBRE` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `FEC_ACTUAL` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `USU_CODIGO` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`OPC_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of opcion
-- ----------------------------
INSERT INTO `opcion` VALUES (1, '0000000001', 'View', '2024-09-16 22:48:35', '1');
INSERT INTO `opcion` VALUES (2, '0000000002', 'Show', '2024-09-16 23:45:57', '1');
INSERT INTO `opcion` VALUES (3, '0000000003', 'Add', '2024-09-16 23:45:57', '1');
INSERT INTO `opcion` VALUES (4, '0000000004', 'Edit', '2024-09-16 23:45:57', '1');
INSERT INTO `opcion` VALUES (5, '0000000005', 'Del', '2024-09-16 23:45:57', '1');
INSERT INTO `opcion` VALUES (6, '0000000006', 'Proc', '2024-09-16 23:45:57', '1');
INSERT INTO `opcion` VALUES (7, '0000000007', 'Exec', '2024-09-16 23:45:57', '1');

-- ----------------------------
-- Table structure for permiso
-- ----------------------------
DROP TABLE IF EXISTS `permiso`;
CREATE TABLE `permiso`  (
  `ROL_ID` int NULL DEFAULT NULL,
  `MOP_ID` int NULL DEFAULT NULL,
  `PER_ESTADO` int NULL DEFAULT 1,
  `FEC_ACTUAL` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `USU_CODIGO` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  INDEX `MOP_ID`(`MOP_ID` ASC) USING BTREE,
  INDEX `ROL_ID`(`ROL_ID` ASC) USING BTREE,
  CONSTRAINT `permiso_ibfk_1` FOREIGN KEY (`MOP_ID`) REFERENCES `modulo_opcion` (`MOP_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `permiso_ibfk_2` FOREIGN KEY (`ROL_ID`) REFERENCES `rol` (`ROL_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permiso
-- ----------------------------
INSERT INTO `permiso` VALUES (1, 1, 1, '2024-09-16 23:53:48', '1');
INSERT INTO `permiso` VALUES (1, 2, 1, '2024-09-16 23:53:48', '1');
INSERT INTO `permiso` VALUES (1, 3, 1, '2024-09-16 23:53:48', '1');
INSERT INTO `permiso` VALUES (1, 4, 1, '2024-09-16 23:53:48', '1');
INSERT INTO `permiso` VALUES (1, 5, 0, '2024-09-16 23:53:48', '1');
INSERT INTO `permiso` VALUES (2, 1, 1, '2024-09-16 23:53:48', '1');
INSERT INTO `permiso` VALUES (2, 2, 1, '2024-09-16 23:53:48', '1');
INSERT INTO `permiso` VALUES (2, 3, 1, '2024-09-16 23:53:48', '1');
INSERT INTO `permiso` VALUES (2, 4, 1, '2024-09-16 23:53:48', '1');
INSERT INTO `permiso` VALUES (2, 5, 0, '2024-09-16 23:53:48', '1');
INSERT INTO `permiso` VALUES (3, 1, 1, '2024-09-16 23:53:48', '1');
INSERT INTO `permiso` VALUES (3, 2, 1, '2024-09-16 23:53:48', '1');
INSERT INTO `permiso` VALUES (3, 3, 0, '2024-09-16 23:53:48', '1');
INSERT INTO `permiso` VALUES (3, 4, 0, '2024-09-16 23:53:48', '1');
INSERT INTO `permiso` VALUES (3, 5, 0, '2024-09-16 23:53:48', '1');

-- ----------------------------
-- Table structure for puesto
-- ----------------------------
DROP TABLE IF EXISTS `puesto`;
CREATE TABLE `puesto`  (
  `PUE_ID` int NOT NULL AUTO_INCREMENT,
  `PUE_CODIGO` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `PUE_NOMBRE` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `PUE_DESCRIPCION` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `PUE_FECCREACION` datetime NULL DEFAULT current_timestamp,
  `FEC_ACTUAL` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `USU_CODIGO` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`PUE_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of puesto
-- ----------------------------
INSERT INTO `puesto` VALUES (1, '0000000001', 'Dueño', 'Dueño de la Veterinaria', '2024-09-15 17:54:33', '2024-09-15 17:54:33', '1');
INSERT INTO `puesto` VALUES (2, '0000000002', 'Asistente Administrativo', 'Personal encargado de gestiones administrativas', '2024-09-15 17:54:33', '2024-09-15 16:55:44', '1');
INSERT INTO `puesto` VALUES (3, '0000000003', 'Veterinario', 'Doctores en Veterinarios', '2024-09-15 16:56:17', '2024-09-15 16:56:17', '1');

-- ----------------------------
-- Table structure for raza
-- ----------------------------
DROP TABLE IF EXISTS `raza`;
CREATE TABLE `raza`  (
  `RAZ_ID` int NOT NULL AUTO_INCREMENT,
  `RAZ_CODIGO` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `RAZ_NOMBRE` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `RAZ_DESCRIPCION` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `TIM_ID` int NULL DEFAULT NULL,
  `FEC_ACTUAL` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `USU_CODIGO` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`RAZ_ID`) USING BTREE,
  INDEX `TIM_ID`(`TIM_ID` ASC) USING BTREE,
  CONSTRAINT `raza_ibfk_1` FOREIGN KEY (`TIM_ID`) REFERENCES `tipo_mascota` (`TIM_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of raza
-- ----------------------------
INSERT INTO `raza` VALUES (1, '0000000001', 'LABRADOR', 'PERRO', 1, '2024-10-06 06:05:28', '1');
INSERT INTO `raza` VALUES (2, '0000000002', 'PASTOR ALEMAN', 'PERRO', 1, '2024-10-06 06:05:33', '1');
INSERT INTO `raza` VALUES (3, '0000000003', 'BULLDOG', 'PERRO', 1, '2024-10-06 06:05:35', '1');
INSERT INTO `raza` VALUES (4, '0000000004', 'GOLDEN RETRIEVER', 'PERRO', 1, '2024-10-06 06:05:37', '1');
INSERT INTO `raza` VALUES (5, '0000000005', 'BEAGLE', 'PERRO', 1, '2024-10-06 06:05:39', '1');
INSERT INTO `raza` VALUES (6, '0000000006', 'PERSA', 'GATO', 2, '2024-10-06 06:05:42', '1');
INSERT INTO `raza` VALUES (7, '0000000007', 'SIAMES', 'GATO', 2, '2024-10-06 06:05:44', '1');
INSERT INTO `raza` VALUES (8, '0000000008', 'MAINE COON', 'GATO', 2, '2024-10-06 06:05:46', '1');
INSERT INTO `raza` VALUES (9, '0000000009', 'BENGALI', 'GATO', 2, '2024-10-06 06:05:47', '1');
INSERT INTO `raza` VALUES (10, '0000000010', 'SPHYNX', 'GATO', 2, '2024-10-06 06:05:49', '1');
INSERT INTO `raza` VALUES (11, '0000000011', 'FRENCH', 'PERRO', 1, '2024-11-23 20:58:14', '1');

-- ----------------------------
-- Table structure for rol
-- ----------------------------
DROP TABLE IF EXISTS `rol`;
CREATE TABLE `rol`  (
  `ROL_ID` int NOT NULL AUTO_INCREMENT,
  `ROL_CODIGO` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `ROL_NOMBRE` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `ROL_DESCRIPCION` varchar(75) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `FEC_ACTUAL` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `USU_CODIGO` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ROL_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rol
-- ----------------------------
INSERT INTO `rol` VALUES (1, '0000000001', 'Admin', 'Rol Administrativo para dueño de la veterinaria.', '2024-09-15 17:33:25', '1');
INSERT INTO `rol` VALUES (2, '0000000002', 'Asistente', 'Rol Asistente para los asistentes administrativos de la veterinaria.', '2024-09-15 15:36:06', '1');
INSERT INTO `rol` VALUES (3, '0000000003', 'Veterinario', 'Rol asignado a los Veterinarios', '2024-09-15 16:40:39', '1');

-- ----------------------------
-- Table structure for sucursal
-- ----------------------------
DROP TABLE IF EXISTS `sucursal`;
CREATE TABLE `sucursal`  (
  `SUC_ID` int NOT NULL AUTO_INCREMENT,
  `SUC_CODIGO` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `SUC_NOMBRE` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `SUC_DIRECCION` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `SUC_TELEFONO` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `FEC_ACTUAL` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `USU_CODIGO` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`SUC_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sucursal
-- ----------------------------
INSERT INTO `sucursal` VALUES (1, '0000000001', 'La Mascota', 'Calle La mascota, San Salvador', '2525 2500', '2024-09-15 18:05:44', '1');

-- ----------------------------
-- Table structure for tipo_mascota
-- ----------------------------
DROP TABLE IF EXISTS `tipo_mascota`;
CREATE TABLE `tipo_mascota`  (
  `TIM_ID` int NOT NULL AUTO_INCREMENT,
  `TIM_CODIGO` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `TIM_GRUPO` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `TIM_DESCRIPCION` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `FEC_ACTUAL` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `USU_CODIGO` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`TIM_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tipo_mascota
-- ----------------------------
INSERT INTO `tipo_mascota` VALUES (1, '0000000001', 'CANINO', 'Grupo familiar para perros', '2024-09-21 22:26:51', NULL);
INSERT INTO `tipo_mascota` VALUES (2, '0000000002', 'FELINO', 'Grupo familiar para gatos', '2024-09-21 22:26:51', NULL);

-- ----------------------------
-- Table structure for tratamiento
-- ----------------------------
DROP TABLE IF EXISTS `tratamiento`;
CREATE TABLE `tratamiento`  (
  `TRT_ID` int NOT NULL AUTO_INCREMENT,
  `TRT_CODIGO` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `TRT_MEDICAMENTO` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `TRT_DOSIS` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `TRT_FRECUENCIA` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `TRT_DURACION` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `TRT_FECINICIO` datetime NULL DEFAULT NULL,
  `CON_ID` int NULL DEFAULT NULL,
  `FEC_ACTUAL` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `USU_CODIGO` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`TRT_ID`) USING BTREE,
  CONSTRAINT `tratamiento_ibfk_1` FOREIGN KEY (`TRT_ID`) REFERENCES `consulta` (`CON_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tratamiento
-- ----------------------------

-- ----------------------------
-- Table structure for usuario
-- ----------------------------
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario`  (
  `USU_ID` int NOT NULL AUTO_INCREMENT,
  `USU_CORRELATIVO` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `USU_EMAIL` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `USU_PASSWORD` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `USU_ESTADO` int NULL DEFAULT 1,
  `EMP_ID` int NULL DEFAULT NULL,
  `ARC_ID` int NULL DEFAULT NULL,
  `ROL_ID` int NULL DEFAULT NULL,
  `FEC_CREACION` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `FEC_ACTUAL` datetime NULL DEFAULT NULL,
  `USU_CODIGO` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`USU_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of usuario
-- ----------------------------
INSERT INTO `usuario` VALUES (1, '000000001', 'juan.perez@gmail.com', 'e43df9b5a46b755ea8f1b4dd08265544 ', 1, 1, NULL, 1, '2024-10-01 23:56:10', '2024-09-15 18:18:23', '1');
INSERT INTO `usuario` VALUES (2, '000000002', 'jose.lopez@gmail.com', 'e43df9b5a46b755ea8f1b4dd08265544', 1, 2, NULL, 2, '2024-10-03 00:22:41', '2024-09-15 18:18:23', '1');
INSERT INTO `usuario` VALUES (3, '000000003', 'jose.canas@gmail.com', 'e43df9b5a46b755ea8f1b4dd08265544', 1, 3, NULL, 3, '2024-10-01 23:56:20', '2024-09-15 18:18:23', '1');

-- ----------------------------
-- Function structure for Generar_CodigoExpediente
-- ----------------------------
DROP FUNCTION IF EXISTS `Generar_CodigoExpediente`;
delimiter ;;
CREATE FUNCTION `Generar_CodigoExpediente`()
 RETURNS varchar(8) CHARSET utf8mb3 COLLATE utf8mb3_general_ci
BEGIN
    DECLARE nuevoCodigo VARCHAR(8);
    DECLARE correlativo INT;
    DECLARE anoActual CHAR(4);
    
    -- Obtiene el año actual
    SET anoActual = YEAR(CURDATE());
    
    -- Obtiene el último correlativo usado en el año actual
    SELECT IFNULL(MAX(CAST(SUBSTRING(MAS_ID, 1, 4) AS UNSIGNED)), 0) + 1 
    INTO correlativo
    FROM Expediente
    WHERE SUBSTRING(MAS_ID, 5, 4) = anoActual;

    -- Genera el nuevo código de expediente concatenando el correlativo y el año
    SET nuevoCodigo = CONCAT(LPAD(correlativo, 4, '0'), anoActual);
    
    RETURN nuevoCodigo;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_add_cita
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_add_cita`;
delimiter ;;
CREATE PROCEDURE `sp_add_cita`()

;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_add_consulta
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_add_consulta`;
delimiter ;;
CREATE PROCEDURE `sp_add_consulta`(IN p_EMP_ID INT, 
		IN p_EXP_ID INT,
		IN p_CON_SINTOMAS VARCHAR(100),
    IN p_CON_DIAGNOSTICO VARCHAR(150),
    IN p_CON_EXAMENES VARCHAR(150),
    IN p_CON_OBSERVACIONES VARCHAR(100),
		IN p_CON_PESO VARCHAR(20),
		IN p_CON_TEMPERATURA VARCHAR(3),
		IN p_CON_FRECARDIACA VARCHAR(3),
    IN p_USU_CODIGO VARCHAR(10),
    OUT `p_INSERT_RESPONSE` VARCHAR(50))
BEGIN
		DECLARE R_COUNT INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION  -- Manejador de errores SQL
    BEGIN
        -- En caso de error, devolvemos un mensaje de error y ponemos el ID en NULL
        SET p_INSERT_RESPONSE = 'Error al guardar consulta medica';
        ROLLBACK;  -- Deshacemos cualquier cambio si hay un error
    END;

    START TRANSACTION;  -- Inicia la transacción
		-- Intentamos hacer update
		INSERT INTO consulta (
        CON_FECCONSULTA, CON_SINTOMAS, CON_DIAGNOSTICO, CON_EXAMENES, CON_OBSERVACIONES, CON_PESO, CON_TEMPERATURA, CON_FRECARDIACA, EMP_ID, EXP_ID, 
        FEC_ACTUAL, USU_CODIGO
    ) VALUES (
        NOW(), p_CON_SINTOMAS, p_CON_DIAGNOSTICO, p_CON_EXAMENES, p_CON_OBSERVACIONES, p_CON_PESO, p_CON_TEMPERATURA, p_CON_FRECARDIACA, 
        p_EMP_ID, p_EXP_ID, NOW(), p_USU_CODIGO
    );

		
		SET R_COUNT=0;
		SET R_COUNT = ROW_COUNT();
		
		IF R_COUNT > 0 THEN
      SET p_INSERT_RESPONSE = 'Consulta medica guardada exitosamente';
		ELSEIF R_COUNT = 0 THEN
      SET p_INSERT_RESPONSE = 'No se pudo guardar consulta medica';
    END IF;

    COMMIT;  -- Confirma la transacción si no hay errores

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_add_examen_resultado
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_add_examen_resultado`;
delimiter ;;
CREATE PROCEDURE `sp_add_examen_resultado`(IN p_CON_ID INT, 
		IN p_EXR_RESULTADO VARCHAR(100),
    IN p_USU_CODIGO VARCHAR(10),
    OUT `p_INSERT_RESPONSE` VARCHAR(50))
BEGIN
		DECLARE R_COUNT INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION  -- Manejador de errores SQL
    BEGIN
        -- En caso de error, devolvemos un mensaje de error y ponemos el ID en NULL
        SET p_INSERT_RESPONSE = 'Error al guardar resultado de examen';
        ROLLBACK;  -- Deshacemos cualquier cambio si hay un error
    END;

    START TRANSACTION;  -- Inicia la transacción
		-- Intentamos hacer update
		INSERT INTO examen_resultado (
        EXR_FECHORA, EXR_RESULTADO, CON_ID, 
        FEC_ACTUAL, USU_CODIGO
    ) VALUES (
        NOW(), p_EXR_RESULTADO, p_CON_ID, NOW(), p_USU_CODIGO
    );

		
		SET R_COUNT=0;
		SET R_COUNT = ROW_COUNT();
		
		IF R_COUNT > 0 THEN
      SET p_INSERT_RESPONSE = 'Resultado de examen guardado exitosamente';
		ELSEIF R_COUNT = 0 THEN
      SET p_INSERT_RESPONSE = 'No se pudo guardar resultado de examen';
    END IF;

    COMMIT;  -- Confirma la transacción si no hay errores

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_add_expediente
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_add_expediente`;
delimiter ;;
CREATE PROCEDURE `sp_add_expediente`(IN p_MAS_NOMBRE VARCHAR(50),
    IN p_MAS_PROPIETARIO VARCHAR(50),
    IN p_MAS_CORREO VARCHAR(50),
    IN p_MAS_GENERO INT,
    IN p_MAS_COLOR VARCHAR(25),
    IN p_MAS_PESO VARCHAR(20),
    IN p_MAS_TEMPERATURA VARCHAR(3),
    IN p_MAS_FRECARDIACA VARCHAR(3),
    IN p_MAS_DIRECCION VARCHAR(50),
    IN p_MAS_TELEFONO VARCHAR(10),
    IN p_MAS_MEDREFERIDO VARCHAR(50),
    IN p_RAZ_ID INT,
    IN p_USU_CODIGO VARCHAR(10),
		OUT `p_MAS_ID` VARCHAR(8), 
    OUT `p_INSERT_RESPONSE` VARCHAR(50))
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION  -- Manejador de errores SQL
    BEGIN
        -- En caso de error, devolvemos un mensaje de error y ponemos el ID en NULL
        SET p_INSERT_RESPONSE = 'Error al guardar expediente';
        SET p_MAS_ID = NULL;
        ROLLBACK;  -- Deshacemos cualquier cambio si hay un error
    END;

    START TRANSACTION;  -- Inicia la transacción

    -- Intentamos hacer el insert
    INSERT INTO expediente (
        MAS_ID, MAS_NOMBRE, MAS_PROPIETARIO, MAS_CORREO, MAS_GENERO, MAS_COLOR, MAS_PESO, 
        MAS_TEMPERATURA, MAS_FRECARDIACA, MAS_DIRECCION, MAS_TELEFONO, 
        MAS_MEDREFERIDO, RAZ_ID, FEC_ACTUAL, USU_CODIGO
    ) VALUES (
        Generar_CodigoExpediente(), p_MAS_NOMBRE, p_MAS_PROPIETARIO, p_MAS_CORREO, p_MAS_GENERO, p_MAS_COLOR, 
        p_MAS_PESO, p_MAS_TEMPERATURA, p_MAS_FRECARDIACA, p_MAS_DIRECCION, 
        p_MAS_TELEFONO, p_MAS_MEDREFERIDO, p_RAZ_ID, NOW(), p_USU_CODIGO
    );

    -- Si todo sale bien, establecemos el último ID insertado y el mensaje de éxito
		SELECT MAS_ID INTO p_MAS_ID
    FROM expediente
    WHERE EXP_ID = LAST_INSERT_ID();
    SET p_INSERT_RESPONSE = 'Expediente creado exitosamente';

    COMMIT;  -- Confirma la transacción si no hay errores

END

-- BackUp 05/10 KMenjivar
/*BEGIN
    INSERT INTO expediente (
        MAS_ID, MAS_NOMBRE, MAS_PROPIETARIO, MAS_CORREO, MAS_GENERO, MAS_COLOR, MAS_PESO, 
        MAS_TEMPERATURA, MAS_FRECARDIACA, MAS_DIRECCION, MAS_TELEFONO, 
        MAS_MEDREFERIDO, RAZ_ID, FEC_ACTUAL, USU_CODIGO
    ) VALUES (
        Generar_CodigoExpediente(), p_MAS_NOMBRE, p_MAS_PROPIETARIO, p_MAS_CORREO, p_MAS_GENERO, p_MAS_COLOR, 
        p_MAS_PESO, p_MAS_TEMPERATURA, p_MAS_FRECARDIACA, p_MAS_DIRECCION, 
        p_MAS_TELEFONO, p_MAS_MEDREFERIDO, p_RAZ_ID, NOW(), p_USU_CODIGO
    );
END*/
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_add_rol
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_add_rol`;
delimiter ;;
CREATE PROCEDURE `sp_add_rol`(IN p_ROL_NOMBRE VARCHAR(50),
    IN p_ROL_DESCRIPCION VARCHAR(75),
    IN p_USU_CODIGO VARCHAR(10),
    OUT `p_INSERT_RESPONSE` VARCHAR(50))
BEGIN
		DECLARE R_COUNT INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION  -- Manejador de errores SQL
    BEGIN
        -- En caso de error, devolvemos un mensaje de error y ponemos el ID en NULL
        SET p_INSERT_RESPONSE = 'Error al guardar rol de usuario';
        ROLLBACK;  -- Deshacemos cualquier cambio si hay un error
    END;

	IF (SELECT COUNT(r.ROL_ID) FROM rol r WHERE r.ROL_NOMBRE = p_ROL_NOMBRE) = 0 THEN
    START TRANSACTION;  -- Inicia la transacción
		-- Intentamos hacer insert
		INSERT INTO rol (
        ROL_NOMBRE, ROL_DESCRIPCION, 
        FEC_ACTUAL, USU_CODIGO
    ) VALUES (
        p_ROL_NOMBRE, p_ROL_DESCRIPCION, NOW(), p_USU_CODIGO
    );

		
		SET R_COUNT=0;
		SET R_COUNT = ROW_COUNT();
		
		IF R_COUNT > 0 THEN
      SET p_INSERT_RESPONSE = 'Rol de usuario guardado exitosamente';
		ELSEIF R_COUNT = 0 THEN
      SET p_INSERT_RESPONSE = 'No se pudo guardar rol de usuario';
    END IF;

    COMMIT;  -- Confirma la transacción si no hay errores
		
		ELSE
		  SET p_INSERT_RESPONSE = 'Ya existe un rol con el mismo nombre';
		END IF;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_add_tratamiento
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_add_tratamiento`;
delimiter ;;
CREATE PROCEDURE `sp_add_tratamiento`(IN p_CON_ID INT, 
		IN p_TRT_MEDICAMENTO VARCHAR(100),
    IN p_TRT_DOSIS VARCHAR(50),
    IN p_TRT_FRECUENCIA VARCHAR(50),
    IN p_TRT_DURACION VARCHAR(50),
		IN p_TRT_FECINICIO DATETIME,
    IN p_USU_CODIGO VARCHAR(10),
    OUT `p_INSERT_RESPONSE` VARCHAR(50))
BEGIN
		DECLARE R_COUNT INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION  -- Manejador de errores SQL
    BEGIN
        -- En caso de error, devolvemos un mensaje de error y ponemos el ID en NULL
        SET p_INSERT_RESPONSE = 'Error al guardar tratamiento medico';
        ROLLBACK;  -- Deshacemos cualquier cambio si hay un error
    END;

    START TRANSACTION;  -- Inicia la transacción
		-- Intentamos hacer update
		INSERT INTO tratamiento (
        TRT_MEDICAMENTO, TRT_DOSIS, TRT_FRECUENCIA, TRT_DURACION, TRT_FECINICIO, CON_ID, 
        FEC_ACTUAL, USU_CODIGO
    ) VALUES (
        p_TRT_MEDICAMENTO, p_TRT_DOSIS, p_TRT_FRECUENCIA, p_TRT_DURACION, 
        p_TRT_FECINICIO, p_CON_ID, NOW(), p_USU_CODIGO
    );

		
		SET R_COUNT=0;
		SET R_COUNT = ROW_COUNT();
		
		IF R_COUNT > 0 THEN
      SET p_INSERT_RESPONSE = 'Tratamiento medico guardado exitosamente';
		ELSEIF R_COUNT = 0 THEN
      SET p_INSERT_RESPONSE = 'No se pudo guardar tratamiento medico';
    END IF;

    COMMIT;  -- Confirma la transacción si no hay errores

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_add_usuario
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_add_usuario`;
delimiter ;;
CREATE PROCEDURE `sp_add_usuario`(IN p_USU_EMAIL VARCHAR(50),
    IN p_USU_PASSWORD VARCHAR(100),
		IN p_USU_ESTADO INT,
		IN p_EMP_ID INT,
		IN p_ARC_ID INT,
		IN p_ROL_ID INT,
    IN p_USU_CODIGO VARCHAR(10),
    OUT `p_INSERT_RESPONSE` VARCHAR(50))
BEGIN
		DECLARE R_COUNT INT;
		DECLARE v_ARC_ID INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION  -- Manejador de errores SQL
    BEGIN
        -- En caso de error, devolvemos un mensaje de error y ponemos el ID en NULL
        SET p_INSERT_RESPONSE = 'Error al guardar usuario';
        ROLLBACK;  -- Deshacemos cualquier cambio si hay un error
    END;

    START TRANSACTION;  -- Inicia la transacción
		IF p_ARC_ID = -1 THEN
        SET v_ARC_ID = NULL; -- Si p_ARC_ID es -1, establecer NULL
    ELSE
        SET v_ARC_ID = p_ARC_ID; -- Caso contrario, usar el valor proporcionado
    END IF;
		-- Intentamos hacer insert
		INSERT INTO usuario (
        USU_EMAIL, USU_PASSWORD, USU_ESTADO, EMP_ID, ARC_ID, ROL_ID,
        FEC_CREACION, FEC_ACTUAL, USU_CODIGO
    ) VALUES (
        p_USU_EMAIL, MD5(p_USU_PASSWORD), p_USU_ESTADO, p_EMP_ID, v_ARC_ID, p_ROL_ID, NOW(), NOW(), p_USU_CODIGO
    );

		
		SET R_COUNT=0;
		SET R_COUNT = ROW_COUNT();
		
		IF R_COUNT > 0 THEN
      SET p_INSERT_RESPONSE = 'Usuario guardado exitosamente';
		ELSEIF R_COUNT = 0 THEN
      SET p_INSERT_RESPONSE = 'No se pudo guardar usuario';
    END IF;

    COMMIT;  -- Confirma la transacción si no hay errores

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_busqueda_cita
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_busqueda_cita`;
delimiter ;;
CREATE PROCEDURE `sp_busqueda_cita`(in p_fecha DATETIME,
    IN p_hora TIME,
    IN p_propietario VARCHAR(50),
		IN p_estado VARCHAR(1))
BEGIN
SELECT
				CTA_ID AS id,
        DATE(CTA_FECHORA) AS fecha,
        TIME(CTA_FECHORA) AS hora,
        CTA_PROPIETARIO as propietario,
				empleado.EMP_ID as veterinarioId,
        concat(empleado.EMP_NOMBRE,' ',empleado.EMP_APELLIDO) as veterinario,
				CTA_ESTADO as estado
    FROM
        cita
        inner join empleado on empleado.EMP_ID = cita.EMP_ID
    WHERE
        (DATE(CTA_FECHORA) = DATE(p_fecha) OR p_fecha IS NULL)
        AND (TIME(CTA_FECHORA) = p_hora OR p_hora IS NULL)
        AND (CTA_PROPIETARIO LIKE CONCAT('%', p_propietario, '%') OR p_propietario IS NULL)
				AND CTA_ESTADO like CONCAT('%',p_estado,'%');
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_busqueda_expediente
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_busqueda_expediente`;
delimiter ;;
CREATE PROCEDURE `sp_busqueda_expediente`(in p_MAS_ID VARCHAR(8),
    IN p_MAS_NOMBRE VARCHAR(50),
    IN p_PROPIETARIO VARCHAR(50))
BEGIN
SELECT
				MAS_ID AS masId,
        MAS_NOMBRE AS masNombre,
        tipo_mascota.TIM_GRUPO AS timGrupo,
        raza.RAZ_NOMBRE as razNombre,
        MAS_COLOR as masColor,
				MAS_PROPIETARIO as masPropietario,
				EXP_ID as expId, 
				MAS_GENERO as masGenero, 
				MAS_PESO as masPeso, 
				MAS_TEMPERATURA as masTemperatura, 
				MAS_FRECARDIACA as masFrecardiaca, 
				MAS_DIRECCION as masDireccion, 
				MAS_TELEFONO as masTelefono, 
        MAS_MEDREFERIDO as masMedReferido, 
				MAS_CORREO as masCorreo,
				raza.RAZ_ID as razId
    FROM
        expediente
        inner join raza on raza.RAZ_ID = expediente.RAZ_ID
				inner join tipo_mascota on tipo_mascota.TIM_ID = raza.TIM_ID
    WHERE 
				MAS_ID LIKE CONCAT('%', p_MAS_ID, '%')
				AND MAS_NOMBRE LIKE CONCAT('%', p_MAS_NOMBRE, '%')
        AND MAS_PROPIETARIO LIKE CONCAT('%', p_PROPIETARIO, '%');
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_cancelar_cita
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_cancelar_cita`;
delimiter ;;
CREATE PROCEDURE `sp_cancelar_cita`(IN `p_CTA_ID` INT, IN `p_USU_CODIGO` VARCHAR(10), OUT `p_RESPUESTA` VARCHAR(2))
BEGIN
		DECLARE R_COUNT INT;
    -- Verifica si la cita está activa (estado 1) antes de intentar cancelarla
    IF (SELECT CTA_ESTADO FROM Cita WHERE CTA_ID = p_CTA_ID) = 1 THEN
        -- Actualiza el estado de la cita a 2 (Cancelado), la fecha actual, y el usuario que cancela
        UPDATE Cita
        SET CTA_ESTADO = 2,      -- Cambiar el estado a 'Cancelado'
            FEC_ACTUAL = NOW(),  -- Actualizar la fecha actual
            USU_CODIGO = p_USU_CODIGO  -- Registrar el código del usuario que canceló
        WHERE CTA_ID = p_CTA_ID
				AND NOW() <= CTA_FECHORA; 

				SET R_COUNT=0;
				SET R_COUNT = ROW_COUNT();
		
				IF R_COUNT > 0 THEN
					  -- Respuesta exitosa
						SET p_RESPUESTA = '00';
				ELSEIF R_COUNT = 0 THEN
					   -- Respuesta fallida
            SET p_RESPUESTA = '01';
				END IF;
    ELSE
        -- Si la cita no está activa o no existe, se envía una respuesta fallida
        SET p_RESPUESTA = '01';
    END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_get_cita_disponible
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_get_cita_disponible`;
delimiter ;;
CREATE PROCEDURE `sp_get_cita_disponible`()

;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_get_empleados
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_get_empleados`;
delimiter ;;
CREATE PROCEDURE `sp_get_empleados`(IN `p_INCLUIR` INT)
BEGIN
-- p_INCLUIR bandera para obtener empleados que ya poseen usuario creado en la plataforma en la lista de resultados 
-- 0 -> no incluye empleados con usuario 1 -> incluye empleados con usuario

IF p_INCLUIR = 0 THEN
SELECT empleado.EMP_ID as empId, empleado.EMP_NOMBRE as empNombre, empleado.EMP_APELLIDO as empApellido 
FROM empleado 
WHERE EMP_ID not in (SELECT usuario.EMP_ID FROM usuario WHERE USU_ESTADO=1);
ELSE
SELECT empleado.EMP_ID as empId, empleado.EMP_NOMBRE as empNombre, empleado.EMP_APELLIDO as empApellido 
FROM empleado; 
END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_get_historialMedico
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_get_historialMedico`;
delimiter ;;
CREATE PROCEDURE `sp_get_historialMedico`(in p_EXP_ID INT)
BEGIN

SELECT 
CON_ID as conId,
CONCAT(DATE_FORMAT(CON_FECCONSULTA, '%d/%m/%Y'),' ',DATE_FORMAT(CON_FECCONSULTA, '%h:00 %p')) AS conFecConsulta,
CON_SINTOMAS as conSintomas,
CON_DIAGNOSTICO as conDiagnostico,
CON_EXAMENES as conExamenes,
CON_OBSERVACIONES as conObservaciones,
CONCAT(empleado.EMP_NOMBRE, ' ' , empleado.EMP_APELLIDO) as empNombre,
CON_PESO as masPeso,
CON_TEMPERATURA as masTemperatura,
CON_FRECARDIACA as masFreCardiaca
FROM consulta
INNER JOIN empleado on empleado.EMP_ID = consulta.EMP_ID
WHERE EXP_ID=p_EXP_ID
ORDER BY CON_FECCONSULTA DESC;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_get_permisos_rol
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_get_permisos_rol`;
delimiter ;;
CREATE PROCEDURE `sp_get_permisos_rol`(IN `p_ROL_ID` INT)
BEGIN
    SELECT m.MOD_NOMBRE, op.OPC_NOMBRE from permiso p inner join modulo_opcion mop on mop.MOP_ID = p.MOP_ID 
    inner join modulo m on m.MOD_ID = mop.MOD_ID inner join opcion op      on    op.OPC_ID = mop.OPC_ID 
    where p.ROL_ID= p_ROL_ID and p.PER_ESTADO=1; 
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_get_razas
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_get_razas`;
delimiter ;;
CREATE PROCEDURE `sp_get_razas`(IN p_idmascota INT)
BEGIN
set @idmascota = p_idmascota;

select RAZ_ID as razId, RAZ_NOMBRE as razNombre
from raza
where TIM_ID = @idmascota;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_get_roles
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_get_roles`;
delimiter ;;
CREATE PROCEDURE `sp_get_roles`()
BEGIN
SELECT ROL_ID as rolId, ROL_NOMBRE as rolNombre, ROL_DESCRIPCION as rolDescripcion FROM rol;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_get_tipo_mascota
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_get_tipo_mascota`;
delimiter ;;
CREATE PROCEDURE `sp_get_tipo_mascota`()
BEGIN

select TIM_ID as timId, TIM_GRUPO as timGrupo
from tipo_mascota;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_get_veterinario
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_get_veterinario`;
delimiter ;;
CREATE PROCEDURE `sp_get_veterinario`(IN `p_PUE_ID` INT)
BEGIN
select EMP_ID as empId, EMP_NOMBRE as empNombre, EMP_APELLIDO as empApellido
from empleado
where PUE_ID = p_PUE_ID;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_update_cita
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_update_cita`;
delimiter ;;
CREATE PROCEDURE `sp_update_cita`(in p_id int, in p_fecha date,in p_hora time,in p_propietario varchar(50), in p_veterinario_id int)
BEGIN

DECLARE fecha_hora DATETIME;
set fecha_hora = concat(p_fecha,' ',p_hora);

update cita set
CTA_FECHORA = fecha_hora,
CTA_PROPIETARIO = p_propietario,
EMP_ID=p_veterinario_id
where  CTA_ID = p_id;

END

-- BACKUP Kevin Menjivar 25/10
/*CREATE DEFINER=`admin_HappyPets`@`%` PROCEDURE `sp_update_cita`(in p_id int, in p_fecha date,in p_hora time,in p_propietario varchar(50), in p_veterinario_id int)
BEGIN
DECLARE fecha_hora DATETIME;
set fecha_hora = concat(p_fecha,' ',p_hora);

update cita set
CTA_FECHORA = fecha_hora,
CTA_PROPIETARIO = p_propietario,
EMP_ID=p_veterinario_id
where  CTA_ID = p_id;

END*/
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_update_consulta
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_update_consulta`;
delimiter ;;
CREATE PROCEDURE `sp_update_consulta`(IN p_CON_ID INT,
		IN p_CON_SINTOMAS VARCHAR(100),
    IN p_CON_DIAGNOSTICO VARCHAR(150),
    IN p_CON_EXAMENES VARCHAR(150),
    IN p_CON_OBSERVACIONES VARCHAR(100),
		IN p_CON_PESO VARCHAR(20),
		IN p_CON_TEMPERATURA VARCHAR(3),
		IN p_CON_FRECARDIACA VARCHAR(3),
    IN p_USU_CODIGO VARCHAR(10),
    OUT `p_INSERT_RESPONSE` VARCHAR(50))
BEGIN
		DECLARE R_COUNT INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION  -- Manejador de errores SQL
    BEGIN
        -- En caso de error, devolvemos un mensaje de error y ponemos el ID en NULL
        SET p_INSERT_RESPONSE = 'Error al actualizar consulta medica';
        ROLLBACK;  -- Deshacemos cualquier cambio si hay un error
    END;

    START TRANSACTION;  -- Inicia la transacción
		-- Intentamos hacer update
		update consulta set
		CON_SINTOMAS = p_CON_SINTOMAS, 
		CON_DIAGNOSTICO = p_CON_DIAGNOSTICO, 
		CON_EXAMENES = p_CON_EXAMENES, 
		CON_OBSERVACIONES = p_CON_OBSERVACIONES,
		CON_PESO=p_CON_PESO,
		CON_TEMPERATURA=p_CON_TEMPERATURA,
		CON_FRECARDIACA=p_CON_FRECARDIACA,
    FEC_ACTUAL=NOW(), 
		USU_CODIGO=p_USU_CODIGO
		where  CON_ID = p_CON_ID;

		
		SET R_COUNT=0;
		SET R_COUNT = ROW_COUNT();
		
		IF R_COUNT > 0 THEN
      SET p_INSERT_RESPONSE = 'Consulta medica actualizada exitosamente';
		ELSEIF R_COUNT = 0 THEN
      SET p_INSERT_RESPONSE = 'No se encontro el registro de consulta medica';
    END IF;

    COMMIT;  -- Confirma la transacción si no hay errores

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_update_expediente
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_update_expediente`;
delimiter ;;
CREATE PROCEDURE `sp_update_expediente`(IN p_MAS_ID VARCHAR(8), 
		IN p_MAS_NOMBRE VARCHAR(50),
    IN p_MAS_PROPIETARIO VARCHAR(50),
    IN p_MAS_CORREO VARCHAR(50),
    IN p_MAS_GENERO INT,
    IN p_MAS_COLOR VARCHAR(25),
    IN p_MAS_PESO VARCHAR(20),
    IN p_MAS_TEMPERATURA VARCHAR(3),
    IN p_MAS_FRECARDIACA VARCHAR(3),
    IN p_MAS_DIRECCION VARCHAR(50),
    IN p_MAS_TELEFONO VARCHAR(10),
    IN p_MAS_MEDREFERIDO VARCHAR(50),
    IN p_RAZ_ID INT,
    IN p_USU_CODIGO VARCHAR(10),
    OUT `p_INSERT_RESPONSE` VARCHAR(50))
BEGIN
		DECLARE R_COUNT INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION  -- Manejador de errores SQL
    BEGIN
        -- En caso de error, devolvemos un mensaje de error y ponemos el ID en NULL
        SET p_INSERT_RESPONSE = 'Error al guardar expediente';
        ROLLBACK;  -- Deshacemos cualquier cambio si hay un error
    END;

    START TRANSACTION;  -- Inicia la transacción
		-- Intentamos hacer update
		update expediente set
		MAS_NOMBRE=p_MAS_NOMBRE,
		MAS_PROPIETARIO=p_MAS_PROPIETARIO,
		MAS_CORREO=p_MAS_CORREO,
		MAS_GENERO=p_MAS_GENERO,
		MAS_COLOR=p_MAS_COLOR,
		MAS_PESO=p_MAS_PESO,
		MAS_TEMPERATURA=p_MAS_TEMPERATURA,
		MAS_FRECARDIACA=p_MAS_FRECARDIACA,
		MAS_DIRECCION=p_MAS_DIRECCION,
		MAS_TELEFONO=p_MAS_TELEFONO,
		MAS_MEDREFERIDO=p_MAS_MEDREFERIDO,
		RAZ_ID=p_RAZ_ID,
		FEC_ACTUAL=NOW(),
		USU_CODIGO=p_USU_CODIGO
		where  MAS_ID = p_MAS_ID;

		
		SET R_COUNT=0;
		SET R_COUNT = ROW_COUNT();
		
		IF R_COUNT > 0 THEN
      SET p_INSERT_RESPONSE = 'Expediente actualizado exitosamente';
		ELSEIF R_COUNT = 0 THEN
      SET p_INSERT_RESPONSE = 'No se encontro el registro';
    END IF;

    COMMIT;  -- Confirma la transacción si no hay errores

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_validar_usuario
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_validar_usuario`;
delimiter ;;
CREATE PROCEDURE `sp_validar_usuario`(IN `p_USU_EMAIL` VARCHAR(50), 
    IN `p_USU_PASSWORD` VARCHAR(25), 
    OUT `p_ROL_ID` INT, 
    OUT `p_ROL_NOMBRE` VARCHAR(50),
    OUT `p_USU_CORRELATIVO` VARCHAR(10),
		OUT `p_EMP_ID` INT,
		 OUT `p_EMP_NOMBRE` VARCHAR(100))
BEGIN
    DECLARE v_ROL_ID INT DEFAULT -1;
    DECLARE v_ROL_NOMBRE VARCHAR(50) DEFAULT 'N/A';
   DECLARE v_USU_CORRELATIVO VARCHAR(10) DEFAULT '';
	 DECLARE v_EMP_ID INT DEFAULT -1;
	 DECLARE v_EMP_NOMBRE VARCHAR(100) DEFAULT '';

    -- Verifica si existe un usuario con el correo y la contraseña encriptada en MD5
    SELECT usuario.ROL_ID, rol.ROL_NOMBRE, usuario.USU_CORRELATIVO, empleado.EMP_ID, CONCAT(empleado.EMP_NOMBRE,' ',empleado.EMP_APELLIDO) EMP_NOMBRE
    INTO v_ROL_ID, v_ROL_NOMBRE, v_USU_CORRELATIVO, v_EMP_ID, v_EMP_NOMBRE
    FROM usuario
    INNER JOIN rol ON rol.ROL_ID = usuario.ROL_ID
		INNER JOIN empleado ON empleado.EMP_ID=usuario.EMP_ID
    WHERE USU_EMAIL = p_USU_EMAIL 
    AND USU_PASSWORD = MD5(p_USU_PASSWORD)  -- Puedes cambiar esto a una función de hash más segura si es necesario
    AND USU_ESTADO = 1;  -- Solo valida usuarios que estén activos

    -- Si no se encontró el usuario, devuelve -1 para el ROL_ID y 'N/A' para el nombre del rol
    IF v_ROL_ID IS NULL THEN
        SET p_ROL_ID = -1;  -- Usuario no válido
        SET p_ROL_NOMBRE = 'N/A'; -- Rol no válido
    ELSE
        SET p_ROL_ID = v_ROL_ID;  -- Devuelve el Id del rol del usuario
        SET p_ROL_NOMBRE = v_ROL_NOMBRE;  -- Devuelve el nombre del rol del usuario
    END IF;
   SET p_USU_CORRELATIVO = v_USU_CORRELATIVO;
	 SET p_EMP_ID = v_EMP_ID;
	 SET p_EMP_NOMBRE = v_EMP_NOMBRE;
END
-- BACKUP 17/09 KMenjivar
/*CREATE DEFINER=`admin_HappyPets`@`%` PROCEDURE `sp_validar_usuario`(
    IN `p_USU_EMAIL` VARCHAR(50), 
    IN `p_USU_PASSWORD` VARCHAR(25), 
    OUT `p_VALIDO` INT
)
BEGIN
    DECLARE v_CONTADOR INT;

    -- Verifica si existe un usuario con el correo y la contraseña encriptada en MD5
    SELECT COUNT(*) INTO v_CONTADOR FROM usuario WHERE USU_EMAIL = p_USU_EMAIL AND USU_PASSWORD = MD5(p_USU_PASSWORD) AND USU_ESTADO = 1;  -- Solo valida usuarios que estén activos

    -- Si el usuario y la contraseña coinciden, se devuelve 1, de lo contrario 0
    IF v_CONTADOR = 1 THEN
        SET p_VALIDO = 1; -- Usuario válido
    ELSE
        SET p_VALIDO = 0; -- Usuario no válido
    END IF;
END*/
;;
delimiter ;

-- ----------------------------
-- Event structure for vencimiento_citas
-- ----------------------------
DROP EVENT IF EXISTS `vencimiento_citas`;
delimiter ;;
CREATE EVENT `vencimiento_citas`
ON SCHEDULE
EVERY '1' HOUR STARTS '2024-10-25 12:17:45'
DO BEGIN
    UPDATE cita
    SET CTA_ESTADO = 2  -- Cambia el estado de la cita a vencida
    WHERE CTA_FECHORA < NOW() AND CTA_ESTADO = 1;  -- Condición de comparación con la hora actual y evitar cambios repetidos
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
