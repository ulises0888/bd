-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 03-04-2025 a las 19:21:42
-- Versión del servidor: 8.0.30
-- Versión de PHP: 8.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `market`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `id_carrito` int NOT NULL,
  `idproductos` int NOT NULL,
  `cantidad` int NOT NULL,
  `total` int NOT NULL,
  `idusuarios` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `carrito`
--

INSERT INTO `carrito` (`id_carrito`, `idproductos`, `cantidad`, `total`, `idusuarios`) VALUES
(19, 15, 2, 30000, 17),
(22, 13, 4, 6000, 17),
(23, 24, 4, 14080, 17),
(26, 13, 3, 4500, 20),
(29, 25, 3, 2697, 17),
(30, 27, 3, 2670, 20),
(33, 17, 1, 4500, 21);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `idcategoria` int NOT NULL,
  `categoria` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`idcategoria`, `categoria`) VALUES
(1, 'Electronicos'),
(2, 'Ropa'),
(3, 'Libros'),
(4, 'Hogar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadopedido`
--

CREATE TABLE `estadopedido` (
  `idestado` int NOT NULL,
  `descripcion` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `idpedidos` int NOT NULL,
  `idcomprador` int NOT NULL,
  `idproducto` int NOT NULL,
  `idvendedor` int NOT NULL,
  `cantidad` int NOT NULL,
  `idestado` int NOT NULL,
  `fecha_pedido` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idproductos` int NOT NULL,
  `idusuarios` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `precio` double NOT NULL,
  `imagen` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `fecha_creacion` date NOT NULL,
  `idcategoria` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idproductos`, `idusuarios`, `nombre`, `descripcion`, `precio`, `imagen`, `fecha_creacion`, `idcategoria`) VALUES
(13, 15, 'Router', 'Router cisco', 1500, 'PRODUCT-1741285236382.jpeg', '2025-03-12', 1),
(14, 15, 'Celular Chino', 'Chino', 1500, 'PRODUCT-1741285493135.jpeg', '2025-03-06', 1),
(15, 15, 'HP', 'Laptop', 15000, 'PRODUCT-1741285660726.jpg', '2025-03-06', 1),
(16, 15, 'Monitor', 'Monitor HP', 2000, 'PRODUCT-1741466937630.jpeg', '2025-03-08', 1),
(17, 20, 'Galaxy A14', '125 GB de almacenamiento y 6GB de ram', 4500, 'PRODUCT-1741545806661.jpeg', '2025-03-09', 1),
(20, 20, 'Samsung Galaxy A55 5G', '5G 250GB', 8000, 'PRODUCT-1741555771985.jpeg', '2025-03-09', 1),
(21, 20, 'InCell', '128 GB', 2000, 'PRODUCT-1741555820707.jpeg', '2025-03-09', 1),
(23, 21, 'Galaxy A54 ', '128 GB 4G', 4500, 'PRODUCT-1741556000296.jpeg', '2025-03-09', 1),
(24, 21, 'Honor 4.5', '128GB y 8GB de ram', 3520, 'PRODUCT-1741556037536.jpeg', '2025-03-09', 1),
(25, 21, 'Hey Dog Mexico 10', 'Color: Negro', 899, 'PRODUCT-1741559959359.jpg', '2025-03-09', 2),
(26, 21, 'Hey Dog K-9 ', 'Color: Negro', 890, 'PRODUCT-1741560080586.jpg', '2025-03-09', 2),
(27, 21, 'Hey Dog Bull Dog Solid', 'Color: Negro', 890, 'PRODUCT-1741560117580.jpeg', '2025-03-09', 2),
(28, 20, 'Comedor', 'Comedor', 5000, 'PRODUCT-1741560212590.jpeg', '2025-03-09', 4),
(29, 20, 'Kali Linux', 'Hacking practico', 500, 'PRODUCT-1741560278411.jpg', '2025-03-09', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `idrol` int NOT NULL,
  `descripcion` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`idrol`, `descripcion`) VALUES
(1, 'Usuario'),
(2, 'Vendedor'),
(3, 'Admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idusuarios` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `id_rol` int NOT NULL,
  `fecha_creacion` date NOT NULL,
  `foto_perfil` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idusuarios`, `nombre`, `email`, `password`, `id_rol`, `fecha_creacion`, `foto_perfil`) VALUES
(9, 'Jony', 'jony@gmail.com', 'wtsd', 1, '2025-02-15', NULL),
(10, 'Jordy', 'jordy@gmail.com', 'qwsa', 1, '2025-02-14', NULL),
(12, 'Josue', 'josue@gmail.com', '$2b$10$LUZYpyK0KjWMOK6FiQltIeh1832mcyBYIFL/sLVOXIOPL6hn.Raru', 1, '2025-02-21', NULL),
(15, 'Maria', 'maria@gmail.com', '$2b$10$UhBjMtT/tkkUy/CBQjuQUO.LxoMAgTIF0WBJbaK4jssfswAc8K9cu', 3, '2025-02-26', 'PROFILE-1741285639300.jpg'),
(17, 'Ulises', 'ulises@gmail.com', '$2b$10$o4G6jxKBawAqN09mQMKUlugkLEBb4lSQWvhZxYyjbSjVLvyPlfXKq', 1, '2025-02-27', 'PROFILE-1741285621700.png'),
(18, 'Estela', 'estela@gmail.com', '$2b$10$LkeJY6MkOaROzId/vKAshuLMgLERQxcMzuNyQ/jW3za5hvhd2el4e', 1, '2025-03-05', NULL),
(19, 'Miguelito', 'miguelito@gmail.com', '$2b$10$3AbgnZAlbqAWJIcwKR956.pRy3NIsY78m17sB1bFD7qqgUGnfeiv6', 2, '2025-03-05', 'PROFILE-1741270802832.png'),
(20, 'Luisa', 'luisa@gmail.com', '$2b$10$UdJlKXupr1M.7OUsnL2NyekWkj2sIktfjyWmh9aHEcoXDTa4CidyO', 2, '2025-03-09', 'PROFILE-1741540803107.jpg'),
(21, 'Sofia', 'sofia@gmail.com', '$2b$10$tGqmz1ub1UsGFSyaxnQrAuOfhRKgNdlf5Ovu1vLE5tcT61EXZbhZ6', 2, '2025-03-09', 'PROFILE-1741555965004.jpeg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vendedor`
--

CREATE TABLE `vendedor` (
  `id_vendedor` int NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`id_carrito`),
  ADD KEY `idproductos` (`idproductos`),
  ADD KEY `idusuarios` (`idusuarios`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idcategoria`);

--
-- Indices de la tabla `estadopedido`
--
ALTER TABLE `estadopedido`
  ADD PRIMARY KEY (`idestado`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`idpedidos`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idproductos`),
  ADD KEY `idusuarios` (`idusuarios`),
  ADD KEY `idcategoria` (`idcategoria`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`idrol`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idusuarios`),
  ADD KEY `id_rol` (`id_rol`);

--
-- Indices de la tabla `vendedor`
--
ALTER TABLE `vendedor`
  ADD PRIMARY KEY (`id_vendedor`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `id_carrito` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idcategoria` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estadopedido`
--
ALTER TABLE `estadopedido`
  MODIFY `idestado` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `idpedidos` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idproductos` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `idrol` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idusuarios` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `vendedor`
--
ALTER TABLE `vendedor`
  MODIFY `id_vendedor` int NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `carrito_ibfk_1` FOREIGN KEY (`idproductos`) REFERENCES `productos` (`idproductos`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `idusuarios` FOREIGN KEY (`idusuarios`) REFERENCES `usuarios` (`idusuarios`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_productos_usuarios` FOREIGN KEY (`idusuarios`) REFERENCES `usuarios` (`idusuarios`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`idcategoria`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`idrol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
