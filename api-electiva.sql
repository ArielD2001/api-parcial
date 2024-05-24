-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-05-2024 a las 04:35:25
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `api-electiva`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `generos`
--

CREATE TABLE `generos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `generos`
--

INSERT INTO `generos` (`id`, `nombre`) VALUES
(1, 'Acción'),
(2, 'Aventura'),
(3, 'Comedia'),
(4, 'Drama'),
(5, 'Ciencia Ficción'),
(6, 'Fantasía'),
(7, 'Terror'),
(8, 'Misterio'),
(9, 'Romance'),
(10, 'Thriller'),
(11, 'Documental'),
(12, 'Animación'),
(13, 'Musical'),
(14, 'Crimen');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `peliculas`
--

CREATE TABLE `peliculas` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `director` varchar(255) NOT NULL,
  `anio` int(11) NOT NULL,
  `genero` varchar(100) NOT NULL,
  `duracion` int(11) NOT NULL,
  `descripcion` text NOT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_actualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `peliculas`
--

INSERT INTO `peliculas` (`id`, `titulo`, `director`, `anio`, `genero`, `duracion`, `descripcion`, `imagen`, `fecha_creacion`, `fecha_actualizacion`) VALUES
(1, 'The Great Adventure', 'John Smith', 2020, 'Aventura', 130, 'Una épica aventura en busca de un tesoro perdido.', 'https://m.media-amazon.com/images/M/MV5BMTgzNDU5MjgxNF5BMl5BanBnXkFtZTgwOTM4MjkwMzE@._V1_.jpg', '2024-05-22 21:53:55', '2024-05-22 22:09:26'),
(2, 'Love in Paris', 'Jane Doe', 2018, 'Romance', 105, 'Una historia de amor en la ciudad de las luces.', 'https://pics.filmaffinity.com/9_semanas_y_media_II_Amor_en_Parais-225009578-large.jpg', '2024-05-22 21:53:55', '2024-05-22 22:09:26'),
(3, 'The Mystery Case', 'Albert Johnson', 2019, 'Misterio', 115, 'Un detective resuelve un enigmático caso de asesinato.', 'https://i.mydramalist.com/Xdr0mO_4f.jpg', '2024-05-22 21:53:55', '2024-05-22 22:09:26'),
(4, 'Future World', 'Emily Davis', 2022, 'Ciencia Ficción', 140, 'Una visión del futuro donde la tecnología gobierna el mundo.', 'https://es.web.img2.acsta.net/pictures/18/04/10/17/27/0918882.jpg', '2024-05-22 21:53:55', '2024-05-22 22:09:26'),
(5, 'The Haunted House', 'Michael Brown', 2017, 'Terror', 95, 'Un grupo de amigos se enfrenta a una casa embrujada.', 'https://m.media-amazon.com/images/M/MV5BMTM1ODgyOTI0NF5BMl5BanBnXkFtZTcwODgyMDY3OA@@._V1_.jpg', '2024-05-22 21:53:55', '2024-05-22 22:09:26'),
(6, 'Comedy Night', 'Linda White', 2021, 'Comedia', 100, 'Una noche llena de risas y situaciones cómicas.', 'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/comedy-night-design-template-96b55a39cab1acd41c8eddc28e3464dc_screen.jpg?ts=1696312216', '2024-05-22 21:53:55', '2024-05-22 22:09:26'),
(7, 'The War Hero', 'Robert Lee', 2016, 'Acción', 120, 'La historia de un héroe de guerra y sus hazañas.', 'https://upload.wikimedia.org/wikipedia/commons/f/f3/The_War_Hero_novel_cover_%28copyright_info_in_description%29.jpg', '2024-05-22 21:53:55', '2024-05-22 22:09:26'),
(8, 'Historical Drama', 'Patricia Green', 2015, 'Drama', 110, 'Una representación dramática de eventos históricos.', 'https://i.pinimg.com/736x/99/31/57/993157bc07c7b07469c0b36949544354.jpg', '2024-05-22 21:53:55', '2024-05-22 22:09:26'),
(11, 'The Great Adventure', 'John Smith', 2020, 'Aventura', 130, 'Una épica aventura en busca de un tesoro perdido.', 'https://m.media-amazon.com/images/M/MV5BMTgzNDU5MjgxNF5BMl5BanBnXkFtZTgwOTM4MjkwMzE@._V1_.jpg', '2024-05-22 21:53:55', '2024-05-22 22:09:26'),
(12, 'Love in Paris', 'Jane Doe', 2018, 'Romance', 105, 'Una historia de amor en la ciudad de las luces.', 'https://pics.filmaffinity.com/9_semanas_y_media_II_Amor_en_Parais-225009578-large.jpg', '2024-05-22 21:53:55', '2024-05-22 22:09:26'),
(13, 'The Mystery Case', 'Albert Johnson', 2019, 'Misterio', 115, 'Un detective resuelve un enigmático caso de asesinato.', 'https://i.mydramalist.com/Xdr0mO_4f.jpg', '2024-05-22 21:53:55', '2024-05-22 22:09:26'),
(14, 'Future World', 'Emily Davis', 2022, 'Ciencia Ficción', 140, 'Una visión del futuro donde la tecnología gobierna el mundo.', 'https://es.web.img2.acsta.net/pictures/18/04/10/17/27/0918882.jpg', '2024-05-22 21:53:55', '2024-05-22 22:09:26'),
(15, 'The Haunted House', 'Michael Brown', 2017, 'Terror', 95, 'Un grupo de amigos se enfrenta a una casa embrujada.', 'https://m.media-amazon.com/images/M/MV5BMTM1ODgyOTI0NF5BMl5BanBnXkFtZTcwODgyMDY3OA@@._V1_.jpg', '2024-05-22 21:53:55', '2024-05-22 22:09:26'),
(16, 'Comedy Night', 'Linda White', 2021, 'Comedia', 100, 'Una noche llena de risas y situaciones cómicas.', 'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/comedy-night-design-template-96b55a39cab1acd41c8eddc28e3464dc_screen.jpg?ts=1696312216', '2024-05-22 21:53:55', '2024-05-22 22:09:26'),
(17, 'The War Hero', 'Robert Lee', 2016, 'Acción', 120, 'La historia de un héroe de guerra y sus hazañas.', 'https://upload.wikimedia.org/wikipedia/commons/f/f3/The_War_Hero_novel_cover_%28copyright_info_in_description%29.jpg', '2024-05-22 21:53:55', '2024-05-22 22:09:26'),
(18, 'Historical Drama', 'Patricia Green', 2015, 'Drama', 110, 'Una representación dramática de eventos históricos.', 'https://i.pinimg.com/736x/99/31/57/993157bc07c7b07469c0b36949544354.jpg', '2024-05-22 21:53:55', '2024-05-22 22:09:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `series`
--

CREATE TABLE `series` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `director` varchar(255) NOT NULL,
  `anio_inicio` int(11) NOT NULL,
  `anio_fin` int(11) DEFAULT NULL,
  `genero` varchar(50) NOT NULL,
  `temporadas` int(11) NOT NULL,
  `episodios` int(11) NOT NULL,
  `descripcion` text NOT NULL,
  `imagen` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `series`
--

INSERT INTO `series` (`id`, `titulo`, `director`, `anio_inicio`, `anio_fin`, `genero`, `temporadas`, `episodios`, `descripcion`, `imagen`) VALUES
(7, 'The Office', 'Greg Daniels', 2005, 2013, 'Comedia', 9, 201, 'Una comedia de falso documental que detalla la vida diaria de los empleados en una oficina de ventas de papel.', 'https://www.gstatic.com/tv/thumb/tvbanners/184819/p184819_b_v8_ab.jpg'),
(11, 'Stranger Things', 'The Duffer Brothers', 2016, NULL, 'Ciencia Ficción', 4, 34, 'Un grupo de niños en la década de 1980 se enfrenta a fenómenos sobrenaturales en su pequeño pueblo.', 'https://image.tmdb.org/t/p/w500/x2LSRK2Cm7MZhjluni1msVJ3wDF.jpg'),
(12, 'Game of Thrones', 'David Benioff, D.B. Weiss', 2011, 2019, 'Fantasía', 8, 73, 'Nueve familias nobles luchan por el control de los Siete Reinos de Westeros.', 'https://image.tmdb.org/t/p/w500/u3bZgnGQ9T01sWNhyveQz0wH0Hl.jpg'),
(13, 'Breaking Bad', 'Vince Gilligan', 2008, 2013, 'Drama', 5, 62, 'Un profesor de química de secundaria recurre a la fabricación y venta de metanfetaminas para asegurar el futuro de su familia.', 'https://image.tmdb.org/t/p/w500/ggFHVNu6YYI5L9pCfOacjizRGt.jpg'),
(14, 'The Witcher', 'Lauren Schmidt Hissrich', 2019, NULL, 'Fantasía', 3, 24, 'Un cazador de monstruos lucha por encontrar su lugar en un mundo donde las personas son a menudo más perversas que las bestias.', 'https://image.tmdb.org/t/p/w500/zrPpUlehQaBf8YX2NrVrKK8IEpf.jpg'),
(16, 'Friends', 'David Crane, Marta Kauffman', 1994, 2004, 'Comedia', 10, 236, 'Seis amigos de veintitantos años viven en Nueva York y enfrentan los altibajos de la vida juntos.', 'https://image.tmdb.org/t/p/w500/f496cm9enuEsZkSPzCwnTESEK5s.jpg'),
(17, 'The Office', 'Greg Daniels', 2005, 2013, 'Comedia', 9, 201, 'Una comedia de falso documental que detalla la vida diaria de los empleados en una oficina de ventas de papel.', 'https://image.tmdb.org/t/p/w500/qWnJzyZhyy74gjpSjIXWmuk0ifX.jpg'),
(18, 'The Crown', 'Peter Morgan', 2016, NULL, 'Drama', 4, 40, 'Una dramatización de la vida de la Reina Isabel II y los eventos que han dado forma a la segunda mitad del siglo XX.', 'https://image.tmdb.org/t/p/w500/kiX7UYfOpYrMFSAGbI6j1pFkLzQ.jpg'),
(21, 'The Office', 'Greg Daniels', 2005, 2013, 'Comedia', 9, 201, 'Una comedia de falso documental que detalla la vida diaria de los empleados en una oficina de ventas de papel.', 'https://www.gstatic.com/tv/thumb/tvbanners/184819/p184819_b_v8_ab.jpg'),
(22, 'Stranger Things', 'The Duffer Brothers', 2016, NULL, 'Ciencia Ficción', 4, 34, 'Un grupo de niños en la década de 1980 se enfrenta a fenómenos sobrenaturales en su pequeño pueblo.', 'https://image.tmdb.org/t/p/w500/x2LSRK2Cm7MZhjluni1msVJ3wDF.jpg'),
(23, 'Game of Thrones', 'David Benioff, D.B. Weiss', 2011, 2019, 'Fantasía', 8, 73, 'Nueve familias nobles luchan por el control de los Siete Reinos de Westeros.', 'https://image.tmdb.org/t/p/w500/u3bZgnGQ9T01sWNhyveQz0wH0Hl.jpg'),
(24, 'Breaking Bad', 'Vince Gilligan', 2008, 2013, 'Drama', 5, 62, 'Un profesor de química de secundaria recurre a la fabricación y venta de metanfetaminas para asegurar el futuro de su familia.', 'https://image.tmdb.org/t/p/w500/ggFHVNu6YYI5L9pCfOacjizRGt.jpg'),
(25, 'The Witcher', 'Lauren Schmidt Hissrich', 2019, NULL, 'Fantasía', 3, 24, 'Un cazador de monstruos lucha por encontrar su lugar en un mundo donde las personas son a menudo más perversas que las bestias.', 'https://image.tmdb.org/t/p/w500/zrPpUlehQaBf8YX2NrVrKK8IEpf.jpg'),
(26, 'Friends', 'David Crane, Marta Kauffman', 1994, 2004, 'Comedia', 10, 236, 'Seis amigos de veintitantos años viven en Nueva York y enfrentan los altibajos de la vida juntos.', 'https://image.tmdb.org/t/p/w500/f496cm9enuEsZkSPzCwnTESEK5s.jpg'),
(27, 'The Office', 'Greg Daniels', 2005, 2013, 'Comedia', 9, 201, 'Una comedia de falso documental que detalla la vida diaria de los empleados en una oficina de ventas de papel.', 'https://image.tmdb.org/t/p/w500/qWnJzyZhyy74gjpSjIXWmuk0ifX.jpg'),
(28, 'The Crown', 'Peter Morgan', 2016, NULL, 'Drama', 4, 40, 'Una dramatización de la vida de la Reina Isabel II y los eventos que han dado forma a la segunda mitad del siglo XX.', 'https://image.tmdb.org/t/p/w500/kiX7UYfOpYrMFSAGbI6j1pFkLzQ.jpg');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `generos`
--
ALTER TABLE `generos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `peliculas`
--
ALTER TABLE `peliculas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `series`
--
ALTER TABLE `series`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `generos`
--
ALTER TABLE `generos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `peliculas`
--
ALTER TABLE `peliculas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `series`
--
ALTER TABLE `series`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
