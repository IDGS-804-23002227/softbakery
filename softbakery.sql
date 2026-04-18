-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: softbakery2
-- ------------------------------------------------------
-- Server version	8.0.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bitacora_acceso`
--

DROP TABLE IF EXISTS `bitacora_acceso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bitacora_acceso` (
  `id_bitacora` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `fecha` datetime NOT NULL,
  `exitoso` tinyint(1) NOT NULL,
  `error_mensaje` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_bitacora`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `bitacora_acceso_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitacora_acceso`
--

LOCK TABLES `bitacora_acceso` WRITE;
/*!40000 ALTER TABLE `bitacora_acceso` DISABLE KEYS */;
INSERT INTO `bitacora_acceso` VALUES (1,1,'2026-04-16 19:14:33',1,'Acceso inicial seed para rol Administrador'),(2,2,'2026-04-16 19:14:33',1,'Acceso inicial seed para rol Ventas'),(3,3,'2026-04-16 19:14:33',1,'Acceso inicial seed para rol Produccion'),(4,4,'2026-04-16 19:14:33',1,'Acceso inicial seed para rol Cliente'),(5,4,'2026-04-16 19:37:52',1,NULL),(6,1,'2026-04-16 19:39:42',1,NULL),(7,4,'2026-04-16 19:42:39',1,NULL),(8,1,'2026-04-16 19:43:47',0,'Contrasena incorrecta'),(9,1,'2026-04-16 19:44:13',1,NULL),(10,4,'2026-04-16 19:46:51',1,NULL);
/*!40000 ALTER TABLE `bitacora_acceso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrito`
--

DROP TABLE IF EXISTS `carrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrito` (
  `id_carrito` int NOT NULL AUTO_INCREMENT,
  `id_usuario_cliente` int NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  PRIMARY KEY (`id_carrito`),
  KEY `id_usuario_cliente` (`id_usuario_cliente`),
  CONSTRAINT `carrito_ibfk_1` FOREIGN KEY (`id_usuario_cliente`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrito`
--

LOCK TABLES `carrito` WRITE;
/*!40000 ALTER TABLE `carrito` DISABLE KEYS */;
INSERT INTO `carrito` VALUES (1,4,'2026-04-16 19:14:33');
/*!40000 ALTER TABLE `carrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra` (
  `id_compra` int NOT NULL AUTO_INCREMENT,
  `id_proveedor` int NOT NULL,
  `id_usuario_comprador` int NOT NULL,
  `fecha` datetime NOT NULL,
  `total` decimal(12,2) NOT NULL,
  `estado_pago` varchar(20) NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  PRIMARY KEY (`id_compra`),
  KEY `id_proveedor` (`id_proveedor`),
  KEY `id_usuario_comprador` (`id_usuario_comprador`),
  CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`),
  CONSTRAINT `compra_ibfk_2` FOREIGN KEY (`id_usuario_comprador`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
INSERT INTO `compra` VALUES (1,1,1,'2026-04-16 19:14:33',2200.00,'PAGADO','2026-04-16 19:14:33'),(2,4,1,'2026-04-16 00:00:00',100.00,'PENDIENTE','2026-04-16 19:30:52');
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corte_diario`
--

DROP TABLE IF EXISTS `corte_diario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `corte_diario` (
  `id_corte` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `total_ventas` decimal(12,2) NOT NULL,
  `numero_ventas` int NOT NULL,
  `total_transacciones` int NOT NULL,
  `total_efectivo` decimal(12,2) NOT NULL,
  `total_tarjeta` decimal(12,2) NOT NULL,
  `total_salidas` decimal(12,2) NOT NULL,
  `costo_produccion` decimal(12,2) NOT NULL,
  `utilidad_diaria` decimal(12,2) NOT NULL,
  `salida_efectivo_proveedores` decimal(12,2) NOT NULL,
  `id_usuario` int NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  PRIMARY KEY (`id_corte`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `corte_diario_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corte_diario`
--

LOCK TABLES `corte_diario` WRITE;
/*!40000 ALTER TABLE `corte_diario` DISABLE KEYS */;
INSERT INTO `corte_diario` VALUES (1,'2026-04-16',2160.00,1,0,0.00,0.00,0.00,0.00,1551.22,85.00,2,'2026-04-16 19:14:33');
/*!40000 ALTER TABLE `corte_diario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_carrito`
--

DROP TABLE IF EXISTS `detalle_carrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_carrito` (
  `id_detalle` int NOT NULL AUTO_INCREMENT,
  `id_carrito` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` int NOT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `id_carrito` (`id_carrito`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `detalle_carrito_ibfk_1` FOREIGN KEY (`id_carrito`) REFERENCES `carrito` (`id_carrito`),
  CONSTRAINT `detalle_carrito_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`),
  CONSTRAINT `ck_carrito_cantidad_1_5` CHECK (((`cantidad` >= 1) and (`cantidad` <= 5)))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_carrito`
--

LOCK TABLES `detalle_carrito` WRITE;
/*!40000 ALTER TABLE `detalle_carrito` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_carrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_compra`
--

DROP TABLE IF EXISTS `detalle_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_compra` (
  `id_detalle` int NOT NULL AUTO_INCREMENT,
  `id_compra` int NOT NULL,
  `id_materia_prima` int NOT NULL,
  `cantidad_comprada` decimal(12,4) NOT NULL,
  `id_unidad_compra` int NOT NULL,
  `precio_unitario` decimal(12,2) NOT NULL,
  `subtotal` decimal(12,2) NOT NULL,
  `cantidad_base` decimal(12,4) NOT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `id_compra` (`id_compra`),
  KEY `id_materia_prima` (`id_materia_prima`),
  KEY `id_unidad_compra` (`id_unidad_compra`),
  CONSTRAINT `detalle_compra_ibfk_1` FOREIGN KEY (`id_compra`) REFERENCES `compra` (`id_compra`),
  CONSTRAINT `detalle_compra_ibfk_2` FOREIGN KEY (`id_materia_prima`) REFERENCES `materia_prima` (`id_materia`),
  CONSTRAINT `detalle_compra_ibfk_3` FOREIGN KEY (`id_unidad_compra`) REFERENCES `unidad_medida` (`id_unidad`),
  CONSTRAINT `ck_detalle_compra_cantidad_base_positiva` CHECK ((`cantidad_base` > 0)),
  CONSTRAINT `ck_detalle_compra_cantidad_positiva` CHECK ((`cantidad_comprada` > 0)),
  CONSTRAINT `ck_detalle_compra_precio_no_negativo` CHECK ((`precio_unitario` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_compra`
--

LOCK TABLES `detalle_compra` WRITE;
/*!40000 ALTER TABLE `detalle_compra` DISABLE KEYS */;
INSERT INTO `detalle_compra` VALUES (1,1,1,2.0000,6,600.00,1200.00,40000.0000),(2,1,2,2.0000,6,500.00,1000.00,40000.0000),(3,2,22,2.0000,1,50.00,100.00,2000.0000);
/*!40000 ALTER TABLE `detalle_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_orden_produccion`
--

DROP TABLE IF EXISTS `detalle_orden_produccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_orden_produccion` (
  `id_detalle` int NOT NULL AUTO_INCREMENT,
  `id_orden` int NOT NULL,
  `id_materia_prima` int NOT NULL,
  `cantidad_receta` decimal(12,4) NOT NULL,
  `cantidad_necesaria` decimal(12,4) NOT NULL,
  `porcentaje_merma` decimal(5,2) NOT NULL,
  `cantidad_real_descontada` decimal(12,4) NOT NULL,
  `stock_previo` decimal(12,4) NOT NULL,
  `stock_posterior` decimal(12,4) NOT NULL,
  PRIMARY KEY (`id_detalle`),
  UNIQUE KEY `uq_detalle_orden_materia` (`id_orden`,`id_materia_prima`),
  KEY `id_materia_prima` (`id_materia_prima`),
  CONSTRAINT `detalle_orden_produccion_ibfk_1` FOREIGN KEY (`id_orden`) REFERENCES `orden_produccion` (`id_orden`),
  CONSTRAINT `detalle_orden_produccion_ibfk_2` FOREIGN KEY (`id_materia_prima`) REFERENCES `materia_prima` (`id_materia`),
  CONSTRAINT `ck_detalle_orden_cantidad_necesaria_positiva` CHECK ((`cantidad_necesaria` > 0)),
  CONSTRAINT `ck_detalle_orden_cantidad_real_positiva` CHECK ((`cantidad_real_descontada` > 0)),
  CONSTRAINT `ck_detalle_orden_cantidad_receta_positiva` CHECK ((`cantidad_receta` > 0)),
  CONSTRAINT `ck_detalle_orden_merma_no_negativa` CHECK ((`porcentaje_merma` >= 0)),
  CONSTRAINT `ck_detalle_orden_stock_posterior_no_negativo` CHECK ((`stock_posterior` >= 0)),
  CONSTRAINT `ck_detalle_orden_stock_previo_no_negativo` CHECK ((`stock_previo` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_orden_produccion`
--

LOCK TABLES `detalle_orden_produccion` WRITE;
/*!40000 ALTER TABLE `detalle_orden_produccion` DISABLE KEYS */;
INSERT INTO `detalle_orden_produccion` VALUES (1,1,1,230.0000,1150.0000,3.00,1184.5000,110000.0000,108815.5000),(2,1,2,179.9990,899.9950,2.00,917.9949,100000.0000,99082.0051),(3,1,3,4.0000,20.0000,5.00,21.0000,600.0000,579.0000),(4,1,8,150.0000,750.0000,2.00,765.0000,10000.0000,9235.0000),(5,1,16,120.0000,600.0000,1.00,606.0000,15000.0000,14394.0000),(6,1,17,10.0000,50.0000,1.00,50.5000,3000.0000,2949.5000),(7,1,18,10.0000,50.0000,1.00,50.5000,1500.0000,1449.5000),(8,2,1,230.0000,230.0000,3.00,236.9000,108815.5000,108578.6000),(9,2,2,179.9990,179.9990,2.00,183.5990,99082.0051,98898.4061),(10,2,3,4.0000,4.0000,5.00,5.0000,579.0000,574.0000),(11,2,8,150.0000,150.0000,2.00,153.0000,9235.0000,9082.0000),(12,2,16,120.0000,120.0000,1.00,121.2000,14394.0000,14272.8000),(13,2,17,10.0000,10.0000,1.00,10.1000,2949.5000,2939.4000),(14,2,18,10.0000,10.0000,1.00,10.1000,1449.5000,1439.4000);
/*!40000 ALTER TABLE `detalle_orden_produccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_pedido`
--

DROP TABLE IF EXISTS `detalle_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_pedido` (
  `id_detalle` int NOT NULL AUTO_INCREMENT,
  `id_pedido` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` int NOT NULL,
  `precio_unitario` decimal(12,2) NOT NULL,
  `subtotal` decimal(12,2) NOT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `id_pedido` (`id_pedido`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `detalle_pedido_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`),
  CONSTRAINT `detalle_pedido_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`),
  CONSTRAINT `ck_pedido_cantidad_1_5` CHECK (((`cantidad` >= 1) and (`cantidad` <= 5)))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_pedido`
--

LOCK TABLES `detalle_pedido` WRITE;
/*!40000 ALTER TABLE `detalle_pedido` DISABLE KEYS */;
INSERT INTO `detalle_pedido` VALUES (1,1,10,1,200.00,200.00);
/*!40000 ALTER TABLE `detalle_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_receta`
--

DROP TABLE IF EXISTS `detalle_receta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_receta` (
  `id_detalle` int NOT NULL AUTO_INCREMENT,
  `id_receta` int NOT NULL,
  `id_materia_prima` int NOT NULL,
  `cantidad_base` decimal(12,4) NOT NULL,
  PRIMARY KEY (`id_detalle`),
  UNIQUE KEY `uq_detalle_receta_materia` (`id_receta`,`id_materia_prima`),
  KEY `id_materia_prima` (`id_materia_prima`),
  CONSTRAINT `detalle_receta_ibfk_1` FOREIGN KEY (`id_receta`) REFERENCES `receta` (`id_receta`),
  CONSTRAINT `detalle_receta_ibfk_2` FOREIGN KEY (`id_materia_prima`) REFERENCES `materia_prima` (`id_materia`),
  CONSTRAINT `ck_detalle_receta_cantidad_positiva` CHECK ((`cantidad_base` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_receta`
--

LOCK TABLES `detalle_receta` WRITE;
/*!40000 ALTER TABLE `detalle_receta` DISABLE KEYS */;
INSERT INTO `detalle_receta` VALUES (1,1,1,250.0000),(2,1,2,200.0000),(3,1,19,50.0000),(4,1,3,4.0000),(5,1,16,120.0000),(6,1,8,200.0000),(7,1,17,10.0000),(8,1,18,10.0000),(9,1,6,300.0000),(10,1,9,200.0000),(11,2,1,200.0000),(12,2,2,180.0000),(13,2,3,5.0000),(14,2,17,10.0000),(15,2,18,8.0000),(16,2,8,250.0000),(17,2,7,250.0000),(18,2,6,200.0000),(19,2,12,250.0000),(20,3,15,200.0000),(21,3,4,100.0000),(22,3,5,400.0000),(23,3,2,230.0000),(24,3,3,3.0000),(25,3,6,200.0000),(26,3,17,10.0000),(27,3,11,250.0000),(28,4,1,150.0000),(29,4,2,120.0000),(30,4,19,40.0000),(31,4,3,6.0000),(32,4,16,80.0000),(33,4,8,420.0000),(34,4,7,250.0000),(35,4,17,15.0000),(36,4,18,8.0000),(37,4,10,180.0000),(38,5,1,230.0000),(39,5,2,220.0000),(40,5,3,4.0000),(41,5,4,120.0000),(42,5,6,420.0000),(43,5,8,120.0000),(44,5,17,10.0000),(45,5,18,10.0000),(46,5,13,150.0000),(47,6,1,220.0000),(48,6,2,180.0000),(49,6,19,40.0000),(50,6,3,4.0000),(51,6,16,100.0000),(52,6,8,180.0000),(53,6,21,15.0000),(54,6,17,10.0000),(55,6,18,10.0000),(56,6,6,300.0000),(57,6,9,150.0000),(58,7,1,220.0000),(59,7,2,320.0000),(60,7,19,15.0000),(61,7,3,4.0000),(62,7,16,120.0000),(63,7,8,200.0000),(64,7,17,15.0000),(65,7,18,10.0000),(66,7,5,400.0000),(67,7,6,300.0000),(68,8,1,220.0000),(69,8,2,290.0000),(70,8,3,4.0000),(71,8,16,100.0000),(72,8,8,200.0000),(73,8,17,15.0000),(74,8,18,10.0000),(75,8,20,400.0000),(76,8,6,300.0000),(77,9,14,550.0000),(78,9,4,120.0000),(79,9,6,700.0000),(80,9,7,350.0000),(81,9,17,10.0000),(82,10,1,230.0000),(83,10,2,179.9990),(84,10,3,4.0000),(85,10,16,120.0000),(86,10,8,150.0000),(87,10,18,10.0000),(88,10,17,10.0000);
/*!40000 ALTER TABLE `detalle_receta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_venta`
--

DROP TABLE IF EXISTS `detalle_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_venta` (
  `id_detalle` int NOT NULL AUTO_INCREMENT,
  `id_venta` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` int NOT NULL,
  `precio_unitario` decimal(12,2) NOT NULL,
  `costo_unitario_produccion` decimal(12,2) DEFAULT NULL,
  `utilidad_unitaria` decimal(12,2) DEFAULT NULL,
  `subtotal` decimal(12,2) NOT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `id_venta` (`id_venta`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `detalle_venta_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `venta` (`id_venta`),
  CONSTRAINT `detalle_venta_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_venta`
--

LOCK TABLES `detalle_venta` WRITE;
/*!40000 ALTER TABLE `detalle_venta` DISABLE KEYS */;
INSERT INTO `detalle_venta` VALUES (1,1,1,1,480.00,143.62,336.38,480.00),(2,1,2,2,530.00,120.20,409.80,1060.00),(3,1,3,1,620.00,224.76,395.24,620.00),(4,2,10,1,200.00,53.49,146.51,200.00);
/*!40000 ALTER TABLE `detalle_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materia_prima`
--

DROP TABLE IF EXISTS `materia_prima`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materia_prima` (
  `id_materia` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(120) NOT NULL,
  `id_unidad_base` int NOT NULL,
  `id_unidad_compra` int NOT NULL,
  `factor_conversion` decimal(12,4) NOT NULL,
  `porcentaje_merma` decimal(5,2) NOT NULL,
  `costo_unitario` decimal(12,4) NOT NULL,
  `stock_minimo` decimal(12,4) NOT NULL,
  `cantidad_disponible` decimal(12,4) NOT NULL,
  `activa` tinyint(1) NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  PRIMARY KEY (`id_materia`),
  UNIQUE KEY `nombre` (`nombre`),
  KEY `id_unidad_base` (`id_unidad_base`),
  KEY `id_unidad_compra` (`id_unidad_compra`),
  CONSTRAINT `materia_prima_ibfk_1` FOREIGN KEY (`id_unidad_base`) REFERENCES `unidad_medida` (`id_unidad`),
  CONSTRAINT `materia_prima_ibfk_2` FOREIGN KEY (`id_unidad_compra`) REFERENCES `unidad_medida` (`id_unidad`),
  CONSTRAINT `ck_mp_cantidad_no_negativa` CHECK ((`cantidad_disponible` >= 0)),
  CONSTRAINT `ck_mp_factor_conversion_positiva` CHECK ((`factor_conversion` > 0)),
  CONSTRAINT `ck_mp_porcentaje_merma_no_negativo` CHECK ((`porcentaje_merma` >= 0)),
  CONSTRAINT `ck_mp_stock_minimo_no_negativo` CHECK ((`stock_minimo` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materia_prima`
--

LOCK TABLES `materia_prima` WRITE;
/*!40000 ALTER TABLE `materia_prima` DISABLE KEYS */;
INSERT INTO `materia_prima` VALUES (1,'Harina de Trigo',2,6,20000.0000,3.00,0.0300,20000.0000,108578.6000,1,'2026-04-16 19:14:33'),(2,'Azúcar Refinada',2,6,20000.0000,2.00,0.0280,20000.0000,98898.4061,1,'2026-04-16 19:14:33'),(3,'Huevo Blanco',5,5,1.0000,5.00,4.0000,200.0000,574.0000,1,'2026-04-16 19:14:33'),(4,'Mantequilla',2,1,1000.0000,2.00,0.1600,4000.0000,8000.0000,1,'2026-04-16 19:14:33'),(5,'Queso Crema',2,1,1000.0000,5.00,0.2100,4000.0000,9000.0000,1,'2026-04-16 19:14:33'),(6,'Crema para Batir',4,3,1000.0000,8.00,0.0900,8000.0000,20000.0000,1,'2026-04-16 19:14:33'),(7,'Leche Condensada',4,3,1000.0000,2.00,0.0800,3000.0000,8000.0000,1,'2026-04-16 19:14:33'),(8,'Leche Evaporada',4,3,1000.0000,2.00,0.0700,3000.0000,9082.0000,1,'2026-04-16 19:14:33'),(9,'Chocolate Semiamargo',2,1,1000.0000,2.00,0.2200,2500.0000,5000.0000,1,'2026-04-16 19:14:33'),(10,'Cajeta Envinada',2,1,1000.0000,3.00,0.1300,2000.0000,4000.0000,1,'2026-04-16 19:14:33'),(11,'Mora Azul',2,1,1000.0000,10.00,0.2000,1500.0000,4000.0000,1,'2026-04-16 19:14:33'),(12,'Durazno en Almíbar',2,1,1000.0000,5.00,0.1000,3000.0000,6000.0000,1,'2026-04-16 19:14:33'),(13,'Frutos Secos',2,1,1000.0000,2.00,0.2500,2000.0000,4000.0000,1,'2026-04-16 19:14:33'),(14,'Galleta Oreo Molida',2,1,1000.0000,8.00,0.1200,2000.0000,5000.0000,1,'2026-04-16 19:14:33'),(15,'Galleta María Molida',2,1,1000.0000,5.00,0.1100,1000.0000,3000.0000,1,'2026-04-16 19:14:33'),(16,'Aceite Vegetal',4,3,1000.0000,1.00,0.0800,5000.0000,14272.8000,1,'2026-04-16 19:14:33'),(17,'Vainilla',4,3,1000.0000,1.00,0.3500,1500.0000,2939.4000,1,'2026-04-16 19:14:33'),(18,'Polvo para hornear',2,1,1000.0000,1.00,0.0500,500.0000,1439.4000,1,'2026-04-16 19:14:33'),(19,'Cocoa en Polvo',2,1,1000.0000,3.00,0.2200,1500.0000,3000.0000,1,'2026-04-16 19:14:33'),(20,'Fresa fresca',2,1,1000.0000,15.00,0.0900,2000.0000,5000.0000,1,'2026-04-16 19:14:33'),(21,'Café soluble',2,1,1000.0000,1.00,0.4200,200.0000,500.0000,1,'2026-04-16 19:14:33'),(22,'Nuez',2,1,1000.0000,1.00,0.0500,500.0000,2000.0000,1,'2026-04-16 19:29:11');
/*!40000 ALTER TABLE `materia_prima` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modulo`
--

DROP TABLE IF EXISTS `modulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modulo` (
  `id_modulo` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_modulo`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modulo`
--

LOCK TABLES `modulo` WRITE;
/*!40000 ALTER TABLE `modulo` DISABLE KEYS */;
INSERT INTO `modulo` VALUES (1,'Dashboard',1),(2,'Usuarios',1),(3,'Roles',1),(4,'Proveedores',1),(5,'Inventario MP',1),(6,'Compras MP',1),(7,'Recetas',1),(8,'Ordenes',1),(9,'Solicitudes',1),(10,'Producto Terminado',1),(11,'Ventas',1),(12,'Costos y Utilidad',1),(13,'Pedidos Clientes',1),(14,'Catalogo Web',1),(15,'Carrito',1);
/*!40000 ALTER TABLE `modulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimiento_inventario_mp`
--

DROP TABLE IF EXISTS `movimiento_inventario_mp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimiento_inventario_mp` (
  `id_movimiento` int NOT NULL AUTO_INCREMENT,
  `id_materia_prima` int NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `cantidad` decimal(12,4) NOT NULL,
  `fecha` datetime NOT NULL,
  `id_usuario` int NOT NULL,
  `referencia_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_movimiento`),
  KEY `id_usuario` (`id_usuario`),
  KEY `ix_movimiento_mp_materia_fecha` (`id_materia_prima`,`fecha`),
  CONSTRAINT `movimiento_inventario_mp_ibfk_1` FOREIGN KEY (`id_materia_prima`) REFERENCES `materia_prima` (`id_materia`),
  CONSTRAINT `movimiento_inventario_mp_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `ck_movimiento_mp_cantidad_positiva` CHECK ((`cantidad` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimiento_inventario_mp`
--

LOCK TABLES `movimiento_inventario_mp` WRITE;
/*!40000 ALTER TABLE `movimiento_inventario_mp` DISABLE KEYS */;
INSERT INTO `movimiento_inventario_mp` VALUES (1,1,'ENTRADA',40000.0000,'2026-04-16 19:14:33',1,'COMPRA-1'),(2,2,'ENTRADA',40000.0000,'2026-04-16 19:14:33',1,'COMPRA-1'),(3,22,'ENTRADA',2000.0000,'2026-04-16 19:30:52',1,'COMPRA-2'),(4,1,'SALIDA',1184.5000,'2026-04-16 19:41:06',1,'ORD-1'),(5,2,'SALIDA',917.9949,'2026-04-16 19:41:06',1,'ORD-1'),(6,3,'SALIDA',21.0000,'2026-04-16 19:41:06',1,'ORD-1'),(7,8,'SALIDA',765.0000,'2026-04-16 19:41:06',1,'ORD-1'),(8,16,'SALIDA',606.0000,'2026-04-16 19:41:06',1,'ORD-1'),(9,17,'SALIDA',50.5000,'2026-04-16 19:41:06',1,'ORD-1'),(10,18,'SALIDA',50.5000,'2026-04-16 19:41:06',1,'ORD-1'),(11,1,'SALIDA',236.9000,'2026-04-16 19:45:12',1,'ORD-2'),(12,2,'SALIDA',183.5990,'2026-04-16 19:45:12',1,'ORD-2'),(13,3,'SALIDA',5.0000,'2026-04-16 19:45:12',1,'ORD-2'),(14,8,'SALIDA',153.0000,'2026-04-16 19:45:12',1,'ORD-2'),(15,16,'SALIDA',121.2000,'2026-04-16 19:45:12',1,'ORD-2'),(16,17,'SALIDA',10.1000,'2026-04-16 19:45:12',1,'ORD-2'),(17,18,'SALIDA',10.1000,'2026-04-16 19:45:12',1,'ORD-2');
/*!40000 ALTER TABLE `movimiento_inventario_mp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimiento_inventario_producto`
--

DROP TABLE IF EXISTS `movimiento_inventario_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimiento_inventario_producto` (
  `id_movimiento` int NOT NULL AUTO_INCREMENT,
  `id_producto` int NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `cantidad` int NOT NULL,
  `stock_anterior` int NOT NULL,
  `stock_posterior` int NOT NULL,
  `referencia_id` varchar(50) DEFAULT NULL,
  `id_usuario` int NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  PRIMARY KEY (`id_movimiento`),
  KEY `id_usuario` (`id_usuario`),
  KEY `ix_movimiento_producto_producto_fecha` (`id_producto`,`fecha_creacion`),
  CONSTRAINT `movimiento_inventario_producto_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`),
  CONSTRAINT `movimiento_inventario_producto_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `ck_movimiento_producto_cantidad_positiva` CHECK ((`cantidad` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimiento_inventario_producto`
--

LOCK TABLES `movimiento_inventario_producto` WRITE;
/*!40000 ALTER TABLE `movimiento_inventario_producto` DISABLE KEYS */;
INSERT INTO `movimiento_inventario_producto` VALUES (1,10,'ENTRADA',5,0,5,'ORD-1',1,'2026-04-16 19:41:47'),(2,10,'ENTRADA',1,5,6,'ORD-2',1,'2026-04-16 19:45:37'),(3,10,'SALIDA',1,6,5,'PEDIDO-1',1,'2026-04-16 19:45:46');
/*!40000 ALTER TABLE `movimiento_inventario_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden_produccion`
--

DROP TABLE IF EXISTS `orden_produccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orden_produccion` (
  `id_orden` int NOT NULL AUTO_INCREMENT,
  `id_solicitud` int DEFAULT NULL,
  `id_receta` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad_producir` int NOT NULL,
  `estado` varchar(20) NOT NULL,
  `fecha_inicio` datetime DEFAULT NULL,
  `fecha_fin` datetime DEFAULT NULL,
  `id_usuario_responsable` int NOT NULL,
  `observaciones` varchar(255) DEFAULT NULL,
  `costo_total` decimal(12,2) NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  PRIMARY KEY (`id_orden`),
  KEY `id_solicitud` (`id_solicitud`),
  KEY `id_receta` (`id_receta`),
  KEY `id_producto` (`id_producto`),
  KEY `id_usuario_responsable` (`id_usuario_responsable`),
  CONSTRAINT `orden_produccion_ibfk_1` FOREIGN KEY (`id_solicitud`) REFERENCES `solicitud_produccion` (`id_solicitud`),
  CONSTRAINT `orden_produccion_ibfk_2` FOREIGN KEY (`id_receta`) REFERENCES `receta` (`id_receta`),
  CONSTRAINT `orden_produccion_ibfk_3` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`),
  CONSTRAINT `orden_produccion_ibfk_4` FOREIGN KEY (`id_usuario_responsable`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `ck_orden_cantidad_positiva` CHECK ((`cantidad_producir` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_produccion`
--

LOCK TABLES `orden_produccion` WRITE;
/*!40000 ALTER TABLE `orden_produccion` DISABLE KEYS */;
INSERT INTO `orden_produccion` VALUES (1,1,10,10,5,'FINALIZADO','2026-04-16 19:41:06','2026-04-16 19:41:47',1,'Generada desde SOL-001',267.47,'2026-04-16 19:41:03'),(2,2,10,10,1,'FINALIZADO','2026-04-16 19:45:12','2026-04-16 19:45:37',1,'Generada desde SOL-002',56.69,'2026-04-16 19:45:08');
/*!40000 ALTER TABLE `orden_produccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago_pedido`
--

DROP TABLE IF EXISTS `pago_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pago_pedido` (
  `id_pago` int NOT NULL AUTO_INCREMENT,
  `id_pedido` int NOT NULL,
  `estado_pago` varchar(20) NOT NULL,
  `tipo_pago` varchar(20) NOT NULL,
  `referencia` varchar(120) DEFAULT NULL,
  `fecha_pago` datetime DEFAULT NULL,
  PRIMARY KEY (`id_pago`),
  UNIQUE KEY `id_pedido` (`id_pedido`),
  CONSTRAINT `pago_pedido_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago_pedido`
--

LOCK TABLES `pago_pedido` WRITE;
/*!40000 ALTER TABLE `pago_pedido` DISABLE KEYS */;
INSERT INTO `pago_pedido` VALUES (1,1,'PAGADO','TARJETA','WEB-4-1776368601','2026-04-16 19:44:46');
/*!40000 ALTER TABLE `pago_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `id_pedido` int NOT NULL AUTO_INCREMENT,
  `id_usuario_cliente` int NOT NULL,
  `fecha_pedido` datetime NOT NULL,
  `fecha_entrega` date NOT NULL,
  `total` decimal(12,2) NOT NULL,
  `estado_pedido` varchar(20) NOT NULL,
  `estado_pago` varchar(20) NOT NULL,
  `tipo_pago` varchar(20) NOT NULL,
  `referencia_pago` varchar(120) DEFAULT NULL,
  `fecha_creacion` datetime NOT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `id_usuario_cliente` (`id_usuario_cliente`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_usuario_cliente`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,4,'2026-04-16 19:43:21','2026-04-19',200.00,'ENTREGADO','PAGADO','EN_LINEA','WEB-4-1776368601','2026-04-16 19:43:21');
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_estado_historial`
--

DROP TABLE IF EXISTS `pedido_estado_historial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_estado_historial` (
  `id_historial` int NOT NULL AUTO_INCREMENT,
  `id_pedido` int NOT NULL,
  `estado_anterior` varchar(20) DEFAULT NULL,
  `estado_nuevo` varchar(20) NOT NULL,
  `detalle` varchar(255) DEFAULT NULL,
  `id_usuario` int DEFAULT NULL,
  `fecha_cambio` datetime NOT NULL,
  PRIMARY KEY (`id_historial`),
  KEY `id_usuario` (`id_usuario`),
  KEY `ix_pedido_estado_historial_pedido_fecha` (`id_pedido`,`fecha_cambio`),
  CONSTRAINT `pedido_estado_historial_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`),
  CONSTRAINT `pedido_estado_historial_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_estado_historial`
--

LOCK TABLES `pedido_estado_historial` WRITE;
/*!40000 ALTER TABLE `pedido_estado_historial` DISABLE KEYS */;
INSERT INTO `pedido_estado_historial` VALUES (1,1,NULL,'PENDIENTE','Pedido creado desde carrito web.',4,'2026-04-16 19:43:21'),(2,1,'PENDIENTE','CONFIRMADO','Confirmación automática por pago en línea. Ref: WEB-4-1776368601',4,'2026-04-16 19:43:21'),(3,1,'CONFIRMADO','PAGADO','Pago aplicado en módulo interno. Ref: WEB-4-1776368601',1,'2026-04-16 19:44:46'),(4,1,'PAGADO','ENTREGADO','Pedido entregado y venta #2 generada con ticket.',1,'2026-04-16 19:45:46');
/*!40000 ALTER TABLE `pedido_estado_historial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permiso`
--

DROP TABLE IF EXISTS `permiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permiso` (
  `id_permiso` int NOT NULL AUTO_INCREMENT,
  `id_rol` int NOT NULL,
  `id_modulo` int NOT NULL,
  `lectura` tinyint(1) NOT NULL,
  `escritura` tinyint(1) NOT NULL,
  `actualizacion` tinyint(1) NOT NULL,
  `eliminacion` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_permiso`),
  UNIQUE KEY `uq_permiso_rol_modulo` (`id_rol`,`id_modulo`),
  KEY `id_modulo` (`id_modulo`),
  CONSTRAINT `permiso_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`),
  CONSTRAINT `permiso_ibfk_2` FOREIGN KEY (`id_modulo`) REFERENCES `modulo` (`id_modulo`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permiso`
--

LOCK TABLES `permiso` WRITE;
/*!40000 ALTER TABLE `permiso` DISABLE KEYS */;
INSERT INTO `permiso` VALUES (1,1,1,1,1,1,1),(2,1,2,1,1,1,1),(3,1,3,1,1,1,1),(4,1,4,1,1,1,1),(5,1,5,1,1,1,1),(6,1,6,1,1,1,1),(7,1,7,1,1,1,1),(8,1,8,1,1,1,1),(9,1,9,1,1,1,1),(10,1,10,1,1,1,1),(11,1,11,1,1,1,1),(12,1,12,1,1,1,1),(13,1,13,1,1,1,1),(14,1,14,1,1,1,1),(15,1,15,1,1,1,1),(16,2,1,1,0,0,0),(17,2,11,1,1,1,0),(18,2,9,1,1,1,0),(19,2,13,1,1,1,0),(20,2,14,1,1,1,0),(21,2,15,1,1,1,1),(22,2,10,1,1,1,0),(23,2,6,0,0,0,0),(24,2,12,1,0,0,0),(25,3,1,1,0,0,0),(26,3,7,1,1,1,1),(27,3,8,1,1,1,1),(28,3,9,1,1,1,0),(29,3,5,1,1,1,0),(30,3,10,1,1,1,0),(31,4,14,1,1,0,0),(32,4,15,1,1,1,1),(33,4,13,1,1,0,1);
/*!40000 ALTER TABLE `permiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona` (
  `id_persona` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellidos` varchar(120) NOT NULL,
  `telefono` varchar(30) NOT NULL,
  `correo` varchar(120) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `ciudad` varchar(120) NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  PRIMARY KEY (`id_persona`),
  UNIQUE KEY `correo` (`correo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (1,'Carlos','Mendoza','4771001000','prime@softbakery.local','Av. Principal 100','Leon','2026-04-16 19:14:31'),(2,'Ana','Garcia','4771002000','ventas@softbakery.local','Blvd. Norte 55','Leon','2026-04-16 19:14:32'),(3,'Luis','Ruiz','4771003000','produccion@softbakery.local','Col. Centro 12','Leon','2026-04-16 19:14:32'),(4,'Laura','Martinez','4771004000','cliente@softbakery.local','Jardin 88','Leon','2026-04-16 19:14:32');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(120) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `precio_venta` decimal(12,2) NOT NULL,
  `unidad_venta` varchar(20) NOT NULL,
  `cantidad_disponible` int NOT NULL,
  `cantidad_reservada` int NOT NULL,
  `stock_minimo` int NOT NULL,
  `costo_produccion_actual` decimal(12,2) NOT NULL,
  `margen_objetivo_pct` decimal(5,2) NOT NULL,
  `precio_sugerido` decimal(12,2) DEFAULT NULL,
  `fecha_costo_actualizado` datetime DEFAULT NULL,
  `id_receta` int DEFAULT NULL,
  `activo` tinyint(1) NOT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT NULL,
  `fecha_creacion` datetime NOT NULL,
  PRIMARY KEY (`id_producto`),
  UNIQUE KEY `nombre` (`nombre`),
  KEY `id_receta` (`id_receta`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_receta`) REFERENCES `receta` (`id_receta`),
  CONSTRAINT `ck_producto_costo_produccion_no_negativo` CHECK ((`costo_produccion_actual` >= 0)),
  CONSTRAINT `ck_producto_margen_objetivo_rango` CHECK (((`margen_objetivo_pct` > 0) and (`margen_objetivo_pct` < 100))),
  CONSTRAINT `ck_producto_precio_sugerido_no_negativo` CHECK (((`precio_sugerido` is null) or (`precio_sugerido` >= 0))),
  CONSTRAINT `ck_producto_reserva_no_negativa` CHECK ((`cantidad_reservada` >= 0)),
  CONSTRAINT `ck_producto_reserva_no_supera_stock` CHECK ((`cantidad_reservada` <= `cantidad_disponible`)),
  CONSTRAINT `ck_producto_stock_minimo_no_negativo` CHECK ((`stock_minimo` >= 0)),
  CONSTRAINT `ck_producto_stock_no_negativo` CHECK ((`cantidad_disponible` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Pastel de Chocolate','Bizcocho de cacao con cobertura de chocolate semiamargo.',480.00,'Pieza',10,0,5,143.62,30.00,205.17,'2026-04-16 19:14:33',1,1,'img/productos/Pastel_de_chocolate.jpg','2026-04-16 19:14:33','2026-04-16 19:12:42'),(2,'Pastel de Tres Leches con Durazno','Pastel esponjoso bañado con tres leches y durazno.',530.00,'Pieza',10,0,5,120.20,30.00,171.71,'2026-04-16 19:14:33',2,1,'img/productos/Pastel_de_3_leches_de_durazno.jpg','2026-04-16 19:14:33','2026-04-16 19:12:42'),(3,'Cheesecake de Mora Azul','Cheesecake cremoso con topping de mora azul.',620.00,'Pieza',10,0,5,224.76,33.00,335.46,'2026-04-16 19:14:33',3,1,'img/productos/cheesecake_de_mora_azul.jpg','2026-04-16 19:14:33','2026-04-16 19:12:42'),(4,'Chocoflan de Cajeta','Flan napolitano con bizcocho de chocolate y cajeta.',500.00,'Pieza',10,0,5,128.99,30.00,184.27,'2026-04-16 19:14:33',4,1,'img/productos/Chocoflan_con_cajeta.jpg','2026-04-16 19:14:33','2026-04-16 19:12:42'),(5,'Pastel de Frutos Secos','Pastel con frutos secos y crema suave.',590.00,'Pieza',10,0,5,141.46,32.00,208.03,'2026-04-16 19:14:33',5,1,'img/productos/Pastel_de_frutos_secos.jpg','2026-04-16 19:14:33','2026-04-16 19:12:42'),(6,'Pastel Tipo Moka','Bizcocho de cafe y cacao con crema moka.',540.00,'Pieza',10,0,5,131.96,31.00,191.25,'2026-04-16 19:14:33',6,1,'img/productos/Pastel_de_moka.jpg','2026-04-16 19:14:33','2026-04-16 19:12:42'),(7,'Pastel de Red Velvet','Bizcocho red velvet con crema de queso.',520.00,'Pieza',10,0,5,183.28,30.00,261.83,'2026-04-16 19:14:33',7,1,'img/productos/Pastel_de_red_velvet.jpg','2026-04-16 19:14:33','2026-04-16 19:12:42'),(8,'Pastel de Vainilla con Fresas','Bizcocho de vainilla con fresas y crema batida.',450.00,'Pieza',10,0,5,130.61,28.00,181.40,'2026-04-16 19:14:33',8,1,'img/productos/Pastel_de_vainilla.jpg','2026-04-16 19:14:33','2026-04-16 19:12:42'),(9,'Pastel Helado de Oreo','Pastel frio de galleta Oreo con crema.',560.00,'Pieza',10,0,5,191.00,32.00,280.88,'2026-04-16 19:14:33',9,1,'img/productos/Pastel_helado_de_Oreo.jpg','2026-04-16 19:14:33','2026-04-16 19:12:42'),(10,'Pastel de nuez','Sin descripcion',200.00,'Pieza',5,0,5,53.49,25.00,71.32,'2026-04-16 19:45:37',10,1,'img/productos/Pastel_de_queso.jpg','2026-04-16 19:45:46','2026-04-16 19:32:32');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `id_proveedor` int NOT NULL AUTO_INCREMENT,
  `nombre_empresa` varchar(120) NOT NULL,
  `nombre_contacto` varchar(120) NOT NULL,
  `telefono` varchar(30) NOT NULL,
  `correo` varchar(120) NOT NULL,
  `ciudad` varchar(120) NOT NULL,
  `estado` varchar(120) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `fecha_alta` datetime NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  PRIMARY KEY (`id_proveedor`),
  UNIQUE KEY `nombre_empresa` (`nombre_empresa`),
  UNIQUE KEY `correo` (`correo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'Harinera del Norte','Roberto Sanchez','4772001000','harinera@proveedor.local','Leon','Guanajuato','Parque Industrial 1',1,'2026-04-16 19:14:32','2026-04-16 19:14:32'),(2,'Lacteos Premium SA','Claudia Rios','4772002000','lacteos@proveedor.local','Silao','Guanajuato','Zona Sur 23',1,'2026-04-16 19:14:32','2026-04-16 19:14:32'),(3,'Insumos Reposteria MX','Miguel Herrera','4772003000','insumos@proveedor.local','Irapuato','Guanajuato','Av. Comercio 300',1,'2026-04-16 19:14:32','2026-04-16 19:14:32'),(4,'Nuez Leon','Gerardo','477-104-0056','gerardo@gmail.com','Leon','Guanajuato','Las aves 88',1,'2026-04-16 19:27:14','2026-04-16 19:27:14');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receta`
--

DROP TABLE IF EXISTS `receta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receta` (
  `id_receta` int NOT NULL AUTO_INCREMENT,
  `id_producto` int NOT NULL,
  `nombre` varchar(120) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `unidad_produccion` varchar(50) NOT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  `version` int NOT NULL,
  `rendimiento_base` decimal(12,4) NOT NULL,
  `activa` tinyint(1) NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  PRIMARY KEY (`id_receta`),
  UNIQUE KEY `uq_receta_producto_version` (`id_producto`,`version`),
  CONSTRAINT `receta_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`),
  CONSTRAINT `ck_receta_rendimiento_positivo` CHECK ((`rendimiento_base` > 0)),
  CONSTRAINT `ck_receta_version_positiva` CHECK ((`version` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receta`
--

LOCK TABLES `receta` WRITE;
/*!40000 ALTER TABLE `receta` DISABLE KEYS */;
INSERT INTO `receta` VALUES (1,1,'Pastel de Chocolate',NULL,'pieza',NULL,1,1.0000,1,'2026-04-16 19:14:33'),(2,2,'Pastel de Tres Leches con Durazno',NULL,'pieza',NULL,1,1.0000,1,'2026-04-16 19:14:33'),(3,3,'Cheesecake de Mora Azul',NULL,'pieza',NULL,1,1.0000,1,'2026-04-16 19:14:33'),(4,4,'Chocoflan de Cajeta',NULL,'pieza',NULL,1,1.0000,1,'2026-04-16 19:14:33'),(5,5,'Pastel de Frutos Secos',NULL,'pieza',NULL,1,1.0000,1,'2026-04-16 19:14:33'),(6,6,'Pastel Tipo Moka',NULL,'pieza',NULL,1,1.0000,1,'2026-04-16 19:14:33'),(7,7,'Pastel de Red Velvet',NULL,'pieza',NULL,1,1.0000,1,'2026-04-16 19:14:33'),(8,8,'Pastel de Vainilla con Fresas',NULL,'pieza',NULL,1,1.0000,1,'2026-04-16 19:14:33'),(9,9,'Pastel Helado de Oreo',NULL,'pieza',NULL,1,1.0000,1,'2026-04-16 19:14:33'),(10,10,'Pastel de nuez',NULL,'Pieza',NULL,1,1.0000,1,'2026-04-16 19:34:52');
/*!40000 ALTER TABLE `receta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `id_rol` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `es_base` tinyint(1) NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  PRIMARY KEY (`id_rol`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'Administrador','Acceso total al sistema.',1,1,'2026-04-16 19:12:41'),(2,'Ventas','Gestiona ventas y solicitudes de produccion.',1,1,'2026-04-16 19:12:41'),(3,'Produccion','Gestiona ordenes y recetas.',1,1,'2026-04-16 19:12:41'),(4,'Cliente','Compra y consulta pedidos web.',1,1,'2026-04-16 19:12:41');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salida_efectivo`
--

DROP TABLE IF EXISTS `salida_efectivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salida_efectivo` (
  `id_salida` int NOT NULL AUTO_INCREMENT,
  `concepto` varchar(150) NOT NULL,
  `monto` decimal(12,2) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `id_usuario` int NOT NULL,
  `referencia` varchar(80) DEFAULT NULL,
  `referencia_tipo` varchar(50) DEFAULT NULL,
  `referencia_id` int DEFAULT NULL,
  `fecha_creacion` datetime NOT NULL,
  PRIMARY KEY (`id_salida`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `salida_efectivo_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salida_efectivo`
--

LOCK TABLES `salida_efectivo` WRITE;
/*!40000 ALTER TABLE `salida_efectivo` DISABLE KEYS */;
INSERT INTO `salida_efectivo` VALUES (1,'Pago compra 1',2200.00,'COMPRA_MATERIA_PRIMA',1,'COMPRA-1',NULL,NULL,'2026-04-16 19:14:33');
/*!40000 ALTER TABLE `salida_efectivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitud_produccion`
--

DROP TABLE IF EXISTS `solicitud_produccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solicitud_produccion` (
  `id_solicitud` int NOT NULL AUTO_INCREMENT,
  `id_producto` int NOT NULL,
  `id_pedido` int DEFAULT NULL,
  `cantidad` int NOT NULL,
  `estado` varchar(20) NOT NULL,
  `fecha_solicitud` datetime NOT NULL,
  `id_usuario_solicita` int NOT NULL,
  `id_usuario_resuelve` int DEFAULT NULL,
  `fecha_resolucion` datetime DEFAULT NULL,
  `observaciones` varchar(255) DEFAULT NULL,
  `observaciones_resolucion` varchar(255) DEFAULT NULL,
  `fecha_creacion` datetime NOT NULL,
  PRIMARY KEY (`id_solicitud`),
  KEY `id_producto` (`id_producto`),
  KEY `id_pedido` (`id_pedido`),
  KEY `id_usuario_solicita` (`id_usuario_solicita`),
  KEY `id_usuario_resuelve` (`id_usuario_resuelve`),
  CONSTRAINT `solicitud_produccion_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`),
  CONSTRAINT `solicitud_produccion_ibfk_2` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`),
  CONSTRAINT `solicitud_produccion_ibfk_3` FOREIGN KEY (`id_usuario_solicita`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `solicitud_produccion_ibfk_4` FOREIGN KEY (`id_usuario_resuelve`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `ck_solicitud_cantidad_positiva` CHECK ((`cantidad` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitud_produccion`
--

LOCK TABLES `solicitud_produccion` WRITE;
/*!40000 ALTER TABLE `solicitud_produccion` DISABLE KEYS */;
INSERT INTO `solicitud_produccion` VALUES (1,10,NULL,5,'APROBADA','2026-04-16 19:40:15',1,1,'2026-04-16 19:40:58','stock bajo','stock bajo','2026-04-16 19:40:15'),(2,10,1,1,'APROBADA','2026-04-16 19:44:41',1,1,'2026-04-16 19:45:01','Solicitud automática desde pedido PED-0001','pedido','2026-04-16 19:44:41');
/*!40000 ALTER TABLE `solicitud_produccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_venta`
--

DROP TABLE IF EXISTS `ticket_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_venta` (
  `id_ticket` int NOT NULL AUTO_INCREMENT,
  `id_venta` int NOT NULL,
  `folio` varchar(30) NOT NULL,
  `nombre_negocio` varchar(120) NOT NULL,
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`id_ticket`),
  UNIQUE KEY `id_venta` (`id_venta`),
  UNIQUE KEY `folio` (`folio`),
  CONSTRAINT `ticket_venta_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `venta` (`id_venta`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_venta`
--

LOCK TABLES `ticket_venta` WRITE;
/*!40000 ALTER TABLE `ticket_venta` DISABLE KEYS */;
INSERT INTO `ticket_venta` VALUES (1,2,'SB-000002','SoftBakery','2026-04-16 19:45:46');
/*!40000 ALTER TABLE `ticket_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidad_medida`
--

DROP TABLE IF EXISTS `unidad_medida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unidad_medida` (
  `id_unidad` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) NOT NULL,
  `abreviatura` varchar(20) NOT NULL,
  `dimension` varchar(20) NOT NULL,
  `factor_base` decimal(12,4) NOT NULL,
  PRIMARY KEY (`id_unidad`),
  UNIQUE KEY `nombre` (`nombre`),
  UNIQUE KEY `abreviatura` (`abreviatura`),
  CONSTRAINT `ck_unidad_medida_factor_base_positivo` CHECK ((`factor_base` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidad_medida`
--

LOCK TABLES `unidad_medida` WRITE;
/*!40000 ALTER TABLE `unidad_medida` DISABLE KEYS */;
INSERT INTO `unidad_medida` VALUES (1,'Kilogramo','kg','MASA',1000.0000),(2,'Gramo','g','MASA',1.0000),(3,'Litro','l','VOLUMEN',1000.0000),(4,'Mililitro','ml','VOLUMEN',1.0000),(5,'Pieza','pza','CONTEO',1.0000),(6,'Costal','cos','MASA',20000.0000);
/*!40000 ALTER TABLE `unidad_medida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `id_persona` int NOT NULL,
  `id_rol` int NOT NULL,
  `username` varchar(60) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `intentos_fallidos` int NOT NULL,
  `bloqueado_hasta` datetime DEFAULT NULL,
  `ultimo_acceso` datetime DEFAULT NULL,
  `token_2fa` varchar(10) DEFAULT NULL,
  `expiracion_2fa` datetime DEFAULT NULL,
  `activo` tinyint(1) NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `id_persona` (`id_persona`),
  UNIQUE KEY `username` (`username`),
  KEY `id_rol` (`id_rol`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`),
  CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,1,1,'admin','$2b$12$ve5k6Ajy/PApjtzaXriYueJyPowKhUYRSQhPXxmqnkOptWin8ju4m',0,NULL,'2026-04-16 19:44:13',NULL,NULL,1,'2026-04-16 19:14:32'),(2,2,2,'ventas','$2b$12$vzWFrgvLyPks3ATPF0MDu.UgDR9y6ynS1Pp8U0RnzwdIFyBSw2AQi',0,NULL,'2026-04-16 19:14:32',NULL,NULL,1,'2026-04-16 19:14:32'),(3,3,3,'produccion','$2b$12$DIDea9dl5PXuO3XFxMVabOymuaJNeiYk.YLBUsj/hVXVvu0ZFFa.G',0,NULL,'2026-04-16 19:14:32',NULL,NULL,1,'2026-04-16 19:14:32'),(4,4,4,'cliente','$2b$12$GyQhUdu499W.6B1mf9amh.o401bA/8rdr0Mkb.wVV.y7Gvs6VBpeS',0,NULL,'2026-04-16 19:46:51',NULL,NULL,1,'2026-04-16 19:14:32');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta` (
  `id_venta` int NOT NULL AUTO_INCREMENT,
  `id_pedido` int DEFAULT NULL,
  `id_usuario_cliente` int NOT NULL,
  `fecha` datetime NOT NULL,
  `total` decimal(12,2) NOT NULL,
  `estado` varchar(40) NOT NULL,
  `tipo_pago` varchar(20) NOT NULL,
  `requiere_ticket` tinyint(1) NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `id_pedido` (`id_pedido`),
  KEY `id_usuario_cliente` (`id_usuario_cliente`),
  CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`),
  CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`id_usuario_cliente`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (1,NULL,4,'2026-04-16 19:14:33',2160.00,'CONFIRMADO','TARJETA',0,'2026-04-16 19:14:33'),(2,1,4,'2026-04-16 19:45:46',200.00,'CONFIRMADO','TARJETA',1,'2026-04-16 19:45:46');
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-16 13:55:48
