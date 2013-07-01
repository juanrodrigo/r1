-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-07-2013 a las 14:46:03
-- Versión del servidor: 5.5.27
-- Versión de PHP: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `codice`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acciones`
--

CREATE TABLE IF NOT EXISTS `acciones` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `accion` varchar(25) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `acciones`
--

INSERT INTO `acciones` (`id`, `accion`) VALUES
(1, 'Accion Necesaria'),
(2, 'Preparar Respuesta'),
(3, 'Preparar informe'),
(4, 'Para su consideración'),
(5, 'Para su conocimiento'),
(6, 'Para firma'),
(7, 'Despachar'),
(8, 'Archivar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agrupaciones`
--

CREATE TABLE IF NOT EXISTS `agrupaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `padre` varchar(25) NOT NULL DEFAULT '0',
  `hijo` varchar(25) NOT NULL DEFAULT '0',
  `id_seguimiento` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `cargo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`,`padre`,`hijo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT AUTO_INCREMENT=10 ;

--
-- Volcado de datos para la tabla `agrupaciones`
--

INSERT INTO `agrupaciones` (`id`, `padre`, `hijo`, `id_seguimiento`, `id_user`, `fecha`, `nombre`, `cargo`) VALUES
(1, 'ZFC/2013-00009', 'IBM/2013-00004', 16, 14, '2013-02-20 13:00:05', 'Luis Fernando', 'Jefe Unidad Auditoria Interna'),
(2, 'ZFC/2013-00009', 'IBM/2013-00007', 23, 14, '2013-02-20 13:00:05', 'Luis Fernando', 'Jefe Unidad Auditoria Interna'),
(3, 'IBM/2013-00004', 'ZFC/2013-00009', 22, 14, '2013-02-20 13:02:13', 'Luis Fernando', 'Jefe Unidad Auditoria Interna'),
(4, 'IBM/2013-00004', 'IBM/2013-00007', 23, 14, '2013-02-20 13:02:13', 'Luis Fernando', 'Jefe Unidad Auditoria Interna'),
(5, 'IBM/2013-00004', 'ZFC/2013-00009', 22, 14, '2013-02-20 13:04:24', 'Luis Fernando', 'Jefe Unidad Auditoria Interna'),
(6, 'IBM/2013-00004', 'IBM/2013-00007', 23, 14, '2013-02-20 13:04:24', 'Luis Fernando', 'Jefe Unidad Auditoria Interna'),
(7, 'ZFC/2013-00006', 'ZFC/2013-00003', 19, 14, '2013-02-20 14:38:17', 'Luis Fernando', 'Jefe Unidad Auditoria Interna'),
(8, 'ZFC/2013-00006', 'IBM/2013-00005', 18, 14, '2013-02-20 14:38:17', 'Luis Fernando', 'Jefe Unidad Auditoria Interna'),
(9, 'IBM/2013-00001', 'ZFC/2013-00004', 20, 19, '2013-02-20 15:50:58', 'Carlos Eduardo', 'Responsable Regional Cochabamba');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `archivados`
--

CREATE TABLE IF NOT EXISTS `archivados` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nur` varchar(25) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_carpeta` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `observaciones` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `archivados`
--

INSERT INTO `archivados` (`id`, `nur`, `id_user`, `id_carpeta`, `fecha`, `observaciones`) VALUES
(1, 'ZFC/2013-00006', 14, 3, '2013-02-20 15:24:56', ''),
(2, 'ZFC/2013-00005', 14, 7, '2013-02-20 15:30:45', ''),
(3, 'MDPyEP/2013-00211', 35, 11, '2013-06-28 16:34:35', 'Informe numero 000000001');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `archivos`
--

CREATE TABLE IF NOT EXISTS `archivos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre_archivo` varchar(255) DEFAULT NULL,
  `extension` varchar(100) DEFAULT NULL,
  `tamanio` varchar(20) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `id_documento` int(11) DEFAULT NULL,
  `sub_directorio` varchar(10) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=168 ;

--
-- Volcado de datos para la tabla `archivos`
--

INSERT INTO `archivos` (`id`, `nombre_archivo`, `extension`, `tamanio`, `id_user`, `fecha`, `id_documento`, `sub_directorio`, `estado`) VALUES
(132, '5108472cc4701doc___1.pdf', 'application/pdf', '129522', 2, '2013-01-29 18:03:24', 1, '2013_01', 1),
(133, '510940088f71bnotaPDF.pdf', 'application/pdf', '13845', 4, '2013-01-30 11:45:12', 7, '2013_01', 1),
(134, '5109401d9469fdoc___1.pdf', 'application/pdf', '129522', 4, '2013-01-30 11:45:33', 7, '2013_01', 1),
(135, '510941362152fdoc___1.pdf', 'application/pdf', '129522', 4, '2013-01-30 11:50:14', 8, '2013_01', 1),
(136, '510941564c166doc___2.pdf', 'application/pdf', '129522', 4, '2013-01-30 11:50:46', 8, '2013_01', 1),
(137, '5109415ec1a2edoc___3.pdf', 'application/pdf', '129522', 4, '2013-01-30 11:50:54', 8, '2013_01', 1),
(138, '51094169e4ba2notaPDF.pdf', 'application/pdf', '13845', 4, '2013-01-30 11:51:05', 8, '2013_01', 1),
(139, '51094517513c2notaPDF.pdf', 'application/pdf', '13845', 4, '2013-01-30 12:06:47', 9, '2013_01', 1),
(140, '5109454573cddnota_1.pdf', 'application/pdf', '13845', 4, '2013-01-30 12:07:33', 9, '2013_01', 1),
(141, '5109454d71de4nota_2.pdf', 'application/pdf', '13845', 4, '2013-01-30 12:07:41', 9, '2013_01', 1),
(142, '51094554b3f27nota_3.pdf', 'application/pdf', '13845', 4, '2013-01-30 12:07:48', 9, '2013_01', 1),
(143, '51096f6a85d712013-00002.pdf', 'application/pdf', '129522', 7, '2013-01-30 15:07:22', 11, '2013_01', 1),
(144, '5109773244b442013-00001.pdf', 'application/pdf', '13845', 7, '2013-01-30 15:40:34', 10, '2013_01', 1),
(145, '51098454444822013-00003.pdf', 'application/pdf', '79310', 7, '2013-01-30 16:36:36', 12, '2013_01', 1),
(146, '5113afe74759aInforme_N_3.pdf', 'application/pdf', '116503', 4, '2013-02-07 09:45:11', 14, '2013_02', 1),
(147, '51151cd4682842013-00004.pdf', 'application/pdf', '116503', 7, '2013-02-08 11:42:12', 15, '2013_02', 1),
(148, '511e965383c58doc___1.pdf', 'application/pdf', '129522', 4, '2013-02-15 16:10:59', 16, '2013_02', 1),
(149, '51239a45182fcInforme_de_Auditoria_2-2012.pdf', 'application/pdf', '14255212', 21, '2013-02-19 11:29:09', 17, '2013_02', 1),
(150, '51239ac25585bInforme_de_Auditoria_2-2012_-_copia.pdf', 'application/pdf', '14255212', 21, '2013-02-19 11:31:14', 17, '2013_02', 0),
(151, '51239b8b6ab27Informe_de_Auditoria_2-2012_-_copia.pdf', 'application/pdf', '14255212', 21, '2013-02-19 11:34:35', 17, '2013_02', 1),
(152, '5123f0fe0d665carta_axs.pdf', 'application/pdf', '176727', 15, '2013-02-19 17:39:10', 20, '2013_02', 1),
(153, '5123f26c7f56dinforme_tecnico.pdf', 'application/pdf', '176727', 15, '2013-02-19 17:45:16', 21, '2013_02', 1),
(154, '5124c997a5fcbinforme_19-02-2013.pdf', 'application/pdf', '176727', 15, '2013-02-20 09:03:19', 22, '2013_02', 1),
(155, '5124ca32678f3informe.pdf', 'application/pdf', '176727', 15, '2013-02-20 09:05:54', 23, '2013_02', 1),
(156, '5124caf5cc243POA.pdf', 'application/pdf', '176727', 15, '2013-02-20 09:09:09', 24, '2013_02', 1),
(157, '5124ce53d06f3informe.pdf', 'application/pdf', '176727', 22, '2013-02-20 09:23:31', 26, '2013_02', 1),
(158, '5124cefdb119finforme.pdf', 'application/pdf', '176727', 22, '2013-02-20 09:26:21', 27, '2013_02', 1),
(159, '5124d1b2def0binforme.pdf', 'application/pdf', '176727', 19, '2013-02-20 09:37:54', 28, '2013_02', 1),
(160, '5124f2d1c5a4ainforme.pdf', 'application/pdf', '176727', 14, '2013-02-20 11:59:13', 30, '2013_02', 1),
(161, '5124f8acdf09cinforme_actividades_octubre.pdf', 'application/pdf', '176727', 22, '2013-02-20 12:24:12', 31, '2013_02', 1),
(162, '5124f9d475818informe_actividades.pdf', 'application/pdf', '176727', 16, '2013-02-20 12:29:08', 32, '2013_02', 1),
(163, '512548c202885informe_actividades.pdf', 'application/pdf', '176727', 15, '2013-02-20 18:05:54', 37, '2013_02', 1),
(164, '512619f8d473dinforme_actividades.pdf', 'application/pdf', '176727', 17, '2013-02-21 08:58:32', 40, '2013_02', 1),
(165, '5126212a0b71cinforme_actividades.pdf', 'application/pdf', '176727', 14, '2013-02-21 09:29:14', 43, '2013_02', 1),
(166, '5126244e6a7e4informe_actividades.pdf', 'application/pdf', '176727', 16, '2013-02-21 09:42:38', 44, '2013_02', 1),
(167, '514a3f2cd9615README.md', 'application/octet-stream', '26329', 14, '2013-03-20 18:58:52', 45, '2013_03', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carpetas`
--

CREATE TABLE IF NOT EXISTS `carpetas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_oficina` int(11) DEFAULT NULL,
  `carpeta` varchar(100) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `nivel` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Volcado de datos para la tabla `carpetas`
--

INSERT INTO `carpetas` (`id`, `id_oficina`, `carpeta`, `fecha_creacion`, `nivel`) VALUES
(1, 27, 'CORRESPONDENCIA 2011', '2011-11-30 06:59:16', 1),
(2, 27, 'correspondencia oficial 2012', '2012-01-06 08:08:07', 1),
(3, NULL, 'Informes', '2012-01-06 12:09:41', 3),
(4, NULL, 'Actas de entrega', '2012-01-06 12:09:41', 3),
(5, NULL, 'Circulares', '2012-01-06 12:09:41', 3),
(6, NULL, 'Varios', '2012-01-06 12:09:41', 3),
(7, NULL, 'Cartas', '2012-01-06 12:09:41', 3),
(8, NULL, 'Adquisiciones', '2012-01-06 12:09:41', 3),
(9, NULL, 'Circulares', '2012-01-06 12:09:41', 4),
(10, NULL, 'Memorandums', '2012-01-06 12:09:41', 3),
(11, NULL, 'Informes', '2012-02-04 09:46:17', 2),
(13, 60, 'Carpeta de sistemas', '2012-12-26 15:15:31', 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `correlativo`
--

CREATE TABLE IF NOT EXISTS `correlativo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_oficina` int(11) NOT NULL DEFAULT '0',
  `id_tipo` int(11) NOT NULL DEFAULT '0',
  `correlativo` int(10) unsigned DEFAULT '0',
  `id_entidad` int(11) NOT NULL,
  PRIMARY KEY (`id`,`id_oficina`,`id_tipo`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=656 ;

--
-- Volcado de datos para la tabla `correlativo`
--

INSERT INTO `correlativo` (`id`, `id_oficina`, `id_tipo`, `correlativo`, `id_entidad`) VALUES
(491, 79, 3, 4, 1),
(492, 79, 4, 4, 1),
(493, 79, 1, 1, 1),
(494, 79, 2, 1, 1),
(495, 100, 1, 0, 2),
(496, 100, 2, 0, 2),
(497, 100, 3, 0, 2),
(498, 100, 4, 0, 2),
(499, 100, 5, 0, 2),
(500, 100, 9, 0, 2),
(501, 100, 10, 0, 2),
(502, 0, -3, 4, 2),
(503, 0, -1, 4, 2),
(504, 100, 1, 0, 12),
(505, 100, 2, 0, 12),
(506, 100, 3, 0, 12),
(507, 100, 4, 0, 12),
(508, 100, 5, 0, 12),
(509, 100, 9, 0, 12),
(510, 100, 10, 0, 12),
(511, 101, 1, 0, 12),
(512, 101, 2, 0, 12),
(513, 101, 3, 18, 12),
(514, 101, 4, 8, 12),
(515, 101, 5, 3, 12),
(516, 101, 9, 0, 12),
(517, 101, 10, 0, 12),
(518, 102, 1, 0, 3),
(519, 102, 2, 0, 3),
(520, 102, 3, 0, 3),
(521, 102, 4, 0, 3),
(522, 102, 5, 0, 3),
(523, 102, 9, 0, 3),
(524, 102, 10, 1, 3),
(525, 103, 1, 0, 3),
(526, 103, 2, 0, 3),
(527, 103, 3, 7, 3),
(528, 103, 4, 1, 3),
(529, 103, 5, 1, 3),
(530, 103, 9, 0, 3),
(531, 103, 10, 0, 3),
(532, 0, -3, 13, 3),
(533, 0, -1, 13, 3),
(534, 104, 1, 0, 1),
(535, 104, 2, 0, 1),
(536, 104, 3, 0, 1),
(537, 104, 4, 0, 1),
(538, 104, 5, 0, 1),
(539, 104, 9, 0, 1),
(540, 104, 10, 0, 1),
(541, 105, 1, 0, 1),
(542, 105, 2, 0, 1),
(543, 105, 3, 0, 1),
(544, 105, 4, 0, 1),
(545, 105, 5, 0, 1),
(546, 105, 9, 0, 1),
(547, 105, 10, 0, 1),
(548, 106, 1, 0, 1),
(549, 106, 2, 0, 1),
(550, 106, 3, 0, 1),
(551, 106, 4, 0, 1),
(552, 106, 5, 0, 1),
(553, 106, 9, 0, 1),
(554, 106, 10, 0, 1),
(555, 107, 1, 0, 1),
(556, 107, 2, 0, 1),
(557, 107, 3, 0, 1),
(558, 107, 4, 0, 1),
(559, 107, 5, 0, 1),
(560, 107, 9, 0, 1),
(561, 107, 10, 0, 1),
(562, 108, 1, 0, 1),
(563, 108, 2, 20, 1),
(564, 108, 3, 3, 1),
(565, 108, 4, 0, 1),
(566, 108, 5, 0, 1),
(567, 108, 9, 0, 1),
(568, 108, 10, 0, 1),
(569, 109, 1, 0, 1),
(570, 109, 2, 0, 1),
(571, 109, 3, 1, 1),
(572, 109, 4, 1, 1),
(573, 109, 5, 0, 1),
(574, 109, 9, 0, 1),
(575, 109, 10, 0, 1),
(576, 110, 1, 0, 1),
(577, 110, 2, 0, 1),
(578, 110, 3, 0, 1),
(579, 110, 4, 0, 1),
(580, 110, 5, 0, 1),
(581, 110, 9, 0, 1),
(582, 110, 10, 0, 1),
(583, 111, 1, 0, 1),
(584, 111, 2, 0, 1),
(585, 111, 3, 0, 1),
(586, 111, 4, 0, 1),
(587, 111, 5, 0, 1),
(588, 111, 9, 0, 1),
(589, 111, 10, 0, 1),
(590, 112, 1, 0, 1),
(591, 112, 2, 0, 1),
(592, 112, 3, 0, 1),
(593, 112, 4, 0, 1),
(594, 112, 5, 0, 1),
(595, 112, 9, 0, 1),
(596, 112, 10, 0, 1),
(597, 113, 1, 0, 1),
(598, 113, 2, 0, 1),
(599, 113, 3, 0, 1),
(600, 113, 4, 0, 1),
(601, 113, 5, 0, 1),
(602, 113, 9, 0, 1),
(603, 113, 10, 0, 1),
(604, 114, 1, 0, 1),
(605, 114, 2, 1, 1),
(606, 114, 3, 2, 1),
(607, 114, 4, 0, 1),
(608, 114, 5, 0, 1),
(609, 114, 9, 0, 1),
(610, 114, 10, 0, 1),
(611, 115, 1, 0, 1),
(612, 115, 2, 0, 1),
(613, 115, 3, 0, 1),
(614, 115, 4, 0, 1),
(615, 115, 5, 0, 1),
(616, 115, 9, 0, 1),
(617, 115, 10, 0, 1),
(618, 116, 1, 0, 1),
(619, 116, 2, 0, 1),
(620, 116, 3, 0, 1),
(621, 116, 4, 0, 1),
(622, 116, 5, 0, 1),
(623, 116, 9, 0, 1),
(624, 116, 10, 0, 1),
(625, 117, 1, 0, 1),
(626, 117, 2, 0, 1),
(627, 117, 3, 0, 1),
(628, 117, 4, 0, 1),
(629, 117, 5, 0, 1),
(630, 117, 9, 0, 1),
(631, 117, 10, 0, 1),
(632, 118, 1, 0, 1),
(633, 118, 2, 0, 1),
(634, 118, 3, 0, 1),
(635, 118, 4, 0, 1),
(636, 118, 5, 0, 1),
(637, 118, 9, 0, 1),
(638, 118, 10, 0, 1),
(639, 119, 1, 0, 1),
(640, 119, 2, 0, 1),
(641, 119, 3, 0, 1),
(642, 119, 4, 0, 1),
(643, 119, 5, 0, 1),
(644, 119, 9, 0, 1),
(645, 119, 10, 0, 1),
(646, 120, 1, 0, 1),
(647, 120, 2, 0, 1),
(648, 120, 3, 0, 1),
(649, 120, 4, 0, 1),
(650, 120, 5, 0, 1),
(651, 120, 9, 0, 1),
(652, 120, 10, 0, 1),
(653, 108, 11, 213, 1),
(654, 104, 11, 10, 1),
(655, 109, 11, 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descripcion`
--

CREATE TABLE IF NOT EXISTS `descripcion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_documento` int(4) DEFAULT NULL,
  `id_grupo` int(4) DEFAULT NULL,
  `id_motivo` int(4) DEFAULT NULL,
  `id_proceso` int(4) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Volcado de datos para la tabla `descripcion`
--

INSERT INTO `descripcion` (`id`, `id_documento`, `id_grupo`, `id_motivo`, `id_proceso`, `id_user`, `fecha`) VALUES
(1, 10, NULL, 1, NULL, 7, '2013-01-30 14:33:43'),
(2, 11, NULL, 1, NULL, 7, '2013-01-30 15:03:07'),
(3, 12, NULL, 1, NULL, 7, '2013-01-30 16:35:11'),
(4, 15, NULL, 1, NULL, 7, '2013-02-08 11:41:35'),
(5, 51, NULL, 30, NULL, 24, '2013-02-10 16:43:33'),
(6, 53, NULL, 14, NULL, 24, '2013-03-10 16:56:16'),
(7, 56, NULL, 29, NULL, 24, '2013-03-19 17:15:39'),
(8, 58, NULL, 18, NULL, 24, '2013-03-19 17:20:07'),
(9, 59, NULL, 14, NULL, 24, '2013-03-20 10:15:16'),
(10, 60, NULL, 1, NULL, 24, '2013-03-20 10:17:09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `destinatarios`
--

CREATE TABLE IF NOT EXISTS `destinatarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL DEFAULT '0',
  `id_destino` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`id_usuario`,`id_destino`),
  KEY `fk` (`id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=202 ;

--
-- Volcado de datos para la tabla `destinatarios`
--

INSERT INTO `destinatarios` (`id`, `id_usuario`, `id_destino`) VALUES
(1, 1, 2),
(2, 2, 1),
(168, 7, 4),
(169, 8, 1),
(170, 8, 2),
(171, 8, 4),
(172, 4, 8),
(178, 14, 15),
(179, 14, 16),
(180, 14, 17),
(181, 14, 18),
(182, 14, 19),
(183, 15, 14),
(184, 16, 14),
(185, 17, 14),
(186, 18, 14),
(187, 20, 19),
(188, 21, 19),
(189, 22, 19),
(190, 23, 19),
(191, 19, 14),
(192, 19, 20),
(193, 19, 21),
(194, 19, 22),
(195, 19, 23),
(196, 24, 14),
(197, 24, 19),
(198, 35, 36),
(199, 35, 37),
(200, 37, 39),
(201, 37, 38);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentos`
--

CREATE TABLE IF NOT EXISTS `documentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_proceso` int(4) NOT NULL DEFAULT '0',
  `id_oficina` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_tipo` int(3) DEFAULT NULL,
  `codigo` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `nur` varchar(25) NOT NULL,
  `nombre_destinatario` mediumtext CHARACTER SET utf8,
  `cargo_destinatario` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `nombre_remitente` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `nombre_via` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `cargo_via` varchar(120) CHARACTER SET utf8 DEFAULT NULL,
  `cargo_remitente` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `mosca_remitente` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `referencia` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `contenido` longtext CHARACTER SET utf8 COLLATE utf8_spanish_ci,
  `fecha_creacion` datetime DEFAULT NULL,
  `adjuntos` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `copias` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `estado` int(2) DEFAULT '0',
  `id_seguimiento` int(11) DEFAULT '0',
  `original` int(1) DEFAULT '1',
  `institucion_destinatario` varchar(100) DEFAULT NULL,
  `institucion_remitente` varchar(100) DEFAULT NULL,
  `hojas` int(4) DEFAULT '0',
  `cite_original` varchar(50) DEFAULT NULL,
  `titulo` varchar(20) DEFAULT NULL,
  `id_entidad` int(11) NOT NULL,
  PRIMARY KEY (`id`,`codigo`,`nur`),
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT AUTO_INCREMENT=277 ;

--
-- Volcado de datos para la tabla `documentos`
--

INSERT INTO `documentos` (`id`, `id_proceso`, `id_oficina`, `id_user`, `id_tipo`, `codigo`, `nur`, `nombre_destinatario`, `cargo_destinatario`, `nombre_remitente`, `nombre_via`, `cargo_via`, `cargo_remitente`, `mosca_remitente`, `referencia`, `contenido`, `fecha_creacion`, `adjuntos`, `copias`, `estado`, `id_seguimiento`, `original`, `institucion_destinatario`, `institucion_remitente`, `hojas`, `cite_original`, `titulo`, `id_entidad`) VALUES
(1, 4, 108, 36, 11, 'FCV/DGAA Nº 0208/2013', 'MDPyEP/2013-00244', 'Lucio Choque', 'Profesional I', 'Maria Elena Alfaro Castillo', NULL, NULL, 'Secretaria D.G.A.A.', 'MAC', 'reunion', NULL, '2013-06-27 11:58:34', '', '', 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0208/2013', NULL, 1),
(1, 4, 108, 36, 11, 'FCV/DGAA Nº 0209/2013', 'MDPyEP/2013-00245', 'Rosario', 'Secretaria de Area', 'Maria Elena Alfaro Castillo', NULL, NULL, 'Secretaria D.G.A.A.', 'MAC', 'asistir a un curso de capacitacion', NULL, '2013-06-27 12:05:15', '', '', 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0209/2013', NULL, 1),
(1, 4, 108, 36, 11, 'FCV/DGAA Nº 0210/2013', 'MDPyEP/2013-00246', 'Rosario', 'Secretaria de Area', 'Maria Elena Alfaro Castillo', NULL, NULL, 'Secretaria D.G.A.A.', 'MAC', 'Curso de capacitacion', NULL, '2013-06-27 12:14:18', '', '', 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0210/2013', NULL, 1),
(1, 14, 86, 2, 4, 'NI/ Nº /2013', 'MDPyEP/2013-0001', '456', 'Jefe', 'Antonio Garcia M.', 'LidiA', 'Jefa', 'Encargado de Sistemas', 'MGM', 'INFORME 1', '<p class="ca_ad">\n	<span style="font-size:20px;"><span style="font-family: verdana,geneva,sans-serif;"><span class="ca_desc">desde $ Dolares, Conozca esto tipos de negocio. Ingrese hoy</span></span></span></p>\n<div id="adhispanic">\n	<p align="center">\n		<u>Con aplicabilidad al &aacute;rea de la Salud</u></p>\n	<p align="center">\n		<u>1.</u></p>\n	<br />\n	<ol>\n		<li>\n			Sugerencias</li>\n		<li>\n			Planteamiento</li>\n		<li>\n			Planificaci&oacute;n</li>\n		<li>\n			Documentaci&oacute;n</li>\n	</ol>\n	<p align="center">\n		<b>Introducci&oacute;n</b></p>\n	<p style="text-align: center;">\n		Ning&uacute;n proyecto se considera completo hasta que se prepara el informe de investigaci&oacute;n, incluso el estudio m&aacute;s brillante tiene poco</p>\n	<table border="1" cellpadding="1" cellspacing="1" style="width: 500px;">\n		<tbody>\n			<tr>\n				<td>\n					1</td>\n				<td>\n					2</td>\n			</tr>\n			<tr>\n				<td>\n					3</td>\n				<td>\n					4</td>\n			</tr>\n			<tr>\n				<td>\n					5</td>\n				<td>\n					6</td>\n			</tr>\n		</tbody>\n	</table>\n</div>\n<p style="text-align: right;">\n	Leer m&aacute;s:</p>\n', '2013-01-28 17:05:17', '', '', 1, 0, 1, '', NULL, 0, 'NI/ Nº /2013', '', 1),
(2, 14, 27, 2, 3, 'INF/ Nº /2013', '', 'Teresa Morales', 'Ministra', 'Antonio Garcia M.', '', '', 'Encargado de Sistemas', 'MGM', '', '<p style="text-align: center;">\n	1.a</p>\n<p style="text-align: center;">\n	2.b</p>\n<p style="text-align: center;">\n	3.c</p>\n<p>\n	<strong>Microsoft </strong><strong>Word</strong>&trade; es el est&aacute;ndar de facto para el procesamiento de textos y, como tal, es utilizado en una gran variedad de entornos profesionales y dom&eacute;sticos. Desde 2003 es tambi&eacute;n un est&aacute;ndar abierto basado en <strong>XML </strong>(OOXML).</p>\n', '2013-01-29 17:19:23', 'anexo1', '', 0, 0, 1, '', NULL, 0, 'INF/ Nº /2013', '', 1),
(6, 2, 86, 2, 3, 'INF/ SNP/DGE/SIS Nº /2013', 'MDPyEP/2013-00004', 'Omar Mendoza Valdez', 'Administrador del sistema', 'Antonio Garcia M.', '', '', 'Encargado de Sistemas', 'MGM', '123', '<p>\n	123123123</p>\n', '2013-01-30 11:23:59', '', '', 0, 0, 1, '', NULL, 0, 'INF/ SNP/DGE/SIS Nº /2013', '', 1),
(7, 14, 79, 4, 3, 'INF/SNP/DGE Nº 0002/2013', 'MDPyEP/2013-00005', 'GABRIELA MURILLO ZARATE', 'Administrador del sistema', 'Jhilda Murillo Zarate', '', '', 'Directora General Ejecutiva', 'JMZ', '', '<p align="center">\n	<strong><u>Installation</u></strong></p>\n<p>\n	&nbsp;</p>\n<p>\n	1.&nbsp;&nbsp;&nbsp;&nbsp; <u>Download the latest </u><strong><u>stable </u></strong><u>release from the </u><u>Kohana website</u><u>.</u></p>\n<p>\n	<em>2.&nbsp;&nbsp;&nbsp;&nbsp; </em><em>Unzip the downloaded package to create a </em><em>!&quot;#$%$ </em><em>directory.</em></p>\n<p>\n	<strong>3.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong><strong>Upload the contents of this folder to your webserver.</strong></p>\n<p>\n	<strong><em>4.&nbsp;&nbsp;&nbsp;&nbsp; </em></strong><strong><em><u>this folder to your webserver.</u></em></strong></p>\n<p>\n	&nbsp;</p>\n<p>\n	&nbsp;</p>\n<table border="1" cellpadding="0" cellspacing="0">\n	<tbody>\n		<tr>\n			<td style="width:288px;">\n				<p>\n					Controller_Template</p>\n			</td>\n			<td style="width:288px;">\n				<p>\n					Controller_Template</p>\n			</td>\n		</tr>\n		<tr>\n			<td style="width:288px;">\n				<p>\n					Remember that in a class, an underscore</p>\n			</td>\n			<td style="width:288px;">\n				<p>\n					Remember that in a class, an underscore</p>\n			</td>\n		</tr>\n		<tr>\n			<td style="width:288px;">\n				<p>\n					Remember that in a class, an underscore</p>\n			</td>\n			<td style="width:288px;">\n				<p>\n					Remember that in a class, an underscore</p>\n			</td>\n		</tr>\n	</tbody>\n</table>\n<p>\n	&nbsp;</p>\n<p align="center">\n	&nbsp;</p>\n<p align="center">\n	&nbsp;</p>\n<p>\n	The &ldquo;<strong><u>top</u></strong>&rdquo; level &lsquo;<strong><u>directories</u></strong><u>&rsquo;</u> of the application, module, and system paths have the following default directories:</p>\n<p>\n	classes/ All classes that you want to autoload should be stored here. This includes controllers, models, and all other classes. All classes must follow the class naming conventions.</p>\n<p>\n	config/ Configuration files return an associative array of options that can be loaded using Kohana::$config. Config files are merged rather than overwritten by the cascade. See config files for more information.</p>\n<p>\n	i18n/ Translation files return an associative array of strings. Translation is done using the &lt;&lt;69 method. To translate &quot;Hello, world!&quot; into Spanish, you would call &lt;&lt;67A$((+&gt;B2+5(;C79 with I18n::$lang set to &quot;es-es&quot;. I18n files are merged rather than overwritten by the cascade. See I18n files for more information.</p>\n<p>\n	messages/ Message files return an associative array of strings that can be loaded using Kohana::message. Messages and i18n files differ in that messages are not translated, but always written in the default language and referred to by a single key. Message files are merged rather than overwritten by the cascade. See message files for more information.</p>\n', '2013-01-30 11:43:46', '', '', 1, 0, 1, '', NULL, 0, 'INF/SNP/DGE Nº 0002/2013', '', 1),
(8, 2, 79, 4, 4, 'NI/SNP/DGE Nº 0002/2013', 'MDPyEP/2013-00006', 'Ana Teresa Morales Olivera', 'Ministra', 'Jhilda Murillo Zarate', '', '', 'Directora General Ejecutiva', 'JMZ', 'INFORME I', '<p>\n	<strong>If we are in the development environment then pass it off to Kohana otherwise:</strong></p>\n<p>\n	&Oslash;&nbsp; Log the error</p>\n<p>\n	&Oslash;&nbsp; Set the route action and message attributes.</p>\n<p>\n	&Oslash;&nbsp; If a !&quot;&quot;#$%&amp;&#39;()*+,- was thrown, then override the action with the error code.</p>\n<p>\n	Fire off an internal sub-request.</p>\n<table border="1" cellpadding="0" cellspacing="0">\n	<tbody>\n		<tr>\n			<td style="width:144px;">\n				<p align="center">\n					1</p>\n			</td>\n			<td style="width:144px;">\n				<p align="center">\n					2</p>\n			</td>\n			<td style="width:144px;">\n				<p align="center">\n					3</p>\n			</td>\n			<td style="width:144px;">\n				<p align="center">\n					4</p>\n			</td>\n		</tr>\n		<tr>\n			<td style="width:144px;">\n				<p align="center">\n					Qwe</p>\n			</td>\n			<td style="width:144px;">\n				<p align="center">\n					Wer</p>\n			</td>\n			<td style="width:144px;">\n				<p align="center">\n					Ert</p>\n			</td>\n			<td style="width:144px;">\n				<p align="center">\n					rty</p>\n			</td>\n		</tr>\n	</tbody>\n</table>\n<p>\n	&nbsp;</p>\n', '2013-01-30 11:49:21', '', '', 1, 0, 1, '', NULL, 0, 'NI/SNP/DGE Nº 0002/2013', '', 1),
(9, 7, 79, 4, 4, 'NI/SNP/DGE Nº 0003/2013', 'MDPyEP/2013-00005', 'Ana Teresa Morales Olivera', 'Ministra', 'Jhilda Murillo Zarate', 'asd', 'asd', 'Directora General Ejecutiva', 'JMZ', 'TABLA DE CONTENIDOS', '<p style="text-align: center;">\n	<u>The following conventions apply:</u><br />\n	<strong>1. CamelCased class names should not be used, except when it is undesirable to create a new</strong> <em>directory level.</em><br />\n	2. <span style="color:#ff8c00;">All class file names and directory names are lowercase.</span><br />\n	3. All classes should be in the *&amp;%##+# directory. This may be at any level in the cascading filesystem.</p>\n<ol>\n	<li>\n		hjhg</li>\n	<li>\n		khkjh</li>\n	<li>\n		poikj</li>\n</ol>\n<table border="1" cellpadding="1" cellspacing="1" style="width: 500px;">\n	<tbody>\n		<tr>\n			<td>\n				a</td>\n			<td>\n				b</td>\n		</tr>\n		<tr>\n			<td>\n				&nbsp;</td>\n			<td>\n				&nbsp;</td>\n		</tr>\n		<tr>\n			<td>\n				&nbsp;</td>\n			<td>\n				&nbsp;</td>\n		</tr>\n	</tbody>\n</table>\n<p>\n	&nbsp;</p>\n', '2013-01-30 12:02:58', '', '', 0, 4, 0, '', NULL, 0, 'NI/SNP/DGE Nº 0003/2013', NULL, 0),
(10, 4, 48, 7, 6, 'X-SNP/2013-00001', 'SNP/2013-00001', 'GABRIELA MURILLO ZARATE', 'directora general', 'JOSE SALGUERO', NULL, NULL, 'T', NULL, 'ASD', NULL, '2013-01-30 14:33:43', '', NULL, 0, 0, 1, 'M', 'TY', 0, 'II-23', NULL, 2),
(11, 4, 48, 7, 6, 'X-SNP/2013-00002', 'SNP/2013-00002', 'jhilda gabrielamurillo zarate', 'directora general ejecutiva', 'jose salguero', NULL, NULL, 'director', NULL, '', NULL, '2013-01-30 15:03:07', '', NULL, 1, 0, 1, 'SENAPI', 'mdr', 0, 'S/C', NULL, 2),
(12, 4, 48, 7, 6, 'X-SNP/2013-00003', 'SNP/2013-00003', 'Jhilda Murillo Zarate', 'Directora General Ejecutiva', 'ALEJANDRO A', NULL, NULL, 'GERENTE', NULL, 'DETALLE DE COSTOS', NULL, '2013-01-30 16:35:11', 'Delalle 1', NULL, 1, 0, 1, 'Servicio Nacional de Propiedad Intelectual', 'A&E', 1, '123', NULL, 2),
(13, 14, 79, 4, 3, 'INF/SNP/DGE Nº 0003/2013', 'MDPyEP/2013-00008', 'Ana Teresa Morales Olivera', 'Ministra', 'Jhilda Murillo Zarate', 'Sin Via', 'Sin Via', 'Directora General Ejecutiva', 'JMZ', 'INFORME TECNICO', '<p style="text-align: center;">\n	<strong>Reporte T&eacute;cnico</strong></p>\n<table border="1" cellpadding="1" cellspacing="1" style="width: 500px; height: 20px">\n	<tbody>\n		<tr>\n			<td>\n				Documento 1</td>\n			<td>\n				Documento 123123123</td>\n		</tr>\n		<tr>\n			<td>\n				Informe de actividades&nbsp; del mes de ...</td>\n			<td>\n				&nbsp;</td>\n		</tr>\n		<tr>\n			<td>\n				&nbsp;</td>\n			<td>\n				asdasd asdasda sdasdas dasdas dasd</td>\n		</tr>\n	</tbody>\n</table>\n<ol>\n	<li>\n		<strong>EWFASDF</strong></li>\n	<li>\n		<em>WFKJN</em></li>\n	<li>\n		<u>43098U0GHI</u></li>\n	<li>\n		<strong>VLIDGEOT</strong></li>\n	<li>\n		<em>ERLJNEG</em></li>\n	<li>\n		<u>LKNRGELJRNG .&nbsp;&nbsp;&nbsp;&nbsp;</u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>\n</ol>\n', '2013-02-04 17:44:18', '', '', 0, 0, 1, '', NULL, 0, 'INF/SNP/DGE Nº 0003/2013', '', 1),
(14, 11, 79, 4, 3, 'INF/SNP/DGE Nº 0004/2013', 'SNP/2013-00002', 'Carlos Ponce', 'ventanilla', 'Jhilda Murillo Zarate', '', '', 'Directora General Ejecutiva', 'JMZ', 'RESPUESTA ', '', '2013-02-07 09:42:22', 'asdasdasd', '123123123', 0, 6, 0, '', NULL, 0, 'INF/SNP/DGE Nº 0004/2013', NULL, 0),
(15, 4, 48, 7, 6, 'X-SNP/2013-00004', 'SNP/2013-00004', 'Jhilda Murillo Zarate', 'Directora General Ejecutiva', 'asd', NULL, NULL, 'asd', NULL, 'ASD', NULL, '2013-02-08 11:41:34', '', NULL, 1, 0, 1, 'Servicio Nacional de Propiedad Intelectual', 'asd', 0, 'asdasd', NULL, 2),
(16, 14, 79, 4, 4, 'NI/SNP/DGE Nº 0004/2013', 'MDPyEP/2013-00010', 'Rosa Aliaga Salas', 'Técnico Auditor Junior', 'Jhilda Murillo Zarate', '', '', 'Directora General Ejecutiva', 'JMZ', 'INFORME DIRIJIDO DIRECTAMENTE AL TéCNICO AUDITOR JUNIOR', '<p>\n	Los usuarios del sistema o usuarios cliente son personas que se conectan al sistema para hacer uso de los servicios que este les proporciona. Dentro de los usuarios del &ldquo;Sistema de Archivo Digital&rdquo; podemos distinguir diferentes tipos o niveles de usuario, y dependiendo de dicho nivel poseer&aacute; m&aacute;s o menos privilegios en su estancia dentro del &ldquo;Sistema de Archivo Digital&rdquo;.</p>\n', '2013-02-15 16:10:39', 'Documentos Base', 'Cristian Arce', 0, 0, 1, '', NULL, 0, 'NI/SNP/DGE Nº 0004/2013', '', 1),
(17, 14, 103, 21, 3, 'INF/IBM/RCBBA Nº 0001/2013', 'IBM/2013-00001', 'Karla Patricia', 'Supervisor Auditoría Interna', 'Jose María', 'Carlos eduardo', 'Responsable Regional Cochabamba', 'Supervisor Técnico', 'JM', 'INFORME DE ACTIVIDADES', '<p style="text-align: center;">\n	<strong>Resumen ejecutivo</strong></p>\n<p>\n	Informe de auditor&iacute;a interna&nbsp; N&ordm; 00/2013, correspondiente al&nbsp; segundo semestre de la gesti&oacute;n 2012.</p>\n<p>\n	Elaborado en cumplimiento a la Gu&iacute;a para el Control y Elaboraci&oacute;n de Informes de Actividades de las Unidades de Auditoria interna del&nbsp; Ministerio de Desarrollo Productivo y Econom&iacute;a Plural por el periodo comprendido entre el 1 de Julio al 31 de Diciembre del 2012.</p>\n<p>\n	El objetivo del Informe de Actividades est&aacute; Constituido por la:</p>\n<ul>\n	<li>\n		Ejecuci&oacute;n de actividades de la UAI.</li>\n	<li>\n		Evaluaciones Internas.</li>\n	<li>\n		Recursos humanos de la UAI.</li>\n	<li>\n		Capacitaci&oacute;n recibida.</li>\n</ul>\n', '2013-02-19 11:16:33', 'copia del informe', '', 1, 0, 1, '', NULL, 0, 'INF/IBM/RCBBA Nº 0001/2013', '', 3),
(18, 1, 103, 21, 4, 'NI/IBM/RCBBA Nº 0001/2013', 'IBM/2013-00002', 'Carlos Eduardo', 'Responsable Regional Cochabamba', 'Jose María', '', '', 'Supervisor Técnico', 'JM', 'INFORME DE ADQUISICIóN DE MAQUINARIA.', '<p style="text-align: center;">\n	Resumen Ejecutivo</p>\n<p style="text-align: justify;">\n	Referencia:</p>\n<p style="text-align: justify;">\n	Informe de control interno sobre la compre de maquinaria de procesamiento de materia prima.</p>\n<p style="text-align: justify;">\n	Objetivo: Emitir una opini&oacute;n independiente sobre el cumplimiento del ordenamiento jur&iacute;dico administrativo. Otras normas&nbsp; legales y aplicables.</p>\n<p>\n	&nbsp;</p>\n<p>\n	&nbsp;</p>\n', '2013-02-19 11:49:55', 'copia del proceso', '', 0, 0, 1, '', NULL, 0, 'NI/IBM/RCBBA Nº 0001/2013', '', 3),
(19, 10, 103, 21, 5, 'CAR/IBM/RCBBA Nº 0001/2013', 'IBM/2013-00003', 'Pedro A.', 'Gerente Técnico', 'Jose María', '', '', 'Supervisor Técnico', 'JM', 'CORTE DEL SERVICIO', '<p>\n	Me es grato saludarle&nbsp; y desearle &eacute;xito en las funciones que desempe&ntilde;a.</p>\n<p>\n	El motivo de la presente es para hacer un reclamo sobre el corte de servicio registrado el d&iacute;a de ayer.</p>\n', '2013-02-19 12:21:11', '', '', 0, 0, 1, 'COTEL', NULL, 0, 'CAR/IBM/RCBBA Nº 0001/2013', 'Señor', 3),
(20, 5, 101, 15, 5, 'CAR/ZFC/UAI Nº 0001/2013', 'ZFC/2013-00001', 'Jose Luis', 'Gerente Técnico', 'Juan Carlos', '', '', 'Profesional Auditor Senior', 'JC', 'SOLICITUD DE PROPUESTA DE SERVICIO INTERNET ADSL', '<p>\n	Por intermedio de la presente, solicito una propuesta del servicio de Internet ADSL, dentro de la red que cuenten, para fortalecer el trabajo en nuestra Insitucion, cuyas especificaciones se encuentran adjuntas en el presente documento.</p>\n<p>\n	Sin otro particular, saludo a usted cordialmente</p>\n<p>\n	&nbsp;</p>\n', '2013-02-19 17:36:58', 'carta', 'Luis Fernando', 0, 0, 1, 'AXS', NULL, 0, 'CAR/ZFC/UAI Nº 0001/2013', 'Señor', 12),
(21, 5, 101, 15, 5, 'CAR/ZFC/UAI Nº 0002/2013', 'ZFC/2013-00002', 'Henrry F.', 'Tecnico en mantenimiento de equipos', 'Juan Carlos', '', '', 'Profesional Auditor Senior', 'JC', 'SOLICITUD REACTIVACION CTD', '<p>\n	En reuniones sostenidas con su persona en el mes de febrero se le hizo conocer la situaci&oacute;n actual del CTD del Ministerio de Desarrollo Productivo y Econom&iacute;a Plural, donde usted nos informo los requerimientos para la reactivaci&oacute;n del mismo con respaldo de notas enviadas en fechas anteriores, por lo cual le hago conocer que los requerimientos explicados en las mismas ya fueron atendidos, es por esta raz&oacute;n que solicito lo siguiente:</p>\n<ol>\n	<li>\n		Verificaci&oacute;n de la calidad energ&iacute;a del CTD.</li>\n	<li>\n		Reconexi&oacute;n de la PS del CTD.</li>\n	<li>\n		Reconexi&oacute;n del panel de acceso.</li>\n	<li>\n		Capacitaci&oacute;n del equipamiento del CTD.</li>\n</ol>\n<p>\n	En conformidad a lo acordado, solicito una pronta respuesta suya, ya que el CTD se encuentra paralizado durante mucho tiempo.</p>\n', '2013-02-19 17:44:43', 'detalle tecnico', 'Luis Fernando', 0, 0, 1, 'ENTEL', NULL, 0, 'CAR/ZFC/UAI Nº 0002/2013', 'Señor', 12),
(22, 2, 101, 15, 3, 'INF/ZFC/UAI Nº 0001/2013', 'ZFC/2013-00003', 'Maria Fernanda', 'Tecnico en Metrologia Legal I', 'Juan Carlos', 'Luis Fernando', 'Jefe Unidad Auditoria Interna', 'Profesional Auditor Senior', 'JC', 'REMISION DE INFORME DE RECEPCIóN', '<p>\n	Mediante la presente pongo a conocimiento, el descargo de la solicitud de actualizacion de antivirus derivado por OBOLIVIA en su solicitud no cuenta con cuantos equipos seran instalados como cabe mencionar dicha institucion es desconcentrada y tiene sus propios recursos necesito la autorizacion para proceder.</p>\n<p>\n	La Nota de sistemas solicitud de compra de palanca termica esta en proceso de ejecucion para la adjudicacion y compra del mismo.</p>\n<p>\n	Las otras notas fueron atendidos en su momento, por el cual estan pendientes por motivos de los que no cumplieron los requisitos para continuar.</p>\n<p>\n	Es cuanto tengo a bien informar.</p>\n', '2013-02-20 09:03:06', 'informe', '', 1, 0, 1, '', NULL, 0, 'INF/ZFC/UAI Nº 0001/2013', '', 12),
(23, 14, 101, 15, 3, 'INF/ZFC/UAI Nº 0002/2013', 'ZFC/2013-00004', 'Luis Fernando', 'Jefe Unidad Auditoria Interna', 'Juan Carlos', '', '', 'Profesional Auditor Senior', 'JC', 'CONFORMIDAD AL INFORME DEL ING. MARCELO A', '<p>\n	Mediante la presente doy la conformidad al informe presentado por el Consultor Marcelo M, atendiendo solicitudes realizadas por las diferentes Unidades dependientes de Ministerio de Desarrollo Productivo y Economia Plural el mismo que refleja el cumplimiento de los resultados esperados en los Terminos de Referencia de la consultoria como asistencia a usuarios en soporte tecnico de equipos y mantenimiento correctivo de los mismos</p>\n<p>\n	Es cuanto tengo a bien informar.</p>\n', '2013-02-20 09:05:22', 'copia del informe', 'Juan Perez, Karla Patricia', 1, 0, 1, '', NULL, 0, 'INF/ZFC/UAI Nº 0002/2013', '', 12),
(24, 3, 101, 15, 4, 'NI/ZFC/UAI Nº 0001/2013', 'ZFC/2013-00005', 'Jose Maria', 'Supervisor Tecnico', 'Juan Carlos', 'Luis Fernando', 'Jefe Unidad Auditoria Interna', 'Profesional Auditor Senior', 'JC', 'SEGUIMIENTO POA', '<p>\n	De mi consideracion:</p>\n<p>\n	En atencion a CIR/MDP/DPL/2012-0000 donde se solicita elaborar el informe de seguimiento al 3er trimestre, remito el FORM 01 correspondiente al Area de Servicios.</p>\n<p>\n	Sin otro particular, me despido atentamente.</p>\n', '2013-02-20 09:08:44', 'poa 2012', 'Carlos Eduardo', 1, 0, 1, '', NULL, 0, 'NI/ZFC/UAI Nº 0001/2013', '', 12),
(25, 2, 101, 15, 4, 'NI/ZFC/UAI Nº 0002/2013', 'ZFC/2013-00006', 'Julio Cesar', 'Tecnico en Metrologia Legal II', 'Juan Carlos', 'Luis Fernando', 'Jefe Unidad Auditoria Interna', 'Profesional Auditor Senior', 'JC', 'RESPUESTA', '<p>\n	La presente, es para poner a su conocimiento que se esta trabajando en las especificaciones tecnicas para la contrataci&oacute;n de el servicio de Internet y Fibra Optica. Al momento llevamos adelante reuniones con las empresas proveedoras AXS, y estamos a la espera de consolidar la informacion de acuerdo a las propuestas.</p>\n<p>\n	Sin otro particular, me despido atentamente.</p>\n', '2013-02-20 09:12:57', '', '', 1, 0, 1, '', NULL, 0, 'NI/ZFC/UAI Nº 0002/2013', '', 12),
(26, 2, 103, 22, 3, 'INF/IBM/RCBBA Nº 0002/2013', 'IBM/2013-00004', 'Carlos Eduardo', 'Responsable Regional Cochabamba', 'Maria Fernanda', '', '', 'Tecnico Metrología Legal I', 'MF', 'REMISION DE INFORME', '<p>\n	Mediante la presente pongo a conocimiento, el descargo de la solicitud de actualizacion de antivirus derivado por OBOLIVIA en su solicitud no cuenta con cuantos equipos seran instalados como cabe mencionar dicha institucion es desconcentrada y tiene sus propios recursos necesito la autorizacion para proceder.</p>\n<p>\n	La Nota de sistemas solicitud de compra de palanca t&eacute;rmica esta en proceso de ejecucion para la adjudicaci&oacute;n y compra del mismo.</p>\n<p>\n	Las otras notas fueron atendidos en su momento, por el cual estan pendientes por motivos de los que no cumplieron los requisitos para continuar.</p>\n<p>\n	Es cuanto tengo a bien informar.</p>\n', '2013-02-20 09:23:06', '', '', 1, 0, 1, '', NULL, 0, 'INF/IBM/RCBBA Nº 0002/2013', '', 3),
(27, 14, 103, 22, 3, 'INF/IBM/RCBBA Nº 0003/2013', 'IBM/2013-00005', 'Juan Carlos', 'Profesional Auditor Senior', 'Maria Fernanda', 'Carlos eduardo', 'Responsable Regional Cochabamba', 'Tecnico Metrología Legal I', 'MF', 'RESPUESTA', '<p>\n	La presente, es para poner a su conocimiento que se esta trabajando en las especificaciones tecnicas para la contratacion de el servicio de Internet y Fibra Optica. Al momento llevamos adelante reuniones con la empresa proveedora AXS y TIGO, y estamos a la espera de consolidar la informacion de acuerdo a las propuestas.</p>\n<p>\n	Sin otro particular, me despido atentamente.</p>\n<p>\n	&nbsp;</p>\n', '2013-02-20 09:25:58', 'informe', 'Paola Carola', 1, 0, 1, '', NULL, 0, 'INF/IBM/RCBBA Nº 0003/2013', '', 3),
(28, 2, 103, 19, 3, 'INF/IBM/RCBBA Nº 0004/2013', 'IBM/2013-00005', 'Luis Fernando', 'Jefe Unidad Auditoria Interna', 'Carlos Eduardo', '', '', 'Responsable Regional Cochabamba', 'CE', 'INFORME', '<p>\n	Mediante la presente doy la conformidad al informe presentado por el Consultor Carlos, atendiendo solicitudes realizadas por las diferentes Unidades dependientes de Ministerio de Desarrollo Productivo y Economia Plural el mismo que refleja el cumplimiento de los resultados esperados en los Terminos de Referencia de la consultoria como asistencia a usuarios en soporte tecnico de equipos y mantenimiento correctivo de los mismos.</p>\n<p>\n	Es cuanto tengo a bien informar.</p>\n', '2013-02-20 09:35:35', '', '', 0, 14, 0, '', NULL, 0, 'INF/IBM/RCBBA Nº 0004/2013', NULL, 0),
(29, 23, 101, 14, 3, 'INF/ZFC/UAI Nº 0003/2013', 'ZFC/2013-00004', 'Juan Carlos', 'Profesional Auditor Senior', 'Luis Fernando', NULL, NULL, 'Jefe Unidad Auditoria Interna', NULL, NULL, NULL, '2013-02-20 11:51:13', NULL, NULL, 0, 13, 0, NULL, NULL, 0, 'INF/ZFC/UAI Nº 0003/2013', NULL, 0),
(30, 2, 101, 14, 3, 'INF/ZFC/UAI Nº 0004/2013', 'ZFC/2013-00004', 'Juan Carlos', 'Profesional Auditor Senior', 'Luis Fernando', '', '', 'Jefe Unidad Auditoria Interna', 'LF', '', '', '2013-02-20 11:55:30', '', '', 0, 13, 0, '', NULL, 0, 'INF/ZFC/UAI Nº 0004/2013', NULL, 0),
(31, 14, 103, 22, 3, 'INF/IBM/RCBBA Nº 0005/2013', 'IBM/2013-00007', 'Carlos Eduardo', 'Responsable Regional Cochabamba', 'Maria Fernanda', '', '', 'Tecnico Metrología Legal I', 'MF', 'INFORME DE ACTIVIDADES MES DE OCTUBRE', '<p>\n	Mediante la presente pongo a conocimiento, el informe e actividades del mes de octubre para su evaluaci&oacute;n por parte del &aacute;rea de auditor&iacute;a interna de de la zona franca comercial.</p>\n', '2013-02-20 12:23:59', 'informe', '', 1, 0, 1, '', NULL, 0, 'INF/IBM/RCBBA Nº 0005/2013', '', 3),
(32, 14, 101, 16, 3, 'INF/ZFC/UAI Nº 0005/2013', 'ZFC/2013-00009', 'Luis Fernando', 'Jefe Unidad Auditoria Interna', 'Karla Patricia', '', '', 'Supervisor Auditoria Interna', 'KP', 'INFORME DE ACTIVIDADES', '<p>\n	remito el informe de actividades.</p>\n', '2013-02-20 12:28:32', 'informe de actividades', '', 1, 0, 1, '', NULL, 0, 'INF/ZFC/UAI Nº 0005/2013', '', 12),
(33, 2, 101, 14, 3, 'INF/ZFC/UAI Nº 0006/2013', 'ZFC/2013-00010', 'Carlos Eduardo', 'Responsable Regional Cochabamba', 'Luis Fernando', '', '', 'Jefe Unidad Auditoria Interna', 'LF', '', '', '2013-02-20 16:32:08', '', '', 1, 0, 1, '', NULL, 0, 'INF/ZFC/UAI Nº 0006/2013', '', 12),
(34, 33, 101, 14, 3, 'INF/ZFC/UAI Nº 0007/2013', 'ZFC/2013-00010', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-02-20 16:57:59', NULL, NULL, 0, 0, 0, NULL, NULL, 0, 'INF/ZFC/UAI Nº 0007/2013', NULL, 0),
(35, 33, 101, 14, 3, 'INF/ZFC/UAI Nº 0008/2013', 'ZFC/2013-00010', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-02-20 17:04:42', NULL, NULL, 0, 0, 0, NULL, NULL, 0, 'INF/ZFC/UAI Nº 0008/2013', NULL, 0),
(36, 33, 101, 14, 3, 'INF/ZFC/UAI Nº 0009/2013', 'ZFC/2013-00010', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-02-20 17:07:52', NULL, NULL, 0, 0, 0, NULL, NULL, 0, 'INF/ZFC/UAI Nº 0009/2013', NULL, 0),
(37, 14, 101, 15, 3, 'INF/ZFC/UAI Nº 0010/2013', 'ZFC/2013-00014', 'Luis Fernando', 'Jefe Unidad Auditoria Interna', 'Juan Carlos', '', '', 'Profesional Auditor Senior', 'JC', 'INFORME DE ACTIVIDADES DEL MES DE NOVIEMBRE', '<p>\n	Mediante la presente pongo a conocimiento, el descargo de la solicitud de actualizacion de antivirus derivado por OBOLIVIA en su solicitud no cuenta con cuantos equipos seran instalados como cabe mencionar dicha institucion es desconcentrada y tiene sus propios recursos necesito la autorizacion para proceder.</p>\n<p>\n	La Nota de sistemas solicitud de compra de palanca termica esta en proceso de ejecucion para la adjudicacion y compra del mismo</p>\n<p>\n	Las otras notas fueron atendidos en su momento, por el cual estan pendientes por motivos de los que no cumplieron los requisitos para continuar.</p>\n<p>\n	Es cuanto tengo a bien informar.</p>\n<p>\n	&nbsp;</p>\n', '2013-02-22 18:05:42', 'copia del informe', '', 1, 0, 1, '', NULL, 0, 'INF/ZFC/UAI Nº 0010/2013', '', 12),
(38, 2, 101, 15, 4, 'NI/ZFC/UAI Nº 0003/2013', 'ZFC/2013-00010', 'Luis Fernando', 'Jefe Unidad Auditoria Interna', 'Juan Carlos', '', '', 'Profesional Auditor Senior', 'JC', '', '', '2013-02-20 18:16:53', '', '', 0, 26, 0, '', NULL, 0, 'NI/ZFC/UAI Nº 0003/2013', NULL, 0),
(39, 33, 101, 14, 4, 'NI/ZFC/UAI Nº 0004/2013', 'ZFC/2013-00010', 'Juan Carlos', 'Profesional Auditor Senior', 'Luis Fernando', NULL, NULL, 'Jefe Unidad Auditoria Interna', NULL, NULL, NULL, '2013-02-20 18:18:05', NULL, NULL, 0, 28, 0, NULL, NULL, 0, 'NI/ZFC/UAI Nº 0004/2013', NULL, 0),
(40, 14, 101, 17, 3, 'INF/ZFC/UAI Nº 0011/2013', 'ZFC/2013-00017', 'Luis Fernando', 'Jefe Unidad Auditoria Interna', 'Juan Perez', '', '', 'Tecnico Auditor Junior', 'JP', 'INFORME', '<p>\n	Se detalla el Informe de Actividades realizadas desde el 1 de Julio de 2012 hasta la fecha.</p>\n', '2013-02-21 08:58:16', 'informe', '', 1, 0, 1, '', NULL, 0, 'INF/ZFC/UAI Nº 0011/2013', '', 12),
(41, 5, 101, 16, 4, 'NI/ZFC/UAI Nº 0005/2013', 'ZFC/2013-00018', 'Luis Fernando', 'Jefe Unidad Auditoria Interna', 'Karla Patricia', '', '', 'Supervisor Auditoria Interna', 'KP', 'SOLICITUD DE HORARIO DEESTUDIO', '<p>\n	Mediante la presente ...</p>\n', '2013-02-21 09:11:16', '', '', 0, 0, 1, '', NULL, 0, 'NI/ZFC/UAI Nº 0005/2013', '', 12),
(42, 14, 101, 15, 4, 'NI/ZFC/UAI Nº 0006/2013', 'ZFC/2013-00019', 'Luis Fernando', 'Jefe Unidad Auditoria Interna', 'Juan Carlos', '', '', 'Profesional Auditor Senior', 'JC', 'ESTADOS FINANCIEROS', '', '2013-02-21 09:23:39', '', '', 1, 0, 1, '', NULL, 0, 'NI/ZFC/UAI Nº 0006/2013', '', 12),
(43, 6, 101, 14, 4, 'NI/ZFC/UAI Nº 0007/2013', 'ZFC/2013-00020', 'Karla Patricia', 'Supervisor Auditoria Interna', 'Luis Fernando', '', '', 'Jefe Unidad Auditoria Interna', 'LF', 'CERTIFICACION DE PRESUPUESTO', '', '2013-02-21 09:29:02', 'informe', '', 1, 0, 1, '', NULL, 0, 'NI/ZFC/UAI Nº 0007/2013', '', 12),
(44, 14, 101, 16, 3, 'INF/ZFC/UAI Nº 0012/2013', 'ZFC/2013-00021', 'Luis Fernando', 'Jefe Unidad Auditoria Interna', 'Karla Patricia', '', '', 'Supervisor Auditoria Interna', 'KP', 'REVISIONDE INFORME', '', '2013-02-21 09:42:30', '', '', 1, 0, 1, '', NULL, 0, 'INF/ZFC/UAI Nº 0012/2013', '', 12),
(45, 5, 101, 14, 5, 'CAR/ZFC/UAI Nº 0003/2013', 'ZFC/2013-00022', 'Javier Z', 'Gerente Técnico', 'Luis Fernando', '', '', 'Jefe Unidad Auditoria Interna', 'LF', 'SOLICITUD DE SERVICIO DE INTERNET', '<p>\n	Mediante la presente ...</p>\n', '2013-02-21 10:23:33', '', '', 0, 0, 1, 'AXS', NULL, 0, 'CAR/ZFC/UAI Nº 0003/2013', 'Señor', 12),
(46, 4, 103, 24, 6, 'X-IBM/2013-00001', '', 'Luis Fernando', 'Jefe Unidad Auditoria Interna', 'Armando Paredes', NULL, NULL, 'Gerente Técnico', NULL, 'SOLICITUD', NULL, '2013-02-02 16:20:38', 'informe', NULL, -1, 0, 1, 'Zona Franca Comercial e Industrial de Cobija', 'MYL', 1, 'S/C', NULL, 3),
(47, 4, 103, 24, 6, 'X-IBM/2013-00002', '', 'Luis Fernando', 'Jefe Unidad Auditoria Interna', 'Armando Paredes', NULL, NULL, 'Gerente Técnico', NULL, 'SOLICITUD', NULL, '2013-02-07 16:32:54', 'informe', NULL, -1, 0, 1, 'Zona Franca Comercial e Industrial de Cobija', 'MYL', 1, 'S/C', NULL, 3),
(48, 4, 103, 24, 6, 'X-IBM/2013-00003', '', 'Luis Fernando', 'Jefe Unidad Auditoria Interna', 'Armando Paredes', NULL, NULL, 'Gerente Técnico', NULL, 'SOLICITUD', NULL, '2013-02-08 16:33:57', 'informe', NULL, -1, 0, 1, 'Zona Franca Comercial e Industrial de Cobija', 'MYL', 1, 'S/C', NULL, 3),
(49, 4, 103, 24, 6, 'X-IBM/2013-00004', '', 'Luis Fernando', 'Jefe Unidad Auditoria Interna', 'Armando Paredes', NULL, NULL, 'Gerente Técnico', NULL, 'SOLICITUD', NULL, '2013-02-06 16:36:19', 'informe', NULL, -1, 0, 1, 'Zona Franca Comercial e Industrial de Cobija', 'MYL', 1, 'S/C', NULL, 3),
(50, 4, 103, 24, 6, 'X-IBM/2013-00005', '', 'Luis Fernando', 'Jefe Unidad Auditoria Interna', 'Armando Paredes', NULL, NULL, 'Gerente Técnico', NULL, 'SOLICITUD', NULL, '2013-02-02 16:43:30', 'informe', NULL, -1, 0, 1, 'Zona Franca Comercial e Industrial de Cobija', 'MYL', 1, 'S/C', NULL, 3),
(51, 4, 103, 24, 6, 'X-IBM/2013-00006', 'IBM/2013-00006', 'Luis Fernando', 'Jefe Unidad Auditoria Interna', 'Armando Paredes', NULL, NULL, 'Gerente Técnico', NULL, 'SOLICITUD', NULL, '2013-02-19 16:43:33', 'informe', NULL, 1, 0, 1, 'Zona Franca Comercial e Industrial de Cobija', 'MYL', 1, 'S/C', NULL, 3),
(52, 4, 103, 24, 6, 'X-IBM/2013-00007', '', 'Carlos Eduardo', 'Responsable Regional Cochabamba', 'Xavier ', NULL, NULL, 'Responsable', NULL, 'INVATACIóN', NULL, '2013-02-05 16:56:11', '', NULL, -1, 0, 1, 'Instituto Boliviano de Metrologia', 'ISM', 0, 'S/C', NULL, 3),
(53, 4, 103, 24, 6, 'X-IBM/2013-00008', 'IBM/2013-00008', 'Carlos Eduardo', 'Responsable Regional Cochabamba', 'Xavier ', NULL, NULL, 'Responsable', NULL, 'INVATACIóN', NULL, '2013-02-08 16:56:16', '', NULL, -1, 0, 1, 'Instituto Boliviano de Metrologia', 'ISM', 0, 'S/C', NULL, 3),
(54, 5, 103, 21, 3, 'INF/IBM/RCBBA Nº 0006/2013', 'IBM/2013-00009', 'Carlos Eduardo', 'Responsable Regional Cochabamba', 'Jose María', '', '', 'Supervisor Técnico', 'JM', 'SOLICITUD', '<p>\n	El motivo de la solicitud es para...</p>\n', '2013-03-19 16:58:38', '', '', 0, 0, 1, '', NULL, 0, 'INF/IBM/RCBBA Nº 0006/2013', '', 3),
(55, 4, 103, 24, 6, 'X-IBM/2013-00009', '', 'Luis Fernando', 'Jefe Unidad Auditoria Interna', 'Oscar R', NULL, NULL, 'Responsable', NULL, 'REUNIóN', NULL, '2013-02-10 17:03:06', 'informe', NULL, -1, 0, 1, 'Zona Franca Comercial e Industrial de Cobija', 'G&L', 1, 'XYZ', NULL, 3),
(56, 4, 103, 24, 6, 'X-IBM/2013-00010', 'E-IBM/2013-00010', 'Luis Fernando', 'Jefe Unidad Auditoria Interna', 'Oscar R', NULL, NULL, 'Responsable de exportaciones', NULL, 'REUNIóN', NULL, '2013-03-19 17:15:39', 'informe', NULL, 0, 0, 1, 'Zona Franca Comercial e Industrial de Cobija', 'G&L', 1, 'HRE-11', NULL, 3),
(57, 1, 103, 21, 3, 'INF/IBM/RCBBA Nº 0007/2013', 'IBM/2013-00010', 'Carlos Eduardo', 'Responsable Regional Cochabamba', 'Jose María', '', '', 'Supervisor Técnico', 'JM', 'CERTIFICADO', '<p>\n	certificado de pago de ...</p>\n', '2013-03-19 17:18:45', '', '', 1, 0, 1, '', NULL, 0, 'INF/IBM/RCBBA Nº 0007/2013', '', 3),
(58, 4, 103, 24, 6, 'X-IBM/2013-00011', 'E-IBM/2013-00011', 'Luis Fernando', 'Jefe Unidad Auditoria Interna', 'Luis P', NULL, NULL, 'Encargado', NULL, 'OFERTA DE...', NULL, '2013-03-19 17:20:07', 'oferta', NULL, 0, 0, 1, 'Zona Franca Comercial e Industrial de Cobija', 'DLK', 3, 'S/C', NULL, 3),
(59, 4, 103, 24, 6, 'X-IBM/2013-00012', 'E-IBM/2013-00012', 'Carlos Eduardo', 'Responsable Regional Cochabamba', 'Franz C', NULL, NULL, 'Jefe Academico', NULL, '', NULL, '2013-03-20 10:15:16', 'invitación', NULL, 1, 0, 1, 'Instituto Boliviano de Metrologia', 'UPS', 3, 'CE-215/2013', NULL, 3),
(60, 4, 103, 24, 6, 'X-IBM/2013-00013', 'E-IBM/2013-00013', 'Luis Fernando', 'Jefe Unidad Auditoria Interna', 'Luis M', NULL, NULL, 'Gerente Técnico', NULL, 'ACLARACIóN DE INFORME', NULL, '2013-03-20 10:17:09', 'informe', NULL, 0, 0, 1, 'Zona Franca Comercial e Industrial de Cobija', 'FGL', 2, 'C-651/2013', NULL, 3),
(61, 3, 101, 14, 3, 'INF/ZFC/UAI Nº 0013/2013', 'ZFC/2013-00023', 'Juan Carlos', 'Profesional Auditor Senior', 'Luis Fernando', '', '', 'Jefe Unidad Auditoria Interna', 'LF', 'INFORME', '<p>\n	Solicitud de informe de actividades.</p>\n', '2013-03-21 09:46:54', '', '', 0, 0, 1, '', NULL, 0, 'INF/ZFC/UAI Nº 0013/2013', '', 12),
(62, 5, 101, 14, 4, 'NI/ZFC/UAI Nº 0008/2013', 'ZFC/2013-00024', 'Carlos Eduardo', 'Responsable Regional Cochabamba', 'Luis Fernando', '', '', 'Jefe Unidad Auditoria Interna', 'LF', 'SOLICITUD', '<p>\n	Solicitud de asignaci&oacute;n de ...</p>\n', '2013-03-21 09:48:16', '', '', 0, 0, 1, '', NULL, 0, 'NI/ZFC/UAI Nº 0008/2013', '', 12),
(63, 41, 101, 14, 3, 'INF/ZFC/UAI Nº 0014/2013', 'ZFC/2013-00018', 'Karla Patricia', 'Supervisor Auditoria Interna', 'Luis Fernando', NULL, NULL, 'Jefe Unidad Auditoria Interna', NULL, NULL, NULL, '2013-05-31 03:29:25', NULL, NULL, 0, 31, 0, NULL, NULL, 0, 'INF/ZFC/UAI Nº 0014/2013', NULL, 0),
(64, 41, 101, 14, 3, 'INF/ZFC/UAI Nº 0015/2013', 'ZFC/2013-00018', 'Karla Patricia', 'Supervisor Auditoria Interna', 'Luis Fernando', NULL, NULL, 'Jefe Unidad Auditoria Interna', NULL, NULL, NULL, '2013-05-31 03:29:43', NULL, NULL, 0, 31, 0, NULL, NULL, 0, 'INF/ZFC/UAI Nº 0015/2013', NULL, 0),
(65, 41, 101, 14, 3, 'INF/ZFC/UAI Nº 0016/2013', 'ZFC/2013-00018', 'Karla Patricia', 'Supervisor Auditoria Interna', 'Luis Fernando', NULL, NULL, 'Jefe Unidad Auditoria Interna', NULL, NULL, NULL, '2013-05-31 03:30:01', NULL, NULL, 0, 31, 0, NULL, NULL, 0, 'INF/ZFC/UAI Nº 0016/2013', NULL, 0),
(66, 2, 101, 14, 3, 'INF/ZFC/UAI Nº 0017/2013', 'ZFC/2013-00018', 'Karla Patricia', 'Supervisor Auditoria Interna', 'Luis Fernando', '', '', 'Jefe Unidad Auditoria Interna', 'LF', 'RESPUESTA', '<p>\n	respuesta</p>\n', '2013-05-31 03:30:33', '', '', 0, 31, 0, '', NULL, 0, 'INF/ZFC/UAI Nº 0017/2013', NULL, 0),
(67, 2, 101, 14, 3, 'INF/ZFC/UAI Nº 0018/2013', 'ZFC/2013-00003', 'Juan Carlos', 'Profesional Auditor Senior', 'Luis Fernando', '', '', 'Jefe Unidad Auditoria Interna', 'LF', 'RESP`2', '<p>\n	resp2</p>\n', '2013-05-31 03:31:30', '', '', 0, 25, 0, '', NULL, 0, 'INF/ZFC/UAI Nº 0018/2013', NULL, 0),
(68, 17, 114, 37, 2, 'MEM/ DGAA/UF Nº 0001/2013', 'MDPyEP/2013-00011', 'juan jose', 'tecnico', 'Juan Carlos Chavez Iporre', '', '', 'Jefe de la Unidad Financiera', 'JCI', 'COMISION DE VIAJE', '<p>\n	Ud a sido asignado en una comisi&oacute;n de viaje...</p>\n', '2013-06-04 02:50:16', '', '', 1, 0, 1, 'MDPyEP', NULL, 0, 'MEM/ DGAA/UF Nº 0001/2013', '', 1),
(69, 68, 114, 38, 3, 'INF/ DGAA/UF Nº 0001/2013', 'MDPyEP/2013-00011', 'Juan Carlos Chavez Iporre', 'Jefe de la Unidad Financiera', 'Norma Flores Marcani', NULL, NULL, 'Secretaria de la Unidad Financiera', NULL, NULL, NULL, '2013-06-04 03:12:33', NULL, NULL, 0, 52, 0, NULL, NULL, 0, 'INF/ DGAA/UF Nº 0001/2013', NULL, 0),
(70, 2, 114, 38, 3, 'INF/ DGAA/UF Nº 0002/2013', 'MDPyEP/2013-00011', 'Juan Carlos Chavez Iporre', 'Jefe de la Unidad Financiera', 'Norma Flores Marcani', '', '', 'Secretaria de la Unidad Financiera', 'MFM', 'INFORME DE RESPUESTA AL MEMORANDUM', '<p>\n	en respuesta al memor&aacute;ndum MEM...</p>\n', '2013-06-04 03:15:35', '', '', 0, 52, 0, '', NULL, 0, 'INF/ DGAA/UF Nº 0002/2013', NULL, 0),
(71, 17, 108, 35, 2, 'MEM/DGAA Nº 0003/2013', 'MDPyEP/2013-00016', 'jjuan', 'Tecnico 4', 'Walter Erick Quevedo Flores', '', '', 'Director General de Asuntos Administrativos', 'EQF', 'ASIGNACION DE COMISION DE VIAJE', '<p>\n	Ud, a sido designado en una comision para viajar a ...</p>\n', '2013-06-04 04:38:28', '', '', 0, 0, 1, '', NULL, 0, 'MEM/DGAA N? 0003/2013', '', 1),
(72, 14, 108, 35, 2, 'MEM/DGAA Nº 0004/2013', 'MDPyEP/2013-00017', 'Alejandro', 'Profesional I', 'Walter Erick Quevedo Flores', '', '', 'Director General de Asuntos Administrativos', 'EQF', 'INFORME DE ACTIVIDADES', '<p>\n	Debe presentar su informe de actividades...</p>\n', '2013-06-04 04:44:45', '', '', 0, 0, 1, '', NULL, 0, 'MEM/DGAA Nº 0004/2013', '', 1),
(73, 14, 108, 35, 2, 'MEM/DGAA N', 'MDPyEP/2013-00018', 'xxavier', 'profesional II', 'Walter Erick Quevedo Flores', '', '', 'Director General de Asuntos Administrativos', 'EQF', 'COMISION DE VIAJE', '<p>\n	en cumplimiento del ...</p>\n', '2013-06-04 04:56:44', '', '', 0, 0, 1, '', NULL, 0, 'MEM/DGAA N? 0005/2013', '', 1),
(74, 7, 108, 35, 2, 'MEM/DGAA N* 0006/2013', 'MDPyEP/2013-00019', 'mmario', 'administrativo 2', 'Walter Erick Quevedo Flores', '', '', 'Director General de Asuntos Administrativos', 'EQF', 'COMISION', '<p>\n	en cumplimiento</p>\n', '2013-06-04 05:00:03', '', '', 0, 0, 1, '', NULL, 0, 'MEM/DGAA N* 0006/2013', '', 1),
(78, 14, 108, 35, 2, 'MEM/DGAA N* 0010/2013', 'MDPyEP/2013-00023', 'asd', 'asd', 'Walter Erick Quevedo Flores', '', '', 'Director General de Asuntos Administrativos', 'EQF', 'ASD', '<p>\n	asd</p>\n', '2013-06-04 05:04:37', '', '', 0, 0, 1, '', NULL, 0, 'MEM/DGAA N* 0010/2013', '', 1),
(81, 2, 108, 35, 2, 'MEM/DGAA No 0013/2013', 'MDPyEP/2013-00026', 'zxc', 'zxc', 'Walter Erick Quevedo Flores', '', '', 'Director General de Asuntos Administrativos', 'EQF', 'ZXC', '<p>\n	zxc</p>\n', '2013-06-04 05:14:02', '', '', 0, 0, 1, '', NULL, 0, 'MEM/DGAA No 0013/2013', '', 1),
(83, 6, 108, 35, 2, 'MEM/DGAA  N', 'MDPyEP/2013-00029', 'ghj', 'ghj', 'Walter Erick Quevedo Flores', '', '', 'Director General de Asuntos Administrativos', 'EQF', 'GHJ', '<p>\n	ghj</p>\n', '2013-06-04 05:17:29', '', '', 0, 0, 1, '', NULL, 0, 'MEM/DGAA  N?  0016/2013', '', 1),
(85, 2, 108, 35, 2, 'MEM/DGAA Nº 0018/2013', 'MDPyEP/2013-00031', 'sdf', 'sdf', 'Walter Erick Quevedo Flores', '', '', 'Director General de Asuntos Administrativos', 'EQF', 'SDF', '<p>\n	sdf</p>\n', '2013-06-04 05:28:18', '', '', 0, 0, 1, '', NULL, 0, 'MEM/DGAA Nº 0018/2013', '', 1),
(86, 2, 108, 35, 2, 'MEM/DGAA Nº 0019/2013', 'MDPyEP/2013-00032', 'Jose Escalante', 'Profesional I', 'Walter Erick Quevedo Flores', '', '', 'Director General de Asuntos Administrativos', 'EQF', 'PROCESO DE ADQUISICION 100613', '<p>\n	Proceso de adquisicion 100613</p>\n', '2013-06-04 05:52:17', '', '', 1, 0, 1, '', NULL, 0, 'MEM/DGAA Nº 0019/2013', '', 1),
(87, 2, 108, 35, 3, 'INF/DGAA Nº 0001/2013', 'MDPyEP/2013-00033', 'Maria Elena Alfaro Castillo', 'Secretaria D.G.A.A.', 'Walter Erick Quevedo Flores', '', '', 'Director General de Asuntos Administrativos', 'EQF', 'INFORME DE ADQUISICION 100613', '<p>\n	el informe de adquisicion...100613</p>\n', '2013-06-04 06:11:33', '', '', 0, 0, 1, '', NULL, 0, 'INF/DGAA Nº 0001/2013', '', 1),
(88, 4, 108, 35, 2, 'MEM/DGAA Nº 0020/2013', 'MDPyEP/2013-00034', 'Juan Jose Espejo', 'Tecnico operativo', 'Walter Erick Quevedo Flores', '', '', 'Director General de Asuntos Administrativos', 'EQF', 'ASD', '<p>\n	asd</p>\n', '2013-06-04 15:20:39', '', '', 1, 0, 1, '', NULL, 0, 'MEM/DGAA Nº 0020/2013', '', 1),
(89, 2, 108, 36, 3, 'INF/DGAA Nº 0002/2013', 'MDPyEP/2013-00035', 'Hernando ', 'Tecnico operativo', 'Maria Elena Alfaro Castillo', '', '', 'Secretaria D.G.A.A.', 'MAC', 'INFORME DE ACTIVIDADES', '', '2013-06-17 09:01:11', '', '', 0, 0, 1, '', NULL, 0, 'INF/DGAA Nº 0002/2013', '', 1),
(90, 2, 108, 36, 3, 'INF/DGAA Nº 0003/2013', 'MDPyEP/2013-00038', 'Oscar', 'Profesional X', 'Juan Zalles', '', '', 'Procurador', 'MAC', 'INFORME DE VIAJE', '', '2013-06-17 11:55:37', '', '', 0, 0, 1, '', NULL, 0, 'INF/DGAA Nº 0003/2013', '', 1),
(91, 4, 108, 36, 11, 'FCV/DGAA Nº 0001/2013', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 12:13:06', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0001/2013', NULL, 1),
(92, 4, 108, 36, 11, 'FCV/DGAA Nº 0002/2013', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 12:15:37', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0002/2013', NULL, 1),
(93, 4, 108, 36, 11, 'FCV/DGAA Nº 0003/2013', 'MDPyEP/2013-00039', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 12:17:15', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0003/2013', NULL, 1),
(94, 4, 108, 36, 11, 'FCV/DGAA Nº 0004/2013', 'MDPyEP/2013-00040', '39', 'Profesional encargado de presupuesto', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 12:21:06', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0004/2013', NULL, 1),
(95, 4, 108, 36, 11, 'FCV/DGAA Nº 0006/2013', 'MDPyEP/2013-00042', 'Jose Elias Stolzer', 'Profesional encargado de presupuesto', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 12:39:12', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0006/2013', NULL, 1),
(96, 4, 108, 36, 11, 'FCV/DGAA Nº 0007/2013', 'MDPyEP/2013-00043', 'Jose Elias Stolzer', 'Profesional encargado de presupuesto', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 15:10:37', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0007/2013', NULL, 1),
(97, 4, 108, 36, 11, 'FCV/DGAA Nº 0008/2013', 'MDPyEP/2013-00044', 'Cristian Jesus Michel Garcia', 'Tecnico Asistente Administrativo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 15:20:00', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0008/2013', NULL, 1),
(98, 4, 108, 36, 11, 'FCV/DGAA Nº 0009/2013', 'MDPyEP/2013-00045', 'Norma Flores Marcani', 'Secretaria de la Unidad Financiera', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 16:13:13', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0009/2013', NULL, 1),
(99, 4, 108, 36, 11, 'FCV/DGAA Nº 0010/2013', 'MDPyEP/2013-00046', 'Juan Carlos Chavez Iporre', 'Jefe de la Unidad Financiera', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 16:14:57', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0010/2013', NULL, 1),
(100, 4, 108, 36, 11, 'FCV/DGAA Nº 0015/2013', 'MDPyEP/2013-00051', 'Walter Erick Quevedo Flores', 'Director General de Asuntos Administrativos', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 16:22:55', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0015/2013', NULL, 1),
(101, 4, 108, 36, 11, 'FCV/DGAA Nº 0016/2013', 'MDPyEP/2013-00052', 'Ana Teresa Morales Olivera', 'Ministra', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 16:23:39', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0016/2013', NULL, 1),
(102, 4, 108, 36, 11, 'FCV/DGAA Nº 0017/2013', 'MDPyEP/2013-00053', 'Maria Luisa Quezada Portugal', 'Jefe de Gabinete', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 16:29:24', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0017/2013', NULL, 1),
(103, 4, 108, 36, 11, 'FCV/DGAA Nº 0019/2013', 'MDPyEP/2013-00055', 'Ana Teresa Morales Olivera', 'Ministra', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 16:41:25', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0019/2013', NULL, 1),
(104, 4, 108, 36, 11, 'FCV/DGAA Nº 0020/2013', 'MDPyEP/2013-00056', 'Ana Teresa Morales Olivera', 'Ministra', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 16:41:56', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0020/2013', NULL, 1),
(105, 4, 108, 36, 11, 'FCV/DGAA Nº 0023/2013', 'MDPyEP/2013-00059', 'Ana Teresa Morales Olivera', 'Ministra', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 17:37:15', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0023/2013', NULL, 1),
(106, 4, 108, 36, 11, 'FCV/DGAA Nº 0024/2013', 'MDPyEP/2013-00060', 'Walter Erick Quevedo Flores', 'Director General de Asuntos Administrativos', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 17:38:15', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0024/2013', NULL, 1),
(107, 4, 108, 36, 11, 'FCV/DGAA Nº 0025/2013', 'MDPyEP/2013-00061', 'Ana Teresa Morales Olivera', 'Ministra', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 17:39:36', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0025/2013', NULL, 1),
(108, 4, 108, 36, 11, 'FCV/DGAA Nº 0026/2013', 'MDPyEP/2013-00062', 'Ana Teresa Morales Olivera', 'Ministra', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 17:41:22', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0026/2013', NULL, 1),
(109, 4, 108, 36, 11, 'FCV/DGAA Nº 0027/2013', 'MDPyEP/2013-00063', 'Ana Teresa Morales Olivera', 'Ministra', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 17:42:46', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0027/2013', NULL, 1),
(110, 4, 108, 36, 11, 'FCV/DGAA Nº 0028/2013', 'MDPyEP/2013-00064', 'Ana Teresa Morales Olivera', 'Ministra', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 17:43:07', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0028/2013', NULL, 1),
(111, 4, 108, 36, 11, 'FCV/DGAA Nº 0029/2013', 'MDPyEP/2013-00065', 'Ana Teresa Morales Olivera', 'Ministra', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 17:43:55', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0029/2013', NULL, 1),
(112, 4, 108, 36, 11, 'FCV/DGAA Nº 0030/2013', 'MDPyEP/2013-00066', 'Ana Teresa Morales Olivera', 'Ministra', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 17:44:03', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0030/2013', NULL, 1),
(113, 4, 108, 36, 11, 'FCV/DGAA Nº 0031/2013', 'MDPyEP/2013-00067', 'Ana Teresa Morales Olivera', 'Ministra', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 17:46:52', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0031/2013', NULL, 1),
(114, 4, 108, 36, 11, 'FCV/DGAA Nº 0032/2013', 'MDPyEP/2013-00068', 'Ana Teresa Morales Olivera', 'Ministra', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 17:48:41', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0032/2013', NULL, 1),
(115, 4, 108, 36, 11, 'FCV/DGAA Nº 0033/2013', 'MDPyEP/2013-00069', 'Ana Teresa Morales Olivera', 'Ministra', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 17:50:02', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0033/2013', NULL, 1),
(116, 4, 108, 36, 11, 'FCV/DGAA Nº 0034/2013', 'MDPyEP/2013-00070', 'Ana Teresa Morales Olivera', 'Ministra', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 17:51:59', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0034/2013', NULL, 1),
(117, 4, 108, 36, 11, 'FCV/DGAA Nº 0035/2013', 'MDPyEP/2013-00071', 'Ana Teresa Morales Olivera', 'Ministra', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 17:52:31', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0035/2013', NULL, 1),
(118, 4, 108, 36, 11, 'FCV/DGAA Nº 0036/2013', 'MDPyEP/2013-00072', 'Ana Teresa Morales Olivera', 'Ministra', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 17:55:30', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0036/2013', NULL, 1),
(119, 4, 108, 36, 11, 'FCV/DGAA Nº 0037/2013', 'MDPyEP/2013-00073', 'Ana Teresa Morales Olivera', 'Ministra', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 17:56:01', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0037/2013', '25', 1),
(120, 4, 108, 36, 11, 'FCV/DGAA Nº 0038/2013', 'MDPyEP/2013-00074', 'Walter Erick Quevedo Flores', 'Director General de Asuntos Administrativos', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 17:59:46', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0038/2013', '35', 1),
(121, 4, 108, 36, 11, 'FCV/DGAA Nº 0039/2013', 'MDPyEP/2013-00075', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 18:00:16', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0039/2013', '', 1),
(122, 4, 108, 36, 11, 'FCV/DGAA Nº 0040/2013', 'MDPyEP/2013-00076', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 18:03:41', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0040/2013', '', 1),
(123, 4, 108, 36, 11, 'FCV/DGAA Nº 0041/2013', 'MDPyEP/2013-00077', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 18:04:02', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0041/2013', '', 1),
(124, 4, 108, 36, 11, 'FCV/DGAA Nº 0042/2013', 'MDPyEP/2013-00078', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 18:04:48', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0042/2013', '', 1),
(125, 4, 108, 36, 11, 'FCV/DGAA Nº 0043/2013', 'MDPyEP/2013-00079', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 18:05:02', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0043/2013', '', 1),
(126, 4, 108, 36, 11, 'FCV/DGAA Nº 0044/2013', 'MDPyEP/2013-00080', 'Ana Teresa Morales Olivera', 'Ministra', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 18:06:09', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0044/2013', '25', 1),
(127, 4, 108, 36, 11, 'FCV/DGAA Nº 0045/2013', 'MDPyEP/2013-00081', 'Ana Teresa Morales Olivera', 'Ministra', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 18:06:41', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0045/2013', '25', 1),
(128, 4, 108, 36, 11, 'FCV/DGAA Nº 0046/2013', 'MDPyEP/2013-00082', 'Ana Teresa Morales Olivera', 'Ministra', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 18:07:00', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0046/2013', '25', 1),
(129, 4, 108, 36, 11, 'FCV/DGAA Nº 0047/2013', 'MDPyEP/2013-00083', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 18:11:56', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0047/2013', '', 1),
(130, 4, 108, 36, 11, 'FCV/DGAA Nº 0048/2013', 'MDPyEP/2013-00084', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 18:12:56', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0048/2013', '', 1);
INSERT INTO `documentos` (`id`, `id_proceso`, `id_oficina`, `id_user`, `id_tipo`, `codigo`, `nur`, `nombre_destinatario`, `cargo_destinatario`, `nombre_remitente`, `nombre_via`, `cargo_via`, `cargo_remitente`, `mosca_remitente`, `referencia`, `contenido`, `fecha_creacion`, `adjuntos`, `copias`, `estado`, `id_seguimiento`, `original`, `institucion_destinatario`, `institucion_remitente`, `hojas`, `cite_original`, `titulo`, `id_entidad`) VALUES
(131, 4, 108, 36, 11, 'FCV/DGAA Nº 0049/2013', 'MDPyEP/2013-00085', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 18:13:28', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0049/2013', '', 1),
(132, 4, 108, 36, 11, 'FCV/DGAA Nº 0050/2013', 'MDPyEP/2013-00086', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 18:14:03', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0050/2013', '', 1),
(133, 4, 108, 36, 11, 'FCV/DGAA Nº 0051/2013', 'MDPyEP/2013-00087', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 18:14:14', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0051/2013', '', 1),
(134, 4, 108, 36, 11, 'FCV/DGAA Nº 0052/2013', 'MDPyEP/2013-00088', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 18:15:07', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0052/2013', '', 1),
(135, 4, 108, 36, 11, 'FCV/DGAA Nº 0053/2013', 'MDPyEP/2013-00089', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 18:16:09', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0053/2013', '', 1),
(136, 4, 108, 36, 11, 'FCV/DGAA Nº 0054/2013', 'MDPyEP/2013-00090', 'Ana Teresa Morales Olivera', 'Ministra', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 18:20:31', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0054/2013', '25', 1),
(137, 4, 108, 36, 11, 'FCV/DGAA Nº 0055/2013', 'MDPyEP/2013-00091', 'Ana Teresa Morales Olivera', 'Ministra', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 18:20:53', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0055/2013', '25', 1),
(138, 4, 108, 36, 11, 'FCV/DGAA Nº 0056/2013', 'MDPyEP/2013-00092', 'Ana Teresa Morales Olivera', 'Ministra', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 18:21:34', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0056/2013', '25', 1),
(139, 4, 108, 36, 11, 'FCV/DGAA Nº 0057/2013', 'MDPyEP/2013-00093', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 18:22:25', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0057/2013', '', 1),
(140, 4, 108, 36, 11, 'FCV/DGAA Nº 0058/2013', 'MDPyEP/2013-00094', 'Cristian Jesus Michel Garcia', 'Tecnico Asistente Administrativo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 18:24:51', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0058/2013', '28', 1),
(141, 4, 108, 36, 11, 'FCV/DGAA Nº 0059/2013', 'MDPyEP/2013-00095', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 18:25:02', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0059/2013', '', 1),
(142, 4, 108, 36, 11, 'FCV/DGAA Nº 0060/2013', 'MDPyEP/2013-00096', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 18:25:27', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0060/2013', '', 1),
(143, 4, 108, 36, 11, 'FCV/DGAA Nº 0061/2013', 'MDPyEP/2013-00097', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 18:25:32', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0061/2013', '', 1),
(144, 4, 108, 36, 11, 'FCV/DGAA Nº 0062/2013', 'MDPyEP/2013-00098', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 18:26:46', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0062/2013', '', 1),
(145, 4, 108, 36, 11, 'FCV/DGAA Nº 0063/2013', 'MDPyEP/2013-00099', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 18:28:00', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0063/2013', '', 1),
(146, 4, 108, 36, 11, 'FCV/DGAA Nº 0064/2013', 'MDPyEP/2013-00100', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 18:28:52', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0064/2013', '', 1),
(147, 4, 108, 36, 11, 'FCV/DGAA Nº 0065/2013', 'MDPyEP/2013-00101', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 18:29:28', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0065/2013', '', 1),
(148, 4, 108, 36, 11, 'FCV/DGAA Nº 0066/2013', 'MDPyEP/2013-00102', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 18:30:03', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0066/2013', '', 1),
(149, 4, 108, 36, 11, 'FCV/DGAA Nº 0067/2013', 'MDPyEP/2013-00103', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 18:30:44', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0067/2013', '', 1),
(150, 4, 108, 36, 11, 'FCV/DGAA Nº 0068/2013', 'MDPyEP/2013-00104', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 18:31:08', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0068/2013', '', 1),
(151, 4, 108, 36, 11, 'FCV/DGAA Nº 0069/2013', 'MDPyEP/2013-00105', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 18:31:36', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0069/2013', '', 1),
(152, 4, 108, 36, 11, 'FCV/DGAA Nº 0070/2013', 'MDPyEP/2013-00106', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 18:32:41', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0070/2013', '', 1),
(153, 4, 108, 36, 11, 'FCV/DGAA Nº 0071/2013', 'MDPyEP/2013-00107', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 18:33:21', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0071/2013', '', 1),
(154, 4, 108, 36, 11, 'FCV/DGAA Nº 0072/2013', 'MDPyEP/2013-00108', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 18:34:44', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0072/2013', '', 1),
(155, 4, 108, 36, 11, 'FCV/DGAA Nº 0073/2013', 'MDPyEP/2013-00109', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 18:35:16', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0073/2013', '', 1),
(156, 4, 108, 36, 11, 'FCV/DGAA Nº 0074/2013', 'MDPyEP/2013-00110', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 18:35:21', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0074/2013', '', 1),
(157, 4, 108, 36, 11, 'FCV/DGAA Nº 0075/2013', 'MDPyEP/2013-00111', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 18:37:36', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0075/2013', '', 1),
(158, 4, 108, 36, 11, 'FCV/DGAA Nº 0076/2013', 'MDPyEP/2013-00112', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 18:38:20', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0076/2013', '', 1),
(159, 4, 108, 36, 11, 'FCV/DGAA Nº 0077/2013', 'MDPyEP/2013-00113', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 18:39:56', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0077/2013', '', 1),
(160, 4, 108, 36, 11, 'FCV/DGAA Nº 0078/2013', 'MDPyEP/2013-00114', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 18:40:03', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0078/2013', '', 1),
(161, 4, 108, 36, 11, 'FCV/DGAA Nº 0079/2013', 'MDPyEP/2013-00115', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 18:40:31', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0079/2013', '', 1),
(162, 4, 108, 36, 11, 'FCV/DGAA Nº 0080/2013', 'MDPyEP/2013-00116', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 18:41:30', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0080/2013', '', 1),
(163, 4, 108, 36, 11, 'FCV/DGAA Nº 0081/2013', 'MDPyEP/2013-00117', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-17 18:47:48', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0081/2013', '', 1),
(164, 4, 108, 36, 11, 'FCV/DGAA Nº 0082/2013', 'MDPyEP/2013-00118', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 08:47:50', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0082/2013', '', 1),
(165, 4, 108, 36, 11, 'FCV/DGAA Nº 0083/2013', 'MDPyEP/2013-00119', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 08:49:29', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0083/2013', '', 1),
(166, 4, 108, 36, 11, 'FCV/DGAA Nº 0084/2013', 'MDPyEP/2013-00120', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 08:52:18', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0084/2013', '', 1),
(167, 4, 108, 36, 11, 'FCV/DGAA Nº 0085/2013', 'MDPyEP/2013-00121', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 08:54:33', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0085/2013', '', 1),
(168, 4, 108, 36, 11, 'FCV/DGAA Nº 0086/2013', 'MDPyEP/2013-00122', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 08:57:08', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0086/2013', '', 1),
(169, 4, 108, 36, 11, 'FCV/DGAA Nº 0087/2013', 'MDPyEP/2013-00123', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 08:57:55', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0087/2013', '', 1),
(170, 4, 108, 36, 11, 'FCV/DGAA Nº 0088/2013', 'MDPyEP/2013-00124', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 08:58:56', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0088/2013', '', 1),
(171, 4, 108, 36, 11, 'FCV/DGAA Nº 0089/2013', 'MDPyEP/2013-00125', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 09:00:10', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0089/2013', '', 1),
(172, 4, 108, 36, 11, 'FCV/DGAA Nº 0090/2013', 'MDPyEP/2013-00126', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 09:00:49', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0090/2013', '', 1),
(173, 4, 108, 36, 11, 'FCV/DGAA Nº 0091/2013', 'MDPyEP/2013-00127', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 09:01:21', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0091/2013', '', 1),
(174, 4, 108, 36, 11, 'FCV/DGAA Nº 0092/2013', 'MDPyEP/2013-00128', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 09:02:40', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0092/2013', '', 1),
(175, 4, 108, 36, 11, 'FCV/DGAA Nº 0093/2013', 'MDPyEP/2013-00129', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 09:05:16', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0093/2013', '', 1),
(176, 4, 108, 36, 11, 'FCV/DGAA Nº 0094/2013', 'MDPyEP/2013-00130', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 09:08:22', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0094/2013', '', 1),
(177, 4, 108, 36, 11, 'FCV/DGAA Nº 0095/2013', 'MDPyEP/2013-00131', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 09:08:36', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0095/2013', '', 1),
(178, 4, 108, 36, 11, 'FCV/DGAA Nº 0096/2013', 'MDPyEP/2013-00132', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 09:11:14', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0096/2013', '', 1),
(179, 4, 108, 36, 11, 'FCV/DGAA Nº 0097/2013', 'MDPyEP/2013-00133', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 09:11:19', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0097/2013', '', 1),
(180, 4, 108, 36, 11, 'FCV/DGAA Nº 0098/2013', 'MDPyEP/2013-00134', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 09:12:27', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0098/2013', '', 1),
(181, 4, 108, 36, 11, 'FCV/DGAA Nº 0099/2013', 'MDPyEP/2013-00135', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 09:12:33', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0099/2013', '', 1),
(182, 4, 108, 36, 11, 'FCV/DGAA Nº 0100/2013', 'MDPyEP/2013-00136', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 09:12:52', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0100/2013', '', 1),
(183, 4, 108, 36, 11, 'FCV/DGAA Nº 0101/2013', 'MDPyEP/2013-00137', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 09:12:56', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0101/2013', '', 1),
(184, 4, 108, 36, 11, 'FCV/DGAA Nº 0102/2013', 'MDPyEP/2013-00138', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 09:13:32', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0102/2013', '', 1),
(185, 4, 108, 36, 11, 'FCV/DGAA Nº 0103/2013', 'MDPyEP/2013-00139', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 09:13:36', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0103/2013', '', 1),
(186, 4, 108, 36, 11, 'FCV/DGAA Nº 0104/2013', 'MDPyEP/2013-00140', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 09:13:39', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0104/2013', '', 1),
(187, 4, 108, 36, 11, 'FCV/DGAA Nº 0105/2013', 'MDPyEP/2013-00141', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 09:13:43', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0105/2013', '', 1),
(188, 4, 108, 36, 11, 'FCV/DGAA Nº 0106/2013', 'MDPyEP/2013-00142', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 09:14:45', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0106/2013', '', 1),
(189, 4, 108, 36, 11, 'FCV/DGAA Nº 0107/2013', 'MDPyEP/2013-00143', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 09:14:50', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0107/2013', '', 1),
(190, 4, 108, 36, 11, 'FCV/DGAA Nº 0108/2013', 'MDPyEP/2013-00144', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 09:14:53', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0108/2013', '', 1),
(191, 4, 108, 36, 11, 'FCV/DGAA Nº 0109/2013', 'MDPyEP/2013-00145', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 09:14:57', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0109/2013', '', 1),
(192, 4, 108, 36, 11, 'FCV/DGAA Nº 0110/2013', 'MDPyEP/2013-00146', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 09:15:30', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0110/2013', '', 1),
(193, 4, 108, 36, 11, 'FCV/DGAA Nº 0111/2013', 'MDPyEP/2013-00147', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 09:15:35', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0111/2013', '', 1),
(194, 4, 108, 36, 11, 'FCV/DGAA Nº 0112/2013', 'MDPyEP/2013-00148', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 09:15:39', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0112/2013', '', 1),
(195, 4, 108, 36, 11, 'FCV/DGAA Nº 0113/2013', 'MDPyEP/2013-00149', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 09:15:51', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0113/2013', '', 1),
(196, 4, 108, 36, 11, 'FCV/DGAA Nº 0114/2013', 'MDPyEP/2013-00150', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 09:16:15', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0114/2013', '', 1),
(197, 4, 108, 36, 11, 'FCV/DGAA Nº 0115/2013', 'MDPyEP/2013-00151', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 09:16:21', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0115/2013', '', 1),
(198, 4, 108, 36, 11, 'FCV/DGAA Nº 0116/2013', 'MDPyEP/2013-00152', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 09:16:37', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0116/2013', '', 1),
(199, 4, 108, 36, 11, 'FCV/DGAA Nº 0117/2013', 'MDPyEP/2013-00153', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 09:17:09', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0117/2013', '', 1),
(200, 4, 108, 36, 11, 'FCV/DGAA Nº 0118/2013', 'MDPyEP/2013-00154', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 09:18:17', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0118/2013', '', 1),
(201, 4, 108, 36, 11, 'FCV/DGAA Nº 0119/2013', 'MDPyEP/2013-00155', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 09:18:23', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0119/2013', '', 1),
(202, 4, 108, 36, 11, 'FCV/DGAA Nº 0120/2013', 'MDPyEP/2013-00156', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 09:19:58', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0120/2013', '', 1),
(203, 4, 108, 36, 11, 'FCV/DGAA Nº 0121/2013', 'MDPyEP/2013-00157', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 09:20:09', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0121/2013', '', 1),
(204, 4, 108, 36, 11, 'FCV/DGAA Nº 0122/2013', 'MDPyEP/2013-00158', 'Ana Teresa Morales Olivera', 'Ministra', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 09:57:31', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0122/2013', '25', 1),
(205, 4, 108, 36, 11, 'FCV/DGAA Nº 0123/2013', 'MDPyEP/2013-00159', 'Ana Teresa Morales Olivera', 'Ministra', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 09:57:37', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0123/2013', '25', 1),
(206, 4, 108, 36, 11, 'FCV/DGAA Nº 0124/2013', 'MDPyEP/2013-00160', 'Ana Teresa Morales Olivera', 'Ministra', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 09:59:44', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0124/2013', '25', 1),
(207, 4, 108, 36, 11, 'FCV/DGAA Nº 0125/2013', 'MDPyEP/2013-00161', 'Ana Teresa Morales Olivera', 'Ministra', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 09:59:51', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0125/2013', '25', 1),
(208, 4, 108, 36, 11, 'FCV/DGAA Nº 0126/2013', 'MDPyEP/2013-00162', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 10:02:54', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0126/2013', '', 1),
(209, 4, 108, 36, 11, 'FCV/DGAA Nº 0127/2013', 'MDPyEP/2013-00163', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 10:03:03', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0127/2013', '', 1),
(210, 4, 108, 36, 11, 'FCV/DGAA Nº 0128/2013', 'MDPyEP/2013-00164', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 10:03:08', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0128/2013', '', 1),
(211, 4, 108, 36, 11, 'FCV/DGAA Nº 0129/2013', 'MDPyEP/2013-00165', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 10:03:16', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0129/2013', '', 1),
(212, 4, 108, 36, 11, 'FCV/DGAA Nº 0130/2013', 'MDPyEP/2013-00166', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 10:03:25', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0130/2013', '', 1),
(213, 4, 108, 36, 11, 'FCV/DGAA Nº 0131/2013', 'MDPyEP/2013-00167', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 10:06:49', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0131/2013', '', 1),
(214, 4, 108, 36, 11, 'FCV/DGAA Nº 0132/2013', 'MDPyEP/2013-00168', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 10:06:58', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0132/2013', '', 1),
(215, 4, 108, 36, 11, 'FCV/DGAA Nº 0133/2013', 'MDPyEP/2013-00169', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 10:07:04', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0133/2013', '', 1),
(216, 4, 108, 36, 11, 'FCV/DGAA Nº 0134/2013', 'MDPyEP/2013-00170', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 10:07:07', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0134/2013', '', 1),
(217, 4, 108, 36, 11, 'FCV/DGAA Nº 0135/2013', 'MDPyEP/2013-00171', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 10:07:16', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0135/2013', '', 1),
(218, 4, 108, 36, 11, 'FCV/DGAA Nº 0136/2013', 'MDPyEP/2013-00172', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 10:11:31', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0136/2013', '', 1),
(219, 4, 108, 36, 11, 'FCV/DGAA Nº 0139/2013', 'MDPyEP/2013-00175', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 11:09:59', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0139/2013', '', 1),
(220, 4, 108, 36, 11, 'FCV/DGAA Nº 0140/2013', 'MDPyEP/2013-00176', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 11:11:06', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0140/2013', '', 1),
(221, 4, 108, 36, 11, 'FCV/DGAA Nº 0141/2013', 'MDPyEP/2013-00177', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 11:11:15', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0141/2013', '', 1),
(222, 4, 108, 36, 11, 'FCV/DGAA Nº 0142/2013', 'MDPyEP/2013-00178', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 11:11:19', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0142/2013', '', 1),
(223, 4, 108, 36, 11, 'FCV/DGAA Nº 0143/2013', 'MDPyEP/2013-00179', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 11:11:25', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0143/2013', '', 1),
(224, 4, 108, 36, 11, 'FCV/DGAA Nº 0144/2013', 'MDPyEP/2013-00180', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 11:13:09', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0144/2013', '', 1),
(225, 4, 108, 36, 11, 'FCV/DGAA Nº 0145/2013', 'MDPyEP/2013-00181', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 11:13:15', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0145/2013', '', 1),
(226, 4, 108, 36, 11, 'FCV/DGAA Nº 0146/2013', 'MDPyEP/2013-00182', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 11:13:19', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0146/2013', '', 1),
(227, 4, 108, 36, 11, 'FCV/DGAA Nº 0147/2013', 'MDPyEP/2013-00183', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 11:19:20', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0147/2013', '', 1),
(228, 4, 108, 36, 11, 'FCV/DGAA Nº 0148/2013', 'MDPyEP/2013-00184', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 11:19:27', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0148/2013', '', 1),
(229, 4, 108, 36, 11, 'FCV/DGAA Nº 0149/2013', 'MDPyEP/2013-00185', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 11:19:45', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0149/2013', '', 1),
(230, 4, 108, 36, 11, 'FCV/DGAA Nº 0150/2013', 'MDPyEP/2013-00186', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 11:19:55', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0150/2013', '', 1),
(231, 4, 108, 36, 11, 'FCV/DGAA Nº 0151/2013', 'MDPyEP/2013-00187', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 11:20:00', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0151/2013', '', 1),
(232, 4, 108, 36, 11, 'FCV/DGAA Nº 0152/2013', 'MDPyEP/2013-00188', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 11:20:30', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0152/2013', '', 1),
(233, 4, 108, 36, 11, 'FCV/DGAA Nº 0153/2013', 'MDPyEP/2013-00189', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 11:21:22', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0153/2013', '', 1),
(234, 4, 108, 36, 11, 'FCV/DGAA Nº 0154/2013', 'MDPyEP/2013-00190', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 11:21:28', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0154/2013', '', 1),
(235, 4, 108, 36, 11, 'FCV/DGAA Nº 0155/2013', 'MDPyEP/2013-00191', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-18 11:22:25', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0155/2013', '', 1),
(236, 4, 108, 36, 11, 'FCV/DGAA Nº 0156/2013', 'MDPyEP/2013-00192', 'Lucio Primitivo Choque Quispe', 'Profesional en Planificacion Sectorial e Institucional', 'Juan Zalles', NULL, NULL, 'Procurador', NULL, 'Fucov', NULL, '2013-06-18 11:25:55', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0156/2013', '34', 1),
(237, 4, 108, 36, 11, 'FCV/DGAA Nº 0157/2013', 'MDPyEP/2013-00193', 'Rosario Jimena Tellez Quenallata', 'Secretaria Direccion General de Planificacion', NULL, NULL, NULL, NULL, NULL, 'Fucov', NULL, '2013-06-18 11:32:11', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0157/2013', '33', 1),
(238, 4, 108, 36, 11, 'FCV/DGAA Nº 0158/2013', 'MDPyEP/2013-00194', 'Jose Elias Stolzer', 'Profesional encargado de presupuesto', NULL, NULL, NULL, NULL, NULL, 'FORMULARIO UNICO DE COMISION DE VIAJE.', NULL, '2013-06-18 12:32:15', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0158/2013', NULL, 1),
(239, 4, 108, 36, 11, 'FCV/DGAA Nº 0168/2013', 'MDPyEP/2013-00204', '', '', NULL, NULL, NULL, NULL, NULL, 'FORMULARIO UNICO DE COMISION DE VIAJE.', NULL, '2013-06-18 15:30:19', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0168/2013', NULL, 1),
(240, 4, 108, 36, 11, 'FCV/DGAA Nº 0169/2013', 'MDPyEP/2013-00205', '', '', NULL, NULL, NULL, NULL, NULL, 'FORMULARIO UNICO DE COMISION DE VIAJE.', NULL, '2013-06-18 15:30:32', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0169/2013', NULL, 1),
(241, 4, 108, 36, 11, 'FCV/DGAA Nº 0170/2013', 'MDPyEP/2013-00206', '', '', NULL, NULL, NULL, NULL, NULL, 'FORMULARIO UNICO DE COMISION DE VIAJE.', NULL, '2013-06-18 15:31:38', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0170/2013', NULL, 1),
(242, 4, 108, 36, 11, 'FCV/DGAA Nº 0171/2013', 'MDPyEP/2013-00207', '', '', NULL, NULL, NULL, NULL, NULL, 'FORMULARIO UNICO DE COMISION DE VIAJE.', NULL, '2013-06-18 15:31:43', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0171/2013', NULL, 1),
(243, 4, 108, 36, 11, 'FCV/DGAA Nº 0172/2013', 'MDPyEP/2013-00208', '', '', NULL, NULL, NULL, NULL, NULL, 'FORMULARIO UNICO DE COMISION DE VIAJE.', NULL, '2013-06-18 16:09:42', NULL, NULL, 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0172/2013', NULL, 1),
(244, 4, 108, 36, 11, 'FCV/DGAA Nº 0173/2013', 'MDPyEP/2013-00209', 'Lucio Choque L.', 'Profesional Planificacion', 'Erick Quevedo Flores', NULL, NULL, 'Director DGAA', 'EQF', 'Formulario Unico de Viaje', NULL, '2013-06-18 16:23:41', '', '', 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0173/2013', NULL, 1),
(245, 4, 108, 36, 11, 'FCV/DGAA Nº 0174/2013', 'MDPyEP/2013-00210', 'saasd', 'asdasd', 'Maria Elena Alfaro Castillo', NULL, NULL, 'Secretaria D.G.A.A.', 'MAC', 'reunion', NULL, '2013-06-19 10:06:31', '', '', 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0174/2013', NULL, 1),
(246, 4, 108, 36, 11, 'FCV/DGAA Nº 0175/2013', 'MDPyEP/2013-00211', 'MAria de los Angeles', 'asdasd', 'Maria Elena Alfaro Castillo', NULL, NULL, 'Secretaria D.G.A.A.', 'MAC', 'reunion', NULL, '2013-06-19 10:07:07', '', '', 1, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0175/2013', NULL, 1),
(247, 4, 108, 36, 11, 'FCV/DGAA Nº 0176/2013', 'MDPyEP/2013-00212', 'jose', 'jose', 'Maria Elena Alfaro Castillo', NULL, NULL, 'Secretaria D.G.A.A.', 'MAC', 'jose', NULL, '2013-06-19 11:23:15', '', '', 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0176/2013', NULL, 1),
(248, 4, 108, 36, 11, 'FCV/DGAA Nº 0177/2013', 'MDPyEP/2013-00213', 'juan', 'juan', 'Maria Elena Alfaro Castillo', NULL, NULL, 'Secretaria D.G.A.A.', 'MAC', 'juan', NULL, '2013-06-19 11:25:56', '', '', 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0177/2013', NULL, 1),
(249, 4, 108, 36, 11, 'FCV/DGAA Nº 0178/2013', 'MDPyEP/2013-00214', 'Jose', 'Tecnico', 'Maria Elena Alfaro Castillo', NULL, NULL, 'Secretaria D.G.A.A.', 'MAC', 'Reunion con los productores de maiz', NULL, '2013-06-19 15:49:11', '', '', 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0178/2013', NULL, 1),
(250, 4, 108, 36, 11, 'FCV/DGAA Nº 0179/2013', 'MDPyEP/2013-00215', 'Lucio Choque', 'Profesional I', 'Maria Elena Alfaro Castillo', NULL, NULL, 'Secretaria D.G.A.A.', 'MAC', 'Reunion', NULL, '2013-06-20 19:13:09', '', '', 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0179/2013', NULL, 1),
(251, 4, 108, 36, 11, 'FCV/DGAA Nº 0180/2013', 'MDPyEP/2013-00216', 'Stolzer', 'Profesional 2', 'Maria Elena Alfaro Castillo', NULL, NULL, 'Secretaria D.G.A.A.', 'MAC', 'Actividades varias', NULL, '2013-06-24 18:33:53', '', '', 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0180/2013', NULL, 1),
(252, 4, 108, 36, 11, 'FCV/DGAA Nº 0207/2013', '', 'Lucio Choque', 'Profesional I', 'Maria Elena Alfaro Castillo', NULL, NULL, 'Secretaria D.G.A.A.', 'MAC', 'reunion', NULL, '2013-06-27 11:52:06', '', '', 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0207/2013', NULL, 1),
(256, 4, 104, 27, 11, 'FCV/DSP Nº /2013', '', 'Cristian', 'Asistente', 'Romina Medina Santy', NULL, NULL, 'Secretaria de Despacho', 'RMS', 'Curso de capacitacion', NULL, '2013-06-27 12:19:27', '', '', 0, 0, 1, NULL, NULL, 0, 'FCV/DSP Nº /2013', NULL, 1),
(259, 4, 104, 27, 11, 'FCV/DSP Nº 0001/2013', 'MDPyEP/2013-00247', 'cristian', 'asistente', 'Romina Medina Santy', NULL, NULL, 'Secretaria de Despacho', 'RMS', 'Curso', NULL, '2013-06-27 12:27:08', '', '', 0, 0, 1, NULL, NULL, 0, 'FCV/DSP Nº 0001/2013', NULL, 1),
(260, 4, 104, 27, 11, 'FCV/DSP Nº 0002/2013', 'MDPyEP/2013-00248', 'Cristian', 'Asistente', 'Romina Medina Santy', NULL, NULL, 'Secretaria de Despacho', 'RMS', 'Curso de Capacitación', NULL, '2013-06-27 13:58:55', '', '', 0, 0, 1, NULL, NULL, 0, 'FCV/DSP Nº 0002/2013', NULL, 1),
(261, 4, 104, 27, 11, 'FCV/DSP Nº 0003/2013', 'MDPyEP/2013-00249', 'Cristian', 'Asistente', 'Romina Medina Santy', NULL, NULL, 'Secretaria de Despacho', 'RMS', 'Curso de Capacitación', NULL, '2013-06-27 13:59:13', '', '', 0, 0, 1, NULL, NULL, 0, 'FCV/DSP Nº 0003/2013', NULL, 1),
(262, 4, 104, 27, 11, 'FCV/DSP Nº 0004/2013', 'MDPyEP/2013-00250', 'Cristian', 'Asistente', 'Romina Medina Santy', NULL, NULL, 'Secretaria de Despacho', 'RMS', 'Curso de Capacitación', NULL, '2013-06-27 13:59:28', '', '', 0, 0, 1, NULL, NULL, 0, 'FCV/DSP Nº 0004/2013', NULL, 1),
(263, 4, 104, 27, 11, 'FCV/DSP Nº 0005/2013', 'MDPyEP/2013-00251', 'Cristian', 'Asistente', 'Romina Medina Santy', NULL, NULL, 'Secretaria de Despacho', 'RMS', 'Curso de Capacitación', NULL, '2013-06-27 13:59:42', '', '', 0, 0, 1, NULL, NULL, 0, 'FCV/DSP Nº 0005/2013', NULL, 1),
(264, 4, 104, 27, 11, 'FCV/DSP Nº 0006/2013', 'MDPyEP/2013-00252', 'Cristian', 'Asistente', 'Romina Medina Santy', NULL, NULL, 'Secretaria de Despacho', 'RMS', 'Curso de Capacitación', NULL, '2013-06-27 14:01:51', '', '', 0, 0, 1, NULL, NULL, 0, 'FCV/DSP Nº 0006/2013', NULL, 1),
(265, 4, 104, 27, 11, 'FCV/DSP Nº 0007/2013', 'MDPyEP/2013-00253', 'Cristian', 'Asistente', 'Romina Medina Santy', NULL, NULL, 'Secretaria de Despacho', 'RMS', 'Capacitacion', NULL, '2013-06-27 14:04:06', '', '', 0, 0, 1, NULL, NULL, 0, 'FCV/DSP Nº 0007/2013', NULL, 1),
(266, 4, 104, 27, 11, 'FCV/DSP Nº 0008/2013', 'MDPyEP/2013-00254', 'Cristian', 'Asistente', 'Romina Medina Santy', NULL, NULL, 'Secretaria de Despacho', 'RMS', 'Capacitacion', NULL, '2013-06-27 14:06:11', '', '', 0, 0, 1, NULL, NULL, 0, 'FCV/DSP Nº 0008/2013', NULL, 1),
(267, 4, 104, 27, 11, 'FCV/DSP Nº 0009/2013', 'MDPyEP/2013-00255', 'Cristian', 'Asistente', 'Romina Medina Santy', NULL, NULL, 'Secretaria de Despacho', 'RMS', 'Capacitacion para le manejo de ...', NULL, '2013-06-27 14:10:38', '', '', 0, 0, 1, NULL, NULL, 0, 'FCV/DSP Nº 0009/2013', NULL, 1),
(268, 4, 104, 27, 11, 'FCV/DSP Nº 0010/2013', 'MDPyEP/2013-00256', 'Elias', 'Profesional Presupuesto', 'Romina Medina Santy', NULL, NULL, 'Secretaria de Despacho', 'RMS', 'asistencia al curso de capacitacion', NULL, '2013-06-27 14:54:58', '', '', 0, 0, 1, NULL, NULL, 0, 'FCV/DSP Nº 0010/2013', NULL, 1),
(269, 4, 109, 32, 4, 'NI/DGP Nº 0001/2013', 'MDPyEP/2013-00257', 'Erick Quevedo Flores', 'Director General de Asuntos Administrativos', 'Ariel Zabala David', '', '', 'Director General de Planificacion', 'AZD', 'REMITO FORMULARIO DE VIAJE FUCOV', '<p>\n	De mi consideraci&oacute;n:</p>\n<p>\n	En Atenci&oacute;n a procesos administrativos, remito adjunto a la presente el memorando de designaci&oacute;n de viaje FUCOV Correspondiente al Licenciado Lucio Choque, Profesional en Planificaci&oacute;n, quien se trasladar&aacute; a la ciudad de Cochabamba a objeto de participar en la reuni&oacute;n con la AGP.</p>\n<p>\n	Designaci&oacute;n que se realiza en aplicaci&oacute;n al articulo N. 13 (Declaratoria en comisi&oacute;n oficial de emergencia) del reglamento de pasajes y vi&aacute;ticos.</p>\n<p>\n	Con este particular saludo a usted atentamente.</p>\n<p>\n	&nbsp;</p>\n', '2013-06-27 15:22:57', '', '', 1, 0, 1, '', NULL, 0, 'NI/DGP Nº 0001/2013', '', 1),
(270, 4, 109, 33, 11, 'FCV/DGP Nº 0001/2013', 'MDPyEP/2013-00258', 'Ariel Zabala David', 'Director General de Planificacion', 'Rosario Jimena Tellez Quenallata', NULL, NULL, 'Secretaria Direccion General de Planificacion', 'RTQ', 'Participar en la reunión con la AGP.', NULL, '2013-06-27 16:21:33', '', '', 0, 0, 1, NULL, NULL, 0, 'FCV/DGP Nº 0001/2013', NULL, 1),
(271, 4, 109, 33, 11, 'FCV/DGP Nº 0002/2013', 'MDPyEP/2013-00257', 'Ariel Zabala David', 'Director General de Planificacion', 'Rosario Jimena Tellez Quenallata', NULL, NULL, 'Secretaria Direccion General de Planificacion', NULL, NULL, NULL, '2013-06-27 16:43:12', NULL, NULL, 1, 62, 0, NULL, NULL, 0, 'FCV/DGP Nº 0002/2013', NULL, 1),
(272, 4, 109, 33, 3, 'INF/DGP Nº 0001/2013', 'MDPyEP/2013-00257', 'Ariel Zabala David', 'Director General de Planificacion', 'Rosario Jimena Tellez Quenallata', '', '', 'Secretaria Direccion General de Planificacion', 'RTQ', 'INFORME 2', '<p>\n	Informe 2</p>\n', '2013-06-27 17:03:26', '', '', 1, 62, 0, '', NULL, 0, 'INF/DGP Nº 0001/2013', '', 1),
(273, 4, 109, 33, 11, 'FCV/DGP Nº 0003/2013', 'MDPyEP/2013-00261', 'Ariel', 'Director General de Planificacion', 'Rosario Jimena Tellez Quenallata', NULL, NULL, 'Secretaria Direccion General de Planificacion', 'RTQ', 'curso de actualizacion', NULL, '2013-06-28 01:20:52', '', '', 1, 0, 1, NULL, NULL, 0, 'FCV/DGP Nº 0003/2013', NULL, 1),
(274, 4, 108, 36, 11, 'FCV/DGAA Nº 0211/2013', 'MDPyEP/2013-00262', 'Erick Quevedo Flores', 'Director General de Asuntos Administrativos', 'Maria Elena Alfaro Castillo', NULL, NULL, 'Secretaria D.G.A.A.', 'MAC', 'Reunion AGP.', NULL, '2013-06-28 12:48:24', '', '', 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0211/2013', NULL, 1),
(275, 4, 108, 36, 11, 'FCV/DGAA Nº 0212/2013', 'MDPyEP/2013-00263', 'Erick Quevedo Flores', 'Director General de Asuntos Administrativos', 'Maria Elena Alfaro Castillo', NULL, NULL, 'Secretaria D.G.A.A.', 'MAC', 'Reunion AGP.', NULL, '2013-06-28 12:49:26', '', '', 0, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0212/2013', NULL, 1),
(276, 4, 108, 36, 11, 'FCV/DGAA Nº 0213/2013', 'MDPyEP/2013-00264', 'Erick Quevedo Flores', 'Director General de Asuntos Administrativos', 'Maria Elena Alfaro Castillo', NULL, NULL, 'Secretaria D.G.A.A.', 'MAC', 'Reunion con los mienbros del AGP', NULL, '2013-06-28 12:56:19', '', '', 1, 0, 1, NULL, NULL, 0, 'FCV/DGAA Nº 0213/2013', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entidades`
--

CREATE TABLE IF NOT EXISTS `entidades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entidad` varchar(150) DEFAULT NULL,
  `sigla` varchar(10) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `estado` int(1) DEFAULT '1',
  `pie_1` varchar(200) DEFAULT 'La Paz - Bolivia',
  `pie_2` varchar(150) DEFAULT NULL,
  `sigla2` varchar(6) DEFAULT NULL,
  `doc_externo` varchar(10) DEFAULT NULL,
  `nur_externo` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Volcado de datos para la tabla `entidades`
--

INSERT INTO `entidades` (`id`, `entidad`, `sigla`, `logo`, `direccion`, `estado`, `pie_1`, `pie_2`, `sigla2`, `doc_externo`, `nur_externo`) VALUES
(1, 'Ministerio de Desarrollo Productivo y Economía PluraL', 'MDPyEP', 'logo_MDPyEP.png', 'Av. Mariscal Santa Cruz, Edificio Palacio de Comunicaciones Piso 20 - telefonos ( 2124935 - 40)- 2124933 Fax: 2129213 Casilla 1868', 0, 'Av. Mariscal Santa Cruz, Edificio Palacio de Comunicaciones Piso 20 - telefonos ( 2124935 - 40)- 2124933 Fax: 2129213 Casilla 1868', 'La Paz - Bolivia', 'MDPyEP', 'X-MDPyEP/', '/'),
(2, 'Servicio Nacional de Propiedad Intelectual', 'SNP', 'logo_senapi.png', 'Calle PotosÃ­ Esq. Colón N° 1278', 1, 'Calle PotosÃ­ Esq. ColÃ³n NÂ° 1278 Edif. Atalaya Piso 1, Zona Central TelÃ©fonos: 2115700 - 2119276 - 2119251 Fax: 2115700 e-mail: senapi@senapi.gob.bo', 'La Paz - Bolivia', 'SNP', 'X-SNP/', '/'),
(3, 'Instituto Boliviano de Metrologia', 'IBM', 'logo_ibmetro.png', 'Av. Camacho No. 1488 - Edificio Anexo', 1, 'Av. Camacho No. 1488 - Edificio Anexo - Telf.(591) 2+2372046 , (591) 2+2310037', 'La Paz - Bolivia', 'IBM', 'X-IBM/', '/'),
(4, 'Servicio Nacional de Verificacion de Exportaciones', 'SNV', 'logo_senavex.png', 'Av. Camacho Esq. Bueno Nº 1488, Ed. Viceministerio de Comercio Interno y Exportaciones Piso 5', 1, 'Av. Camacho Esq. Bueno NÂº 1488, Ed. Viceministerio de Comercio Interno y Exportaciones Piso 5 TelÃ©fonos (591-2) 2-113621 â€“ Fax (591-2) 2372055', 'La Paz - Bolivia', 'SNV', 'X-SNV/', '/'),
(5, 'PROBOLIVIA', 'PRB', 'logo_probolivia.png', 'Av. Camacho Ex. Refo Piso 4', 1, 'Av. Camacho Ex. Refo Piso 4 Telfs.: 2319973 - 2319974', 'La Paz - Bolivia', 'PRB', 'X-PRB/', '/'),
(6, 'PROMUEVE', 'PMV', 'logo_promueve.png', 'Av. Camacho NÂº 1448, esquina Bueno\r\nTelfs.: 2338084 - 2377179', 1, 'Av. Camacho NÂº 1448, esquina Bueno (Edif. Viceministerio de Comercio y Exportaciones, Piso 2)\r\nTelfs.: 2338084 - 2377179', 'La Paz - Bolivia', 'PMV', 'X-PMV/', '/'),
(7, 'Autoridad de Fiscalizacion y Control Social de Empresas', 'AEMP', 'logo_aemp.png', 'C. BatallÃ³n Colorados - Edif. "El Condor" No.24 Piso 11', 1, 'C. BatallÃ³n Colorados - Edif. "El Condor" No.24 Piso 11 Telfs: 2150000 - 2151212 - 2152118 - 2152119 - 2110779', 'La Paz - Bolivia', 'AEMP', 'X-AEMP/', '/'),
(8, 'Empresa Azucarera San Buenaventua', 'EASBA', 'logo_easba.png', 'Av. 6 de Agosto, Pasaje Caracas Nro. 871, entre Rosendo Gutierrez y Belisario Salinas', 1, 'Av. 6 de Agosto, Pasaje Caracas Nro. 871, entre Rosendo Gutierrez y Belisario Salinas TelÃ©fono: (591) 2-2145019', 'La Paz - Bolivia', 'ESB', 'X-ESB/', '/'),
(9, 'Empresa de Apoyo a la Produccion Alimentaria', 'EMAPA', 'logo_emapa.png', 'Calle  9 Calacoto Nº 7835  Zona Sur', 1, 'Calle  9 Calacoto NÂº 7835  Zona Sur TelÃ©fonos:(+ 591 2)   2115500 â€“ 2119162 â€“ 2112702 â€“ 2112728', 'La Paz - Bolivia', 'EMP', 'X-EMP/', '/'),
(10, 'Fideicomiso para el Financiamiento a Exportadores y a Proveedores de Bienes del Estado', 'feprobe', 'logo_feprobe.png', 'Av. Camacho Ex. Refo Piso 4', 1, 'Av. Camacho Ex. Refo Piso 4', 'La Paz - Bolivia', 'FPB', 'XFB/', 'FPB/'),
(11, 'Insumos Bolivia', 'INS', 'logo_insumos.png', 'DirecciÃ³n: Av. Mcal. Santa Cruz Edif. Hansa Piso 20', 1, 'DirecciÃ³n: Av. Mcal. Santa Cruz Edif. Hansa Piso 20 Telf.: 2408191', 'La Paz - Bolivia', 'INS', 'X-INS/', '/'),
(12, 'Zona Franca Comercial e Industrial de Cobija', 'ZFC', NULL, NULL, 1, 'La Paz - Bolivia', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entidades_oficinas`
--

CREATE TABLE IF NOT EXISTS `entidades_oficinas` (
  `id_entidad` int(11) NOT NULL DEFAULT '0',
  `id_oficina` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_entidad`,`id_oficina`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `entidades_oficinas`
--

INSERT INTO `entidades_oficinas` (`id_entidad`, `id_oficina`) VALUES
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(1, 17),
(1, 18),
(1, 19),
(1, 20),
(1, 21),
(1, 22),
(1, 23),
(1, 24),
(1, 25),
(1, 26),
(1, 27),
(1, 28),
(1, 29),
(1, 33),
(1, 36),
(1, 37),
(1, 48),
(1, 49),
(1, 50),
(1, 51),
(1, 79),
(1, 80),
(1, 81),
(1, 82),
(1, 83),
(1, 84),
(1, 85),
(1, 86),
(2, 38);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE IF NOT EXISTS `estados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `plural` varchar(100) DEFAULT NULL,
  `singular` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`id`, `estado`, `plural`, `singular`) VALUES
(1, 'No recibido', 'No recepcionada', 'No recepcionado'),
(2, 'Recibido/Acción pendiente', 'Pendiente', 'Pendiente oficial'),
(4, 'Recibido/Derivado', 'Derivada', NULL),
(6, 'Agrupado', 'Agrupada', 'Agrupado'),
(10, 'Archivado', 'Archivada', 'Archivado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupos`
--

CREATE TABLE IF NOT EXISTS `grupos` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `grupo` varchar(100) DEFAULT NULL,
  `activo` int(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT AUTO_INCREMENT=37 ;

--
-- Volcado de datos para la tabla `grupos`
--

INSERT INTO `grupos` (`id`, `grupo`, `activo`) VALUES
(1, 'ALCALDÍA', 1),
(2, 'BANCO', 1),
(3, 'BRIGADAS PARLAMENTARIAS', 1),
(4, 'CÃMARA DE DIPUTADOS', 1),
(5, 'CÃMARA DE SENADORES', 1),
(6, 'COMITÃ‰', 1),
(7, 'COMUNIDAD', 1),
(8, 'CONFEDERACION', 1),
(9, 'CONSEJO MUNICIPAL', 1),
(10, 'CONSTRUCTORA', 1),
(11, 'CONSULTORES', 1),
(12, 'CONTRALORÃA', 1),
(13, 'EMBAJADAS', 1),
(14, 'EMPRESA PRIVADA', 1),
(16, 'FEDERACIÃ“N', 1),
(17, 'FINANCIADORES', 1),
(18, 'FISCAL DE OBRA', 1),
(19, 'GOBIERNO MUNICIPAL', 1),
(20, 'INSTITUCION PUBLICA', 1),
(21, 'MINISTERIO', 1),
(22, 'MINISTERIO DE HACIENDA', 1),
(23, 'MOVIMIENTO SOCIAL', 1),
(24, 'ONG', 1),
(25, 'OTROS', 1),
(26, 'PERSONA PARTICULAR', 1),
(27, 'PREFECTURA', 1),
(28, 'PRESIDENCIA', 1),
(29, 'PUBLICIDAD', 1),
(30, 'SEGURO', 1),
(31, 'SEPCAM', 1),
(32, 'SINDICATO', 1),
(33, 'SNC', 1),
(34, 'SUPERVISORA', 1),
(35, 'VICEMINISTERIO', 1),
(36, 'VICEPRESIDENCIA', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hojasruta`
--

CREATE TABLE IF NOT EXISTS `hojasruta` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nur` varchar(25) NOT NULL COMMENT 'Nur Interno o Externo',
  `id_documento` int(10) unsigned NOT NULL,
  `id_seguimiento` int(11) NOT NULL DEFAULT '-1',
  `id_estado` int(11) NOT NULL DEFAULT '0',
  `fecha` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `id_user` varchar(50) DEFAULT NULL,
  `id_proceso` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`,`nur`,`id_documento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menus`
--

CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu` varchar(30) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `controlador` varchar(30) DEFAULT NULL,
  `index` int(11) DEFAULT '0',
  `logo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Volcado de datos para la tabla `menus`
--

INSERT INTO `menus` (`id`, `menu`, `descripcion`, `controlador`, `index`, `logo`) VALUES
(1, 'Inicio', 'Pagina principal', 'index', 1, 'media/images/32/home.png'),
(2, 'Bandeja', 'Correspondencia ', 'bandeja', 2, 'media/images/32/inbox.png'),
(3, 'Documentos', 'Mis Documentos', 'documento', 3, 'media/images/32/documents.png'),
(4, 'Reportes', 'Reportes Disp.', 'reportes', 6, 'media/images/32/chart-bar.png'),
(5, 'Despacho', 'Modulo para despacho', 'depacho', 7, 'media/images/32/document.png'),
(6, 'Seguimiento', 'Realizar seguimiento', 'seguimiento', 5, 'media/images/32/site-map.png'),
(7, 'Hojas de Ruta', 'Hojas de Ruta creados', 'hojaruta', 4, 'media/images/32/document-file.png'),
(8, 'Administrador', 'Menu Administrador', 'admin', 2, NULL),
(9, 'Recepci&oacute;n', 'Correspondencia', 'ventanilla', 2, NULL),
(10, 'Bandeja ', 'Salida', 'derivados', 3, NULL),
(11, 'Hojas de Ruta', 'Hojas de Ruta creados ', 'nurs', 4, NULL),
(12, 'Reportes', 'Reportes Ventanilla', 'reports', 6, NULL),
(13, 'User', 'Menu usuario', 'user', 7, NULL),
(14, 'Entidades', 'Lista de Entidades', 'admin/entidades', 2, NULL),
(15, 'Oficinas', 'Lista de Oficinas', 'admin/oficinas', 3, NULL),
(16, 'Inicio', 'Pagina Principal', 'admin', 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `motivos`
--

CREATE TABLE IF NOT EXISTS `motivos` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `motivo` varchar(100) DEFAULT NULL,
  `activo` int(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

--
-- Volcado de datos para la tabla `motivos`
--

INSERT INTO `motivos` (`id`, `motivo`, `activo`) VALUES
(1, 'ACLARACION', 1),
(2, 'AGRADECIMIENTO', 1),
(3, 'AUDIENCIA', 1),
(4, 'BOLETAS DE GARANTÃA', 1),
(5, 'CERTIFICADO DE PAGO', 1),
(6, 'COMUNICACION', 1),
(7, 'CONOCIMIENTO', 1),
(8, 'CONVOCATORIA', 1),
(9, 'DENUNCIA', 1),
(10, 'ENTREGA DE DOCUMENTACIÓN RESPALDATORIA', 1),
(11, 'FACTURA', 1),
(12, 'IMPUGNACION', 1),
(13, 'INFORME', 1),
(14, 'INVITACIÓN', 1),
(16, 'LEGALIZACIÓN', 1),
(17, 'OBSERVACIÓN', 1),
(18, 'OFERTA', 1),
(19, 'OTROS', 1),
(20, 'PETICIÓN', 1),
(22, 'PROPAGANDA', 1),
(23, 'RECLAMO', 1),
(24, 'REITERACION', 1),
(25, 'REQUERIMIENTO', 1),
(26, 'RESOLUCIÓN EXTERNA', 1),
(27, 'RESPUESTA A CARTAS', 1),
(29, 'REUNIÓN', 1),
(30, 'SOLICITUD', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `niveles`
--

CREATE TABLE IF NOT EXISTS `niveles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nivel` varchar(30) NOT NULL DEFAULT '0',
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`nivel`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=113 ;

--
-- Volcado de datos para la tabla `niveles`
--

INSERT INTO `niveles` (`id`, `nivel`, `descripcion`) VALUES
(1, 'Administrador', 'Adminstrador del sistema'),
(2, 'Usuario', 'Usuario comun'),
(3, 'Jefe de Oficina', 'Director, Jefe de Unidad, Encargado'),
(4, 'Ventanilla', 'Ventanilla'),
(5, 'Despacho', 'Ministro(a)'),
(16, 'Administrador pyv', 'Administrador de Pasajes y viaticos'),
(17, 'Usuario pyv', 'Usuario comun de Pasajes y viaticos'),
(18, 'Enlace Adm', 'Enlace Administrativo'),
(19, 'Inmediato Superior', 'Inmediato Superior'),
(110, 'Responsable pyv', 'Responsable de Pasajes y Viaticos'),
(111, 'Responsable poa', 'Responsable de POA'),
(112, 'Responsable ppto', 'Responsable de Presupuesto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nivelmenu`
--

CREATE TABLE IF NOT EXISTS `nivelmenu` (
  `id_nivel` int(11) NOT NULL DEFAULT '0',
  `id_menu` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_nivel`,`id_menu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `nivelmenu`
--

INSERT INTO `nivelmenu` (`id_nivel`, `id_menu`) VALUES
(1, 1),
(1, 8),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 6),
(2, 7),
(2, 17),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(3, 6),
(3, 7),
(4, 1),
(4, 2),
(4, 6),
(4, 9),
(4, 11),
(4, 12),
(5, 14),
(5, 15),
(5, 16),
(7, 18),
(7, 26),
(8, 18),
(8, 19),
(8, 26),
(9, 18),
(9, 20),
(9, 26),
(10, 18),
(10, 21),
(10, 26),
(11, 18),
(11, 22),
(11, 26),
(12, 18),
(12, 23),
(12, 26),
(13, 18),
(13, 24),
(13, 26);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nurs`
--

CREATE TABLE IF NOT EXISTS `nurs` (
  `nur` varchar(25) NOT NULL DEFAULT '0',
  `id_user` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `username` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`nur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `nurs`
--

INSERT INTO `nurs` (`nur`, `id_user`, `fecha_creacion`, `username`) VALUES
('E-IBM/2013-00010', 24, '2013-03-19 17:15:39', 'Jose Luis'),
('E-IBM/2013-00011', 24, '2013-03-19 17:20:07', 'Jose Luis'),
('E-IBM/2013-00012', 24, '2013-03-20 10:15:16', 'Jose Luis'),
('E-IBM/2013-00013', 24, '2013-03-20 10:17:09', 'Jose Luis'),
('IBM/2013-00001', 21, '2013-02-19 11:16:33', 'Jose María'),
('IBM/2013-00002', 21, '2013-02-19 11:49:55', 'Jose María'),
('IBM/2013-00003', 21, '2013-02-19 12:21:11', 'Jose María'),
('IBM/2013-00004', 22, '2013-02-20 09:23:06', 'Maria Fernanda'),
('IBM/2013-00005', 22, '2013-02-20 09:25:58', 'Maria Fernanda'),
('IBM/2013-00006', 24, '2013-02-05 16:43:33', 'Jose Luis'),
('IBM/2013-00007', 22, '2013-02-20 12:23:59', 'Maria Fernanda'),
('IBM/2013-00008', 24, '2013-02-10 16:56:16', 'Jose Luis'),
('IBM/2013-00009', 21, '2013-02-03 16:58:39', 'Jose María'),
('IBM/2013-00010', 21, '2013-02-01 17:18:45', 'Jose María'),
('MDPyEP/2013-0000', 2, '2013-01-28 17:05:17', 'Antonio Garcia M.'),
('MDPyEP/2013-00004', 2, '2013-01-30 11:23:59', 'Antonio Garcia M.'),
('MDPyEP/2013-00005', 4, '2013-01-30 11:43:46', 'Jhilda Murillo Zarate'),
('MDPyEP/2013-00006', 4, '2013-01-30 11:49:21', 'Jhilda Murillo Zarate'),
('MDPyEP/2013-00008', 4, '2013-02-04 17:44:18', 'Jhilda Murillo Zarate'),
('MDPyEP/2013-00010', 4, '2013-02-15 16:10:39', 'Jhilda Murillo Zarate'),
('MDPyEP/2013-00011', 37, '2013-06-04 02:50:16', 'Juan Carlos Chavez Iporre'),
('MDPyEP/2013-00016', 35, '2013-06-04 04:38:28', 'Walter Erick Quevedo Flores'),
('MDPyEP/2013-00017', 35, '2013-06-04 04:44:45', 'Walter Erick Quevedo Flores'),
('MDPyEP/2013-00018', 35, '2013-06-04 04:56:44', 'Walter Erick Quevedo Flores'),
('MDPyEP/2013-00019', 35, '2013-06-04 05:00:03', 'Walter Erick Quevedo Flores'),
('MDPyEP/2013-00023', 35, '2013-06-04 05:04:37', 'Walter Erick Quevedo Flores'),
('MDPyEP/2013-00026', 35, '2013-06-04 05:14:02', 'Walter Erick Quevedo Flores'),
('MDPyEP/2013-00029', 35, '2013-06-04 05:17:30', 'Walter Erick Quevedo Flores'),
('MDPyEP/2013-00031', 35, '2013-06-04 05:28:18', 'Walter Erick Quevedo Flores'),
('MDPyEP/2013-00032', 35, '2013-06-04 05:52:17', 'Walter Erick Quevedo Flores'),
('MDPyEP/2013-00033', 35, '2013-06-04 06:11:33', 'Walter Erick Quevedo Flores'),
('MDPyEP/2013-00034', 35, '2013-06-04 15:20:39', 'Walter Erick Quevedo Flores'),
('MDPyEP/2013-00035', 36, '2013-06-17 09:01:11', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00038', 36, '2013-06-17 11:55:37', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00039', 36, '2013-06-17 12:17:15', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00040', 36, '2013-06-17 12:21:06', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00042', 36, '2013-06-17 12:39:12', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00043', 36, '2013-06-17 15:10:37', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00044', 36, '2013-06-17 15:20:00', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00045', 36, '2013-06-17 16:13:13', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00046', 36, '2013-06-17 16:14:57', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00051', 36, '2013-06-17 16:22:55', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00052', 36, '2013-06-17 16:23:39', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00053', 36, '2013-06-17 16:29:24', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00055', 36, '2013-06-17 16:41:25', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00056', 36, '2013-06-17 16:41:56', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00059', 36, '2013-06-17 17:37:15', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00060', 36, '2013-06-17 17:38:15', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00061', 36, '2013-06-17 17:39:36', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00062', 36, '2013-06-17 17:41:22', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00063', 36, '2013-06-17 17:42:46', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00064', 36, '2013-06-17 17:43:07', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00065', 36, '2013-06-17 17:43:55', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00066', 36, '2013-06-17 17:44:03', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00067', 36, '2013-06-17 17:46:52', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00068', 36, '2013-06-17 17:48:41', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00069', 36, '2013-06-17 17:50:02', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00070', 36, '2013-06-17 17:51:59', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00071', 36, '2013-06-17 17:52:31', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00072', 36, '2013-06-17 17:55:30', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00073', 36, '2013-06-17 17:56:01', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00074', 36, '2013-06-17 17:59:46', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00075', 36, '2013-06-17 18:00:16', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00076', 36, '2013-06-17 18:03:41', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00077', 36, '2013-06-17 18:04:02', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00078', 36, '2013-06-17 18:04:48', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00079', 36, '2013-06-17 18:05:02', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00080', 36, '2013-06-17 18:06:09', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00081', 36, '2013-06-17 18:06:41', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00082', 36, '2013-06-17 18:07:00', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00083', 36, '2013-06-17 18:11:56', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00084', 36, '2013-06-17 18:12:56', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00085', 36, '2013-06-17 18:13:28', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00086', 36, '2013-06-17 18:14:03', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00087', 36, '2013-06-17 18:14:14', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00088', 36, '2013-06-17 18:15:07', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00089', 36, '2013-06-17 18:16:09', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00090', 36, '2013-06-17 18:20:31', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00091', 36, '2013-06-17 18:20:53', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00092', 36, '2013-06-17 18:21:34', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00093', 36, '2013-06-17 18:22:25', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00094', 36, '2013-06-17 18:24:51', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00095', 36, '2013-06-17 18:25:02', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00096', 36, '2013-06-17 18:25:27', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00097', 36, '2013-06-17 18:25:32', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00098', 36, '2013-06-17 18:26:46', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00099', 36, '2013-06-17 18:28:00', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00100', 36, '2013-06-17 18:28:52', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00101', 36, '2013-06-17 18:29:28', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00102', 36, '2013-06-17 18:30:03', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00103', 36, '2013-06-17 18:30:44', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00104', 36, '2013-06-17 18:31:08', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00105', 36, '2013-06-17 18:31:36', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00106', 36, '2013-06-17 18:32:41', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00107', 36, '2013-06-17 18:33:21', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00108', 36, '2013-06-17 18:34:44', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00109', 36, '2013-06-17 18:35:16', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00110', 36, '2013-06-17 18:35:21', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00111', 36, '2013-06-17 18:37:36', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00112', 36, '2013-06-17 18:38:20', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00113', 36, '2013-06-17 18:39:56', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00114', 36, '2013-06-17 18:40:03', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00115', 36, '2013-06-17 18:40:31', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00116', 36, '2013-06-17 18:41:30', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00117', 36, '2013-06-17 18:47:48', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00118', 36, '2013-06-18 08:47:50', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00119', 36, '2013-06-18 08:49:29', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00120', 36, '2013-06-18 08:52:18', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00121', 36, '2013-06-18 08:54:33', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00122', 36, '2013-06-18 08:57:08', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00123', 36, '2013-06-18 08:57:55', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00124', 36, '2013-06-18 08:58:56', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00125', 36, '2013-06-18 09:00:10', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00126', 36, '2013-06-18 09:00:49', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00127', 36, '2013-06-18 09:01:21', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00128', 36, '2013-06-18 09:02:40', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00129', 36, '2013-06-18 09:05:16', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00130', 36, '2013-06-18 09:08:22', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00131', 36, '2013-06-18 09:08:36', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00132', 36, '2013-06-18 09:11:14', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00133', 36, '2013-06-18 09:11:19', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00134', 36, '2013-06-18 09:12:27', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00135', 36, '2013-06-18 09:12:33', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00136', 36, '2013-06-18 09:12:52', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00137', 36, '2013-06-18 09:12:56', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00138', 36, '2013-06-18 09:13:32', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00139', 36, '2013-06-18 09:13:36', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00140', 36, '2013-06-18 09:13:39', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00141', 36, '2013-06-18 09:13:43', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00142', 36, '2013-06-18 09:14:45', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00143', 36, '2013-06-18 09:14:50', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00144', 36, '2013-06-18 09:14:53', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00145', 36, '2013-06-18 09:14:57', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00146', 36, '2013-06-18 09:15:30', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00147', 36, '2013-06-18 09:15:35', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00148', 36, '2013-06-18 09:15:39', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00149', 36, '2013-06-18 09:15:51', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00150', 36, '2013-06-18 09:16:15', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00151', 36, '2013-06-18 09:16:21', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00152', 36, '2013-06-18 09:16:37', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00153', 36, '2013-06-18 09:17:09', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00154', 36, '2013-06-18 09:18:17', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00155', 36, '2013-06-18 09:18:23', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00156', 36, '2013-06-18 09:19:58', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00157', 36, '2013-06-18 09:20:09', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00158', 36, '2013-06-18 09:57:31', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00159', 36, '2013-06-18 09:57:37', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00160', 36, '2013-06-18 09:59:44', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00161', 36, '2013-06-18 09:59:51', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00162', 36, '2013-06-18 10:02:54', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00163', 36, '2013-06-18 10:03:03', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00164', 36, '2013-06-18 10:03:08', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00165', 36, '2013-06-18 10:03:16', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00166', 36, '2013-06-18 10:03:25', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00167', 36, '2013-06-18 10:06:49', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00168', 36, '2013-06-18 10:06:58', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00169', 36, '2013-06-18 10:07:04', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00170', 36, '2013-06-18 10:07:07', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00171', 36, '2013-06-18 10:07:16', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00172', 36, '2013-06-18 10:11:31', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00175', 36, '2013-06-18 11:09:59', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00176', 36, '2013-06-18 11:11:06', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00177', 36, '2013-06-18 11:11:15', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00178', 36, '2013-06-18 11:11:19', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00179', 36, '2013-06-18 11:11:25', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00180', 36, '2013-06-18 11:13:09', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00181', 36, '2013-06-18 11:13:15', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00182', 36, '2013-06-18 11:13:19', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00183', 36, '2013-06-18 11:19:20', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00184', 36, '2013-06-18 11:19:27', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00185', 36, '2013-06-18 11:19:45', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00186', 36, '2013-06-18 11:19:55', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00187', 36, '2013-06-18 11:20:00', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00188', 36, '2013-06-18 11:20:30', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00189', 36, '2013-06-18 11:21:22', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00190', 36, '2013-06-18 11:21:28', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00191', 36, '2013-06-18 11:22:25', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00192', 36, '2013-06-18 11:25:55', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00193', 36, '2013-06-18 11:32:11', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00194', 36, '2013-06-18 12:32:15', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00204', 36, '2013-06-18 15:30:19', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00205', 36, '2013-06-18 15:30:32', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00206', 36, '2013-06-18 15:31:38', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00207', 36, '2013-06-18 15:31:43', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00208', 36, '2013-06-18 16:09:42', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00209', 36, '2013-06-18 16:23:41', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00210', 36, '2013-06-19 10:06:31', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00211', 36, '2013-06-19 10:07:07', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00212', 36, '2013-06-19 11:23:15', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00213', 36, '2013-06-19 11:25:57', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00214', 36, '2013-06-19 15:49:11', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00215', 36, '2013-06-20 19:13:09', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00216', 36, '2013-06-24 18:33:53', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00244', 36, '2013-06-27 11:58:35', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00245', 36, '2013-06-27 12:05:15', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00246', 36, '2013-06-27 12:14:18', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00247', 27, '2013-06-27 12:27:08', 'Romina Medina Santy'),
('MDPyEP/2013-00248', 27, '2013-06-27 13:58:55', 'Romina Medina Santy'),
('MDPyEP/2013-00249', 27, '2013-06-27 13:59:13', 'Romina Medina Santy'),
('MDPyEP/2013-00250', 27, '2013-06-27 13:59:28', 'Romina Medina Santy'),
('MDPyEP/2013-00251', 27, '2013-06-27 13:59:42', 'Romina Medina Santy'),
('MDPyEP/2013-00252', 27, '2013-06-27 14:01:51', 'Romina Medina Santy'),
('MDPyEP/2013-00253', 27, '2013-06-27 14:04:06', 'Romina Medina Santy'),
('MDPyEP/2013-00254', 27, '2013-06-27 14:06:11', 'Romina Medina Santy'),
('MDPyEP/2013-00255', 27, '2013-06-27 14:10:38', 'Romina Medina Santy'),
('MDPyEP/2013-00256', 27, '2013-06-27 14:54:58', 'Romina Medina Santy'),
('MDPyEP/2013-00257', 32, '2013-06-27 15:22:57', 'Ariel Zabala David'),
('MDPyEP/2013-00258', 33, '2013-06-27 16:21:33', 'Rosario Jimena Tellez Quenallata'),
('MDPyEP/2013-00261', 33, '2013-06-28 01:20:52', 'Rosario Jimena Tellez Quenallata'),
('MDPyEP/2013-00262', 36, '2013-06-28 12:48:24', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00263', 36, '2013-06-28 12:49:26', 'Maria Elena Alfaro Castillo'),
('MDPyEP/2013-00264', 36, '2013-06-28 12:56:19', 'Maria Elena Alfaro Castillo'),
('SNP/2013-00001', 7, '2013-01-30 14:33:43', 'Carlos Ponce'),
('SNP/2013-00002', 7, '2013-01-30 15:03:07', 'Carlos Ponce'),
('SNP/2013-00003', 7, '2013-01-30 16:35:11', 'Carlos Ponce'),
('SNP/2013-00004', 7, '2013-02-08 11:41:34', 'Carlos Ponce'),
('ZFC/2013-00001', 15, '2013-02-19 17:36:58', 'Juan Carlos'),
('ZFC/2013-00002', 15, '2013-02-19 17:44:43', 'Juan Carlos'),
('ZFC/2013-00003', 15, '2013-02-20 09:03:06', 'Juan Carlos'),
('ZFC/2013-00004', 15, '2013-02-20 09:05:22', 'Juan Carlos'),
('ZFC/2013-00005', 15, '2013-02-20 09:08:44', 'Juan Carlos'),
('ZFC/2013-00006', 15, '2013-02-20 09:12:57', 'Juan Carlos'),
('ZFC/2013-00009', 16, '2013-02-20 12:28:32', 'Karla Patricia'),
('ZFC/2013-00010', 14, '2013-02-20 16:32:08', 'Luis Fernando'),
('ZFC/2013-00014', 15, '2013-02-20 18:05:42', 'Juan Carlos'),
('ZFC/2013-00017', 17, '2013-02-21 08:58:16', 'Juan Perez'),
('ZFC/2013-00018', 16, '2013-02-21 09:11:16', 'Karla Patricia'),
('ZFC/2013-00019', 15, '2013-02-21 09:23:39', 'Juan Carlos'),
('ZFC/2013-00020', 14, '2013-02-21 09:29:02', 'Luis Fernando'),
('ZFC/2013-00021', 16, '2013-02-21 09:42:30', 'Karla Patricia'),
('ZFC/2013-00022', 14, '2013-02-21 10:23:33', 'Luis Fernando'),
('ZFC/2013-00023', 14, '2013-03-21 09:46:55', 'Luis Fernando'),
('ZFC/2013-00024', 14, '2013-03-21 09:48:16', 'Luis Fernando');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nurs_documentos`
--

CREATE TABLE IF NOT EXISTS `nurs_documentos` (
  `nur` varchar(25) NOT NULL DEFAULT '0',
  `id_documento` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`nur`,`id_documento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `nurs_documentos`
--

INSERT INTO `nurs_documentos` (`nur`, `id_documento`) VALUES
('E-IBM/2013-00010', 56),
('E-IBM/2013-00011', 58),
('E-IBM/2013-00012', 59),
('E-IBM/2013-00013', 60),
('IBM/2013-00001', 17),
('IBM/2013-00002', 18),
('IBM/2013-00003', 19),
('IBM/2013-00004', 26),
('IBM/2013-00005', 27),
('IBM/2013-00005', 28),
('IBM/2013-00006', 51),
('IBM/2013-00007', 31),
('IBM/2013-00008', 53),
('IBM/2013-00009', 54),
('IBM/2013-00010', 57),
('MDPyEP/2013-0000', 1),
('MDPyEP/2013-00004', 6),
('MDPyEP/2013-00005', 7),
('MDPyEP/2013-00005', 9),
('MDPyEP/2013-00006', 8),
('MDPyEP/2013-00008', 13),
('MDPyEP/2013-00010', 16),
('MDPyEP/2013-00011', 68),
('MDPyEP/2013-00011', 69),
('MDPyEP/2013-00011', 70),
('MDPyEP/2013-00016', 71),
('MDPyEP/2013-00017', 72),
('MDPyEP/2013-00018', 73),
('MDPyEP/2013-00019', 74),
('MDPyEP/2013-00023', 78),
('MDPyEP/2013-00026', 81),
('MDPyEP/2013-00029', 83),
('MDPyEP/2013-00031', 85),
('MDPyEP/2013-00032', 86),
('MDPyEP/2013-00033', 87),
('MDPyEP/2013-00034', 88),
('MDPyEP/2013-00035', 89),
('MDPyEP/2013-00038', 90),
('MDPyEP/2013-00039', 93),
('MDPyEP/2013-00040', 94),
('MDPyEP/2013-00042', 95),
('MDPyEP/2013-00043', 96),
('MDPyEP/2013-00044', 97),
('MDPyEP/2013-00045', 98),
('MDPyEP/2013-00046', 99),
('MDPyEP/2013-00051', 100),
('MDPyEP/2013-00052', 101),
('MDPyEP/2013-00053', 102),
('MDPyEP/2013-00055', 103),
('MDPyEP/2013-00056', 104),
('MDPyEP/2013-00059', 105),
('MDPyEP/2013-00060', 106),
('MDPyEP/2013-00061', 107),
('MDPyEP/2013-00062', 108),
('MDPyEP/2013-00063', 109),
('MDPyEP/2013-00064', 110),
('MDPyEP/2013-00065', 111),
('MDPyEP/2013-00066', 112),
('MDPyEP/2013-00067', 113),
('MDPyEP/2013-00068', 114),
('MDPyEP/2013-00069', 115),
('MDPyEP/2013-00070', 116),
('MDPyEP/2013-00071', 117),
('MDPyEP/2013-00072', 118),
('MDPyEP/2013-00073', 119),
('MDPyEP/2013-00074', 120),
('MDPyEP/2013-00075', 121),
('MDPyEP/2013-00076', 122),
('MDPyEP/2013-00077', 123),
('MDPyEP/2013-00078', 124),
('MDPyEP/2013-00079', 125),
('MDPyEP/2013-00080', 126),
('MDPyEP/2013-00081', 127),
('MDPyEP/2013-00082', 128),
('MDPyEP/2013-00083', 129),
('MDPyEP/2013-00084', 130),
('MDPyEP/2013-00085', 131),
('MDPyEP/2013-00086', 132),
('MDPyEP/2013-00087', 133),
('MDPyEP/2013-00088', 134),
('MDPyEP/2013-00089', 135),
('MDPyEP/2013-00090', 136),
('MDPyEP/2013-00091', 137),
('MDPyEP/2013-00092', 138),
('MDPyEP/2013-00093', 139),
('MDPyEP/2013-00094', 140),
('MDPyEP/2013-00095', 141),
('MDPyEP/2013-00096', 142),
('MDPyEP/2013-00097', 143),
('MDPyEP/2013-00098', 144),
('MDPyEP/2013-00099', 145),
('MDPyEP/2013-00100', 146),
('MDPyEP/2013-00101', 147),
('MDPyEP/2013-00102', 148),
('MDPyEP/2013-00103', 149),
('MDPyEP/2013-00104', 150),
('MDPyEP/2013-00105', 151),
('MDPyEP/2013-00106', 152),
('MDPyEP/2013-00107', 153),
('MDPyEP/2013-00108', 154),
('MDPyEP/2013-00109', 155),
('MDPyEP/2013-00110', 156),
('MDPyEP/2013-00111', 157),
('MDPyEP/2013-00112', 158),
('MDPyEP/2013-00113', 159),
('MDPyEP/2013-00114', 160),
('MDPyEP/2013-00115', 161),
('MDPyEP/2013-00116', 162),
('MDPyEP/2013-00117', 163),
('MDPyEP/2013-00118', 164),
('MDPyEP/2013-00119', 165),
('MDPyEP/2013-00120', 166),
('MDPyEP/2013-00121', 167),
('MDPyEP/2013-00122', 168),
('MDPyEP/2013-00123', 169),
('MDPyEP/2013-00124', 170),
('MDPyEP/2013-00125', 171),
('MDPyEP/2013-00126', 172),
('MDPyEP/2013-00127', 173),
('MDPyEP/2013-00128', 174),
('MDPyEP/2013-00129', 175),
('MDPyEP/2013-00130', 176),
('MDPyEP/2013-00131', 177),
('MDPyEP/2013-00132', 178),
('MDPyEP/2013-00133', 179),
('MDPyEP/2013-00134', 180),
('MDPyEP/2013-00135', 181),
('MDPyEP/2013-00136', 182),
('MDPyEP/2013-00137', 183),
('MDPyEP/2013-00138', 184),
('MDPyEP/2013-00139', 185),
('MDPyEP/2013-00140', 186),
('MDPyEP/2013-00141', 187),
('MDPyEP/2013-00142', 188),
('MDPyEP/2013-00143', 189),
('MDPyEP/2013-00144', 190),
('MDPyEP/2013-00145', 191),
('MDPyEP/2013-00146', 192),
('MDPyEP/2013-00147', 193),
('MDPyEP/2013-00148', 194),
('MDPyEP/2013-00149', 195),
('MDPyEP/2013-00150', 196),
('MDPyEP/2013-00151', 197),
('MDPyEP/2013-00152', 198),
('MDPyEP/2013-00153', 199),
('MDPyEP/2013-00154', 200),
('MDPyEP/2013-00155', 201),
('MDPyEP/2013-00156', 202),
('MDPyEP/2013-00157', 203),
('MDPyEP/2013-00158', 204),
('MDPyEP/2013-00159', 205),
('MDPyEP/2013-00160', 206),
('MDPyEP/2013-00161', 207),
('MDPyEP/2013-00162', 208),
('MDPyEP/2013-00163', 209),
('MDPyEP/2013-00164', 210),
('MDPyEP/2013-00165', 211),
('MDPyEP/2013-00166', 212),
('MDPyEP/2013-00167', 213),
('MDPyEP/2013-00168', 214),
('MDPyEP/2013-00169', 215),
('MDPyEP/2013-00170', 216),
('MDPyEP/2013-00171', 217),
('MDPyEP/2013-00172', 218),
('MDPyEP/2013-00175', 219),
('MDPyEP/2013-00176', 220),
('MDPyEP/2013-00177', 221),
('MDPyEP/2013-00178', 222),
('MDPyEP/2013-00179', 223),
('MDPyEP/2013-00180', 224),
('MDPyEP/2013-00181', 225),
('MDPyEP/2013-00182', 226),
('MDPyEP/2013-00183', 227),
('MDPyEP/2013-00184', 228),
('MDPyEP/2013-00185', 229),
('MDPyEP/2013-00186', 230),
('MDPyEP/2013-00187', 231),
('MDPyEP/2013-00188', 232),
('MDPyEP/2013-00189', 233),
('MDPyEP/2013-00190', 234),
('MDPyEP/2013-00191', 235),
('MDPyEP/2013-00192', 236),
('MDPyEP/2013-00193', 237),
('MDPyEP/2013-00194', 238),
('MDPyEP/2013-00204', 239),
('MDPyEP/2013-00205', 240),
('MDPyEP/2013-00206', 241),
('MDPyEP/2013-00207', 242),
('MDPyEP/2013-00208', 243),
('MDPyEP/2013-00209', 244),
('MDPyEP/2013-00210', 245),
('MDPyEP/2013-00211', 246),
('MDPyEP/2013-00212', 247),
('MDPyEP/2013-00213', 248),
('MDPyEP/2013-00214', 249),
('MDPyEP/2013-00215', 250),
('MDPyEP/2013-00216', 251),
('MDPyEP/2013-00244', 1),
('MDPyEP/2013-00245', 1),
('MDPyEP/2013-00246', 1),
('MDPyEP/2013-00247', 259),
('MDPyEP/2013-00248', 260),
('MDPyEP/2013-00249', 261),
('MDPyEP/2013-00250', 262),
('MDPyEP/2013-00251', 263),
('MDPyEP/2013-00252', 264),
('MDPyEP/2013-00253', 265),
('MDPyEP/2013-00254', 266),
('MDPyEP/2013-00255', 267),
('MDPyEP/2013-00256', 268),
('MDPyEP/2013-00257', 269),
('MDPyEP/2013-00257', 271),
('MDPyEP/2013-00257', 272),
('MDPyEP/2013-00258', 270),
('MDPyEP/2013-00261', 273),
('MDPyEP/2013-00262', 274),
('MDPyEP/2013-00263', 275),
('MDPyEP/2013-00264', 276),
('SNP/2013-00001', 10),
('SNP/2013-00002', 11),
('SNP/2013-00002', 14),
('SNP/2013-00003', 12),
('SNP/2013-00004', 15),
('ZFC/2013-00001', 20),
('ZFC/2013-00002', 21),
('ZFC/2013-00003', 22),
('ZFC/2013-00003', 67),
('ZFC/2013-00004', 23),
('ZFC/2013-00004', 29),
('ZFC/2013-00004', 30),
('ZFC/2013-00005', 24),
('ZFC/2013-00006', 25),
('ZFC/2013-00009', 32),
('ZFC/2013-00010', 33),
('ZFC/2013-00010', 34),
('ZFC/2013-00010', 35),
('ZFC/2013-00010', 36),
('ZFC/2013-00010', 38),
('ZFC/2013-00010', 39),
('ZFC/2013-00014', 37),
('ZFC/2013-00017', 40),
('ZFC/2013-00018', 41),
('ZFC/2013-00018', 63),
('ZFC/2013-00018', 64),
('ZFC/2013-00018', 65),
('ZFC/2013-00018', 66),
('ZFC/2013-00019', 42),
('ZFC/2013-00020', 43),
('ZFC/2013-00021', 44),
('ZFC/2013-00022', 45),
('ZFC/2013-00023', 61),
('ZFC/2013-00024', 62);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oficinas`
--

CREATE TABLE IF NOT EXISTS `oficinas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `padre` int(2) DEFAULT NULL,
  `oficina` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `sigla` varchar(100) NOT NULL DEFAULT '',
  `prioridad` int(2) DEFAULT '0',
  `id_entidad` int(11) NOT NULL,
  PRIMARY KEY (`id`,`sigla`),
  UNIQUE KEY `sigla` (`sigla`),
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=121 ;

--
-- Volcado de datos para la tabla `oficinas`
--

INSERT INTO `oficinas` (`id`, `padre`, `oficina`, `sigla`, `prioridad`, `id_entidad`) VALUES
(48, 0, 'Ventanilla', 'FPB', 0, 2),
(49, 48, 'Certificación Unidad Productiva', 'FPB/UP', 0, 10),
(50, 48, 'Certificación de Cumplimiento de  Contrato', 'FPB/CC', 0, 10),
(51, 48, 'Certificación de Tipo de Organización', 'FPB/TO', 0, 10),
(79, 0, 'DIRECCION GENERAL EJECUTIVA', 'SNP/DGE', 0, 2),
(80, 79, 'DIRECCION DE ADMINISTRACION FINANCIERO', 'SNP/DGE/DAF', 0, 2),
(81, 79, 'DIRECCION DE ASUNTOS JURIDICOS', 'SNP/DGE/DAJ', 0, 2),
(82, 79, 'DIRECCION DE PROPIEDAD INDUSTRIAL', ' SNP/DGE/DPI', 0, 2),
(83, 79, 'DIRECCION DE DERECHOS DE AUTOR Y DERECHOS CONEXOS', ' SNP/DGE/DDADC', 0, 2),
(84, 79, 'AREA DE AUDITORIA INTERNA', ' SNP/DGE/AI', 0, 2),
(85, 79, 'AREA DE COMUNICACION Y TRANSPARENCIA', ' SNP/DGE/ACT', 0, 2),
(86, 79, 'AREA DE SISTEMAS', ' SNP/DGE/SIS', 0, 2),
(87, 79, 'REGIONAL COCHABAMBA', ' SNP/DGE/RC', 0, 2),
(88, 79, 'REGIONAL SANTA CRUZ', ' SNP/DGE/RSC', 0, 2),
(89, 79, 'REGIONAL EL ALTO', ' SNP/DGE/REA', 0, 2),
(90, 80, 'AREA DE SABS', ' SNP/DGE/DAF/AS', 0, 2),
(91, 80, 'AREA DE POA Y PRESUPUESTO', ' SNP/DGE/DAF/APP', 0, 2),
(92, 80, 'AREA DE CONTABILIDAD Y TESORERIA', ' SNP/DGE/DAF/ACT', 0, 2),
(93, 80, 'AREA DE RECURSOS HUMANOS', ' SNP/DGE/DAF/RRHH', 0, 2),
(94, 81, 'AREA DE INFRACCIONES', '  SNP/DGE/DAJ/AI', 0, 2),
(95, 81, 'AREA DE ASUNTOS ADMINISTRATIVOS', '  SNP/DGE/DAJ/AAA', 0, 2),
(96, 82, 'AREA DE SIGNOS DISTINTIVOS', '  SNP/DGE/DPI/ASD', 0, 2),
(97, 81, 'AREA DE MODIFICACIONES DE SIGNOS DISTINTIVOS', '  SNP/DGE/DAJ/AMSD', 0, 2),
(98, 81, 'AREA DE OPOSICIONES', '  SNP/DGE/DAJ/AO', 0, 2),
(99, 81, 'AREA DE PATENTES', '  SNP/DGE/DAJ/AP', 0, 2),
(100, 0, 'ZONA FRANCA COMERCIAL', 'ZFC/ZOFRACOBIJA', 0, 12),
(101, 100, 'UNIDAD DE AUDITORIA INTERNA', 'ZFC/UAI', 0, 12),
(102, 0, 'DIRECCION GENERAL EJECUTIVA', 'IBM/DGE', 0, 3),
(103, 102, 'REGIONAL COCHABAMBA', 'IBM/RCBBA', 0, 3),
(104, 0, 'DESPACHO', 'DSP', 0, 1),
(105, 104, 'UNIDAD DE TRANSPARENCIA', 'UT', 0, 1),
(106, 104, 'UNIDAD DE COMUNICACION SOCIAL', 'UC', 0, 1),
(107, 104, 'UNIDAD DE AUDITORIA INTERNA', 'UAI', 0, 1),
(108, 104, 'DIRECCION GENERAL DE ASUNTOS ADMINISTRATIVOS', 'DGAA', 0, 1),
(109, 104, 'DIRECCION GENERAL DE PLANIFICACION', 'DGP', 0, 1),
(110, 104, 'DIRECCION GENERAL DE ASUNTOS JURIDICOS', 'DGAJ', 0, 1),
(111, 104, 'VICEMINISTERIO DE LA MICRO Y PEQUEÑA EMPRESA', 'VMPE', 0, 1),
(112, 104, 'VICEMINISTERIO DE PRODUCCION INDUSTRIAL A MEDIANA Y GRAN ESCALA', 'VPIMGE', 0, 1),
(113, 104, 'VICEMINISTERIO DE COMERCIO INTERNO Y EXPORTACIONES', 'VCIE', 0, 1),
(114, 108, 'UNIDAD FINANCIERA', ' DGAA/UF', 0, 1),
(115, 108, 'UNIDAD DE ADMINISTRACION', ' DGAA/UA', 0, 1),
(116, 108, 'UNIDAD DE RECURSOS HUMANOS', ' DGAA/URH', 0, 1),
(117, 109, 'UNIDAD DE ASESORAMIENTO PRODUCTIVO', ' PGP/UDAPRO', 0, 1),
(118, 110, 'UNIDAD DE GESTION JURIDICA', ' DGAJ/UGJ', 0, 1),
(119, 110, 'UNIDAD DE ANALISIS JURIDICO', ' DGAJ/UAJ', 0, 1),
(120, 110, 'UNIDAD DE DESARROLLO NORMATIVO', ' DGAJ/UDN', 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `procesos`
--

CREATE TABLE IF NOT EXISTS `procesos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `proceso` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Volcado de datos para la tabla `procesos`
--

INSERT INTO `procesos` (`id`, `proceso`) VALUES
(1, 'Certificado de Pago'),
(2, 'Adquisición'),
(3, 'Petición de informe'),
(4, 'Varios'),
(5, 'Solicitud'),
(6, 'Certificacion Presupuestaria'),
(7, 'Elaboracion Contratos'),
(8, 'Enmiendas'),
(9, 'Orden de Cambio'),
(10, 'Reclamo'),
(11, 'Registro Aportes locales'),
(12, 'Solicitud de Desembolso'),
(13, 'Cuotas de Inversión'),
(14, 'Informe'),
(15, 'Certificacion FEPROBE'),
(16, 'Certificacion de Equivalencia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `procesosx`
--

CREATE TABLE IF NOT EXISTS `procesosx` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `proceso` varchar(100) DEFAULT NULL,
  `activo` int(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `procesosx`
--

INSERT INTO `procesosx` (`id`, `proceso`, `activo`) VALUES
(1, 'CD: SOLICITUD DE CAMBIO DE DOMICILIO', 1),
(2, '-NPI', 1),
(3, 'PA: GESTIÃ“N ADMINISTRATIVA Y DE RECURSOS HUMANOS', 1),
(4, 'PG: AUDITORIAS INTERNAS DE LA CALIDAD', 1),
(5, 'PG: COMUNICACIÃ“N', 1),
(6, 'PG: PLANIFICACIÃ“N', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pyvcategoria`
--

CREATE TABLE IF NOT EXISTS `pyvcategoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(32) NOT NULL,
  `estado` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `pyvcategoria`
--

INSERT INTO `pyvcategoria` (`id`, `categoria`, `estado`) VALUES
(1, 'Ministro', 1),
(2, 'Viceministro', 1),
(3, 'Funcionario', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pyvcategoriazona`
--

CREATE TABLE IF NOT EXISTS `pyvcategoriazona` (
  `id_categoria` int(11) NOT NULL,
  `id_zona` int(11) NOT NULL,
  `viatico` float(10,2) NOT NULL,
  `moneda` varchar(2) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pyvcategoriazona`
--

INSERT INTO `pyvcategoriazona` (`id_categoria`, `id_zona`, `viatico`, `moneda`, `estado`) VALUES
(1, 1, 522.00, 'BS', 1),
(1, 2, 313.00, 'BS', 1),
(1, 3, 339.00, 'US', 1),
(1, 4, 283.00, 'US', 1),
(2, 1, 439.00, 'BS', 1),
(2, 2, 261.00, 'BS', 1),
(2, 3, 283.00, 'US', 1),
(2, 4, 226.00, 'US', 1),
(3, 1, 350.00, 'BS', 1),
(3, 2, 209.00, 'BS', 1),
(3, 3, 260.00, 'US', 1),
(3, 4, 195.00, 'US', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pyvcatprogramatica`
--

CREATE TABLE IF NOT EXISTS `pyvcatprogramatica` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `programa` varchar(2) NOT NULL,
  `proyecto` varchar(4) NOT NULL,
  `actividad` varchar(3) NOT NULL,
  `cat_programatica` varchar(250) NOT NULL,
  `estado` tinyint(1) DEFAULT '1',
  `id_unidad_ejecutora` int(11) NOT NULL,
  `id_dir_admin` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- Volcado de datos para la tabla `pyvcatprogramatica`
--

INSERT INTO `pyvcatprogramatica` (`id`, `programa`, `proyecto`, `actividad`, `cat_programatica`, `estado`, `id_unidad_ejecutora`, `id_dir_admin`) VALUES
(1, '00', '0000', '000', 'ADMINISTRACION CENTRAL', 1, 108, 108),
(2, '00', '0000', '001', 'DIRECCION Y COORDINACION DE DESARROLLO PRODUCTIVO', 1, 108, 108),
(3, '00', '0000', '002', 'GESTION ADMINISTRATIVA FINANCIERA', 1, 108, 108),
(4, '00', '0000', '003', 'GESTION DE ASESORAMIENTO JURIDICO Y NORMATIVO', 1, 108, 108),
(5, '00', '0000', '004', 'GESTION DE LA PLANIFICACION, INVERSION E INFORMACION SECTORIAL', 1, 108, 108),
(6, '00', '0000', '005', 'AUDITORIA INTERNA', 1, 108, 108),
(7, '00', '0000', '006', 'GESTION DE COMUNICACION', 1, 108, 108),
(8, '00', '0000', '007', 'GESTION DE TRANSPARENCIA', 1, 108, 108),
(9, '10', '0000', '000', 'DESARROLLO DEL COMERCIO INTERNO Y EXPORTACIONES', 1, 113, 108),
(10, '10', '0000', '001', 'DIRECCION Y COORDINACION DE LA MEDIANA Y GRAN EMPRESA', 1, 113, 108),
(11, '10', '0000', '002', 'GESTION NORMATIVA DEL COMERCIO INTERNO', 1, 113, 108),
(12, '10', '0000', '003', 'GESTION NORMATIVA Y DE EXPORTACIONES', 1, 113, 108),
(13, '10', '0000', '004', 'GESTION NORMATIVA DE DEFENSA DEL CONSUMIDOR', 1, 113, 108),
(14, '11', '0000', '000', 'DESARROLLO INDUSTRIAL A MEDIANA Y GRAN ESCALA', 1, 112, 108),
(15, '11', '0000', '001', 'DIRECCION Y COORDINACION DE LA MEDIANA Y GRAN EMPRESA', 1, 112, 108),
(16, '11', '0000', '002', 'GESTION Y NORMATIVA DE DESARROLLO INDUSTRIAL', 1, 112, 108),
(17, '11', '0000', '003', 'GESTION Y NORMATIVA DE SERVICIOS Y CONTROL INDUSTRIAL', 1, 112, 108),
(18, '11', '0000', '000', 'CONST. PARQUE INDUSTRIAL ECOLOGICO ORURO', 1, 112, 108),
(19, '11', '0000', '000', 'IMPLEM CENTRO DE INNOVACION TECNOLOGICA METALMECANICA PARQUE', 1, 112, 108),
(20, '11', '0000', '000', 'IMPLEM PLANTA AVICOLA INCUBADORA TROPICO DE CBBA', 1, 112, 108);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pyvestructuraprogramatica`
--

CREATE TABLE IF NOT EXISTS `pyvestructuraprogramatica` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(10) NOT NULL,
  `gestion` varchar(4) DEFAULT NULL,
  `codigo_entidad` varchar(25) NOT NULL,
  `entidad` varchar(32) DEFAULT NULL,
  `ppto_inicial` float(10,2) DEFAULT NULL,
  `modificado` float(10,2) DEFAULT NULL,
  `ppto_vigente` float(10,2) DEFAULT NULL,
  `preventivo` float(10,2) DEFAULT NULL,
  `comprometido` float(10,2) DEFAULT NULL,
  `devengado` float(10,2) DEFAULT NULL,
  `saldo_devengado` float(10,2) DEFAULT NULL,
  `pagado` float(10,2) DEFAULT NULL,
  `saldo_pagar` float(10,2) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT '1',
  `id_unidad_funcional` int(11) NOT NULL,
  `id_partida` int(11) NOT NULL,
  `da` int(11) NOT NULL,
  `ue` int(11) NOT NULL,
  `id_cat_programatica` varchar(250) NOT NULL,
  `id_organismo` int(10) DEFAULT NULL,
  `id_fuente` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `pyvestructuraprogramatica`
--

INSERT INTO `pyvestructuraprogramatica` (`id`, `codigo`, `gestion`, `codigo_entidad`, `entidad`, `ppto_inicial`, `modificado`, `ppto_vigente`, `preventivo`, `comprometido`, `devengado`, `saldo_devengado`, `pagado`, `saldo_pagar`, `estado`, `id_unidad_funcional`, `id_partida`, `da`, `ue`, `id_cat_programatica`, `id_organismo`, `id_fuente`) VALUES
(1, '1', '2013', '0041', 'MDPyEP', 323000.00, 0.00, 323000.00, 23247.60, 23247.60, 23247.60, 299752.00, 23247.60, 0.00, 1, 1, 1, 5, 5, '2', 1, 4),
(2, '2', '2013', '0041', 'MDPyEP', 60600.00, 0.00, 60600.00, 0.00, 0.00, 0.00, 60600.00, 0.00, 0.00, 1, 1, 2, 5, 5, '2', 1, 4),
(3, '3', '2013', '0041', 'MDPyEP', 142512.00, 0.00, 142512.00, 42967.23, 42967.23, 42967.23, 99544.77, 41943.00, 1024.23, 1, 1, 3, 5, 5, '2', 1, 4),
(4, '4', '2013', '0041', 'MDPyEP', 47188.00, 0.00, 47188.00, 40307.73, 40307.73, 40307.73, 6880.27, 40307.73, 0.00, 1, 1, 4, 5, 5, '2', 1, 4),
(5, '5', '2013', '0041', 'MDPyEP', 30000.00, 0.00, 30000.00, 11209.82, 11209.82, 11209.82, 18790.18, 10953.76, 256.60, 1, 1, 5, 5, 5, '2', 1, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pyvferiados`
--

CREATE TABLE IF NOT EXISTS `pyvferiados` (
  `fecha` date NOT NULL,
  `detalle` varchar(400) NOT NULL,
  `gestion` varchar(4) NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pyvferiados`
--

INSERT INTO `pyvferiados` (`fecha`, `detalle`, `gestion`, `estado`) VALUES
('2013-01-01', 'Año Nuevo', '2013', 0),
('2013-01-22', 'Fundacion de Bolivia', '2013', 0),
('2013-02-11', 'Carnaval', '2013', 0),
('2013-02-12', 'Carnaval', '2013', 0),
('2013-03-29', 'Viernes Santo', '2013', 0),
('2013-05-01', 'Dia del Trabajador', '2013', 0),
('2013-05-30', 'Corpus Christy', '2013', 0),
('2013-06-21', 'Año nuevo Aymara', '2013', 0),
('2013-07-16', 'Dia de La Paz', '2013', 1),
('2013-08-06', 'Dia de la Independencia', '2013', 1),
('2013-11-02', 'Dia de los Muertos', '2013', 1),
('2013-12-25', 'Navidad', '2013', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pyvfucov`
--

CREATE TABLE IF NOT EXISTS `pyvfucov` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_area_funcional` varchar(5) NOT NULL,
  `id_user_comision` int(11) DEFAULT NULL,
  `nombre_user_comision` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `cargo_user_comision` varchar(120) CHARACTER SET utf8 DEFAULT NULL,
  `id_unidad_ejecutora` int(11) NOT NULL,
  `id_autoridad` int(11) NOT NULL,
  `nombre_autoridad` varchar(300) NOT NULL,
  `cargo_autoridad` varchar(200) NOT NULL,
  `fecha_ini_comision` date NOT NULL,
  `hora_ini_comision` time NOT NULL,
  `fecha_fin_comision` date NOT NULL,
  `hora_fin_comision` time NOT NULL,
  `resolucion_min` varchar(30) DEFAULT NULL,
  `fecha_resolucion_min` date DEFAULT NULL,
  `cod_poa_ue` varchar(10) NOT NULL,
  `id_obj_gestion` int(11) NOT NULL,
  `id_obj_especifico` int(11) NOT NULL,
  `id_actividad` int(11) NOT NULL,
  `tipo_viaje` varchar(1) NOT NULL,
  `id_zona` int(11) NOT NULL,
  `id_pais_origen` int(11) NOT NULL,
  `id_depto_origen` varchar(50) NOT NULL,
  `localidad_origen` varchar(50) NOT NULL,
  `id_pais_destino` int(11) NOT NULL,
  `id_depto_destino` varchar(50) NOT NULL,
  `localidad_destino` varchar(50) NOT NULL,
  `estado_registro` varchar(50) NOT NULL,
  `etapa_proceso` varchar(50) NOT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `id_observacion` int(11) NOT NULL,
  `id_user` varchar(10) NOT NULL,
  `tipo_Resolucion` varchar(5) NOT NULL,
  `medio_transporte` varchar(30) NOT NULL,
  `actividad_1` text NOT NULL,
  `actividad_2` text,
  `comision_fin_semana` tinyint(1) NOT NULL,
  `justificacion_fin_semana` text NOT NULL,
  `id_documento` int(11) NOT NULL,
  `id_area_inmediato_superior` int(11) DEFAULT NULL,
  `id_inmediato_superior` int(11) DEFAULT NULL,
  `nombre_inmediato_superior` varchar(32) DEFAULT NULL,
  `cargo_inmediato_superior` varchar(90) DEFAULT NULL,
  `fecha_act_1` date DEFAULT NULL,
  `tipo_1` varchar(10) DEFAULT NULL,
  `lugar_1` varchar(50) DEFAULT NULL,
  `resultado_1` text,
  `fecha_act_2` date DEFAULT NULL,
  `tipo_2` varchar(10) DEFAULT NULL,
  `lugar_2` varchar(50) DEFAULT NULL,
  `resultado_2` text,
  `financiador_pasaje` varchar(32) DEFAULT NULL,
  `financiador_viatico` varchar(32) DEFAULT NULL,
  `financiamiento_pasaje` varchar(32) DEFAULT NULL,
  `financiamiento_viatico` varchar(32) DEFAULT NULL,
  `just_renuncia_viatico` text,
  `id_fuente_presupuesto` int(11) DEFAULT NULL,
  `alcance` tinyint(10) DEFAULT NULL,
  `num_dias` int(11) DEFAULT NULL,
  `viatico_dia` float(10,2) DEFAULT NULL,
  `categoria_funcionario` int(11) DEFAULT NULL,
  `tipo_cambio` float(10,2) DEFAULT '0.00',
  `moneda` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

--
-- Volcado de datos para la tabla `pyvfucov`
--

INSERT INTO `pyvfucov` (`id`, `id_area_funcional`, `id_user_comision`, `nombre_user_comision`, `cargo_user_comision`, `id_unidad_ejecutora`, `id_autoridad`, `nombre_autoridad`, `cargo_autoridad`, `fecha_ini_comision`, `hora_ini_comision`, `fecha_fin_comision`, `hora_fin_comision`, `resolucion_min`, `fecha_resolucion_min`, `cod_poa_ue`, `id_obj_gestion`, `id_obj_especifico`, `id_actividad`, `tipo_viaje`, `id_zona`, `id_pais_origen`, `id_depto_origen`, `localidad_origen`, `id_pais_destino`, `id_depto_destino`, `localidad_destino`, `estado_registro`, `etapa_proceso`, `fecha_creacion`, `id_observacion`, `id_user`, `tipo_Resolucion`, `medio_transporte`, `actividad_1`, `actividad_2`, `comision_fin_semana`, `justificacion_fin_semana`, `id_documento`, `id_area_inmediato_superior`, `id_inmediato_superior`, `nombre_inmediato_superior`, `cargo_inmediato_superior`, `fecha_act_1`, `tipo_1`, `lugar_1`, `resultado_1`, `fecha_act_2`, `tipo_2`, `lugar_2`, `resultado_2`, `financiador_pasaje`, `financiador_viatico`, `financiamiento_pasaje`, `financiamiento_viatico`, `just_renuncia_viatico`, `id_fuente_presupuesto`, `alcance`, `num_dias`, `viatico_dia`, `categoria_funcionario`, `tipo_cambio`, `moneda`) VALUES
(1, '', NULL, NULL, NULL, 0, 0, '', '', '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', NULL, NULL, '', 0, 0, 0, '0', 0, 0, '0', '', 0, '0', '', '', '', NULL, 0, '', '', '', '', NULL, 0, '', 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL),
(2, '', NULL, NULL, NULL, 0, 0, '', '', '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', NULL, NULL, '', 0, 0, 0, '0', 0, 0, '0', '', 0, '0', '', '', '', NULL, 0, '', '', '', '', NULL, 0, '', 124, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL),
(3, '', NULL, NULL, NULL, 0, 0, '', '', '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', NULL, NULL, '', 0, 0, 0, '0', 0, 0, '0', '', 0, '0', '', '', '', NULL, 0, '', '', '', '', NULL, 0, '', 125, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL),
(4, '', NULL, NULL, NULL, 0, 0, '', '', '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', NULL, NULL, '', 0, 0, 0, '0', 0, 0, '0', '', 0, '0', '', '', '', NULL, 0, '', '', '', '', NULL, 0, '', 126, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL),
(5, '104', NULL, NULL, NULL, 0, 0, '', '', '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', NULL, NULL, '', 0, 0, 0, '0', 0, 0, '0', '', 0, '0', '', '', '', NULL, 0, '', '', '', '', NULL, 0, '', 128, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL),
(6, '109', 33, 'Rosario Jimena Tellez Quenallata', 'Secretaria Direccion General de Planificacion', 108, 35, 'Walter Erick Quevedo Flores', 'Director General de Asuntos Administrativos', '0000-00-00', '09:30:00', '0000-00-00', '00:00:11', NULL, NULL, '', 7, 12, 0, '0', 1, 1, '1', 'lp', 1, '9', 'cbba', '1', 'creado', '2013-06-18 11:32:11', 0, '36', '', 'aereo', 'Acualización ', '', 1, '', 237, 109, 32, 'Ariel Zabala David', 'Director General de Planificacion', '0000-00-00', '3', 'CENPT', 'Uso apropiado de los sitemas d einformación', '0000-00-00', '', '', '', NULL, 'OJASD', 'mdp', 'otro', NULL, NULL, 75, NULL, NULL, NULL, 0.00, NULL),
(7, '114', 39, 'Jose Elias Stolzer', 'Profesional encargado de presupuesto', 108, 35, 'Walter Erick Quevedo Flores', 'Director General de Asuntos Administrativos', '2013-06-18', '08:30:00', '2013-06-19', '00:00:14', NULL, NULL, '', 7, 12, 0, '0', 1, 1, '1', 'lp', 1, '9', 'cbba', '1', 'creado', '2013-06-18 12:32:15', 0, '36', '', 'aereo', 'taller123', '', 0, '', 238, 108, 35, 'Walter Erick Quevedo Flores', 'Director General de Asuntos Administrativos', '0000-00-00', '2', 'taller', 'taller456', '0000-00-00', '', '', '', NULL, 'qwe', 'mdp', 'otro', NULL, NULL, 75, NULL, NULL, NULL, 0.00, NULL),
(8, '', 0, '', '', 108, 0, '', '', '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', NULL, NULL, '', 0, 0, 0, '', 0, 0, '0', '', 0, '0', '', '1', 'creado', '2013-06-18 15:30:32', 0, '36', '', '', '', '', 0, '', 240, 0, 0, '', '', '0000-00-00', '', '', '', '0000-00-00', '', '', '', NULL, NULL, '', 'mdp', NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL),
(9, '', 0, '', '', 108, 0, '', '', '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', NULL, NULL, '', 0, 0, 0, '', 0, 0, '0', '', 0, '0', '', '1', 'creado', '2013-06-18 15:31:43', 0, '36', '', '', '', '', 0, '', 242, 0, 0, '', '', '0000-00-00', '', '', '', '0000-00-00', '', '', '', NULL, NULL, '', 'mdp', NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL),
(10, '109', 34, 'Lucio Choque', 'Profesional en Planificacion Sectorial e Institucional', 108, 35, 'Walter Erick Quevedo Flores', 'Director General de Asuntos Administrativos', '2013-06-18', '09:30:00', '2013-06-19', '16:30:00', NULL, NULL, '', 7, 12, 0, 'I', 1, 1, '1', 'lp', 1, '7', 'bn', '1', 'creado', '2013-06-18 16:23:41', 0, '36', '', 'aereo', 're', '', 0, '', 244, 109, 32, 'Ariel Zabala David', 'Director General de Planificacion', '0000-00-00', '1', 're', 're', '0000-00-00', '', '', '', 'QWERT', 'QWERT', 'otro', 'otro', NULL, NULL, 75, NULL, NULL, NULL, 0.00, NULL),
(11, '114', 39, 'saasd', 'Profesional encargado de presupuesto', 108, 35, 'Walter Erick Quevedo Flores', 'Director General de Asuntos Administrativos', '2013-06-19', '08:30:00', '2013-06-22', '12:30:00', NULL, NULL, '', 7, 13, 0, 'I', 1, 1, '1', 'lp', 1, '9', 'cbba', '1', 'creado', '2013-06-19 10:06:31', 0, '36', '', 'aereo', 'reunion', '', 1, '', 245, 108, 35, 'Walter Erick Quevedo Flores', 'Director General de Asuntos Administrativos', '0000-00-00', '1', 'Hotel Ritz', 'reunion', '0000-00-00', '', '', '', NULL, 'QWERT', 'mdp', 'otro', NULL, NULL, 75, NULL, NULL, NULL, 0.00, NULL),
(12, '114', 39, 'Jose Elias Stolzer', 'Profesional encargado de presupuesto', 108, 35, 'Walter Erick Quevedo Flores', 'Director General de Asuntos Administrativos', '2013-06-19', '08:30:00', '2013-06-22', '12:30:00', NULL, NULL, '', 7, 13, 0, 'I', 1, 1, '1', 'lp', 1, '9', 'cbba', '1', 'creado', '2013-06-19 10:07:07', 0, '36', '', 'aereo', 'reunion', '', 1, '', 246, 108, 35, 'Walter Erick Quevedo Flores', 'Director General de Asuntos Administrativos', NULL, '1', 'Hotel Ritz', 'reunion', NULL, '', '', '', NULL, 'QWERT', 'mdp', 'otro', NULL, NULL, 75, NULL, NULL, NULL, 0.00, NULL),
(13, '114', 39, 'jose', 'Profesional encargado de presupuesto', 108, 35, 'Walter Erick Quevedo Flores', 'Director General de Asuntos Administrativos', '2013-06-19', '14:00:00', '2013-06-20', '12:00:00', NULL, NULL, '', 7, 12, 0, 'I', 1, 1, '1', 'lp', 1, '9', 'cbba', '1', 'creado', '2013-06-19 11:23:15', 0, '36', '', 'aereo', 'act1', '', 0, '', 247, 108, 35, 'Walter Erick Quevedo Flores', 'Director General de Asuntos Administrativos', '0000-00-00', '1', 'Hotel Ritz', 'act1', '0000-00-00', '', '', '', NULL, NULL, 'mdp', 'mdp', NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL),
(14, '109', 34, 'juan', 'Profesional en Planificacion Sectorial e Institucional', 108, 35, 'Walter Erick Quevedo Flores', 'Director General de Asuntos Administrativos', '2013-06-19', '13:00:00', '2013-06-20', '08:30:00', NULL, NULL, '', 7, 13, 0, 'I', 1, 1, '5', 'sc', 1, '5', 'ch', '1', 'creado', '2013-06-19 11:25:57', 0, '36', '', 'terrestre', 're', '', 0, '', 248, 109, 32, 'Ariel Zabala David', 'Director General de Planificacion', '0000-00-00', '1', 're', 're', '0000-00-00', '', '', '', NULL, 'qwert', 'mdp', 'otro', NULL, NULL, 75, NULL, NULL, NULL, 0.00, NULL),
(15, '114', 39, 'Jose', 'Profesional encargado de presupuesto', 108, 35, 'Walter Erick Quevedo Flores', 'Director General de Asuntos Administrativos', '2013-06-19', '10:00:00', '2013-06-21', '16:30:00', NULL, NULL, '', 7, 12, 0, 'I', 1, 1, 'La Paz', 'La Paz', 1, 'Cochabamba', 'Cochabamba', '1', 'creado', '2013-06-19 15:49:11', 0, '36', '', 'aereo', 're', '', 0, '', 249, 108, 35, 'Walter Erick Quevedo Flores', 'Director General de Asuntos Administrativos', '0000-00-00', '1', 'reunion', 're', '0000-00-00', '', '', '', NULL, NULL, 'mdp', 'mdp', NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL),
(16, '109', 34, 'Lucio Primitivo Choque Quispe', 'Profesional en Planificacion Sectorial e Institucional', 108, 35, 'Walter Erick Quevedo Flores', 'Director General de Asuntos Administrativos', '2013-06-27', '11:00:00', '2013-06-28', '11:00:00', NULL, NULL, '', 7, 12, 0, '', 0, 0, '', '', 0, '', '', '1', 'creado', '2013-06-27 11:52:06', 0, '36', '', '', 'reun', '', 0, '', 1, 109, 32, 'Ariel Zabala David', 'Director General de Planificacion', '0000-00-00', 'reunion', 'CENPT', 'reun', '0000-00-00', '', '', '', NULL, NULL, NULL, '100', NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL),
(17, '109', 34, 'Lucio Primitivo Choque Quispe', 'Profesional en Planificacion Sectorial e Institucional', 108, 35, 'Walter Erick Quevedo Flores', 'Director General de Asuntos Administrativos', '2013-06-27', '11:00:00', '2013-06-28', '11:00:00', NULL, NULL, '', 7, 12, 0, '', 0, 0, '', '', 0, '', '', '1', 'creado', '2013-06-27 11:58:35', 0, '36', '', '', 'reun', '', 0, '', 1, 109, 32, 'Ariel Zabala David', 'Director General de Planificacion', '0000-00-00', 'reunion', 'CENPT', 'reun', '0000-00-00', '', '', '', NULL, NULL, NULL, '100', NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL),
(18, '109', 33, 'Rosario Jimena Tellez Quenallata', 'Secretaria Direccion General de Planificacion', 108, 35, 'Walter Erick Quevedo Flores', 'Director General de Asuntos Administrativos', '2013-06-27', '10:30:00', '2013-06-28', '10:30:00', NULL, NULL, '', 7, 12, 0, '', 0, 0, '', '', 0, '', '', '1', 'creado', '2013-06-27 12:14:18', 0, '36', '', '', 'curso', '', 0, '', 1, 109, 32, 'Ariel Zabala David', 'Director General de Planificacion', '0000-00-00', 'curso', 'DCP', 'curso', '0000-00-00', '', '', '', NULL, 'ASDF', NULL, '25', NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL),
(19, '104', 28, 'Cristian Jesus Michel Garcia', 'Tecnico Asistente Administrativo', 104, 26, 'Maria Luisa Quezada Portugal', 'Jefe de Gabinete', '2013-06-27', '10:30:00', '2013-06-28', '15:30:00', NULL, NULL, '', 1, 1, 0, '', 0, 0, '', '', 0, '', '', '1', 'creado', '2013-06-27 12:27:08', 0, '27', '', '', 'capacitacion', '', 0, '', 259, 104, 26, 'Maria Luisa Quezada Portugal', 'Jefe de Gabinete', '0000-00-00', 'curso', 'CENCAP', 'capacitacion', '0000-00-00', '', '', '', NULL, 'G&L', NULL, '70', NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL),
(20, '104', 28, 'Cristian Jesus Michel Garcia', 'Tecnico Asistente Administrativo', 104, 25, 'Ana Teresa Morales Olivera', 'Ministra', '2013-06-28', '08:30:00', '2013-06-29', '18:30:00', NULL, NULL, '', 1, 1, 0, '', 0, 0, '', '', 0, '', '', '1', 'creado', '2013-06-27 13:58:55', 0, '27', '', '', 'capacitacion para ...', '', 1, '', 260, 104, 26, 'Maria Luisa Quezada Portugal', 'Jefe de Gabinete', '0000-00-00', 'curso', 'CENCAP', 'conocimiento sobre el funcionamiento basico de ...', '0000-00-00', '', '', '', NULL, 'J&F', NULL, '70', NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL),
(21, '104', 28, 'Cristian Jesus Michel Garcia', 'Tecnico Asistente Administrativo', 104, 25, 'Ana Teresa Morales Olivera', 'Ministra', '2013-06-28', '08:30:00', '2013-06-29', '18:30:00', NULL, NULL, '', 1, 1, 0, '', 0, 0, '', '', 0, '', '', '1', 'creado', '2013-06-27 13:59:13', 0, '27', '', '', 'capacitacion para ...', '', 1, '', 261, 104, 26, 'Maria Luisa Quezada Portugal', 'Jefe de Gabinete', '0000-00-00', 'curso', 'CENCAP', 'conocimiento sobre el funcionamiento basico de ...', '0000-00-00', '', '', '', NULL, 'J&F', NULL, '70', NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL),
(22, '104', 28, 'Cristian Jesus Michel Garcia', 'Tecnico Asistente Administrativo', 104, 25, 'Ana Teresa Morales Olivera', 'Ministra', '2013-06-28', '08:30:00', '2013-06-29', '18:30:00', NULL, NULL, '', 1, 1, 0, '', 0, 0, '', '', 0, '', '', '1', 'creado', '2013-06-27 13:59:28', 0, '27', '', '', 'capacitacion para ...', '', 1, '', 262, 104, 26, 'Maria Luisa Quezada Portugal', 'Jefe de Gabinete', '0000-00-00', 'curso', 'CENCAP', 'conocimiento sobre el funcionamiento basico de ...', '0000-00-00', '', '', '', NULL, 'J&F', NULL, '70', NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL),
(23, '104', 28, 'Cristian Jesus Michel Garcia', 'Tecnico Asistente Administrativo', 104, 25, 'Ana Teresa Morales Olivera', 'Ministra', '2013-06-28', '08:30:00', '2013-06-29', '18:30:00', NULL, NULL, '', 1, 1, 0, '', 0, 0, '', '', 0, '', '', '1', 'creado', '2013-06-27 13:59:42', 0, '27', '', '', 'capacitacion para ...', '', 1, '', 263, 104, 26, 'Maria Luisa Quezada Portugal', 'Jefe de Gabinete', '0000-00-00', 'curso', 'CENCAP', 'conocimiento sobre el funcionamiento basico de ...', '0000-00-00', '', '', '', NULL, 'J&F', NULL, '70', NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL),
(24, '104', 28, 'Cristian Jesus Michel Garcia', 'Tecnico Asistente Administrativo', 104, 26, 'Maria Luisa Quezada Portugal', 'Jefe de Gabinete', '2013-06-28', '08:00:00', '2013-06-29', '16:00:00', NULL, NULL, '', 1, 2, 0, '', 0, 0, '', '', 0, '', '', '1', 'creado', '2013-06-27 14:10:38', 0, '27', '', '', 'capacitacion', '', 1, '', 267, 104, 26, 'Maria Luisa Quezada Portugal', 'Jefe de Gabinete', '0000-00-00', 'curso', 'CENPT', 'Conocimiento sobre el manejo de ...', '0000-00-00', '', '', '', NULL, 'DGCMP', NULL, '70', NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL),
(25, '114', 39, 'Jose Elias Stolzer', 'Profesional encargado de presupuesto', 104, 26, 'Maria Luisa Quezada Portugal', 'Jefe de Gabinete', '2013-06-28', '09:30:00', '2013-06-29', '18:30:00', NULL, NULL, '', 1, 1, 0, '', 0, 0, '', '', 0, '', '', '1', 'creado', '2013-06-27 14:54:58', 0, '27', '', '', 'curso de actualizacion ', '', 1, '', 268, 108, 35, 'Walter Erick Quevedo Flores', 'Director General de Asuntos Administrativos', '2013-06-27', 'curso', 'CENTEP', 'conocer las directrices actuales para el manejo.', '0000-00-00', '', '', '', NULL, NULL, NULL, '100', NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL),
(26, '109', 34, 'Lucio Primitivo Choque Quispe', 'Profesional en Planificacion Sectorial e Institucional', 109, 32, 'Ariel Zabala David', 'Director General de Planificacion', '2013-06-28', '08:30:00', '2013-06-29', '16:30:00', NULL, NULL, '', 6, 21, 0, '', 0, 0, '', '', 0, '', '', '1', 'creado', '2013-06-27 16:21:33', 0, '33', '', '', 'Reunión de coordinacion para ', '', 1, '', 270, 109, 32, 'Ariel Zabala David', 'Director General de Planificacion', '2013-06-27', 'reunion', 'AGP', 'Resultados de la Reunión ...', '0000-00-00', '', '', '', NULL, NULL, NULL, '100', NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL),
(27, '109', 34, 'Lucio Primitivo Choque Quispe', 'Profesional en Planificacion Sectorial e Institucional', 109, 32, 'Ariel Zabala David', 'Director General de Planificacion', '2013-06-28', '08:30:00', '2013-06-29', '15:00:00', NULL, NULL, '', 5, 15, 0, '', 0, 0, '', '', 0, '', '', '1', 'creado', '2013-06-28 01:20:52', 0, '33', '', '', 'curso de actualizacion', '', 1, '', 273, 109, 32, 'Ariel Zabala David', 'Director General de Planificacion', '2013-06-29', 'curso', 'DCP', 'conocimiento sobre las nuevas tecnicas de ...', '0000-00-00', '', '', '', NULL, 'ERTY', NULL, '70', NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL),
(28, '114', 37, 'Juan Carlos Chavez Iporre', 'Jefe de la Unidad Financiera', 108, 35, 'Walter Erick Quevedo Flores', 'Director General de Asuntos Administrativos', '2013-06-28', '08:30:00', '2013-06-29', '18:30:00', NULL, NULL, '', 7, 12, 0, '', 0, 0, '', '', 0, '', '', '1', 'creado', '2013-06-28 12:56:19', 0, '36', '', '', 'Reunion de planificacion de actividades', '', 1, '', 276, 108, 35, 'Walter Erick Quevedo Flores', 'Director General de Asuntos Administrativos', '2013-06-28', 'reunion', 'Reunion', 'acuerdo entre partes', '0000-00-00', '', '', '', NULL, 'ORP', NULL, '70', NULL, NULL, NULL, 2, 350.00, 3, 6.88, 'BS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pyvfuente`
--

CREATE TABLE IF NOT EXISTS `pyvfuente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(3) NOT NULL,
  `denominacion` varchar(64) NOT NULL,
  `sigla` varchar(15) NOT NULL,
  `tipo` varchar(1) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Volcado de datos para la tabla `pyvfuente`
--

INSERT INTO `pyvfuente` (`id`, `codigo`, `denominacion`, `sigla`, `tipo`, `estado`) VALUES
(1, '10', 'Tesoro General de la Nacion', 'TGN', 'I', 1),
(2, '41', 'Transferencias T.G.N.', 'TRANSF-TGN', 'I', 1),
(3, '91', 'Prestamos T.G.N.', 'PREST-TGN', 'I', 1),
(4, '11', 'T.G.N. Otros Ingresos', 'TGN-OT', 'I', 1),
(5, '46', 'Transferencias T.G.N. Otros Ingresos', 'TRANSF-OTI', 'I', 1),
(6, '96', 'Prestamos T.G.N. Otros Ingresos', 'PREST-OTI', 'I', 1),
(7, '20', 'Recursos Especificos', 'RECESP', 'I', 1),
(8, '42', 'Transferencias de Recursos Especificos', 'TRANSF-ESP', 'I', 1),
(9, '92', 'Prestamos de Recursos Especificos', 'PREST-ESP', 'I', 1),
(10, '70', 'Credito Externo', 'CREDEX', 'E', 1),
(11, '43', 'Transferencias de Credito Externo', 'TRANSF-CRE', 'E', 1),
(12, '93', 'Prestamos de Credito Externo', 'PREST-CRE', 'E', 1),
(13, '80', 'Donacion Externa', 'DON-EXT', 'E', 1),
(14, '44', 'Transferencias de Donacion Externa', 'TRANSF-DON', 'E', 1),
(15, '94', 'Prestamos de Donacion Externa', 'PREST-DON', 'E', 1),
(16, '90', 'Credito Interno', 'CREDINT', 'I', 1),
(17, '45', 'Transferencias de Credito Interno', 'TRANSF-CREI', 'I', 1),
(18, '95', 'Prestamos de Credito Interno', 'PREST-CREI', 'I', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pyvfuncionario`
--

CREATE TABLE IF NOT EXISTS `pyvfuncionario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nivel` varchar(3) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT '0',
  `id_user` int(11) NOT NULL DEFAULT '0',
  `id_autoridad_competente` tinyint(1) DEFAULT NULL,
  `id_categoria` tinyint(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- Volcado de datos para la tabla `pyvfuncionario`
--

INSERT INTO `pyvfuncionario` (`id`, `nivel`, `estado`, `id_user`, `id_autoridad_competente`, `id_categoria`) VALUES
(1, 'SUP', 1, 25, 1, 1),
(2, 'COM', 1, 26, 1, 3),
(3, 'ENL', 1, 27, 0, 3),
(4, 'ENL', 1, 28, 0, 3),
(5, 'SUP', 1, 29, 1, 3),
(6, 'COM', 1, 30, 0, 3),
(7, 'ENL', 1, 31, 0, 3),
(8, 'SUP', 1, 32, 1, 3),
(9, 'ENL', 1, 33, 0, 3),
(10, 'COM', 1, 34, 0, 3),
(11, 'SUP', 1, 35, 1, 3),
(12, 'ENL', 1, 36, 0, 3),
(13, 'COM', 1, 37, 0, 3),
(14, 'COM', 1, 38, 0, 3),
(15, 'COM', 1, 39, 0, 3),
(16, 'COM', 1, 40, 0, 3),
(17, 'COM', 1, 41, 0, 3),
(18, 'COM', 1, 42, 0, 3),
(19, 'COM', 1, 43, 0, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pyvliquidacion`
--

CREATE TABLE IF NOT EXISTS `pyvliquidacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_liquidacion` datetime DEFAULT NULL,
  `viaticos_interior` float(10,2) NOT NULL,
  `pasajes_interior` float(10,2) NOT NULL,
  `viaticos_exterior` float(10,2) NOT NULL,
  `pasajes_exterior` float(10,2) NOT NULL,
  `gastos_representacion` float(10,2) NOT NULL,
  `financiado_por` int(11) NOT NULL,
  `motivo_renuncia` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `porcentaje_financiamiento` int(11) NOT NULL,
  `aclaracion_financiamiento` varchar(300) NOT NULL,
  `tipo_cambio` float(10,2) NOT NULL,
  `categoria` int(11) NOT NULL,
  `cantidad_dias` int(11) NOT NULL,
  `cantidad_horas` int(11) DEFAULT NULL,
  `viatico_dia` float(10,2) NOT NULL,
  `multas` float(10,2) NOT NULL,
  `costo_final` float(10,2) NOT NULL,
  `id_fucov` int(11) NOT NULL,
  `fecha_ini_comision` date NOT NULL,
  `hora_ini_comision` time NOT NULL,
  `fecha_fin_comision` date NOT NULL,
  `hora_fin_comision` time NOT NULL,
  `tipo_calculo` varchar(20) NOT NULL,
  `fecha_ini_viaje` date NOT NULL,
  `hora_ini_viaje` time NOT NULL,
  `fecha_fin_viaje` date NOT NULL,
  `hora_fin_viaje` time NOT NULL,
  `usuario_registro` varchar(10) NOT NULL,
  `fecha_registro` datetime NOT NULL,
  `observaciones` text,
  `dia_pernocte` int(11) NOT NULL,
  `id_cat_programatica` int(11) NOT NULL,
  `etapa_proceso` varchar(50) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pyvobjespcatprog`
--

CREATE TABLE IF NOT EXISTS `pyvobjespcatprog` (
  `id_objetivoespecifico` int(10) NOT NULL,
  `id_catprogramatica` int(10) NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pyvobjespcatprog`
--

INSERT INTO `pyvobjespcatprog` (`id_objetivoespecifico`, `id_catprogramatica`, `estado`) VALUES
(1, 2, 1),
(2, 2, 1),
(3, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pyvobjetivoespecifico`
--

CREATE TABLE IF NOT EXISTS `pyvobjetivoespecifico` (
  `id_obj_especifico` int(10) NOT NULL AUTO_INCREMENT,
  `cod_objetivo_especifico` varchar(20) DEFAULT NULL,
  `objetivo_especifico` text NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `id_obj_gestion` int(10) NOT NULL,
  `id_unidad_responsable` int(10) NOT NULL,
  PRIMARY KEY (`id_obj_especifico`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Volcado de datos para la tabla `pyvobjetivoespecifico`
--

INSERT INTO `pyvobjetivoespecifico` (`id_obj_especifico`, `cod_objetivo_especifico`, `objetivo_especifico`, `estado`, `id_obj_gestion`, `id_unidad_responsable`) VALUES
(1, '8.1.1', 'Diseñar politicas y estrategias para el desarrollo productivo sobre la base de la creacion de una matriz productiva para establecimiento de empleos sostenibles en las diferentes formas de organizacion economica, incentivando la oferta exportable hacia los mercados nacionales e internacionales.', 1, 1, 0),
(2, '8.1.2', 'Apoyar al Despacho de la Ministra y a las autoridades jerarquicas del Ministerio en la toma de decisiones concernientes a los asuntos de su competencia.', 1, 1, 0),
(3, '8.1.3', 'Coordinar las actividades que se desarrollan en el Despacho de la Ministra de Desarrollo Productivo y Economia Plural.', 1, 1, 0),
(4, '8.1.1', 'Informar a los actores del sector productivo y a la poblacion sobre la gestion y resultados del MDPyEP, ejecutando estrategias de comunicacion institucional, utilizando los medios de \ncomunicación masiva y diferentes medios escritos.', 1, 2, 0),
(5, '8.1.2', 'Apoyar la toma de decisiones por parte de las autoridades del MDPyEP y las acciones comunicacionales con el monitoreo de noticias y alerta temprana.', 1, 2, 0),
(6, '8.1.1', 'Auditoria de Confiabilidad de los registros, estados presupuestarios consolidados y estados complementarios al 31/12/12', 1, 3, 0),
(7, '8.1.2', 'Auditoria especial sobre Cuentas por cobrar de Gestiones Anteriores expuesto en los estados financieros de Zona Franca Comercial e Industrial de Cobija (ZOFRA COBIJA) al 31 de diciembre de 2011 (2)', 1, 3, 0),
(8, '8.1.3', 'Auditoria especial sobre la contratacion de servicios de consultoria por producto en las gestiones 2010, 2011 y 2012, en PRO BOLIVIA', 1, 3, 0),
(9, '8.1.4', 'Auditoria especial sobre la contratacion del Diseño, Ejecucion y Puesta en Marcha del Proyecto Implementacion Taller Textil Fibra de Alpaca para Discapacitados en El Alto - Modalidad Llave en Mano, en PRO BOLIVIA', 1, 3, 0),
(10, '8.1.5', 'Auditoria especial sobre la implementacion del Taller Artesanal para Personas con Discapacidad en Pando - Modalidad Llave en Mano, en PRO BOLIVIA', 1, 3, 0),
(11, '8.1.6', 'Auditoria especial sobre facturacion por servicios de metrologia legal, gestiones 2010 y 2011, en IBMETRO (2)', 1, 3, 0),
(12, '8.1.1', 'Implantar una politica de RRHH acorde a la Normativa vigente, que promueva la vocacion de servicio, la competitividad, la productividad y el compromiso Institucional, apoyados en planes de capacitacion, motivacion e institucionalizacion.', 1, 7, 0),
(13, '8.1.2', 'Aplicar los Sistemas de Control financiero en la ejecucion de los recursos asignados y proporcionar y elaborar informacion financiera oportuna y confiable, que ayude a la toma de decisiones a los niveles superiores', 1, 7, 0),
(14, '8.1.3', 'Aplicar los sistemas de Bienes y Servicios, Organizacion Administrativa, desarrollando procesos y procedimientos, que busquen optimizar los recursos economicos y satisfaga las necesidades de bienes y servicios necesarios para el logro de los objetivos institucionales.', 1, 7, 0),
(15, '8.1.1', 'Cumplir con el seguimiento de las acciones del Ministerio y entidades del sector en el marco del Plan Sectorial de Desarrollo', 1, 5, 0),
(16, '8.1.2', 'Verificar el cumplimiento del Programa de Operaciones Anual 2013 del MDPyEP y sus entidades desconcentradas.', 1, 5, 0),
(17, '8.1.3', 'Consolidar el Programa de Operaciones Anual gestión 2014 del MDPyEP y entidades desconcentradas', 1, 5, 0),
(18, '8.1.4', 'Cumplir con el seguimiento del Programa de Inversiones 2013 y las propuestas de proyectos formulados por las instancias del MDPyEP y las organizaciones productivas.', 1, 5, 0),
(19, '8.1.5', 'Consolidar el Programa de Inversiones 2014', 1, 5, 0),
(20, '8.1.6', 'Institucionalizar la perspectiva de igualdad de genero en la gestion del MDPyEP.', 1, 5, 0),
(21, '8.2.1', 'Gestion, administracion y operacion del SIIP', 1, 6, 0),
(22, '8.2.2', 'Producir documentos de analisis', 1, 6, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pyvobjetivogestion`
--

CREATE TABLE IF NOT EXISTS `pyvobjetivogestion` (
  `id_obj_gestion` int(10) NOT NULL,
  `cod_objetivo_gestion` varchar(10) DEFAULT NULL,
  `objetivo_gestion` text NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `id_unidad_funcional` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pyvobjetivogestion`
--

INSERT INTO `pyvobjetivogestion` (`id_obj_gestion`, `cod_objetivo_gestion`, `objetivo_gestion`, `estado`, `id_unidad_funcional`) VALUES
(1, '8.1', 'Impulsar el desarrollo de un nuevo modelo economico con el cambio de la matriz productiva a traves de la diversificacion de la produccion artesanal, manufacturera, industrial y agroindustrial, contribuyendo a la soberania alimentaria y democratizando el acceso a los mercados interno y externo y fortaleciendo las iniciativas privadas, comunitarias y social cooperativas para generar mayor empleo digno y redistribucin de los ingresos.', 1, 1),
(2, '8.1', 'Posicionar al MDPyEP en el imaginario nacional como el encargado de impulsar el desarrollo productivo del pais, destacando las actividades y resultados alcanzados.', 1, 3),
(3, '8.1', 'Realizar auditorias para evaluar el grado de cumplimiento y eficacia de los Sistemas de Administracion y Control, emitiendo recomendaciones que incrementen los niveles de eficiencia, oportunidad y transparencia de los registros y transparencia de los registros e informacion y verificar su grado de cumplimiento con el fin de mejorar los controles internos del MDPyEP.', 1, 4),
(4, '8.1', 'Transparentar la gestion del Ministerio y sus entidades dependientes, en coordinacion con los actores sociales individuales y/o colectivos.', 1, 2),
(5, '8.1', 'Implementar en el MDPyEP y sus dependientes los procesos de planificacion sectorial, institucional, programacion operativa, programacion de inversiones, su seguimiento y evaluacion', 1, 6),
(6, '8.2', 'Proveer informacion productiva del pais, para la toma de decisiones estrategicas por parte de la MAE y funcionarios MDPyEP, en busqueda de mejorar los procesos productivos', 1, 6),
(7, '8.1', 'Apoyar la gestion Institucional del MDP y EP a traves de la dotacion de bienes, servicios y recursos humanos, aplicando la normativa de control y administracion publica con altos niveles de eficiencia, eficacia y transparencia, para el logro de los Objetivos de gestion y estrategicos', 1, 5),
(8, '8.1', 'Prestar asesoramiento juridico a la Estructura Central del Ministerio, expresado en informes pertinentes y oportunos, en proyectos normativos y resoluciones atinentes a su competencia y en una gestion juridica eficiente, en la gestion 2013', 1, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pyvobjgestcatprog`
--

CREATE TABLE IF NOT EXISTS `pyvobjgestcatprog` (
  `id_objetivogestion` int(11) NOT NULL,
  `id_catprogramatica` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pyvobjgestcatprog`
--

INSERT INTO `pyvobjgestcatprog` (`id_objetivogestion`, `id_catprogramatica`, `estado`) VALUES
(1, 1, 1),
(2, 1, 1),
(3, 1, 1),
(4, 1, 1),
(5, 1, 1),
(6, 1, 1),
(7, 1, 1),
(8, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pyvorganismo`
--

CREATE TABLE IF NOT EXISTS `pyvorganismo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(3) NOT NULL,
  `denominacion` varchar(100) NOT NULL,
  `sigla` varchar(15) DEFAULT NULL,
  `tipo` varchar(1) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Volcado de datos para la tabla `pyvorganismo`
--

INSERT INTO `pyvorganismo` (`id`, `codigo`, `denominacion`, `sigla`, `tipo`, `estado`) VALUES
(1, '000', 'NC', 'NC', 'I', 1),
(2, '111', 'TESORO GENERAL DE LA NACION', 'TGN', 'I', 1),
(3, '112', 'TESORO GENERAL DE LA NACION -PAPELES', 'TGN-P', 'I', 1),
(4, '113', 'TESORO GENERAL DE LA NACION -PARTICIPACION POPULAR', 'TGN-PP', 'I', 1),
(5, '114', 'RECURSOS CONTRAVALOR', 'RECON', 'I', 1),
(6, '116', 'TESORO GENERAL DE LA NACION - FONDO DE COMPENSACION DEPARTAMENTAL', 'TGN-FCOMP', 'I', 1),
(7, '117', 'TESORO GENERAL DE LA NACION - IMPUESTO ESPECIAL A LOS HIDROCARBUROS Y SUS DERIVADOS', 'TGN-IEDH', 'I', 1),
(8, '119', 'TESORO GENERAL DE LA NACION - IMPUESTO DIRECTO A LOS HIDROCARBUROS', 'TGN-IDH', 'I', 1),
(9, '129', 'OTROS ORGANISMOS FINANCIADORES DEL GOBIERNO', 'OT-GOB', 'I', 1),
(10, '210', 'RECURSOS ESPECIFICOS DE LAS MUNICIPALIDADES E INDIGENA ORIGINARIO CAMPESINO', 'RECESPMUN', 'I', 1),
(11, '220', 'REGALIAS', 'REG', 'I', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pyvpais`
--

CREATE TABLE IF NOT EXISTS `pyvpais` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `iso` char(2) DEFAULT NULL,
  `pais` varchar(100) NOT NULL DEFAULT '',
  `id_zona` int(11) NOT NULL,
  `id_tipo_viaje` varchar(10) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_pais` (`pais`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=40 ;

--
-- Volcado de datos para la tabla `pyvpais`
--

INSERT INTO `pyvpais` (`id`, `iso`, `pais`, `id_zona`, `id_tipo_viaje`, `estado`) VALUES
(1, 'BO', 'BOLIVIA', 1, 'I', 1),
(2, 'DE', 'ALEMANIA', 3, 'E', 1),
(3, 'AR', 'ARGENTINA', 4, 'E', 1),
(4, 'AU', 'AUSTRALIA', 3, 'E', 1),
(5, 'BR', 'BRASIL', 4, 'E', 1),
(6, 'CA', 'CANADA', 4, 'E', 1),
(7, 'CL', 'CHILE', 4, 'E', 1),
(8, 'CN', 'CHINA', 3, 'E', 1),
(9, 'CO', 'COLOMBIA', 4, 'E', 1),
(10, 'KP', 'COREA DEL NORTE', 3, 'E', 1),
(11, 'KR', 'COREA DEL SUR', 3, 'E', 1),
(12, 'CR', 'COSTA RICA', 4, 'E', 1),
(13, 'CU', 'CUBA', 4, 'E', 1),
(14, 'DO', 'REPUBLICA DOMINICANA', 4, 'E', 1),
(15, 'EC', 'ECUADOR', 4, 'E', 1),
(16, 'EG', 'EGIPTO', 3, 'E', 1),
(17, 'SV', 'EL SALVADOR', 4, 'E', 1),
(18, 'ES', 'ESPANA', 3, 'E', 1),
(19, 'US', 'ESTADOS UNIDOS', 3, 'E', 1),
(20, 'FR', 'FRANCIA', 3, 'E', 1),
(21, 'GT', 'GUATEMALA', 4, 'E', 1),
(22, 'HN', 'HONDURAS', 3, 'E', 1),
(23, 'IN', 'INDIA', 3, 'E', 1),
(24, 'IL', 'ISRAEL', 3, 'E', 1),
(25, 'IT', 'ITALIA', 3, 'E', 1),
(26, 'JP', 'JAPON', 3, 'E', 1),
(27, 'MX', 'MEXICO', 4, 'E', 1),
(28, 'NI', 'NICARAGUA', 4, 'E', 1),
(29, 'NL', 'PAISES BAJOS', 3, 'E', 1),
(30, 'PA', 'PANAMA', 4, 'E', 1),
(31, 'PY', 'PARAGUAY', 4, 'E', 1),
(32, 'PE', 'PERU', 4, 'E', 1),
(33, 'PT', 'PORTUGAL', 3, 'E', 1),
(34, 'PR', 'PUERTO RICO', 4, 'E', 1),
(35, 'GB', 'REINO UNIDO', 3, 'E', 1),
(36, 'RU', 'RUSIA', 3, 'E', 1),
(37, 'ZA', 'SUDAFRICA', 3, 'E', 1),
(38, 'UY', 'URUGUAY', 4, 'E', 1),
(39, 'VE', 'VENEZUELA', 4, 'E', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pyvpartidas`
--

CREATE TABLE IF NOT EXISTS `pyvpartidas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(8) NOT NULL,
  `partida` varchar(100) NOT NULL,
  `descripcion` text,
  `estado` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_partida` (`codigo`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Volcado de datos para la tabla `pyvpartidas`
--

INSERT INTO `pyvpartidas` (`id`, `codigo`, `partida`, `descripcion`, `estado`) VALUES
(1, '22110', 'Pasajes al Interior del Pais', 'Costos de pasajes cuyos destinos finales sean ciudades del Estado boliviano.', 1),
(2, '22120', 'Pasajes al Exterior del Pais', 'Costos de pasajes cuyos destinos finales sean ciudades en el exterior del Pais.', 1),
(3, '22210', 'Viaticos por Viajes al Interior del Pais', '', 1),
(4, '22220', 'Viaticos por Viajes al Exterior del Pais', '', 1),
(5, '26910', 'Gastos de Representacion', 'Se incluyen los gastos de representación autorizados expresamente por las disposiciones legales vigentes', 1),
(6, '23400', 'Otros Alquileres', 'Alquileres no especificados', 1),
(7, '25210', 'Consultorias porProducto', 'Gastos destinados a la contratacion de terceros', 1),
(8, '31120', 'Gastos por Alimentacion y Otros Similares', 'Efectuados en reuniones, seminarios y otros eventos', 1),
(9, '11220', 'Bono de Antiguedad', 'Remuneracion determinada sobre la calificacion de anios de servicios prestados por el servidor publico y sujeto a una escala porcentual establecida', 1),
(10, '11400', 'Aguinaldos', 'Retribucion extraordinaria anual de acuerdo a disposiciones legales vigentes', 1),
(11, '11600', 'Asignaciones familiares', 'Prestaciones pagadas al trabajador por concepto de subsidios de Prenatal, Natalidad, Lactancia y Sepelio, de acuerdo a normativa vigente.', 1),
(12, '11700', 'Sueldos', 'Esta partida sera utilizada para asignar el sueldo o salario basico mensual de los funcionarios publicos sobre la base de escala salarial aprobada, de acuerdo a normativa vigente', 1),
(13, '12100', 'Personal Eventual', '', 1),
(14, '13110', 'Regimen de Corto Plazo (Salud)', '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pyvpasajes`
--

CREATE TABLE IF NOT EXISTS `pyvpasajes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pyvfucov` int(11) NOT NULL,
  `tipo_pasaje` varchar(15) NOT NULL,
  `tramo_viaje` varchar(15) DEFAULT NULL,
  `empresa_salida` varchar(50) DEFAULT NULL,
  `num_boleto_salida` varchar(20) DEFAULT NULL,
  `costo_salida` float(10,2) DEFAULT NULL,
  `fecha_salida` date NOT NULL,
  `hora_salida` time NOT NULL,
  `empresa_retorno` varchar(20) DEFAULT NULL,
  `num_boleto_retorno` varchar(20) DEFAULT NULL,
  `fecha_retorno` date NOT NULL,
  `hora_retorno` time NOT NULL,
  `costo_retorno` float(10,2) DEFAULT NULL,
  `reservado_por` varchar(100) DEFAULT NULL,
  `estado_pasaje` tinyint(1) NOT NULL,
  `justificacion` text,
  `nota_debito` varchar(150) DEFAULT NULL,
  `multas` float(10,2) DEFAULT NULL,
  `costo_final` float(10,2) DEFAULT NULL,
  `etapa_proceso` varchar(30) NOT NULL,
  `id_zona` int(11) DEFAULT NULL,
  `localidad_origen` varchar(50) NOT NULL,
  `dep_origen` varchar(50) NOT NULL,
  `id_pais_origen` int(11) NOT NULL,
  `localidad_destino` varchar(50) NOT NULL,
  `dep_destino` varchar(50) NOT NULL,
  `id_pais_destino` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Volcado de datos para la tabla `pyvpasajes`
--

INSERT INTO `pyvpasajes` (`id`, `id_pyvfucov`, `tipo_pasaje`, `tramo_viaje`, `empresa_salida`, `num_boleto_salida`, `costo_salida`, `fecha_salida`, `hora_salida`, `empresa_retorno`, `num_boleto_retorno`, `fecha_retorno`, `hora_retorno`, `costo_retorno`, `reservado_por`, `estado_pasaje`, `justificacion`, `nota_debito`, `multas`, `costo_final`, `etapa_proceso`, `id_zona`, `localidad_origen`, `dep_origen`, `id_pais_origen`, `localidad_destino`, `dep_destino`, `id_pais_destino`) VALUES
(1, 16, 'aereo', '0', '0', '0', 0.00, '0000-00-00', '00:00:00', NULL, NULL, '0000-00-00', '00:00:00', 0.00, '0', 0, '0', '0', 0.00, 0.00, '', 1, 'La Paz', 'La Paz', 1, 'Cochabamba', 'Cochabamba', 1),
(2, 17, 'aereo', '0', '0', '0', 0.00, '0000-00-00', '00:00:00', NULL, NULL, '0000-00-00', '00:00:00', 0.00, '0', 0, '0', '0', 0.00, 0.00, '', 1, 'La Paz', 'La Paz', 1, 'Cochabamba', 'Cochabamba', 1),
(3, 18, 'aereo', '0', '0', '0', 0.00, '0000-00-00', '00:00:00', NULL, NULL, '0000-00-00', '00:00:00', 0.00, '0', 0, '0', '0', 0.00, 0.00, '', 2, 'La Paz', 'La Paz', 1, 'Cochabamba', 'Cochabamba', 1),
(4, 19, 'aereo', '0', '0', '0', 0.00, '0000-00-00', '00:00:00', NULL, NULL, '0000-00-00', '00:00:00', 0.00, '0', 0, '0', '0', 0.00, 0.00, '', 1, 'La Paz', 'La Paz', 1, 'Cochabamba', 'Cochabamba', 1),
(5, 0, 'aereo', '', 'AEROSUR', '123TY', 250.00, '2013-06-27', '07:30:00', 'AEROSUR', '456UL', '2013-06-27', '12:30:00', 300.00, '', 1, 'Ninguna', 'Ninguna', 0.00, 0.00, 'PASAJE ASIGNADO', 1, 'La Paz', 'La Paz', 1, 'Cochabamba', 'Cochabamba', 1),
(6, 0, 'aereo', '', 'AEROSUR', '123TY', 240.00, '2013-06-27', '07:30:00', 'AEROSUR', '456UL', '2013-06-27', '12:30:00', 250.00, '', 1, 'Ninguna', 'Ninguna', 0.00, 0.00, 'PASAJE ASIGNADO', 1, 'La Paz', 'La Paz', 1, 'Cochabamba', 'Cochabamba', 1),
(7, 24, 'vehiculo', '', 'AEROSUR', '123TY', 240.00, '2013-06-28', '07:00:00', 'AEROSUR', '456UL', '2013-06-29', '17:30:00', 290.00, '', 1, 'Ninguna', 'Ninguna', 0.00, 0.00, 'PASAJE ASIGNADO', 1, 'La Paz', 'La Paz', 1, 'Cochabamba', 'Cochabamba', 1),
(8, 25, 'aereo', '', 'AEROSUR', '789 YH', 600.00, '2013-06-28', '07:00:00', '', '', '2013-06-29', '15:30:00', 0.00, '', 1, 'Ninguna', 'Ninguna', 0.00, 0.00, 'PASAJE ASIGNADO', 1, 'La Paz', 'La Paz', 1, 'Warnes', 'Santa Cruz', 1),
(9, 26, 'aereo', '', 'AEROSUR', '123TY', 250.00, '2013-06-28', '07:00:00', 'AEROSUR', '456UL', '2013-06-29', '19:00:00', 300.00, '', 1, 'Ninguna', 'Ninguna', 0.00, 0.00, 'PASAJE ASIGNADO', 1, 'La Paz', 'La Paz', 1, 'Santa Cruz de la Sierra', 'Santa Cruz', 1),
(10, 27, 'aereo', '', '', '456TYU', 250.00, '2013-06-28', '07:30:00', '', '789WER', '2013-06-29', '18:00:00', 300.00, '', 1, 'Ninguna', 'Ninguna', 0.00, 0.00, 'PASAJE ASIGNADO', 1, 'La Paz', 'La Paz', 1, 'Cochabamba', 'Cochabamba', 1),
(11, 28, 'aereo', '', 'AEROSUR', '123 TYU', 500.00, '2013-06-28', '07:00:00', 'AEROSUR', '456 JKL', '2013-06-29', '17:30:00', 700.00, '', 1, 'Ninguna', 'Ninguna', 0.00, 0.00, 'PASAJE ASIGNADO', 1, 'La Paz', 'La Paz', 1, 'Santa Cruz de la Sierra', 'Santa Cruz', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pyvtipocambio`
--

CREATE TABLE IF NOT EXISTS `pyvtipocambio` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `us` float NOT NULL,
  `bs` float NOT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `pyvtipocambio`
--

INSERT INTO `pyvtipocambio` (`id`, `us`, `bs`, `fecha_registro`, `estado`) VALUES
(1, 1, 6.96, '2013-06-19 12:23:00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pyvunidadfuncional`
--

CREATE TABLE IF NOT EXISTS `pyvunidadfuncional` (
  `id` int(11) NOT NULL,
  `unidad_ejecutora` tinyint(1) DEFAULT NULL,
  `ue_presupuestaria` int(10) DEFAULT NULL,
  `ue` tinyint(1) DEFAULT NULL,
  `codigo_ue` varchar(3) DEFAULT NULL,
  `da` tinyint(1) DEFAULT NULL,
  `codigo_da` varchar(3) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `id_estructura_programatica` int(10) DEFAULT NULL,
  `id_oficina` int(11) DEFAULT NULL,
  `id_entidad` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pyvunidadfuncional`
--

INSERT INTO `pyvunidadfuncional` (`id`, `unidad_ejecutora`, `ue_presupuestaria`, `ue`, `codigo_ue`, `da`, `codigo_da`, `estado`, `id_estructura_programatica`, `id_oficina`, `id_entidad`) VALUES
(1, 1, 104, 0, NULL, 0, NULL, 1, 0, 104, 1),
(2, 1, 105, 0, NULL, 0, NULL, 1, 0, 105, 1),
(3, 1, 106, 0, NULL, 0, NULL, 1, 0, 106, 1),
(4, 1, 107, 0, NULL, 0, NULL, 1, 0, 107, 1),
(5, 1, 108, 1, '001', 1, '01', 1, 0, 108, 1),
(6, 1, 109, 0, NULL, 0, NULL, 1, 0, 109, 1),
(7, 1, 110, 0, NULL, 0, NULL, 1, 0, 110, 1),
(8, 1, 111, 0, NULL, 0, NULL, 1, 0, 111, 1),
(9, 1, 112, 0, NULL, 0, NULL, 1, 0, 112, 1),
(10, 1, 113, 0, NULL, 0, NULL, 1, 0, 113, 1),
(11, 0, 108, 0, NULL, 0, NULL, 1, 0, 114, 1),
(12, 0, 108, 0, NULL, 0, NULL, 1, 0, 115, 1),
(13, 0, 108, 0, NULL, 0, NULL, 1, 0, 116, 1),
(14, 0, 109, 0, NULL, 0, NULL, 1, 0, 117, 1),
(15, 0, 110, 0, NULL, 0, NULL, 1, 0, 118, 1),
(16, 0, 110, 0, NULL, 0, NULL, 1, 0, 119, 1),
(17, 0, 110, 0, NULL, 0, NULL, 1, 0, 120, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pyvzona`
--

CREATE TABLE IF NOT EXISTS `pyvzona` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `zona` varchar(250) NOT NULL DEFAULT '',
  `tipo_viaje` varchar(10) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `pyvzona`
--

INSERT INTO `pyvzona` (`id`, `zona`, `tipo_viaje`, `estado`) VALUES
(1, 'Interdepartamental', 'I', 1),
(2, 'Interior del Departamento', 'I', 1),
(3, 'Europa-Asia-Africa-Estados Unidos', 'E', 1),
(4, 'Centro America-Sudamerica-Caribe', 'E', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reportes`
--

CREATE TABLE IF NOT EXISTS `reportes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dependencia` int(1) DEFAULT NULL,
  `accion` varchar(30) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `nivel` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `reportes`
--

INSERT INTO `reportes` (`id`, `dependencia`, `accion`, `nombre`, `nivel`) VALUES
(1, 0, 'pendientes_oficina', 'Pendientes de mi oficina', 1),
(2, 1, 'pendientes', 'Mis pendientes', 1),
(3, 0, 'archivados_oficina', 'Documentacion archivada de la Oficina', 1),
(4, 1, 'archivados', 'Mi documentacion archivada', 1),
(5, 0, 'norecep_oficina', 'Documentacion no recepcionada de mi oficina', 1),
(6, 1, 'norecepcionados', 'Documentacion no recepcionada', 1),
(7, 0, 'Recibidos Hoy', 'Documentacion recibida hoy', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`) VALUES
(1, 'login', 'Usuario'),
(2, 'usuario', 'Usuario común'),
(3, 'jefe', 'Jefe de Oficina(Area, Unidad, Dirección)'),
(4, 'ventanilla', 'Ventanilla'),
(5, 'despacho', 'Despacho Ministerial');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles_users`
--

CREATE TABLE IF NOT EXISTS `roles_users` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `fk_role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `roles_users`
--

INSERT INTO `roles_users` (`user_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(7, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seguimiento`
--

CREATE TABLE IF NOT EXISTS `seguimiento` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_seguimiento` bigint(20) DEFAULT NULL,
  `nur` varchar(25) NOT NULL,
  `derivado_por` int(11) DEFAULT NULL,
  `nombre_emisor` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `cargo_emisor` varchar(80) DEFAULT NULL,
  `fecha_emision` datetime DEFAULT NULL,
  `derivado_a` int(11) DEFAULT NULL,
  `nombre_receptor` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `cargo_receptor` varchar(80) DEFAULT NULL,
  `fecha_recepcion` datetime DEFAULT NULL,
  `estado` int(4) DEFAULT NULL,
  `accion` int(4) DEFAULT NULL,
  `oficial` int(4) DEFAULT NULL,
  `hijo` varchar(30) DEFAULT NULL,
  `proveido` text,
  `archivos` varchar(255) DEFAULT NULL,
  `adjuntos` varchar(255) DEFAULT NULL,
  `de_oficina` varchar(150) DEFAULT NULL,
  `padre` bigint(20) unsigned DEFAULT '0',
  `a_oficina` varchar(150) DEFAULT NULL,
  `id_archivo` int(11) DEFAULT '0',
  `id_de_oficina` int(11) DEFAULT NULL,
  `id_a_oficina` int(11) DEFAULT NULL,
  `prioridad` int(2) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT AUTO_INCREMENT=66 ;

--
-- Volcado de datos para la tabla `seguimiento`
--

INSERT INTO `seguimiento` (`id`, `id_seguimiento`, `nur`, `derivado_por`, `nombre_emisor`, `cargo_emisor`, `fecha_emision`, `derivado_a`, `nombre_receptor`, `cargo_receptor`, `fecha_recepcion`, `estado`, `accion`, `oficial`, `hijo`, `proveido`, `archivos`, `adjuntos`, `de_oficina`, `padre`, `a_oficina`, `id_archivo`, `id_de_oficina`, `id_a_oficina`, `prioridad`) VALUES
(1, 0, 'MDPyEP/2013-0000', 2, 'Antonio Garcia M.', 'Encargado de Sistemas', '2013-01-29 16:47:00', 3, 'Ana Teresa Morales Olivera', 'Ministra', '2013-01-29 16:49:26', 2, 1, 1, '0', '', NULL, '[]', NULL, 0, 'DIRECCION GENERAL EJECUTIVA', 0, NULL, 79, 0),
(2, 0, 'MDPyEP/2013-00005', 4, 'Jhilda Murillo Zarate', 'Directora General Ejecutiva', '2013-01-30 11:46:27', 3, 'Ana Teresa Morales Olivera', 'Ministra', '2013-01-30 11:56:10', 2, 1, 1, '0', '123', NULL, '[]', 'DIRECCION GENERAL EJECUTIVA', 0, 'DIRECCION GENERAL EJECUTIVA', 0, 79, 79, 0),
(3, 0, 'MDPyEP/2013-00006', 4, 'Jhilda Murillo Zarate', 'Directora General Ejecutiva', '2013-01-30 11:54:47', 3, 'Ana Teresa Morales Olivera', 'Ministra', '2013-01-30 11:56:16', 2, 1, 1, '0', '456', NULL, '[]', 'DIRECCION GENERAL EJECUTIVA', 0, 'DIRECCION GENERAL EJECUTIVA', 0, 79, 79, 1),
(4, 2, 'MDPyEP/2013-00005', 3, 'Ana Teresa Morales Olivera', 'Ministra', '2013-01-30 11:58:09', 4, 'Jhilda Murillo Zarate', 'Directora General Ejecutiva', '2013-01-30 11:59:06', 4, 1, 0, '0', '', NULL, '[]', 'DIRECCION GENERAL EJECUTIVA', 0, 'DIRECCION GENERAL EJECUTIVA', 0, 79, 79, 0),
(5, 4, 'MDPyEP/2013-00005', 4, 'Jhilda Murillo Zarate', 'Directora General Ejecutiva', '2013-01-30 12:08:44', 3, 'Ana Teresa Morales Olivera', 'Ministra', NULL, 1, 1, 0, '0', '678', NULL, '[]', 'DIRECCION GENERAL EJECUTIVA', 0, 'DIRECCION GENERAL EJECUTIVA', 0, 79, 79, 0),
(6, 0, 'SNP/2013-00002', 7, 'Carlos Ponce', 'ventanilla', '2013-01-30 15:35:12', 4, 'Jhilda Murillo Zarate', 'Directora General Ejecutiva', '2013-02-07 09:42:05', 2, 1, 1, '0', '', NULL, '[]', 'Ventanilla', 0, 'DIRECCION GENERAL EJECUTIVA', 0, 48, 79, 0),
(7, 0, 'SNP/2013-00001', 7, 'Carlos Ponce', 'ventanilla', '2013-01-30 15:41:25', 4, 'Jhilda Murillo Zarate', 'Directora General Ejecutiva', NULL, 1, 2, 0, '0', 'ML', NULL, '[]', 'Ventanilla', 0, 'DIRECCION GENERAL EJECUTIVA', 0, 48, 79, 0),
(8, 0, 'SNP/2013-00003', 7, 'Carlos Ponce', 'ventanilla', '2013-01-30 16:37:31', 4, 'Jhilda Murillo Zarate', 'Directora General Ejecutiva', NULL, 1, 5, 1, '0', '', NULL, '[]', 'Ventanilla', 0, 'DIRECCION GENERAL EJECUTIVA', 0, 48, 79, 0),
(9, 0, 'SNP/2013-00004', 7, 'Carlos Ponce', 'ventanilla', '2013-02-08 11:43:37', 4, 'Jhilda Murillo Zarate', 'Directora General Ejecutiva', NULL, 1, 1, 1, '0', '', NULL, '[]', 'Ventanilla', 0, 'DIRECCION GENERAL EJECUTIVA', 0, 48, 79, 0),
(11, 0, 'ZFC/2013-00006', 15, 'Juan Carlos', 'Profesional Auditor Senior', '2013-02-20 09:17:06', 14, 'Luis Fernando', 'Jefe Unidad Auditoria Interna', '2013-02-20 10:12:14', 10, 1, 1, '1', 'para su atención e Informe', NULL, '["CAR\\/ZFC\\/UAI N\\u00ba 0001\\/2013"]', 'UNIDAD DE AUDITORIA INTERNA', 0, 'UNIDAD DE AUDITORIA INTERNA', 1, 101, 101, 0),
(12, 0, 'ZFC/2013-00005', 15, 'Juan Carlos', 'Profesional Auditor Senior', '2013-02-20 09:18:02', 14, 'Luis Fernando', 'Jefe Unidad Auditoria Interna', '2013-02-20 10:12:08', 10, 1, 1, '0', 'para su atención y seguimiento', NULL, '[]', 'UNIDAD DE AUDITORIA INTERNA', 0, 'UNIDAD DE AUDITORIA INTERNA', 2, 101, 101, 1),
(13, 0, 'ZFC/2013-00004', 15, 'Juan Carlos', 'Profesional Auditor Senior', '2013-02-20 09:18:48', 14, 'Luis Fernando', 'Jefe Unidad Auditoria Interna', '2013-02-20 10:06:27', 4, 1, 2, '0', 'para su atencion e Informe', NULL, '[]', 'UNIDAD DE AUDITORIA INTERNA', 0, 'UNIDAD DE AUDITORIA INTERNA', 0, 101, 101, 0),
(14, 0, 'IBM/2013-00005', 22, 'Maria Fernanda', 'Tecnico Metrología Legal I', '2013-02-20 09:27:19', 19, 'Carlos Eduardo', 'Responsable Regional Cochabamba', '2013-02-20 09:34:00', 4, 1, 2, '0', '', NULL, '[]', 'REGIONAL COCHABAMBA', 0, 'REGIONAL COCHABAMBA', 0, 103, 103, 0),
(15, 0, 'IBM/2013-00004', 22, 'Maria Fernanda', 'Tecnico Metrología Legal I', '2013-02-20 09:28:46', 19, 'Carlos Eduardo', 'Responsable Regional Cochabamba', '2013-02-20 09:33:55', 4, 5, 2, '0', 'para su conocimiento y respuesta', NULL, '[]', 'REGIONAL COCHABAMBA', 0, 'REGIONAL COCHABAMBA', 0, 103, 103, 0),
(16, 15, 'IBM/2013-00004', 19, 'Carlos Eduardo', 'Responsable Regional Cochabamba', '2013-02-20 09:35:15', 14, 'Luis Fernando', 'Jefe Unidad Auditoria Interna', '2013-02-20 12:32:47', 6, 1, 1, '1', 'para su atención y respuesta', NULL, '[]', 'REGIONAL COCHABAMBA', 0, 'UNIDAD DE AUDITORIA INTERNA', 0, 103, 101, 0),
(18, 14, 'IBM/2013-00005', 19, 'Carlos Eduardo', 'Responsable Regional Cochabamba', '2013-02-20 09:39:50', 14, 'Luis Fernando', 'Jefe Unidad Auditoria Interna', '2013-02-20 10:40:44', 6, 1, 1, '0', 'para su atención e Informe', NULL, '[]', 'REGIONAL COCHABAMBA', 0, 'UNIDAD DE AUDITORIA INTERNA', 0, 103, 101, 0),
(19, 0, 'ZFC/2013-00003', 15, 'Juan Carlos', 'Profesional Auditor Senior', '2013-02-20 09:47:16', 14, 'Luis Fernando', 'Jefe Unidad Auditoria Interna', '2013-02-20 10:12:04', 6, 1, 0, '0', 'para su atencio e Informe', NULL, '[]', 'UNIDAD DE AUDITORIA INTERNA', 0, 'UNIDAD DE AUDITORIA INTERNA', 0, 101, 101, 0),
(20, 13, 'ZFC/2013-00004', 14, 'Luis Fernando', 'Jefe Unidad Auditoria Interna', '2013-02-20 12:08:14', 19, 'Carlos Eduardo', 'Responsable Regional Cochabamba', '2013-02-20 12:31:08', 6, 1, 1, '0', 'Para su atención e Informe.', NULL, '[]', 'UNIDAD DE AUDITORIA INTERNA', 0, 'REGIONAL COCHABAMBA', 0, 101, 103, 0),
(21, 0, 'IBM/2013-00007', 22, 'Maria Fernanda', 'Tecnico Metrología Legal I', '2013-02-20 12:26:26', 19, 'Carlos Eduardo', 'Responsable Regional Cochabamba', '2013-02-20 12:31:13', 4, 2, 2, '0', '', NULL, '[]', 'REGIONAL COCHABAMBA', 0, 'REGIONAL COCHABAMBA', 0, 103, 103, 0),
(22, 0, 'ZFC/2013-00009', 16, 'Karla Patricia', 'Supervisor Auditoria Interna', '2013-02-20 12:30:39', 14, 'Luis Fernando', 'Jefe Unidad Auditoria Interna', '2013-02-20 12:32:52', 6, 1, 1, '1', 'para su conocimiento.', NULL, '[]', 'UNIDAD DE AUDITORIA INTERNA', 0, 'UNIDAD DE AUDITORIA INTERNA', 0, 101, 101, 0),
(23, 21, 'IBM/2013-00007', 19, 'Carlos Eduardo', 'Responsable Regional Cochabamba', '2013-02-20 12:32:12', 14, 'Luis Fernando', 'Jefe Unidad Auditoria Interna', '2013-02-20 12:32:57', 6, 2, 1, '0', 'para su atención e informe.', NULL, '[]', 'REGIONAL COCHABAMBA', 0, 'UNIDAD DE AUDITORIA INTERNA', 0, 103, 101, 0),
(24, 0, 'IBM/2013-00001', 21, 'Jose María', 'Supervisor Técnico', '2013-02-20 15:49:08', 19, 'Carlos Eduardo', 'Responsable Regional Cochabamba', '2013-02-20 15:50:24', 2, 1, 1, '1', '', NULL, '[]', 'REGIONAL COCHABAMBA', 0, 'REGIONAL COCHABAMBA', 0, 103, 103, 0),
(25, 0, 'ZFC/2013-00003', 15, 'Juan Carlos', 'Profesional Auditor Senior', '2013-02-20 17:36:52', 14, 'Luis Fernando', 'Jefe Unidad Auditoria Interna', '2013-02-01 08:56:01', 2, 1, 1, '0', '', NULL, '[]', 'UNIDAD DE AUDITORIA INTERNA', 0, 'UNIDAD DE AUDITORIA INTERNA', 0, 101, 101, 0),
(26, 0, 'ZFC/2013-00010', 14, 'Luis Fernando', 'Jefe Unidad Auditoria Interna', '2013-02-20 17:52:12', 15, 'Juan Carlos', 'Profesional Auditor Senior', '2013-02-20 17:52:41', 4, 1, 2, '0', 'Para su conocimiento.', NULL, '[]', 'UNIDAD DE AUDITORIA INTERNA', 0, 'UNIDAD DE AUDITORIA INTERNA', 0, 101, 101, 0),
(27, 0, 'ZFC/2013-00014', 15, 'Juan Carlos', 'Profesional Auditor Senior', '2013-02-22 18:06:24', 14, 'Luis Fernando', 'Jefe Unidad Auditoria Interna', '2013-02-21 18:07:38', 2, 4, 1, '0', 'para su concideración', NULL, '[]', 'UNIDAD DE AUDITORIA INTERNA', 0, 'UNIDAD DE AUDITORIA INTERNA', 0, 101, 101, 0),
(28, 26, 'ZFC/2013-00010', 15, 'Juan Carlos', 'Profesional Auditor Senior', '2013-02-20 18:17:31', 14, 'Luis Fernando', 'Jefe Unidad Auditoria Interna', '2013-02-20 18:17:53', 4, 1, 2, '0', 'para su atención e Informe', NULL, '[]', 'UNIDAD DE AUDITORIA INTERNA', 0, 'UNIDAD DE AUDITORIA INTERNA', 0, 101, 101, 0),
(29, 28, 'ZFC/2013-00010', 14, 'Luis Fernando', 'Jefe Unidad Auditoria Interna', '2013-02-20 18:19:20', 16, 'Karla Patricia', 'Supervisor Auditoria Interna', '2013-02-21 09:09:27', 2, 1, 1, '0', 'para su atención', NULL, '[]', 'UNIDAD DE AUDITORIA INTERNA', 0, 'UNIDAD DE AUDITORIA INTERNA', 0, 101, 101, 0),
(30, 0, 'ZFC/2013-00017', 17, 'Juan Perez', 'Tecnico Auditor Junior', '2013-02-21 09:08:12', 14, 'Luis Fernando', 'Jefe Unidad Auditoria Interna', '2013-02-20 09:24:30', 2, 3, 1, '0', '', NULL, '[]', 'UNIDAD DE AUDITORIA INTERNA', 0, 'UNIDAD DE AUDITORIA INTERNA', 0, 101, 101, 0),
(31, 0, 'ZFC/2013-00018', 16, 'Karla Patricia', 'Supervisor Auditoria Interna', '2013-02-21 09:11:39', 14, 'Luis Fernando', 'Jefe Unidad Auditoria Interna', '2013-02-21 09:12:17', 2, 1, 0, '0', '', NULL, '[]', 'UNIDAD DE AUDITORIA INTERNA', 0, 'UNIDAD DE AUDITORIA INTERNA', 0, 101, 101, 0),
(32, 0, 'ZFC/2013-00019', 15, 'Juan Carlos', 'Profesional Auditor Senior', '2013-02-21 09:23:50', 14, 'Luis Fernando', 'Jefe Unidad Auditoria Interna', '2013-02-21 09:24:43', 2, 1, 1, '0', '', NULL, '[]', 'UNIDAD DE AUDITORIA INTERNA', 0, 'UNIDAD DE AUDITORIA INTERNA', 0, 101, 101, 0),
(33, 0, 'ZFC/2013-00020', 14, 'Luis Fernando', 'Jefe Unidad Auditoria Interna', '2013-02-21 09:30:24', 16, 'Karla Patricia', 'Supervisor Auditoria Interna', '2013-02-21 09:39:41', 4, 1, 2, '0', 'para su atencion', NULL, '[]', 'UNIDAD DE AUDITORIA INTERNA', 0, 'UNIDAD DE AUDITORIA INTERNA', 0, 101, 101, 0),
(34, 0, 'ZFC/2013-00021', 16, 'Karla Patricia', 'Supervisor Auditoria Interna', '2013-02-21 09:43:08', 14, 'Luis Fernando', 'Jefe Unidad Auditoria Interna', '2013-02-21 09:43:29', 4, 4, 2, '0', 'revision de informe', NULL, '[]', 'UNIDAD DE AUDITORIA INTERNA', 0, 'UNIDAD DE AUDITORIA INTERNA', 0, 101, 101, 0),
(35, 34, 'ZFC/2013-00021', 14, 'Luis Fernando', 'Jefe Unidad Auditoria Interna', '2013-02-21 09:44:51', 15, 'Juan Carlos', 'Profesional Auditor Senior', '2013-02-21 09:45:36', 2, 3, 1, '0', 'Revisión de Informe', NULL, '[]', 'UNIDAD DE AUDITORIA INTERNA', 0, 'UNIDAD DE AUDITORIA INTERNA', 0, 101, 101, 0),
(41, 33, 'ZFC/2013-00020', 16, 'Karla Patricia', 'Supervisor Auditoria Interna', '2013-02-22 12:17:10', 14, 'Luis Fernando', 'Jefe Unidad Auditoria Interna', NULL, 1, 1, 1, '0', 'para su conocimiento', NULL, '["INF\\/ZFC\\/UAI N\\u00ba 0005\\/2013"]', 'UNIDAD DE AUDITORIA INTERNA', 0, 'UNIDAD DE AUDITORIA INTERNA', 0, 101, 101, 0),
(47, 0, 'IBM/2013-00006', 24, 'Jose Luis', 'correspondencia', '2013-03-20 14:48:48', 14, 'Luis Fernando', 'Jefe Unidad Auditoria Interna', NULL, 1, 3, 1, '0', 'Para su atencion e informe.', NULL, '[]', 'REGIONAL COCHABAMBA', 0, 'UNIDAD DE AUDITORIA INTERNA', 0, 103, 101, 1),
(48, 0, 'E-IBM/2013-00012', 24, 'Jose Luis', 'correspondencia', '2013-03-20 15:07:58', 14, 'Luis Fernando', 'Jefe Unidad Auditoria Interna', NULL, 1, 2, 1, '0', 'Para su atencion Informe.', NULL, '["XIBM\\/2013-00003"]', 'REGIONAL COCHABAMBA', 0, 'UNIDAD DE AUDITORIA INTERNA', 0, 103, 101, 0),
(50, 0, 'IBM/2013-00010', 21, 'Jose María', 'Supervisor Técnico', '2013-05-20 16:24:41', 19, 'Carlos Eduardo', 'Responsable Regional Cochabamba', NULL, 1, 1, 1, '0', 'para su atencion e informe', NULL, '[]', 'REGIONAL COCHABAMBA', 0, 'REGIONAL COCHABAMBA', 0, 103, 103, 0),
(52, 0, 'MDPyEP/2013-00011', 37, 'Juan Carlos Chavez Iporre', 'Jefe de la Unidad Financiera', '2013-06-04 03:08:28', 38, 'Norma Flores Marcani', 'Secretaria de la Unidad Financiera', '2013-06-04 03:10:49', 4, 2, 2, '0', 'para el llenado del formulario', NULL, '[]', 'UNIDAD FINANCIERA', 0, 'UNIDAD FINANCIERA', 0, 114, 114, 0),
(53, 52, 'MDPyEP/2013-00011', 38, 'Norma Flores Marcani', 'Secretaria de la Unidad Financiera', '2013-06-04 03:37:40', 37, 'Juan Carlos Chavez Iporre', 'Jefe de la Unidad Financiera', '2013-06-04 03:51:13', 4, 5, 2, '0', 'el formulario fue llenado', NULL, '[]', 'UNIDAD FINANCIERA', 0, 'UNIDAD FINANCIERA', 0, 114, 114, 0),
(54, 53, 'MDPyEP/2013-00011', 37, 'Juan Carlos Chavez Iporre', 'Jefe de la Unidad Financiera', '2013-06-04 03:55:02', 39, 'Jose Elias Stolzer', 'Profesional encargado de presupuesto', NULL, 1, 6, 1, '0', 'aprovado para el calculo de viaticos', NULL, '[]', 'UNIDAD FINANCIERA', 0, 'UNIDAD FINANCIERA', 0, 114, 114, 0),
(55, 0, 'MDPyEP/2013-00034', 35, 'Walter Erick Quevedo Flores', 'Director General de Asuntos Administrativos', '2013-06-05 11:15:28', 36, 'Maria Elena Alfaro Castillo', 'Secretaria D.G.A.A.', '2013-06-05 11:33:00', 4, 1, 2, '0', 'llenar formulario de pasajes y viáticos', NULL, '[]', 'DIRECCION GENERAL DE ASUNTOS ADMINISTRATIVOS', 0, 'DIRECCION GENERAL DE ASUNTOS ADMINISTRATIVOS', 0, 108, 108, 0),
(56, 0, 'MDPyEP/2013-00032', 35, 'Walter Erick Quevedo Flores', 'Director General de Asuntos Administrativos', '2013-06-10 09:36:11', 36, 'Maria Elena Alfaro Castillo', 'Secretaria D.G.A.A.', '2013-06-12 11:46:35', 2, 1, 1, '0', 'Proceso de Adquisicion 100613', NULL, '["INF\\/DGAA N\\u00ba 0001\\/2013"]', 'DIRECCION GENERAL DE ASUNTOS ADMINISTRATIVOS', 0, 'DIRECCION GENERAL DE ASUNTOS ADMINISTRATIVOS', 0, 108, 108, 0),
(58, 55, 'MDPyEP/2013-00034', 36, 'Maria Elena Alfaro Castillo', 'Secretaria D.G.A.A.', '2013-06-12 09:21:52', 35, 'Walter Erick Quevedo Flores', 'Director General de Asuntos Administrativos', '2013-06-28 09:11:16', 2, 1, 1, '0', ' ', NULL, '[]', 'DIRECCION GENERAL DE ASUNTOS ADMINISTRATIVOS', 0, 'DIRECCION GENERAL DE ASUNTOS ADMINISTRATIVOS', 0, 108, 108, 0),
(59, 0, 'MDPyEP/2013-00211', 36, 'Maria Elena Alfaro Castillo', 'Secretaria D.G.A.A.', '2013-06-19 10:09:17', 35, 'Walter Erick Quevedo Flores', 'Director General de Asuntos Administrativos', '2013-06-19 10:09:46', 10, 1, 1, '0', 'viaje', NULL, '[]', 'DIRECCION GENERAL DE ASUNTOS ADMINISTRATIVOS', 0, 'DIRECCION GENERAL DE ASUNTOS ADMINISTRATIVOS', 3, 108, 108, 0),
(60, 0, 'MDPyEP/2013-00257', 32, 'Ariel Zabala David', 'Director General de Planificacion', '2013-06-27 15:25:44', 33, 'Rosario Jimena Tellez Quenallata', 'Secretaria Direccion General de Planificacion', '2013-06-27 16:12:41', 4, 1, 2, '0', 'Para el llenado de formulario FUCOV.', NULL, '[]', 'DIRECCION GENERAL DE PLANIFICACION', 0, 'DIRECCION GENERAL DE PLANIFICACION', 0, 109, 109, 0),
(61, 60, 'MDPyEP/2013-00257', 33, 'Rosario Jimena Tellez Quenallata', 'Secretaria Direccion General de Planificacion', '2013-06-27 16:27:21', 32, 'Ariel Zabala David', 'Director General de Planificacion', '2013-06-27 16:38:25', 4, 1, 2, '0', 'Remito FUCOV 0001/2013 para su consideracion y fines consiguientes.', NULL, '["FCV\\/DGP N\\u00ba 0001\\/2013"]', 'DIRECCION GENERAL DE PLANIFICACION', 0, 'DIRECCION GENERAL DE PLANIFICACION', 0, 109, 109, 0),
(62, 61, 'MDPyEP/2013-00257', 32, 'Ariel Zabala David', 'Director General de Planificacion', '2013-06-27 16:39:38', 33, 'Rosario Jimena Tellez Quenallata', 'Secretaria Direccion General de Planificacion', '2013-06-27 16:39:53', 4, 1, 2, '0', 'Formulario Unico de Comision Viaje', NULL, '[]', 'DIRECCION GENERAL DE PLANIFICACION', 0, 'DIRECCION GENERAL DE PLANIFICACION', 0, 109, 109, 0),
(63, 62, 'MDPyEP/2013-00257', 33, 'Rosario Jimena Tellez Quenallata', 'Secretaria Direccion General de Planificacion', '2013-06-27 17:09:44', 32, 'Ariel Zabala David', 'Director General de Planificacion', '2013-06-27 17:10:01', 2, 1, 1, '0', 'Informe 2', NULL, '[]', 'DIRECCION GENERAL DE PLANIFICACION', 0, 'DIRECCION GENERAL DE PLANIFICACION', 0, 109, 109, 0),
(64, 0, 'MDPyEP/2013-00261', 33, 'Rosario Jimena Tellez Quenallata', 'Secretaria Direccion General de Planificacion', '2013-06-28 01:21:50', 32, 'Ariel Zabala David', 'Director General de Planificacion', NULL, 1, 1, 1, '0', 'Remito Fucov para su autorizacion', NULL, '[]', 'DIRECCION GENERAL DE PLANIFICACION', 0, 'DIRECCION GENERAL DE PLANIFICACION', 0, 109, 109, 0),
(65, 0, 'MDPyEP/2013-00264', 36, 'Maria Elena Alfaro Castillo', 'Secretaria D.G.A.A.', '2013-06-28 12:57:16', 35, 'Walter Erick Quevedo Flores', 'Director General de Asuntos Administrativos', '2013-06-28 15:52:15', 2, 1, 1, '0', 'Para su conocimiento', NULL, '[]', 'DIRECCION GENERAL DE ASUNTOS ADMINISTRATIVOS', 0, 'DIRECCION GENERAL DE ASUNTOS ADMINISTRATIVOS', 0, 108, 108, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE IF NOT EXISTS `sessions` (
  `session_id` varchar(24) NOT NULL,
  `last_active` int(10) unsigned NOT NULL,
  `contents` text NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_active` (`last_active`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `submenus`
--

CREATE TABLE IF NOT EXISTS `submenus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_menu` int(11) DEFAULT NULL,
  `submenu` varchar(30) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `accion` varchar(20) DEFAULT NULL,
  `habilitado` int(1) DEFAULT '1',
  `id_level` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=43 ;

--
-- Volcado de datos para la tabla `submenus`
--

INSERT INTO `submenus` (`id`, `id_menu`, `submenu`, `descripcion`, `accion`, `habilitado`, `id_level`) VALUES
(1, 2, 'Entrada', 'Lista de Correspondencia que aun no recibo', NULL, 0, 0),
(2, 2, 'Pendientes', 'Lista de correspondencia pendiente', 'pendientes', 0, 0),
(3, 3, 'Crear nuevo documento', 'Crear nuevo documento', 'nuevo', 1, 0),
(5, 3, 'Documentos creados', 'Todos mis documentos generados', NULL, 1, 0),
(7, 7, 'Lista de hojas de ruta', 'Mis hojas de ruta', NULL, 1, 0),
(11, 7, 'Imprimir hoja de ruta', 'Imprimir una hoja de ruta ', 'imprimir', 1, 0),
(12, 4, 'Pendientes Oficina', 'Pendientes de mi oficina y dependencias directas', 'pendientes_oficina', 1, 4),
(13, 8, 'Entidades', 'Lista de Entidades', 'entidades', 1, 1),
(14, 8, 'Oficinas', 'Lista de Oficinas', 'oficinas', 1, 1),
(15, 8, 'Usuarios', 'Lista General de usuario', 'user/list', 1, 0),
(16, 8, 'Destinatarios', 'Lista de Destinatarios para derivar', 'destinatarios', 1, 0),
(17, 2, 'Enviados', 'Corrrespondencia enviada que aun no fue recibida', 'enviados', 1, 0),
(18, 9, 'Recepcionar', 'Recepcionar documentos externos', NULL, 1, 0),
(19, 2, 'Archivados', 'Correspondencia archivada', 'archivos', 1, NULL),
(20, 4, 'Correspondencia Recibida', 'Correspondencia', 'recepcionada', 1, NULL),
(21, 4, 'Correspondencia Enviada', 'Buscar mediante criterios para el sistema', 'enviada', 1, NULL),
(22, 9, 'Pendientes', 'Lista de correspondencia recepcionada que falta derivar', 'pendientes', 1, NULL),
(23, 4, 'Personalizado', 'Gestionar mi propio reporte', 'personal', 1, NULL),
(24, 15, 'Documentacion', NULL, NULL, 1, NULL),
(26, 12, 'Documentacion Recibiba', 'Documentos Recepcionados por mi usuario', NULL, 1, 4),
(27, 100, 'Reporte General', 'Pendientes de la entidad', 'general', 1, NULL),
(29, 12, 'Correspondencia Enviada', NULL, 'enviada', 1, NULL),
(30, 1, 'Buscar', 'Formulario de busqueda', 'buscar', 1, NULL),
(31, 13, 'Cambiar Contrase&ntilde;a', 'Cambiar mi contrase&ntilde;a ', 'changePass', 1, NULL),
(32, 13, 'Cambiar mis datos', 'Cambiar nombre, cargo, email, mosca.', 'changeData', 1, NULL),
(33, 13, 'Salir', 'Salir del sistema', 'logout', 1, NULL),
(34, 9, 'Recepcionados', 'Lista de Correspondencia Recepcionada', 'listar', 1, NULL),
(35, 6, 'Enviados Recientemente', 'Lista de hojas de ruta enviados recientemente', 'ver', 1, NULL),
(36, 3, 'Archivos Digitales', 'Lista de archivos subidos', 'archivos', 1, NULL),
(37, 2, 'Agrupados', 'Lista de hojas de ruta agrupados', 'agrupados', 1, NULL),
(38, 8, 'Carpetas', 'Listado de carpetas', 'carpetas', 1, NULL),
(39, 19, 'Solicitudes de Viaticos', 'Solicitudes', '', 1, 0),
(40, 19, 'Crear Formulario', 'Crear Formulario de pasajes y viaticos', 'nuevo', 1, 0),
(41, 19, 'Informes de Descargo', 'Ver Informes', 'informes_pyv', 1, 0),
(42, 19, 'Ejecucion Presupuestaria', 'Presupuesto', 'epresupuesto', 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos`
--

CREATE TABLE IF NOT EXISTS `tipos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `abreviatura` varchar(3) DEFAULT NULL,
  `tipo` varchar(20) DEFAULT NULL,
  `plural` varchar(30) DEFAULT NULL,
  `action` varchar(20) NOT NULL DEFAULT '',
  `via` tinyint(1) DEFAULT '0',
  `activo` tinyint(1) DEFAULT '1',
  `prioridad` int(2) DEFAULT NULL,
  `doc` int(1) DEFAULT '0',
  `image` varchar(100) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`action`),
  UNIQUE KEY `ik2` (`action`),
  UNIQUE KEY `ik1` (`abreviatura`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Volcado de datos para la tabla `tipos`
--

INSERT INTO `tipos` (`id`, `abreviatura`, `tipo`, `plural`, `action`, `via`, `activo`, `prioridad`, `doc`, `image`, `descripcion`) VALUES
(1, 'CIR', 'Circular', 'Circulares', 'circular', 0, 1, 0, 0, 'circular_0.png', 'CIR/ENTIDAD/OFICINA N° Nro/Año'),
(2, 'MEM', 'Memorandum', 'Memorandums', 'memo', 0, 1, 0, 0, 'memo_0.png', 'MEM/ENTIDAD/OFICINA N° Nro/Año'),
(3, 'INF', 'Informe', 'Informes', 'informe', 1, 1, 0, 0, 'informe_0.png', 'INF/ENTIDAD/OFICINA N° Nro/Año'),
(4, 'NI', 'Nota Interna', 'Notas Internas', 'nota', 1, 1, 0, 0, 'nota_0.png', 'NI/ENTIDAD/OFICINA N° Nro/Año'),
(5, 'CAR', 'Carta', 'Cartas', 'carta', 0, 1, 0, 0, 'carta_1.png', 'ENTIDAD/OFICINA N° Nro/Año'),
(6, 'EXT', 'Doc. Externo', 'Documentos Externos', '../recepcion', 0, 1, 0, 1, 'carta_0.png', 'Recepcion de documentos externos'),
(7, 'E', 'NUR', 'NURs', 'nur', 0, 1, 1, 1, NULL, NULL),
(8, 'I', 'NURI', 'NURIs', 'nuris', 0, 1, 0, 1, NULL, NULL),
(9, 'INS', 'Instructivo', 'Intructivos', 'intructivo', 0, 1, 0, 0, NULL, 'INS/ENTIDAD/OFICINA N° Nro/Año'),
(10, 'CER', 'Certificacion', 'Certificaciones', 'certificacion', 0, 1, 0, 0, 'Certi_0.png', 'CER/ENTIDAD/OFICINA N° Nro/Año'),
(11, 'FCV', 'Fucov', 'Fucovs', 'fucov', 0, 1, 0, 0, 'fucov.png', 'FCV/ENTIDAD/OFICINA N° Nro/Año');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usermenu`
--

CREATE TABLE IF NOT EXISTS `usermenu` (
  `id_user` int(11) NOT NULL DEFAULT '0',
  `id_menu` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_user`,`id_menu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `superior` int(11) NOT NULL DEFAULT '0',
  `id_oficina` int(11) NOT NULL DEFAULT '0',
  `dependencia` tinyint(1) DEFAULT '1',
  `username` varchar(32) NOT NULL DEFAULT '',
  `password` varchar(64) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `last_login` int(10) unsigned DEFAULT NULL,
  `mosca` varchar(30) DEFAULT NULL,
  `cargo` varchar(90) DEFAULT NULL,
  `email` varchar(127) DEFAULT NULL,
  `logins` int(10) unsigned NOT NULL DEFAULT '0',
  `fecha_creacion` datetime DEFAULT NULL,
  `habilitado` tinyint(1) DEFAULT '1',
  `nivel` int(2) DEFAULT '2',
  `genero` varchar(10) DEFAULT 'hombre',
  `prioridad` int(1) DEFAULT '0',
  `id_entidad` int(3) NOT NULL,
  `super` int(1) DEFAULT '0',
  PRIMARY KEY (`id`,`superior`,`id_oficina`,`username`),
  UNIQUE KEY `uniq_username` (`username`),
  UNIQUE KEY `uniq_email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=44 ;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `superior`, `id_oficina`, `dependencia`, `username`, `password`, `nombre`, `last_login`, `mosca`, `cargo`, `email`, `logins`, `fecha_creacion`, `habilitado`, `nivel`, `genero`, `prioridad`, `id_entidad`, `super`) VALUES
(1, 2, 86, 0, 'admin', '7de9e3fed384f75bfa21907c41defd632cf254fedf5b46fbd3725352fe4d78f5', 'admin', 1372389952, 'IMCM', 'Administrador del sistema', 'freddy.velasco@produccion.gob.bo', 536, NULL, 1, 5, 'hombre', 0, 1, 0),
(2, 3, 86, 0, 'sistemas', '7de9e3fed384f75bfa21907c41defd632cf254fedf5b46fbd3725352fe4d78f5', 'Antonio Garcia M.', 1364240263, 'MGM', 'Encargado de Sistemas', 'sistemas@produccion.gob.bo', 846, NULL, 1, 3, 'hombre', 1, 1, 0),
(3, 0, 79, 0, 'despacho.ministerial', '007b6baae3261ca1587682eb1290d3ebcaf084a03db5b40522063d7bd0fa3316', 'Ana Teresa Morales Olivera', 1361458643, 'ATMO', 'Ministra', 'teresa.morales@produccion.gob.bo', 12, NULL, 1, 2, 'mujer', 1, 1, 0),
(4, 3, 79, 0, 'direccion.ejecutiva', '7de9e3fed384f75bfa21907c41defd632cf254fedf5b46fbd3725352fe4d78f5', 'Jhilda Murillo Zarate', 1364241270, 'JMZ', 'Directora General Ejecutiva', 'jhilda.murillo@produccion.gob.bo', 46, NULL, 1, 3, 'mujer', 0, 1, 0),
(7, 0, 48, 0, 'ventanilla.ventanilla', '5f42f9afb33811cece24690b415d01991843e2163ff0110e3d3e8995ebd0f4a8', 'Carlos Ponce', 1370271072, 'CPD', 'ventanilla', 'carlos.ponce@produccion.gob.bo', 16, '2013-01-30 12:35:44', 1, 4, 'hombre', 0, 2, 0),
(14, 0, 101, 0, 'zfc.auditoria.responsable', '5f42f9afb33811cece24690b415d01991843e2163ff0110e3d3e8995ebd0f4a8', 'Luis Fernando', 1370012558, 'LF', 'Jefe Unidad Auditoria Interna', 'luis.fernando@mail.com', 74, '2013-02-18 09:29:33', 0, 3, 'hombre', 0, 12, 0),
(15, 14, 101, 1, 'zfc.auditor.senior', '5f42f9afb33811cece24690b415d01991843e2163ff0110e3d3e8995ebd0f4a8', 'Juan Carlos', 1367250361, 'JC', 'Profesional Auditor Senior', 'juan.carlos@mail.com', 29, '2013-02-18 09:38:08', 1, 2, 'hombre', 0, 12, 0),
(16, 14, 101, 1, 'zfc.auditoria.supervisor', '5f42f9afb33811cece24690b415d01991843e2163ff0110e3d3e8995ebd0f4a8', 'Karla Patricia', 1363731620, 'KP', 'Supervisor Auditoria Interna', 'karla.patricia@mail.com', 11, '2013-02-18 09:40:36', 1, 2, 'mujer', 0, 12, 0),
(17, 14, 101, 1, 'zfc.auditor.junior1', '5f42f9afb33811cece24690b415d01991843e2163ff0110e3d3e8995ebd0f4a8', 'Juan Perez', 1361548187, 'JP', 'Tecnico Auditor Junior', 'juan.perez@mail.com', 2, '2013-02-18 09:42:03', 1, 2, 'hombre', 0, 12, 0),
(18, 14, 101, 1, 'zfc.auditoria.sria', '5f42f9afb33811cece24690b415d01991843e2163ff0110e3d3e8995ebd0f4a8', 'Ana Maria', NULL, 'AM', 'Secretaria de Area', 'ana.maria@mail.com', 0, '2013-02-18 09:43:30', 1, 2, 'mujer', 0, 12, 0),
(19, 0, 103, 0, 'ibm.regional.cbba', '5f42f9afb33811cece24690b415d01991843e2163ff0110e3d3e8995ebd0f4a8', 'Carlos Eduardo', 1363731602, 'CE', 'Responsable Regional Cochabamba', 'carlos.eduardo@mail.com', 21, '2013-02-18 10:16:56', 1, 3, 'hombre', 0, 3, 0),
(20, 19, 103, 1, 'ibm.regional.sria', '5f42f9afb33811cece24690b415d01991843e2163ff0110e3d3e8995ebd0f4a8', 'Paola Carola', NULL, 'PC', 'Secretaria de Unidad', 'paola.carola@mail.com', 0, '2013-02-18 10:22:29', 1, 2, 'mujer', 0, 3, 0),
(21, 19, 103, 1, 'ibm.supervisor', '5f42f9afb33811cece24690b415d01991843e2163ff0110e3d3e8995ebd0f4a8', 'Jose María', 1369081435, 'JM', 'Supervisor Técnico', 'jose.maria@mail.com', 8, '2013-02-18 10:25:00', 1, 2, 'hombre', 0, 3, 0),
(22, 19, 103, 1, 'ibm.metro.legal1', '5f42f9afb33811cece24690b415d01991843e2163ff0110e3d3e8995ebd0f4a8', 'Maria Fernanda', 1361548226, 'MF', 'Tecnico Metrología Legal I', 'maria.fernanda@mail.com', 9, '2013-02-18 10:28:27', 1, 2, 'mujer', 0, 3, 0),
(23, 19, 103, 1, 'ibm.metro.legal2', '5f42f9afb33811cece24690b415d01991843e2163ff0110e3d3e8995ebd0f4a8', 'Julio Cesar', NULL, 'JC', 'Tecnico Metrología Legal II', 'julio.cesar@mail.com', 0, '2013-02-18 10:29:31', 1, 2, 'hombre', 0, 3, 0),
(24, 19, 103, 1, 'ventanilla.cbba', '5f42f9afb33811cece24690b415d01991843e2163ff0110e3d3e8995ebd0f4a8', 'Jose Luis', 1364225686, 'JL', 'correspondencia', 'jose.luis@produccion.gob.bo', 12, '2013-03-19 14:51:30', 1, 4, 'hombre', 0, 3, 0),
(25, 0, 104, 0, 'despacho', '5f42f9afb33811cece24690b415d01991843e2163ff0110e3d3e8995ebd0f4a8', 'Ana Teresa Morales Olivera', 1370019667, 'ATM', 'Ministra', 'ana.morales@produccion.gob.bo', 4, '2013-05-31 05:31:18', 1, 2, 'mujer', 0, 1, 0),
(26, 25, 104, 1, 'jefe.gabinete', '5f42f9afb33811cece24690b415d01991843e2163ff0110e3d3e8995ebd0f4a8', 'Maria Luisa Quezada Portugal', 1370017140, 'MLQ', 'Jefe de Gabinete', 'maria.quezada@produccion.gob.bo', 1, '2013-05-31 05:33:57', 1, 2, 'mujer', 0, 1, 0),
(27, 25, 104, 1, 'despacho.secretaria', '5f42f9afb33811cece24690b415d01991843e2163ff0110e3d3e8995ebd0f4a8', 'Romina Medina Santy', 1372349816, 'RMS', 'Secretaria de Despacho', 'romina.medina@produccion.gob.bo', 10, '2013-05-31 05:35:33', 1, 2, 'mujer', 0, 1, 0),
(28, 25, 104, 1, 'despacho.asistente', '5f42f9afb33811cece24690b415d01991843e2163ff0110e3d3e8995ebd0f4a8', 'Cristian Jesus Michel Garcia', NULL, 'CJM', 'Tecnico Asistente Administrativo', 'cristian.michel@produccion.gob.bo', 0, '2013-05-31 05:37:30', 1, 2, 'hombre', 0, 1, 0),
(29, 0, 106, 0, 'ucs.responsable', '5f42f9afb33811cece24690b415d01991843e2163ff0110e3d3e8995ebd0f4a8', 'Luisa Limachi Flores', NULL, 'LLF', 'Jefe de la Unidad de Comunicacion Social', 'luisa.limachi@produccion.gob.bo', 0, '2013-05-31 05:39:37', 1, 2, 'mujer', 0, 1, 0),
(30, 29, 106, 1, 'ucs.medios', '5f42f9afb33811cece24690b415d01991843e2163ff0110e3d3e8995ebd0f4a8', 'Gonzalo Zambrana Quispe', NULL, 'GZQ', 'Encargado de Medios', 'gonzalo.zambrana@produccion.gob.bo', 0, '2013-05-31 05:41:39', 1, 2, 'hombre', 0, 1, 0),
(31, 29, 106, 1, 'ucs.tecnico', '5f42f9afb33811cece24690b415d01991843e2163ff0110e3d3e8995ebd0f4a8', 'Keyko Aleja Bautista Quispe', NULL, 'KAB', 'Tecnico en Medios', 'keyko.bautista@produccion.gob.bo', 0, '2013-05-31 05:42:42', 1, 2, 'mujer', 0, 1, 0),
(32, 0, 109, 0, 'dgp.direccion', '5f42f9afb33811cece24690b415d01991843e2163ff0110e3d3e8995ebd0f4a8', 'Ariel Zabala David', 1372445911, 'AZD', 'Director General de Planificacion', 'ariel.david@produccion.gob.bo', 8, '2013-05-31 05:45:51', 1, 2, 'hombre', 0, 1, 0),
(33, 32, 109, 1, 'dgp.secretaria', '5f42f9afb33811cece24690b415d01991843e2163ff0110e3d3e8995ebd0f4a8', 'Rosario Jimena Tellez Quenallata', 1372439325, 'RTQ', 'Secretaria Direccion General de Planificacion', 'rosario.tellez@produccion.gob.bo', 10, '2013-05-31 05:47:19', 1, 2, 'mujer', 0, 1, 0),
(34, 32, 109, 1, 'dgp.sectorial', '5f42f9afb33811cece24690b415d01991843e2163ff0110e3d3e8995ebd0f4a8', 'Lucio Primitivo Choque Quispe', NULL, 'LCQ', 'Profesional en Planificacion Sectorial e Institucional', 'lucio.choque@produccion.gob.bo', 0, '2013-05-31 05:49:01', 1, 2, 'hombre', 0, 1, 0),
(35, 0, 108, 0, 'dgaa.direccion', '5f42f9afb33811cece24690b415d01991843e2163ff0110e3d3e8995ebd0f4a8', 'Walter Erick Quevedo Flores', 1372445953, 'EQF', 'Director General de Asuntos Administrativos', 'erick.quevedo@produccion.gob.bo', 38, '2013-05-31 05:50:29', 1, 2, 'hombre', 0, 1, 0),
(36, 35, 108, 1, 'dgaa.secretaria', '5f42f9afb33811cece24690b415d01991843e2163ff0110e3d3e8995ebd0f4a8', 'Maria Elena Alfaro Castillo', 1372445723, 'MAC', 'Secretaria D.G.A.A.', 'maria.alfaro@produccion.gob.bo', 50, '2013-05-31 05:51:39', 1, 2, 'mujer', 0, 1, 0),
(37, 0, 114, 0, 'uf.responsable', '5f42f9afb33811cece24690b415d01991843e2163ff0110e3d3e8995ebd0f4a8', 'Juan Carlos Chavez Iporre', 1370452159, 'JCI', 'Jefe de la Unidad Financiera', 'carlos.chavez@produccion.gob.bo', 17, '2013-05-31 05:54:13', 1, 2, 'hombre', 0, 1, 0),
(38, 37, 114, 1, 'uf.secretaria', '5f42f9afb33811cece24690b415d01991843e2163ff0110e3d3e8995ebd0f4a8', 'Norma Flores Marcani', 1370986812, 'MFM', 'Secretaria de la Unidad Financiera', 'norma.flores@produccion.gob.bo', 4, '2013-05-31 06:21:27', 1, 2, 'mujer', 0, 1, 0),
(39, 37, 114, 1, 'uf.presupuesto', '5f42f9afb33811cece24690b415d01991843e2163ff0110e3d3e8995ebd0f4a8', 'Jose Elias Stolzer', NULL, 'JES', 'Profesional encargado de presupuesto', 'jose.stolzer@produccion.gob.bo', 0, '2013-05-31 06:23:49', 1, 2, 'hombre', 0, 1, 0),
(40, 0, 117, 0, 'udapro.responsable', '5f42f9afb33811cece24690b415d01991843e2163ff0110e3d3e8995ebd0f4a8', 'Amilcar Miranda Gonzales', NULL, 'AMG', 'JEFE DE LA UNIDAD DE ANALISIS PRODUCTIVO (UDAPRO)', 'amilcar.miranda@produccion.gob.bo', 0, '2013-05-31 13:35:24', 1, 2, 'hombre', 0, 1, 0),
(41, 40, 117, 1, 'udapro.sectorial', '5f42f9afb33811cece24690b415d01991843e2163ff0110e3d3e8995ebd0f4a8', 'Luis Eduardo Baudoin Salguero', NULL, 'LBS', 'ESPECIALISTA EN ANALISIS PRODUCTIVO SECTORIAL', 'luis.baudoin@produccion.gob.bo', 0, '2013-05-31 13:37:37', 1, 2, 'hombre', 0, 1, 0),
(42, 40, 117, 1, 'udapro.tecnico1', '5f42f9afb33811cece24690b415d01991843e2163ff0110e3d3e8995ebd0f4a8', 'Sarai Milca Mamani Huayta', NULL, 'SMH', 'TECNICO DE INFORMACIÓN PRECIOS.', 'sarai.mamani@produccion.gob.bo', 0, '2013-05-31 13:38:59', 1, 2, 'mujer', 0, 1, 0),
(43, 40, 117, 1, 'udapro.tecnico2', '5f42f9afb33811cece24690b415d01991843e2163ff0110e3d3e8995ebd0f4a8', 'Santos Fausto Felipez Sejas', NULL, 'SFS', 'TECNICO DE INFORMACIÓN PRIMARIA Y SECUNDARIA', 'santos.felipez@produccion.gob.bo', 0, '2013-05-31 13:40:10', 1, 2, 'hombre', 0, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usertipo`
--

CREATE TABLE IF NOT EXISTS `usertipo` (
  `id_tipo` int(11) NOT NULL DEFAULT '0',
  `id_user` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_tipo`,`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `usertipo`
--

INSERT INTO `usertipo` (`id_tipo`, `id_user`) VALUES
(1, 2),
(2, 35),
(2, 37),
(3, 2),
(3, 4),
(3, 7),
(3, 8),
(3, 9),
(3, 10),
(3, 11),
(3, 12),
(3, 13),
(3, 14),
(3, 15),
(3, 16),
(3, 17),
(3, 18),
(3, 19),
(3, 20),
(3, 21),
(3, 22),
(3, 23),
(3, 24),
(3, 25),
(3, 26),
(3, 27),
(3, 28),
(3, 29),
(3, 30),
(3, 31),
(3, 32),
(3, 33),
(3, 34),
(3, 35),
(3, 36),
(3, 37),
(3, 38),
(3, 39),
(3, 40),
(3, 41),
(3, 42),
(3, 43),
(3, 71),
(3, 72),
(3, 73),
(3, 74),
(4, 2),
(4, 4),
(4, 7),
(4, 8),
(4, 9),
(4, 10),
(4, 11),
(4, 12),
(4, 13),
(4, 14),
(4, 15),
(4, 16),
(4, 17),
(4, 18),
(4, 19),
(4, 20),
(4, 21),
(4, 22),
(4, 23),
(4, 24),
(4, 25),
(4, 26),
(4, 27),
(4, 28),
(4, 29),
(4, 30),
(4, 31),
(4, 32),
(4, 33),
(4, 34),
(4, 35),
(4, 36),
(4, 37),
(4, 38),
(4, 39),
(4, 40),
(4, 41),
(4, 42),
(4, 43),
(4, 71),
(4, 72),
(4, 73),
(4, 74),
(5, 2),
(5, 4),
(5, 7),
(5, 8),
(5, 9),
(5, 10),
(5, 11),
(5, 12),
(5, 13),
(5, 14),
(5, 15),
(5, 16),
(5, 17),
(5, 18),
(5, 19),
(5, 20),
(5, 21),
(5, 22),
(5, 23),
(5, 24),
(5, 25),
(5, 26),
(5, 27),
(5, 28),
(5, 29),
(5, 30),
(5, 31),
(5, 32),
(5, 33),
(5, 34),
(5, 35),
(5, 36),
(5, 37),
(5, 40),
(5, 41),
(5, 42),
(5, 43),
(5, 71),
(5, 72),
(5, 73),
(5, 74),
(11, 27),
(11, 33),
(11, 36),
(11, 38);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_tokens`
--

CREATE TABLE IF NOT EXISTS `user_tokens` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `user_agent` varchar(40) NOT NULL,
  `token` varchar(40) NOT NULL,
  `type` varchar(100) NOT NULL,
  `created` int(10) unsigned NOT NULL,
  `expires` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_token` (`token`),
  KEY `fk_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vias`
--

CREATE TABLE IF NOT EXISTS `vias` (
  `id_usuario` int(11) NOT NULL DEFAULT '0',
  `id_destinatario` int(11) NOT NULL,
  `id_via` int(11) NOT NULL,
  PRIMARY KEY (`id_usuario`,`id_destinatario`,`id_via`),
  KEY `pk` (`id_destinatario`),
  KEY `pk2` (`id_via`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `vias`
--

INSERT INTO `vias` (`id_usuario`, `id_destinatario`, `id_via`) VALUES
(2, 4, 3),
(0, 8, 0),
(2, 8, 3),
(2, 14, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vitacora`
--

CREATE TABLE IF NOT EXISTS `vitacora` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_entidad` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha_hora` datetime DEFAULT NULL,
  `accion_realizada` varchar(255) DEFAULT NULL,
  `ip_usuario` varchar(30) DEFAULT NULL,
  `hostname` varchar(30) DEFAULT NULL,
  `mac_usuario` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1180 ;

--
-- Volcado de datos para la tabla `vitacora`
--

INSERT INTO `vitacora` (`id`, `id_entidad`, `id_usuario`, `fecha_hora`, `accion_realizada`, `ip_usuario`, `hostname`, `mac_usuario`) VALUES
(1, 1, 1, '2013-01-28 15:14:16', 'Omar Mendoza Valdez <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(2, 1, 1, '2013-01-28 15:56:25', 'Omar Mendoza Valdez <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(3, 1, 1, '2013-01-28 15:57:55', 'Omar Mendoza Valdez <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(4, 1, 1, '2013-01-28 15:59:15', 'Omar Mendoza Valdez <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(5, 1, 1, '2013-01-28 16:00:19', 'Omar Mendoza Valdez <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(6, 1, 1, '2013-01-28 16:01:18', 'Omar Mendoza Valdez <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(7, 1, 1, '2013-01-28 16:13:21', 'Omar Mendoza Valdez <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(8, 1, 1, '2013-01-28 16:13:58', 'Omar Mendoza Valdez <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(9, 1, 1, '2013-01-28 16:14:10', 'Omar Mendoza Valdez <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(10, 1, 1, '2013-01-28 16:15:49', 'Omar Mendoza Valdez <b>Administrador del sistema</b> Cambio su contrase&ntilde;', '::1', NULL, NULL),
(11, 1, 1, '2013-01-28 16:15:55', 'Omar Mendoza Valdez <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(12, 1, 1, '2013-01-28 16:15:59', 'Omar Mendoza Valdez <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(13, 1, 1, '2013-01-28 16:17:11', 'Omar Mendoza Valdez <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(14, 1, 1, '2013-01-28 16:17:18', 'Omar Mendoza Valdez <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(15, 1, 1, '2013-01-28 16:19:42', 'Omar Mendoza Valdez <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(16, 1, 1, '2013-01-28 16:19:47', 'Omar Mendoza Valdez <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(17, 1, 1, '2013-01-28 16:19:53', 'Omar Mendoza Valdez <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(18, 1, 1, '2013-01-28 16:20:01', 'Omar Mendoza Valdez <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(19, 1, 1, '2013-01-28 16:21:43', 'Omar Mendoza Valdez <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(20, 1, 2, '2013-01-28 16:22:01', 'Antonio Garcia M. <b>Encargado de Sistemas</b> ingresó al sistema', '::1', NULL, NULL),
(21, 1, 2, '2013-01-28 16:27:21', 'Antonio Garcia M. <b>Encargado de Sistemas</b> salio al sistema', '::1', NULL, NULL),
(22, 1, 2, '2013-01-28 16:27:32', 'Antonio Garcia M. <b>Encargado de Sistemas</b> ingresó al sistema', '::1', NULL, NULL),
(23, 1, 2, '2013-01-28 17:20:41', 'Antonio Garcia M. <b>Encargado de Sistemas</b> ingresó al sistema', '::1', NULL, NULL),
(24, 1, 2, '2013-01-28 17:21:00', 'Antonio Garcia M. <b>Encargado de Sistemas</b> salio al sistema', '::1', NULL, NULL),
(25, 1, 2, '2013-01-28 17:21:38', 'Antonio Garcia M. <b>Encargado de Sistemas</b> ingresó al sistema', '::1', NULL, NULL),
(26, 1, 2, '2013-01-28 17:24:18', 'Antonio Garcia M. <b>Encargado de Sistemas</b> ingresó al sistema', '::1', NULL, NULL),
(27, 1, 2, '2013-01-29 09:48:01', 'Antonio Garcia M. <b>Encargado de Sistemas</b> salio al sistema', '::1', NULL, NULL),
(28, 1, 2, '2013-01-29 09:48:08', 'Antonio Garcia M. <b>Encargado de Sistemas</b> ingresó al sistema', '::1', NULL, NULL),
(29, 1, 2, '2013-01-29 09:48:13', 'Antonio Garcia M. <b>Encargado de Sistemas</b> salio al sistema', '::1', NULL, NULL),
(30, 1, 2, '2013-01-29 09:48:39', 'Antonio Garcia M. <b>Encargado de Sistemas</b> ingresó al sistema', '::1', NULL, NULL),
(31, 1, 2, '2013-01-29 10:01:30', 'Antonio Garcia M. <b>Encargado de Sistemas</b> salio al sistema', '::1', NULL, NULL),
(32, 1, 1, '2013-01-29 10:01:35', 'Omar Mendoza Valdez <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(33, 1, 1, '2013-01-29 10:02:22', 'Omar Mendoza Valdez <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(34, 1, 2, '2013-01-29 10:02:28', 'Antonio Garcia M. <b>Encargado de Sistemas</b> ingresó al sistema', '::1', NULL, NULL),
(35, 1, 2, '2013-01-29 10:02:45', 'Antonio Garcia M. <b>Encargado de Sistemas</b> salio al sistema', '::1', NULL, NULL),
(36, 1, 1, '2013-01-29 10:07:35', 'Omar Mendoza Valdez <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(37, 1, 1, '2013-01-29 10:09:31', 'Omar Mendoza Valdez <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(38, 1, 1, '2013-01-29 10:09:36', 'Omar Mendoza Valdez <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(39, 1, 1, '2013-01-29 10:09:54', 'Omar Mendoza Valdez <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(40, 1, 1, '2013-01-29 10:10:22', 'Omar Mendoza Valdez <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(41, 1, 1, '2013-01-29 10:10:52', 'Omar Mendoza Valdez <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(42, 1, 1, '2013-01-29 10:10:56', 'Omar Mendoza Valdez <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(43, 1, 1, '2013-01-29 10:11:26', 'Omar Mendoza Valdez <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(44, 1, 1, '2013-01-29 10:11:31', 'Omar Mendoza Valdez <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(45, 1, 1, '2013-01-29 10:11:38', 'Omar Mendoza Valdez <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(46, 1, 1, '2013-01-29 10:11:52', 'Omar Mendoza Valdez <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(47, 1, 1, '2013-01-29 10:12:07', 'Omar Mendoza Valdez <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(48, 1, 1, '2013-01-29 10:12:12', 'Omar Mendoza Valdez <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(49, 1, 1, '2013-01-29 10:15:29', 'Omar Mendoza Valdez <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(50, 1, 1, '2013-01-29 10:15:30', 'Omar Mendoza Valdez <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(51, 1, 1, '2013-01-29 10:15:34', 'Omar Mendoza Valdez <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(52, 1, 1, '2013-01-29 10:17:27', 'Omar Mendoza Valdez <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(53, 1, 2, '2013-01-29 10:17:34', 'Antonio Garcia M. <b>Encargado de Sistemas</b> ingresó al sistema', '::1', NULL, NULL),
(54, 1, 2, '2013-01-29 10:30:41', 'Antonio Garcia M. <b>Encargado de Sistemas</b> salio al sistema', '::1', NULL, NULL),
(55, 1, 1, '2013-01-29 10:30:50', 'Omar Mendoza Valdez <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(56, 1, 1, '2013-01-29 10:31:15', 'Omar Mendoza Valdez <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(57, 1, 2, '2013-01-29 10:31:20', 'Antonio Garcia M. <b>Encargado de Sistemas</b> ingresó al sistema', '::1', NULL, NULL),
(58, 1, 2, '2013-01-29 11:44:15', 'Antonio Garcia M. <b>Encargado de Sistemas</b> salio al sistema', '::1', NULL, NULL),
(59, 1, 2, '2013-01-29 11:44:42', 'Antonio Garcia M. <b>Encargado de Sistemas</b> ingresó al sistema', '::1', NULL, NULL),
(60, 1, 2, '2013-01-29 11:44:47', 'Antonio Garcia M. <b>Encargado de Sistemas</b> salio al sistema', '::1', NULL, NULL),
(61, 1, 1, '2013-01-29 11:46:39', 'Omar Mendoza Valdez <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(62, 1, 1, '2013-01-29 11:46:53', 'Omar Mendoza Valdez <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(63, 1, 2, '2013-01-29 11:47:18', 'Antonio Garcia M. <b>Encargado de Sistemas</b> ingresó al sistema', '::1', NULL, NULL),
(64, 1, 2, '2013-01-29 11:47:23', 'Antonio Garcia M. <b>Encargado de Sistemas</b> salio al sistema', '::1', NULL, NULL),
(65, 1, 1, '2013-01-29 11:48:11', 'Omar Mendoza Valdez <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(66, 1, 1, '2013-01-29 11:49:13', 'Omar Mendoza Valdez <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(67, 1, 1, '2013-01-29 11:50:43', 'Omar Mendoza Valdez <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(68, 1, 1, '2013-01-29 11:50:52', 'Omar Mendoza Valdez <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(69, 1, 2, '2013-01-29 11:50:57', 'Antonio Garcia M. <b>Encargado de Sistemas</b> ingresó al sistema', '::1', NULL, NULL),
(70, 1, 2, '2013-01-29 11:51:04', 'Antonio Garcia M. <b>Encargado de Sistemas</b> salio al sistema', '::1', NULL, NULL),
(71, 1, 2, '2013-01-29 11:51:15', 'Antonio Garcia M. <b>Encargado de Sistemas</b> ingresó al sistema', '::1', NULL, NULL),
(72, 1, 2, '2013-01-29 11:51:21', 'Antonio Garcia M. <b>Encargado de Sistemas</b> salio al sistema', '::1', NULL, NULL),
(73, 1, 2, '2013-01-29 11:51:47', 'Antonio Garcia M. <b>Encargado de Sistemas</b> ingresó al sistema', '::1', NULL, NULL),
(74, 1, 2, '2013-01-29 11:57:48', 'Antonio Garcia M. <b>Encargado de Sistemas</b> salio al sistema', '::1', NULL, NULL),
(75, 1, 2, '2013-01-29 11:58:56', 'Antonio Garcia M. <b>Encargado de Sistemas</b> ingresó al sistema', '::1', NULL, NULL),
(76, 1, 2, '2013-01-29 12:00:53', 'Antonio Garcia M. <b>Encargado de Sistemas</b> salio al sistema', '::1', NULL, NULL),
(77, 1, 1, '2013-01-29 12:10:58', 'Omar Mendoza Valdez <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(78, 1, 1, '2013-01-29 12:12:16', 'Omar Mendoza Valdez <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(79, 1, 1, '2013-01-29 12:12:20', 'Omar Mendoza Valdez <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(80, 1, 1, '2013-01-29 12:12:37', 'Omar Mendoza Valdez <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(81, 1, 2, '2013-01-29 12:12:42', 'Antonio Garcia M. <b>Encargado de Sistemas</b> ingresó al sistema', '::1', NULL, NULL),
(82, 1, 2, '2013-01-29 12:12:47', 'Antonio Garcia M. <b>Encargado de Sistemas</b> salio al sistema', '::1', NULL, NULL),
(83, 1, 2, '2013-01-29 12:12:59', 'Antonio Garcia M. <b>Encargado de Sistemas</b> ingresó al sistema', '::1', NULL, NULL),
(84, 1, 2, '2013-01-29 12:13:13', 'Antonio Garcia M. <b>Encargado de Sistemas</b> salio al sistema', '::1', NULL, NULL),
(85, 1, 2, '2013-01-29 12:13:18', 'Antonio Garcia M. <b>Encargado de Sistemas</b> ingresó al sistema', '::1', NULL, NULL),
(86, 1, 2, '2013-01-29 12:13:48', 'Antonio Garcia M. <b>Encargado de Sistemas</b> salio al sistema', '::1', NULL, NULL),
(87, 1, 1, '2013-01-29 12:13:52', 'Omar Mendoza Valdez <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(88, 1, 1, '2013-01-29 12:14:49', 'Omar Mendoza Valdez <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(89, 1, 1, '2013-01-29 12:14:53', 'Omar Mendoza Valdez <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(90, 1, 1, '2013-01-29 12:16:12', 'Omar Mendoza Valdez <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(91, 1, 1, '2013-01-29 12:16:20', 'Omar Mendoza Valdez <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(92, 1, 1, '2013-01-29 12:16:32', 'Omar Mendoza Valdez <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(93, 1, 2, '2013-01-29 12:16:37', 'Antonio Garcia M. <b>Encargado de Sistemas</b> ingresó al sistema', '::1', NULL, NULL),
(94, 1, 2, '2013-01-29 12:27:08', 'Antonio Garcia M. <b>Encargado de Sistemas</b> salio al sistema', '::1', NULL, NULL),
(95, 1, 2, '2013-01-29 12:27:13', 'Antonio Garcia M. <b>Encargado de Sistemas</b> ingresó al sistema', '::1', NULL, NULL),
(96, 1, 2, '2013-01-29 15:08:15', 'Antonio Garcia M. <b>Encargado de Sistemas</b> salio al sistema', '::1', NULL, NULL),
(97, 1, 2, '2013-01-29 15:10:11', 'Antonio Garcia M. <b>Encargado de Sistemas</b> ingresó al sistema', '::1', NULL, NULL),
(98, 1, 2, '2013-01-29 15:10:19', 'Antonio Garcia M. <b>Encargado de Sistemas</b> salio al sistema', '::1', NULL, NULL),
(99, 1, 1, '2013-01-29 15:10:26', 'Omar Mendoza Valdez <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(100, 1, 1, '2013-01-29 15:10:47', 'Omar Mendoza Valdez <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(101, 1, 2, '2013-01-29 15:10:54', 'Antonio Garcia M. <b>Encargado de Sistemas</b> ingresó al sistema', '::1', NULL, NULL),
(102, 1, 2, '2013-01-29 16:24:31', 'Antonio Garcia M. <b>Encargado de Sistemas</b> salio al sistema', '::1', NULL, NULL),
(103, 1, 1, '2013-01-29 16:24:36', 'Omar Mendoza Valdez <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(104, 1, 1, '2013-01-29 16:24:40', 'Omar Mendoza Valdez <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(105, 1, 1, '2013-01-29 16:24:46', 'Omar Mendoza Valdez <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(106, 1, 1, '2013-01-29 16:24:50', 'Omar Mendoza Valdez <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(107, 1, 1, '2013-01-29 16:24:56', 'Omar Mendoza Valdez <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(108, 1, 1, '2013-01-29 16:25:23', 'Omar Mendoza Valdez <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(109, 1, 2, '2013-01-29 16:35:13', 'Antonio Garcia M. <b>Encargado de Sistemas</b> ingresó al sistema', '::1', NULL, NULL),
(110, 1, 2, '2013-01-29 16:42:26', 'Antonio Garcia M. <b>Encargado de Sistemas</b> salio al sistema', '::1', NULL, NULL),
(111, 1, 3, '2013-01-29 16:45:54', 'Ana Teresa Morales Olivera <b>Ministra</b> ingresó al sistema', '::1', NULL, NULL),
(112, 1, 3, '2013-01-29 16:46:11', 'Ana Teresa Morales Olivera <b>Ministra</b> salio al sistema', '::1', NULL, NULL),
(113, 1, 2, '2013-01-29 16:46:17', 'Antonio Garcia M. <b>Encargado de Sistemas</b> ingresó al sistema', '::1', NULL, NULL),
(114, 1, 2, '2013-01-29 16:47:00', 'Antonio Garcia M. | <b>Encargado de Sistemas</b> Deriva la Hoja de Ruta MDPyEP/2013-0000(Oficial) a Ana Teresa Morales Olivera | <b>Ministra</b>', '::1', NULL, NULL),
(115, 1, 2, '2013-01-29 16:47:08', 'Antonio Garcia M. <b>Encargado de Sistemas</b> salio al sistema', '::1', NULL, NULL),
(116, 1, 3, '2013-01-29 16:47:14', 'Ana Teresa Morales Olivera <b>Ministra</b> ingresó al sistema', '::1', NULL, NULL),
(117, 1, 3, '2013-01-29 16:47:40', 'Ana Teresa Morales Olivera <b>Ministra</b> salio al sistema', '::1', NULL, NULL),
(118, 1, 3, '2013-01-29 16:48:41', 'Ana Teresa Morales Olivera <b>Ministra</b> ingresó al sistema', '::1', NULL, NULL),
(119, 1, 3, '2013-01-29 16:49:01', 'Ana Teresa Morales Olivera <b>Ministra</b> Cambio su contrase&ntilde;', '::1', NULL, NULL),
(120, 1, 3, '2013-01-29 16:49:05', 'Ana Teresa Morales Olivera <b>Ministra</b> salio al sistema', '::1', NULL, NULL),
(121, 1, 3, '2013-01-29 16:49:11', 'Ana Teresa Morales Olivera <b>Ministra</b> ingresó al sistema', '::1', NULL, NULL),
(122, 1, 3, '2013-01-29 16:49:26', 'Ana Teresa Morales Olivera | <b>Ministra</b> Recepciono la hoja de ruta MDPyEP/2013-0000', '::1', NULL, NULL),
(123, 1, 3, '2013-01-29 16:51:20', 'Ana Teresa Morales Olivera <b>Ministra</b> salio al sistema', '::1', NULL, NULL),
(124, 1, 3, '2013-01-29 16:52:27', 'Ana Teresa Morales Olivera <b>Ministra</b> ingresó al sistema', '::1', NULL, NULL),
(125, 1, 3, '2013-01-29 16:53:11', 'Ana Teresa Morales Olivera <b>Ministra</b> Cambio su contrase&ntilde;', '::1', NULL, NULL),
(126, 1, 3, '2013-01-29 16:53:31', 'Ana Teresa Morales Olivera <b>Ministra</b> salio al sistema', '::1', NULL, NULL),
(127, 1, 3, '2013-01-29 16:53:37', 'Ana Teresa Morales Olivera <b>Ministra</b> ingresó al sistema', '::1', NULL, NULL),
(128, 1, 3, '2013-01-29 17:17:07', 'Ana Teresa Morales Olivera <b>Ministra</b> salio al sistema', '::1', NULL, NULL),
(129, 1, 2, '2013-01-29 17:17:12', 'Antonio Garcia M. <b>Encargado de Sistemas</b> ingresó al sistema', '::1', NULL, NULL),
(130, 1, 2, '2013-01-29 18:06:26', 'Antonio Garcia M. <b>Encargado de Sistemas</b> salio al sistema', '::1', NULL, NULL),
(131, 1, 3, '2013-01-29 18:06:33', 'Ana Teresa Morales Olivera <b>Ministra</b> ingresó al sistema', '::1', NULL, NULL),
(132, 1, 3, '2013-01-29 18:07:02', 'Ana Teresa Morales Olivera <b>Ministra</b> salio al sistema', '::1', NULL, NULL),
(133, 1, 2, '2013-01-29 18:08:15', 'Antonio Garcia M. <b>Encargado de Sistemas</b> ingresó al sistema', '::1', NULL, NULL),
(134, 1, 2, '2013-01-29 18:08:44', 'Antonio Garcia M. <b>Encargado de Sistemas</b> salio al sistema', '::1', NULL, NULL),
(135, 1, 1, '2013-01-29 18:08:48', 'Omar Mendoza Valdez <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(136, 1, 1, '2013-01-29 18:24:19', 'Omar Mendoza Valdez <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(137, 1, 3, '2013-01-29 18:24:27', 'Ana Teresa Morales Olivera <b>Ministra</b> ingresó al sistema', '::1', NULL, NULL),
(138, 1, 3, '2013-01-29 18:29:18', 'Ana Teresa Morales Olivera <b>Ministra</b> salio al sistema', '::1', NULL, NULL),
(139, 1, 2, '2013-01-29 18:29:26', 'Antonio Garcia M. <b>Encargado de Sistemas</b> ingresó al sistema', '::1', NULL, NULL),
(140, 1, 2, '2013-01-30 08:42:07', 'Antonio Garcia M. <b>Encargado de Sistemas</b> salio al sistema', '::1', NULL, NULL),
(141, 1, 3, '2013-01-30 08:42:16', 'Ana Teresa Morales Olivera <b>Ministra</b> ingresó al sistema', '::1', NULL, NULL),
(142, 1, 3, '2013-01-30 08:42:51', 'Ana Teresa Morales Olivera <b>Ministra</b> salio al sistema', '::1', NULL, NULL),
(143, 1, 2, '2013-01-30 08:42:58', 'Antonio Garcia M. <b>Encargado de Sistemas</b> ingresó al sistema', '::1', NULL, NULL),
(144, 1, 2, '2013-01-30 08:51:08', 'Antonio Garcia M. <b>Encargado de Sistemas</b> salio al sistema', '::1', NULL, NULL),
(145, 1, 2, '2013-01-30 09:01:31', 'Antonio Garcia M. <b>Encargado de Sistemas</b> ingresó al sistema', '::1', NULL, NULL),
(146, 1, 2, '2013-01-30 09:02:12', 'Antonio Garcia M. <b>Encargado de Sistemas</b> salio al sistema', '::1', NULL, NULL),
(147, 1, 3, '2013-01-30 09:16:20', 'Ana Teresa Morales Olivera <b>Ministra</b> ingresó al sistema', '::1', NULL, NULL),
(148, 1, 3, '2013-01-30 09:16:27', 'Ana Teresa Morales Olivera <b>Ministra</b> salio al sistema', '::1', NULL, NULL),
(149, 1, 3, '2013-01-30 09:31:55', 'Ana Teresa Morales Olivera <b>Ministra</b> ingresó al sistema', '::1', NULL, NULL),
(150, 1, 3, '2013-01-30 09:35:07', 'Ana Teresa Morales Olivera <b>Ministra</b> salio al sistema', '::1', NULL, NULL),
(151, 1, 4, '2013-01-30 09:35:15', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> ingresó al sistema', '::1', NULL, NULL),
(152, 1, 4, '2013-01-30 09:41:39', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> salio al sistema', '::1', NULL, NULL),
(153, 1, 4, '2013-01-30 09:45:44', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> ingresó al sistema', '::1', NULL, NULL),
(154, 1, 4, '2013-01-30 09:49:36', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> salio al sistema', '::1', NULL, NULL),
(155, 1, 4, '2013-01-30 09:54:00', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> ingresó al sistema', '::1', NULL, NULL),
(156, 1, 4, '2013-01-30 10:02:51', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> salio al sistema', '::1', NULL, NULL),
(157, 1, 2, '2013-01-30 10:03:01', 'Antonio Garcia M. <b>Encargado de Sistemas</b> ingresó al sistema', '::1', NULL, NULL),
(158, 1, 2, '2013-01-30 11:20:05', 'Antonio Garcia M. <b>Encargado de Sistemas</b> salio al sistema', '::1', NULL, NULL),
(159, 1, 2, '2013-01-30 11:20:22', 'Antonio Garcia M. <b>Encargado de Sistemas</b> ingresó al sistema', '::1', NULL, NULL),
(160, 1, 2, '2013-01-30 11:25:46', 'Antonio Garcia M. <b>Encargado de Sistemas</b> salio al sistema', '::1', NULL, NULL),
(161, 1, 4, '2013-01-30 11:26:09', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> ingresó al sistema', '::1', NULL, NULL),
(162, 1, 4, '2013-01-30 11:32:06', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> salio al sistema', '::1', NULL, NULL),
(163, 1, 2, '2013-01-30 11:32:12', 'Antonio Garcia M. <b>Encargado de Sistemas</b> ingresó al sistema', '::1', NULL, NULL),
(164, 1, 2, '2013-01-30 11:36:14', 'Antonio Garcia M. <b>Encargado de Sistemas</b> salio al sistema', '::1', NULL, NULL),
(165, 1, 4, '2013-01-30 11:36:41', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> ingresó al sistema', '::1', NULL, NULL),
(166, 1, 4, '2013-01-30 11:46:27', 'Jhilda Murillo Zarate | <b>Directora General Ejecutiva</b> Deriva la Hoja de Ruta MDPyEP/2013-00005(Oficial) a Ana Teresa Morales Olivera | <b>Ministra</b>', '::1', NULL, NULL),
(167, 1, 4, '2013-01-30 11:46:36', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> salio al sistema', '::1', NULL, NULL),
(168, 1, 3, '2013-01-30 11:46:43', 'Ana Teresa Morales Olivera <b>Ministra</b> ingresó al sistema', '::1', NULL, NULL),
(169, 1, 3, '2013-01-30 11:47:04', 'Ana Teresa Morales Olivera <b>Ministra</b> salio al sistema', '::1', NULL, NULL),
(170, 1, 4, '2013-01-30 11:47:18', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> ingresó al sistema', '::1', NULL, NULL),
(171, 1, 4, '2013-01-30 11:54:47', 'Jhilda Murillo Zarate | <b>Directora General Ejecutiva</b> Deriva la Hoja de Ruta MDPyEP/2013-00006(Oficial) a Ana Teresa Morales Olivera | <b>Ministra</b>', '::1', NULL, NULL),
(172, 1, 4, '2013-01-30 11:55:10', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> salio al sistema', '::1', NULL, NULL),
(173, 1, 3, '2013-01-30 11:55:16', 'Ana Teresa Morales Olivera <b>Ministra</b> ingresó al sistema', '::1', NULL, NULL),
(174, 1, 3, '2013-01-30 11:56:10', 'Ana Teresa Morales Olivera | <b>Ministra</b> Recepciono la hoja de ruta MDPyEP/2013-00005', '::1', NULL, NULL),
(175, 1, 3, '2013-01-30 11:56:16', 'Ana Teresa Morales Olivera | <b>Ministra</b> Recepciono la hoja de ruta MDPyEP/2013-00006', '::1', NULL, NULL),
(176, 1, 3, '2013-01-30 11:58:09', 'Ana Teresa Morales Olivera | <b>Ministra</b> Deriva la Hoja de Ruta MDPyEP/2013-00005(Copia) a Jhilda Murillo Zarate | <b>Directora General Ejecutiva</b>', '::1', NULL, NULL),
(177, 1, 3, '2013-01-30 11:58:18', 'Ana Teresa Morales Olivera <b>Ministra</b> salio al sistema', '::1', NULL, NULL),
(178, 1, 4, '2013-01-30 11:58:29', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> ingresó al sistema', '::1', NULL, NULL),
(179, 1, 4, '2013-01-30 11:59:06', 'Jhilda Murillo Zarate | <b>Directora General Ejecutiva</b> Recepciono la hoja de ruta MDPyEP/2013-00005', '::1', NULL, NULL),
(180, 1, 4, '2013-01-30 12:08:44', 'Jhilda Murillo Zarate | <b>Directora General Ejecutiva</b> Deriva la Hoja de Ruta MDPyEP/2013-00005(Copia) a Ana Teresa Morales Olivera | <b>Ministra</b>', '::1', NULL, NULL),
(181, 1, 4, '2013-01-30 12:16:06', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> salio al sistema', '::1', NULL, NULL),
(182, 1, 4, '2013-01-30 12:19:42', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> ingresó al sistema', '::1', NULL, NULL),
(183, 1, 4, '2013-01-30 12:23:39', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> salio al sistema', '::1', NULL, NULL),
(184, 1, 1, '2013-01-30 12:25:24', 'Omar Mendoza Valdez <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(185, 1, 1, '2013-01-30 12:32:41', 'Omar Mendoza Valdez <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(186, 1, 1, '2013-01-30 12:33:03', 'Omar Mendoza Valdez <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(187, 1, 1, '2013-01-30 12:35:55', 'Omar Mendoza Valdez <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(188, 2, 7, '2013-01-30 12:36:02', 'Carlos Ponce <b>ventanilla</b> ingresó al sistema', '::1', NULL, NULL),
(189, 2, 7, '2013-01-30 15:16:01', 'Carlos Ponce <b>ventanilla</b> salio al sistema', '::1', NULL, NULL),
(190, 1, 1, '2013-01-30 15:16:04', 'Omar Mendoza Valdez <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(191, 1, 1, '2013-01-30 15:16:52', 'Omar Mendoza Valdez <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(192, 2, 7, '2013-01-30 15:32:07', 'Carlos Ponce <b>ventanilla</b> ingresó al sistema', '::1', NULL, NULL),
(193, 2, 7, '2013-01-30 15:35:12', 'Carlos Ponce | <b>ventanilla</b> Deriva la Hoja de Ruta SNP/2013-00002(Oficial) a Jhilda Murillo Zarate | <b>Directora General Ejecutiva</b>', '::1', NULL, NULL),
(194, 2, 7, '2013-01-30 15:41:25', 'Carlos Ponce | <b>ventanilla</b> Deriva la Hoja de Ruta SNP/2013-00001(Copia) a Jhilda Murillo Zarate | <b>Directora General Ejecutiva</b>', '::1', NULL, NULL),
(195, 2, 7, '2013-01-30 15:57:05', 'Carlos Ponce <b>ventanilla</b> salio al sistema', '::1', NULL, NULL),
(196, 1, 4, '2013-01-30 15:57:11', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> ingresó al sistema', '::1', NULL, NULL),
(197, 1, 4, '2013-01-30 16:00:35', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> salio al sistema', '::1', NULL, NULL),
(198, 2, 7, '2013-01-30 16:00:45', 'Carlos Ponce <b>ventanilla</b> ingresó al sistema', '::1', NULL, NULL),
(199, 2, 7, '2013-01-30 16:15:29', 'Carlos Ponce <b>ventanilla</b> salio al sistema', '::1', NULL, NULL),
(200, 1, 4, '2013-01-30 16:15:44', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> ingresó al sistema', '::1', NULL, NULL),
(201, 1, 4, '2013-01-30 16:18:08', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> salio al sistema', '::1', NULL, NULL),
(202, 2, 7, '2013-01-30 16:18:18', 'Carlos Ponce <b>ventanilla</b> ingresó al sistema', '::1', NULL, NULL),
(203, 2, 7, '2013-01-30 16:20:28', 'Carlos Ponce <b>ventanilla</b> salio al sistema', '::1', NULL, NULL),
(204, 1, 4, '2013-01-30 16:20:33', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> ingresó al sistema', '::1', NULL, NULL),
(205, 1, 4, '2013-01-30 16:26:31', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> salio al sistema', '::1', NULL, NULL),
(206, 2, 7, '2013-01-30 16:26:36', 'Carlos Ponce <b>ventanilla</b> ingresó al sistema', '::1', NULL, NULL),
(207, 2, 7, '2013-01-30 16:37:31', 'Carlos Ponce | <b>ventanilla</b> Deriva la Hoja de Ruta SNP/2013-00003(Oficial) a Jhilda Murillo Zarate | <b>Directora General Ejecutiva</b>', '::1', NULL, NULL),
(208, 2, 7, '2013-01-30 16:46:10', 'Carlos Ponce <b>ventanilla</b> salio al sistema', '::1', NULL, NULL),
(209, 1, 4, '2013-01-30 16:46:17', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> ingresó al sistema', '::1', NULL, NULL),
(210, 1, 4, '2013-01-30 16:51:34', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> salio al sistema', '::1', NULL, NULL),
(211, 2, 7, '2013-01-30 16:51:43', 'Carlos Ponce <b>ventanilla</b> ingresó al sistema', '::1', NULL, NULL),
(212, 2, 7, '2013-01-30 16:55:28', 'Carlos Ponce <b>ventanilla</b> salio al sistema', '::1', NULL, NULL),
(213, 1, 4, '2013-01-30 16:55:40', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> ingresó al sistema', '::1', NULL, NULL),
(214, 1, 1, '2013-01-31 12:34:20', 'Omar Mendoza Valdez <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(215, 1, 4, '2013-01-31 12:34:33', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> ingresó al sistema', '::1', NULL, NULL),
(216, 1, 4, '2013-01-31 17:36:42', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> salio al sistema', '::1', NULL, NULL),
(217, 1, 1, '2013-01-31 17:36:48', 'Omar Mendoza Valdez <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(218, 1, 1, '2013-01-31 17:36:58', 'Omar Mendoza Valdez <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(219, 1, 1, '2013-01-31 17:37:05', 'Omar Mendoza Valdez <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(220, 1, 1, '2013-01-31 17:48:17', 'Omar Mendoza Valdez <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(221, 1, 4, '2013-01-31 17:48:25', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> ingresó al sistema', '::1', NULL, NULL),
(222, 1, 4, '2013-01-31 17:58:29', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> salio al sistema', '::1', NULL, NULL),
(223, 2, 7, '2013-01-31 17:58:42', 'Carlos Ponce <b>ventanilla</b> ingresó al sistema', '::1', NULL, NULL),
(224, 2, 7, '2013-01-31 17:59:34', 'Carlos Ponce <b>ventanilla</b> salio al sistema', '::1', NULL, NULL),
(225, 1, 4, '2013-01-31 17:59:44', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> ingresó al sistema', '::1', NULL, NULL),
(226, 1, 4, '2013-01-31 18:02:56', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> salio al sistema', '::1', NULL, NULL),
(227, 2, 7, '2013-01-31 18:03:05', 'Carlos Ponce <b>ventanilla</b> ingresó al sistema', '::1', NULL, NULL),
(228, 2, 7, '2013-01-31 18:14:58', 'Carlos Ponce <b>ventanilla</b> salio al sistema', '::1', NULL, NULL),
(229, 1, 4, '2013-01-31 18:16:00', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> ingresó al sistema', '::1', NULL, NULL),
(230, 1, 4, '2013-01-31 18:18:19', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> salio al sistema', '::1', NULL, NULL),
(231, 1, 4, '2013-01-31 18:32:28', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> ingresó al sistema', '::1', NULL, NULL),
(232, 1, 4, '2013-02-01 17:54:06', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> salio al sistema', '::1', NULL, NULL),
(233, 1, 2, '2013-02-01 17:54:12', 'Antonio Garcia M. <b>Encargado de Sistemas</b> ingresó al sistema', '::1', NULL, NULL),
(234, 1, 2, '2013-02-01 17:54:24', 'Antonio Garcia M. <b>Encargado de Sistemas</b> salio al sistema', '::1', NULL, NULL),
(235, 1, 4, '2013-02-01 17:55:36', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> ingresó al sistema', '::1', NULL, NULL),
(236, 1, 4, '2013-02-04 08:48:35', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> ingresó al sistema', '::1', NULL, NULL),
(237, 1, 4, '2013-02-04 10:01:27', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> ingresó al sistema', '::1', NULL, NULL),
(238, 1, 4, '2013-02-04 10:16:55', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> ingresó al sistema', '::1', NULL, NULL),
(239, 1, 1, '2013-02-04 11:30:09', 'Omar Mendoza Valdez <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(240, 1, 4, '2013-02-04 11:30:21', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> ingresó al sistema', '::1', NULL, NULL),
(241, 1, 4, '2013-02-06 17:13:08', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> ingresó al sistema', '::1', NULL, NULL),
(242, 1, 4, '2013-02-07 09:42:05', 'Jhilda Murillo Zarate | <b>Directora General Ejecutiva</b> Recepciono la hoja de ruta SNP/2013-00002', '::1', NULL, NULL),
(243, 1, 4, '2013-02-07 10:10:40', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> salio al sistema', '::1', NULL, NULL),
(244, 1, 1, '2013-02-07 10:10:45', 'Omar Mendoza Valdez <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(245, 1, 1, '2013-02-07 14:46:38', 'Omar Mendoza Valdez <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(246, 1, 4, '2013-02-07 14:46:45', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> ingresó al sistema', '::1', NULL, NULL),
(247, 1, 4, '2013-02-07 14:47:29', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> ingresó al sistema', '::1', NULL, NULL),
(248, 1, 4, '2013-02-08 08:47:10', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> salio al sistema', '::1', NULL, NULL),
(249, 1, 1, '2013-02-08 08:47:16', 'Omar Mendoza Valdez <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(250, 1, 1, '2013-02-08 11:33:36', 'Omar Mendoza Valdez <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(251, 1, 4, '2013-02-08 11:33:43', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> ingresó al sistema', '::1', NULL, NULL),
(252, 1, 4, '2013-02-08 11:35:00', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> salio al sistema', '::1', NULL, NULL),
(253, 2, 7, '2013-02-08 11:35:24', 'Carlos Ponce <b>ventanilla</b> ingresó al sistema', '::1', NULL, NULL),
(254, 2, 7, '2013-02-08 11:36:36', 'Carlos Ponce <b>ventanilla</b> salio al sistema', '::1', NULL, NULL),
(255, 1, 4, '2013-02-08 11:36:55', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> ingresó al sistema', '::1', NULL, NULL),
(256, 1, 4, '2013-02-08 11:38:59', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> salio al sistema', '::1', NULL, NULL),
(257, 2, 7, '2013-02-08 11:39:06', 'Carlos Ponce <b>ventanilla</b> ingresó al sistema', '::1', NULL, NULL),
(258, 2, 7, '2013-02-08 11:39:10', 'Carlos Ponce <b>ventanilla</b> salio al sistema', '::1', NULL, NULL),
(259, 1, 4, '2013-02-08 11:39:16', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> ingresó al sistema', '::1', NULL, NULL),
(260, 1, 4, '2013-02-08 11:41:00', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> salio al sistema', '::1', NULL, NULL),
(261, 2, 7, '2013-02-08 11:41:10', 'Carlos Ponce <b>ventanilla</b> ingresó al sistema', '::1', NULL, NULL),
(262, 2, 7, '2013-02-08 11:43:37', 'Carlos Ponce | <b>ventanilla</b> Deriva la Hoja de Ruta SNP/2013-00004(Oficial) a Jhilda Murillo Zarate | <b>Directora General Ejecutiva</b>', '::1', NULL, NULL),
(263, 2, 7, '2013-02-08 11:43:49', 'Carlos Ponce <b>ventanilla</b> salio al sistema', '::1', NULL, NULL),
(264, 1, 4, '2013-02-08 11:44:01', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> ingresó al sistema', '::1', NULL, NULL),
(265, 1, 4, '2013-02-08 12:01:11', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> salio al sistema', '::1', NULL, NULL),
(266, 1, 4, '2013-02-08 12:01:35', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> ingresó al sistema', '::1', NULL, NULL),
(267, 1, 4, '2013-02-08 12:02:47', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> salio al sistema', '::1', NULL, NULL),
(268, 1, 1, '2013-02-08 12:02:58', 'Omar Mendoza Valdez <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(269, 1, 1, '2013-02-08 12:21:55', 'Omar Mendoza Valdez <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(270, 1, 4, '2013-02-08 12:22:01', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> ingresó al sistema', '::1', NULL, NULL),
(271, 1, 1, '2013-02-13 08:41:10', 'Omar Mendoza Valdez <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(272, 1, 1, '2013-02-13 08:44:22', 'Omar Mendoza Valdez <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(273, 1, 4, '2013-02-13 08:44:27', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> ingresó al sistema', '::1', NULL, NULL),
(274, 1, 4, '2013-02-13 10:28:05', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> salio al sistema', '::1', NULL, NULL),
(275, 1, 1, '2013-02-13 10:28:10', 'Omar Mendoza Valdez <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(276, 1, 1, '2013-02-13 10:54:42', 'Freddy Velasco <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(277, 1, 4, '2013-02-13 10:55:02', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> ingresó al sistema', '::1', NULL, NULL),
(278, 1, 4, '2013-02-13 10:58:05', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> salio al sistema', '::1', NULL, NULL),
(279, 1, 1, '2013-02-13 10:58:58', 'Freddy Velasco <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(280, 1, 1, '2013-02-13 14:40:56', 'Freddy Velasco <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(281, 1, 1, '2013-02-13 14:41:02', 'Freddy Velasco <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(282, 1, 1, '2013-02-13 16:00:49', 'Freddy Velasco <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(283, 12, 8, '2013-02-13 16:01:12', 'Ruben Calizaya Calani <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(284, 12, 8, '2013-02-13 16:01:37', 'Ruben Calizaya Calani <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(285, 12, 8, '2013-02-13 16:01:46', 'Ruben Calizaya Calani <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(286, 12, 8, '2013-02-13 16:01:51', 'Ruben Calizaya Calani <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(287, 12, 8, '2013-02-13 16:02:01', 'Ruben Calizaya Calani <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(288, 12, 8, '2013-02-13 16:02:15', 'Ruben Calizaya Calani <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(289, 12, 8, '2013-02-13 16:06:21', 'Ruben Calizaya Calani <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(290, 12, 8, '2013-02-13 16:06:34', 'Ruben Calizaya Calani <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(291, 12, 8, '2013-02-13 16:07:04', 'Ruben Calizaya Calani <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(292, 12, 8, '2013-02-13 16:07:46', 'Ruben Calizaya Calani <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(293, 12, 8, '2013-02-13 16:07:53', 'Ruben Calizaya Calani <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(294, 12, 8, '2013-02-13 16:08:24', 'Ruben Calizaya Calani <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(295, 12, 8, '2013-02-13 16:08:31', 'Ruben Calizaya Calani <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(296, 12, 8, '2013-02-13 16:09:17', 'Ruben Calizaya Calani <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(297, 12, 8, '2013-02-13 16:09:22', 'Ruben Calizaya Calani <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(298, 12, 8, '2013-02-13 16:09:47', 'Ruben Calizaya Calani <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(299, 12, 8, '2013-02-13 16:09:53', 'Ruben Calizaya Calani <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(300, 12, 8, '2013-02-13 16:10:02', 'Ruben Calizaya Calani <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(301, 1, 1, '2013-02-13 16:10:16', 'Freddy Velasco <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(302, 1, 1, '2013-02-13 16:12:06', 'Freddy Velasco <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(303, 12, 8, '2013-02-13 16:12:14', 'Ruben Calizaya Calani <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(304, 12, 8, '2013-02-13 16:19:20', 'Ruben Calizaya Calani <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(305, 12, 8, '2013-02-13 16:19:26', 'Ruben Calizaya Calani <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(306, 12, 8, '2013-02-13 16:22:07', 'Ruben Calizaya Calani <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(307, 1, 1, '2013-02-13 16:22:17', 'Freddy Velasco <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(308, 1, 1, '2013-02-13 17:20:52', 'Freddy Velasco <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(309, 1, 4, '2013-02-13 17:20:57', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> ingresó al sistema', '::1', NULL, NULL),
(310, 1, 4, '2013-02-13 17:37:35', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> salio al sistema', '::1', NULL, NULL),
(311, 1, 1, '2013-02-13 17:37:39', 'Freddy Velasco <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(312, 1, 1, '2013-02-14 08:41:41', 'Freddy Velasco <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(313, 1, 1, '2013-02-14 08:41:48', 'Freddy Velasco <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(314, 1, 1, '2013-02-14 08:42:17', 'Freddy Velasco <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(315, 12, 8, '2013-02-14 08:42:42', 'Ruben Calizaya Calani <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(316, 12, 8, '2013-02-14 08:42:52', 'Ruben Calizaya Calani <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(317, 12, 8, '2013-02-14 08:45:05', 'Ruben Calizaya Calani <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(318, 12, 8, '2013-02-14 08:45:14', 'Ruben Calizaya Calani <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(319, 1, 1, '2013-02-14 11:08:11', 'Freddy Velasco <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(320, 1, 1, '2013-02-14 11:11:05', 'Freddy Velasco <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(321, 12, 8, '2013-02-14 11:11:14', 'Ruben Calizaya Calani <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(322, 12, 8, '2013-02-14 11:11:48', 'Ruben Calizaya Calani <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(323, 12, 8, '2013-02-14 11:33:29', 'Ruben Calizaya Calani <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(324, 12, 8, '2013-02-14 12:09:50', 'Ruben Calizaya Calani <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(325, 1, 1, '2013-02-14 12:10:02', 'Freddy Velasco <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(326, 1, 1, '2013-02-14 12:22:24', 'Freddy Velasco <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(327, 12, 8, '2013-02-14 12:22:38', 'Ruben Calizaya Calani <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(328, 12, 8, '2013-02-14 12:28:13', 'Ruben Calizaya Calani <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(329, 1, 1, '2013-02-14 12:28:18', 'Freddy Velasco <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(330, 1, 1, '2013-02-14 12:30:54', 'Freddy Velasco <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(331, 12, 8, '2013-02-14 12:31:02', 'Ruben Calizaya Calani <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(332, 12, 8, '2013-02-14 12:31:12', 'Ruben Calizaya Calani <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(333, 1, 1, '2013-02-14 12:31:19', 'Freddy Velasco <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(334, 1, 1, '2013-02-14 16:09:34', 'Freddy Velasco <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(335, 1, 4, '2013-02-14 16:09:41', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> ingresó al sistema', '::1', NULL, NULL),
(336, 1, 4, '2013-02-14 16:21:07', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> ingresó al sistema', '::1', NULL, NULL),
(337, 1, 4, '2013-02-15 14:43:33', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> salio al sistema', '::1', NULL, NULL),
(338, 12, 8, '2013-02-15 14:43:47', 'Ruben Calizaya Calani <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(339, 12, 8, '2013-02-15 15:51:22', 'Ruben Calizaya Calani <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(340, 1, 4, '2013-02-15 15:51:34', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> ingresó al sistema', '::1', NULL, NULL),
(341, 1, 4, '2013-02-15 15:56:44', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> salio al sistema', '::1', NULL, NULL),
(342, 1, 1, '2013-02-15 15:56:48', 'Freddy Velasco <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(343, 1, 1, '2013-02-15 15:57:09', 'Freddy Velasco <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(344, 1, 4, '2013-02-15 15:57:24', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> ingresó al sistema', '::1', NULL, NULL),
(345, 1, 4, '2013-02-15 15:58:40', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> salio al sistema', '::1', NULL, NULL),
(346, 1, 1, '2013-02-15 15:58:44', 'Freddy Velasco <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(347, 1, 1, '2013-02-15 16:05:36', 'Freddy Velasco <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(348, 1, 4, '2013-02-15 16:05:49', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> ingresó al sistema', '::1', NULL, NULL),
(349, 1, 4, '2013-02-15 16:07:22', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> salio al sistema', '::1', NULL, NULL),
(350, 1, 1, '2013-02-15 16:07:26', 'Freddy Velasco <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(351, 1, 1, '2013-02-15 16:07:57', 'Freddy Velasco <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(352, 1, 4, '2013-02-15 16:08:03', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> ingresó al sistema', '::1', NULL, NULL),
(353, 1, 4, '2013-02-15 16:15:36', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> salio al sistema', '::1', NULL, NULL),
(354, 1, 1, '2013-02-15 16:15:42', 'Freddy Velasco <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(355, 1, 1, '2013-02-15 16:17:26', 'Freddy Velasco <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(356, 12, 9, '2013-02-15 16:19:17', 'Alvaro Ramirez Ballester <b>Profesional Auditor</b> ingresó al sistema', '::1', NULL, NULL),
(357, 12, 9, '2013-02-15 16:19:43', 'Alvaro Ramirez Ballester <b>Profesional Auditor</b> salio al sistema', '::1', NULL, NULL),
(358, 1, 1, '2013-02-15 16:19:48', 'Freddy Velasco <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(359, 1, 1, '2013-02-15 16:36:56', 'Freddy Velasco <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(360, 12, 8, '2013-02-15 16:37:04', 'Ruben Calizaya Calani <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(361, 12, 8, '2013-02-15 16:37:23', 'Ruben Calizaya Calani <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(362, 1, 4, '2013-02-15 16:37:30', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> ingresó al sistema', '::1', NULL, NULL),
(363, 1, 1, '2013-02-15 17:31:50', 'Freddy Velasco <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(364, 1, 1, '2013-02-15 17:32:02', 'Freddy Velasco <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(365, 12, 8, '2013-02-15 17:32:13', 'Ruben Calizaya Calani <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(366, 12, 8, '2013-02-15 17:32:23', 'Ruben Calizaya Calani <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(367, 1, 4, '2013-02-15 17:33:15', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> ingresó al sistema', '::1', NULL, NULL),
(368, 1, 4, '2013-02-15 17:34:05', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> salio al sistema', '::1', NULL, NULL),
(369, 1, 1, '2013-02-15 17:34:09', 'Freddy Velasco <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(370, 1, 1, '2013-02-15 17:59:25', 'Freddy Velasco <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(371, 1, 1, '2013-02-15 17:59:45', 'Freddy Velasco <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(372, 1, 1, '2013-02-15 18:28:40', 'Freddy Velasco <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(373, 1, 4, '2013-02-15 18:28:46', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> ingresó al sistema', '::1', NULL, NULL),
(374, 1, 1, '2013-02-18 08:52:35', 'Freddy Velasco <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(375, 1, 1, '2013-02-18 08:54:45', 'Freddy Velasco <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(376, -1, 8, '2013-02-18 08:54:51', 'Ruben Calizaya Calani <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(377, -1, 8, '2013-02-18 08:54:59', 'Ruben Calizaya Calani <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(378, -1, 8, '2013-02-18 08:55:07', 'Ruben Calizaya Calani <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(379, -1, 8, '2013-02-18 08:55:37', 'Ruben Calizaya Calani <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(380, 1, 1, '2013-02-18 08:57:14', 'Freddy Velasco <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(381, 1, 1, '2013-02-18 09:09:41', 'Freddy Velasco <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(382, 1, 1, '2013-02-18 09:09:58', 'Freddy Velasco <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(383, 1, 1, '2013-02-18 10:30:13', 'Freddy Velasco <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(384, 12, 14, '2013-02-18 10:30:39', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(385, 12, 14, '2013-02-18 10:30:55', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(386, 1, 1, '2013-02-18 10:31:05', 'Freddy Velasco <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(387, 1, 1, '2013-02-18 10:32:04', 'Freddy Velasco <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(388, 12, 14, '2013-02-18 10:32:12', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(389, 12, 14, '2013-02-18 10:33:16', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(390, 1, 1, '2013-02-18 10:33:32', 'Freddy Velasco <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(391, 1, 1, '2013-02-18 10:40:42', 'Freddy Velasco <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL);
INSERT INTO `vitacora` (`id`, `id_entidad`, `id_usuario`, `fecha_hora`, `accion_realizada`, `ip_usuario`, `hostname`, `mac_usuario`) VALUES
(392, 1, 1, '2013-02-18 10:40:50', 'Freddy Velasco <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(393, 1, 1, '2013-02-18 10:52:16', 'Freddy Velasco <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(394, 12, 14, '2013-02-18 10:52:25', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(395, 12, 14, '2013-02-19 09:00:00', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(396, 1, 1, '2013-02-19 09:01:34', 'Freddy Velasco <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(397, 1, 1, '2013-02-19 10:40:09', 'Freddy Velasco <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(398, 1, 1, '2013-02-19 10:40:18', 'Freddy Velasco <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(399, 1, 1, '2013-02-19 10:41:16', 'Freddy Velasco <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(400, 12, 14, '2013-02-19 10:41:29', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(401, 12, 14, '2013-02-19 10:42:13', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(402, 1, 1, '2013-02-19 10:42:18', 'Freddy Velasco <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(403, 1, 1, '2013-02-19 10:46:10', 'Freddy Velasco <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(404, 1, 1, '2013-02-19 10:46:15', 'Freddy Velasco <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(405, 1, 1, '2013-02-19 10:48:29', 'Freddy Velasco <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(406, 12, 14, '2013-02-19 10:48:58', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(407, 12, 14, '2013-02-19 11:00:59', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(408, 3, 19, '2013-02-19 11:01:17', 'Carlos Eduardo <b>Responsable Regional Cochabamba</b> ingresó al sistema', '::1', NULL, NULL),
(409, 3, 19, '2013-02-19 11:02:58', 'Carlos Eduardo <b>Responsable Regional Cochabamba</b> salio al sistema', '::1', NULL, NULL),
(410, 3, 21, '2013-02-19 11:03:07', 'Jose María <b>Supervisor Técnico</b> ingresó al sistema', '::1', NULL, NULL),
(411, 3, 21, '2013-02-19 15:08:00', 'Jose María <b>Supervisor Técnico</b> salio al sistema', '::1', NULL, NULL),
(412, 1, 1, '2013-02-19 15:08:05', 'Freddy Velasco <b>Administrador del sistema</b> ingresó al sistema', '::1', NULL, NULL),
(413, 1, 1, '2013-02-19 15:09:21', 'Freddy Velasco <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(414, 12, 14, '2013-02-19 15:09:47', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(415, 12, 14, '2013-02-19 15:09:54', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(416, 3, 19, '2013-02-19 15:10:07', 'Carlos Eduardo <b>Responsable Regional Cochabamba</b> ingresó al sistema', '::1', NULL, NULL),
(417, 3, 19, '2013-02-19 15:10:17', 'Carlos Eduardo <b>Responsable Regional Cochabamba</b> salio al sistema', '::1', NULL, NULL),
(418, 3, 19, '2013-02-19 15:10:32', 'Carlos Eduardo <b>Responsable Regional Cochabamba</b> ingresó al sistema', '::1', NULL, NULL),
(419, 3, 19, '2013-02-19 15:11:04', 'Carlos Eduardo <b>Responsable Regional Cochabamba</b> salio al sistema', '::1', NULL, NULL),
(420, 3, 21, '2013-02-19 15:11:13', 'Jose María <b>Supervisor Técnico</b> ingresó al sistema', '::1', NULL, NULL),
(421, 3, 21, '2013-02-19 16:58:06', 'Jose María <b>Supervisor Técnico</b> salio al sistema', '::1', NULL, NULL),
(422, 1, 4, '2013-02-19 16:58:12', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> ingresó al sistema', '::1', NULL, NULL),
(423, 1, 4, '2013-02-19 16:58:47', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> salio al sistema', '::1', NULL, NULL),
(424, 2, 7, '2013-02-19 16:59:03', 'Carlos Ponce <b>ventanilla</b> ingresó al sistema', '::1', NULL, NULL),
(425, 2, 7, '2013-02-19 17:11:01', 'Carlos Ponce <b>ventanilla</b> salio al sistema', '::1', NULL, NULL),
(426, 12, 15, '2013-02-19 17:34:38', 'Juan Carlos <b>Profesional Auditor Senior</b> ingresó al sistema', '::1', NULL, NULL),
(427, 12, 15, '2013-02-20 08:54:38', 'Juan Carlos <b>Profesional Auditor Senior</b> salio al sistema', '::1', NULL, NULL),
(428, 12, 14, '2013-02-20 08:54:46', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(429, 12, 14, '2013-02-20 09:00:26', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(430, 12, 15, '2013-02-20 09:00:35', 'Juan Carlos <b>Profesional Auditor Senior</b> ingresó al sistema', '::1', NULL, NULL),
(431, 12, 15, '2013-02-20 09:14:59', 'Juan Carlos | <b>Profesional Auditor Senior</b> Deriva la Hoja de Ruta ZFC/2013-00006(Oficial) a Luis Fernando | <b>Jefe Unidad Auditoria Interna</b>', '::1', NULL, NULL),
(432, 0, 15, '2013-02-20 09:16:54', 'Juan Carlos | <b>Profesional Auditor Senior</b> Cancela derivacion de la Hoja de Ruta ZFC/2013-00006(Oficial) a Luis Fernando', '::1', NULL, NULL),
(433, 12, 15, '2013-02-20 09:17:06', 'Juan Carlos | <b>Profesional Auditor Senior</b> Deriva la Hoja de Ruta ZFC/2013-00006(Oficial) a Luis Fernando | <b>Jefe Unidad Auditoria Interna</b>', '::1', NULL, NULL),
(434, 12, 15, '2013-02-20 09:18:02', 'Juan Carlos | <b>Profesional Auditor Senior</b> Deriva la Hoja de Ruta ZFC/2013-00005(Oficial) a Luis Fernando | <b>Jefe Unidad Auditoria Interna</b>', '::1', NULL, NULL),
(435, 12, 15, '2013-02-20 09:18:48', 'Juan Carlos | <b>Profesional Auditor Senior</b> Deriva la Hoja de Ruta ZFC/2013-00004(Oficial) a Luis Fernando | <b>Jefe Unidad Auditoria Interna</b>', '::1', NULL, NULL),
(436, 12, 15, '2013-02-20 09:19:05', 'Juan Carlos <b>Profesional Auditor Senior</b> salio al sistema', '::1', NULL, NULL),
(437, 12, 14, '2013-02-20 09:19:18', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(438, 12, 14, '2013-02-20 09:19:36', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(439, 3, 22, '2013-02-20 09:19:51', 'Maria Fernanda <b>Tecnico Metrología Legal I</b> ingresó al sistema', '::1', NULL, NULL),
(440, 3, 22, '2013-02-20 09:20:23', 'Maria Fernanda <b>Tecnico Metrología Legal I</b> salio al sistema', '::1', NULL, NULL),
(441, 12, 16, '2013-02-20 09:20:33', 'Karla Patricia <b>Supervisor Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(442, 12, 16, '2013-02-20 09:21:36', 'Karla Patricia <b>Supervisor Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(443, 3, 22, '2013-02-20 09:21:53', 'Maria Fernanda <b>Tecnico Metrología Legal I</b> ingresó al sistema', '::1', NULL, NULL),
(444, 3, 22, '2013-02-20 09:27:19', 'Maria Fernanda | <b>Tecnico Metrología Legal I</b> Deriva la Hoja de Ruta IBM/2013-00005(Oficial) a Carlos Eduardo | <b>Responsable Regional Cochabamba</b>', '::1', NULL, NULL),
(445, 3, 22, '2013-02-20 09:28:46', 'Maria Fernanda | <b>Tecnico Metrología Legal I</b> Deriva la Hoja de Ruta IBM/2013-00004(Oficial) a Carlos Eduardo | <b>Responsable Regional Cochabamba</b>', '::1', NULL, NULL),
(446, 3, 22, '2013-02-20 09:33:15', 'Maria Fernanda <b>Tecnico Metrología Legal I</b> salio al sistema', '::1', NULL, NULL),
(447, 12, 14, '2013-02-20 09:33:23', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(448, 12, 14, '2013-02-20 09:33:30', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(449, 3, 19, '2013-02-20 09:33:37', 'Carlos Eduardo <b>Responsable Regional Cochabamba</b> ingresó al sistema', '::1', NULL, NULL),
(450, 3, 19, '2013-02-20 09:33:55', 'Carlos Eduardo | <b>Responsable Regional Cochabamba</b> Recepciono la hoja de ruta IBM/2013-00004', '::1', NULL, NULL),
(451, 3, 19, '2013-02-20 09:34:00', 'Carlos Eduardo | <b>Responsable Regional Cochabamba</b> Recepciono la hoja de ruta IBM/2013-00005', '::1', NULL, NULL),
(452, 3, 19, '2013-02-20 09:35:15', 'Carlos Eduardo | <b>Responsable Regional Cochabamba</b> Deriva la Hoja de Ruta IBM/2013-00004(Oficial) a Luis Fernando | <b>Jefe Unidad Auditoria Interna</b>', '::1', NULL, NULL),
(453, 3, 19, '2013-02-20 09:39:02', 'Carlos Eduardo | <b>Responsable Regional Cochabamba</b> Deriva la Hoja de Ruta IBM/2013-00005(Oficial) a Luis Fernando | <b>Jefe Unidad Auditoria Interna</b>', '::1', NULL, NULL),
(454, 0, 19, '2013-02-20 09:39:46', 'Carlos Eduardo | <b>Responsable Regional Cochabamba</b> Cancela derivacion de la Hoja de Ruta IBM/2013-00005(Oficial) a Luis Fernando', '::1', NULL, NULL),
(455, 3, 19, '2013-02-20 09:39:50', 'Carlos Eduardo | <b>Responsable Regional Cochabamba</b> Deriva la Hoja de Ruta IBM/2013-00005(Oficial) a Luis Fernando | <b>Jefe Unidad Auditoria Interna</b>', '::1', NULL, NULL),
(456, 3, 19, '2013-02-20 09:40:00', 'Carlos Eduardo <b>Responsable Regional Cochabamba</b> salio al sistema', '::1', NULL, NULL),
(457, 12, 14, '2013-02-20 09:40:08', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(458, 12, 14, '2013-02-20 09:43:40', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(459, 12, 15, '2013-02-20 09:44:12', 'Juan Carlos <b>Profesional Auditor Senior</b> ingresó al sistema', '::1', NULL, NULL),
(460, 12, 15, '2013-02-20 09:47:16', 'Juan Carlos | <b>Profesional Auditor Senior</b> Deriva la Hoja de Ruta ZFC/2013-00003(Copia) a Luis Fernando | <b>Jefe Unidad Auditoria Interna</b>', '::1', NULL, NULL),
(461, 12, 15, '2013-02-20 09:47:34', 'Juan Carlos <b>Profesional Auditor Senior</b> salio al sistema', '::1', NULL, NULL),
(462, 12, 14, '2013-02-20 09:50:17', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(463, 12, 14, '2013-02-20 10:06:27', 'Luis Fernando | <b>Jefe Unidad Auditoria Interna</b> Recepciono la hoja de ruta ZFC/2013-00004', '::1', NULL, NULL),
(464, 12, 14, '2013-02-20 10:12:04', 'Luis Fernando | <b>Jefe Unidad Auditoria Interna</b> Recepciono la hoja de ruta ZFC/2013-00003', '::1', NULL, NULL),
(465, 12, 14, '2013-02-20 10:12:09', 'Luis Fernando | <b>Jefe Unidad Auditoria Interna</b> Recepciono la hoja de ruta ZFC/2013-00005', '::1', NULL, NULL),
(466, 12, 14, '2013-02-20 10:12:14', 'Luis Fernando | <b>Jefe Unidad Auditoria Interna</b> Recepciono la hoja de ruta ZFC/2013-00006', '::1', NULL, NULL),
(467, 12, 14, '2013-02-20 10:40:45', 'Luis Fernando | <b>Jefe Unidad Auditoria Interna</b> Recepciono la hoja de ruta IBM/2013-00005', '::1', NULL, NULL),
(468, 12, 14, '2013-02-20 11:23:30', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(469, 12, 15, '2013-02-20 11:23:42', 'Juan Carlos <b>Profesional Auditor Senior</b> ingresó al sistema', '::1', NULL, NULL),
(470, 12, 15, '2013-02-20 11:30:27', 'Juan Carlos <b>Profesional Auditor Senior</b> salio al sistema', '::1', NULL, NULL),
(471, 12, 14, '2013-02-20 11:30:59', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(472, 12, 14, '2013-02-20 12:08:14', 'Luis Fernando | <b>Jefe Unidad Auditoria Interna</b> Deriva la Hoja de Ruta ZFC/2013-00004(Oficial) a Carlos Eduardo | <b>Responsable Regional Cochabamba</b>', '::1', NULL, NULL),
(473, 12, 14, '2013-02-20 12:12:52', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(474, 3, 19, '2013-02-20 12:12:58', 'Carlos Eduardo <b>Responsable Regional Cochabamba</b> ingresó al sistema', '::1', NULL, NULL),
(475, 3, 19, '2013-02-20 12:15:49', 'Carlos Eduardo <b>Responsable Regional Cochabamba</b> salio al sistema', '::1', NULL, NULL),
(476, 12, 15, '2013-02-20 12:16:14', 'Juan Carlos <b>Profesional Auditor Senior</b> ingresó al sistema', '::1', NULL, NULL),
(477, 12, 15, '2013-02-20 12:19:07', 'Juan Carlos <b>Profesional Auditor Senior</b> salio al sistema', '::1', NULL, NULL),
(478, 3, 19, '2013-02-20 12:19:20', 'Carlos Eduardo <b>Responsable Regional Cochabamba</b> ingresó al sistema', '::1', NULL, NULL),
(479, 3, 19, '2013-02-20 12:19:31', 'Carlos Eduardo <b>Responsable Regional Cochabamba</b> salio al sistema', '::1', NULL, NULL),
(480, 3, 22, '2013-02-20 12:19:41', 'Maria Fernanda <b>Tecnico Metrología Legal I</b> ingresó al sistema', '::1', NULL, NULL),
(481, 3, 22, '2013-02-20 12:26:26', 'Maria Fernanda | <b>Tecnico Metrología Legal I</b> Deriva la Hoja de Ruta IBM/2013-00007(Oficial) a Carlos Eduardo | <b>Responsable Regional Cochabamba</b>', '::1', NULL, NULL),
(482, 3, 22, '2013-02-20 12:26:40', 'Maria Fernanda <b>Tecnico Metrología Legal I</b> salio al sistema', '::1', NULL, NULL),
(483, 12, 16, '2013-02-20 12:26:55', 'Karla Patricia <b>Supervisor Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(484, 12, 16, '2013-02-20 12:30:39', 'Karla Patricia | <b>Supervisor Auditoria Interna</b> Deriva la Hoja de Ruta ZFC/2013-00009(Oficial) a Luis Fernando | <b>Jefe Unidad Auditoria Interna</b>', '::1', NULL, NULL),
(485, 12, 16, '2013-02-20 12:30:42', 'Karla Patricia <b>Supervisor Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(486, 3, 19, '2013-02-20 12:30:49', 'Carlos Eduardo <b>Responsable Regional Cochabamba</b> ingresó al sistema', '::1', NULL, NULL),
(487, 3, 19, '2013-02-20 12:31:08', 'Carlos Eduardo | <b>Responsable Regional Cochabamba</b> Recepciono la hoja de ruta ZFC/2013-00004', '::1', NULL, NULL),
(488, 3, 19, '2013-02-20 12:31:13', 'Carlos Eduardo | <b>Responsable Regional Cochabamba</b> Recepciono la hoja de ruta IBM/2013-00007', '::1', NULL, NULL),
(489, 3, 19, '2013-02-20 12:32:12', 'Carlos Eduardo | <b>Responsable Regional Cochabamba</b> Deriva la Hoja de Ruta IBM/2013-00007(Oficial) a Luis Fernando | <b>Jefe Unidad Auditoria Interna</b>', '::1', NULL, NULL),
(490, 3, 19, '2013-02-20 12:32:15', 'Carlos Eduardo <b>Responsable Regional Cochabamba</b> salio al sistema', '::1', NULL, NULL),
(491, 12, 14, '2013-02-20 12:32:27', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(492, 12, 14, '2013-02-20 12:32:47', 'Luis Fernando | <b>Jefe Unidad Auditoria Interna</b> Recepciono la hoja de ruta IBM/2013-00004', '::1', NULL, NULL),
(493, 12, 14, '2013-02-20 12:32:52', 'Luis Fernando | <b>Jefe Unidad Auditoria Interna</b> Recepciono la hoja de ruta ZFC/2013-00009', '::1', NULL, NULL),
(494, 12, 14, '2013-02-20 12:32:58', 'Luis Fernando | <b>Jefe Unidad Auditoria Interna</b> Recepciono la hoja de ruta IBM/2013-00007', '::1', NULL, NULL),
(495, 12, 14, '2013-02-20 14:31:36', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(496, 2, 7, '2013-02-20 14:31:47', 'Carlos Ponce <b>ventanilla</b> ingresó al sistema', '::1', NULL, NULL),
(497, 2, 7, '2013-02-20 14:32:16', 'Carlos Ponce <b>ventanilla</b> salio al sistema', '::1', NULL, NULL),
(498, 12, 14, '2013-02-20 14:32:25', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(499, 12, 14, '2013-02-20 15:43:49', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(500, 3, 19, '2013-02-20 15:44:44', 'Carlos Eduardo <b>Responsable Regional Cochabamba</b> ingresó al sistema', '::1', NULL, NULL),
(501, 3, 19, '2013-02-20 15:45:05', 'Carlos Eduardo <b>Responsable Regional Cochabamba</b> salio al sistema', '::1', NULL, NULL),
(502, 12, 14, '2013-02-20 15:45:12', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(503, 12, 14, '2013-02-20 15:45:30', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(504, 3, 22, '2013-02-20 15:45:37', 'Maria Fernanda <b>Tecnico Metrología Legal I</b> ingresó al sistema', '::1', NULL, NULL),
(505, 3, 22, '2013-02-20 15:45:49', 'Maria Fernanda <b>Tecnico Metrología Legal I</b> salio al sistema', '::1', NULL, NULL),
(506, 3, 21, '2013-02-20 15:48:16', 'Jose María <b>Supervisor Técnico</b> ingresó al sistema', '::1', NULL, NULL),
(507, 3, 21, '2013-02-20 15:49:08', 'Jose María | <b>Supervisor Técnico</b> Deriva la Hoja de Ruta IBM/2013-00001(Oficial) a Carlos Eduardo | <b>Responsable Regional Cochabamba</b>', '::1', NULL, NULL),
(508, 3, 21, '2013-02-20 15:49:12', 'Jose María <b>Supervisor Técnico</b> salio al sistema', '::1', NULL, NULL),
(509, 3, 19, '2013-02-20 15:49:18', 'Carlos Eduardo <b>Responsable Regional Cochabamba</b> ingresó al sistema', '::1', NULL, NULL),
(510, 3, 19, '2013-02-20 15:49:46', 'Carlos Eduardo <b>Responsable Regional Cochabamba</b> salio al sistema', '::1', NULL, NULL),
(511, 3, 19, '2013-02-20 15:50:08', 'Carlos Eduardo <b>Responsable Regional Cochabamba</b> ingresó al sistema', '::1', NULL, NULL),
(512, 3, 19, '2013-02-20 15:50:24', 'Carlos Eduardo | <b>Responsable Regional Cochabamba</b> Recepciono la hoja de ruta IBM/2013-00001', '::1', NULL, NULL),
(513, 3, 19, '2013-02-20 16:14:30', 'Carlos Eduardo <b>Responsable Regional Cochabamba</b> salio al sistema', '::1', NULL, NULL),
(514, 3, 19, '2013-02-20 16:14:40', 'Carlos Eduardo <b>Responsable Regional Cochabamba</b> ingresó al sistema', '::1', NULL, NULL),
(515, 3, 19, '2013-02-20 16:15:01', 'Carlos Eduardo <b>Responsable Regional Cochabamba</b> salio al sistema', '::1', NULL, NULL),
(516, 12, 14, '2013-02-20 16:15:08', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(517, 12, 14, '2013-02-20 16:19:30', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(518, 12, 14, '2013-02-20 16:21:48', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(519, 12, 14, '2013-02-20 17:10:37', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(520, 3, 19, '2013-02-20 17:10:45', 'Carlos Eduardo <b>Responsable Regional Cochabamba</b> ingresó al sistema', '::1', NULL, NULL),
(521, 3, 19, '2013-02-20 17:13:38', 'Carlos Eduardo <b>Responsable Regional Cochabamba</b> salio al sistema', '::1', NULL, NULL),
(522, 12, 14, '2013-02-20 17:13:47', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(523, 12, 14, '2013-02-20 17:14:10', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(524, 3, 22, '2013-02-20 17:16:24', 'Maria Fernanda <b>Tecnico Metrología Legal I</b> ingresó al sistema', '::1', NULL, NULL),
(525, 3, 22, '2013-02-20 17:28:51', 'Maria Fernanda <b>Tecnico Metrología Legal I</b> salio al sistema', '::1', NULL, NULL),
(526, 12, 14, '2013-02-20 17:29:05', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(527, 12, 14, '2013-02-20 17:29:21', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(528, 12, 15, '2013-02-20 17:30:34', 'Juan Carlos <b>Profesional Auditor Senior</b> ingresó al sistema', '::1', NULL, NULL),
(529, 12, 15, '2013-02-20 17:36:52', 'Juan Carlos | <b>Profesional Auditor Senior</b> Deriva la Hoja de Ruta ZFC/2013-00003(Oficial) a Luis Fernando | <b>Jefe Unidad Auditoria Interna</b>', '::1', NULL, NULL),
(530, 12, 15, '2013-02-20 17:40:09', 'Juan Carlos <b>Profesional Auditor Senior</b> salio al sistema', '::1', NULL, NULL),
(531, 12, 14, '2013-02-20 17:40:47', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(532, 12, 14, '2013-02-20 17:44:26', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(533, 3, 19, '2013-02-20 17:44:52', 'Carlos Eduardo <b>Responsable Regional Cochabamba</b> ingresó al sistema', '::1', NULL, NULL),
(534, 3, 19, '2013-02-20 17:45:35', 'Carlos Eduardo <b>Responsable Regional Cochabamba</b> salio al sistema', '::1', NULL, NULL),
(535, 3, 19, '2013-02-20 17:45:44', 'Carlos Eduardo <b>Responsable Regional Cochabamba</b> ingresó al sistema', '::1', NULL, NULL),
(536, 3, 19, '2013-02-20 17:45:53', 'Carlos Eduardo <b>Responsable Regional Cochabamba</b> salio al sistema', '::1', NULL, NULL),
(537, 12, 14, '2013-02-20 17:46:08', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(538, 12, 14, '2013-02-20 17:46:18', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(539, 3, 19, '2013-02-20 17:47:41', 'Carlos Eduardo <b>Responsable Regional Cochabamba</b> ingresó al sistema', '::1', NULL, NULL),
(540, 3, 19, '2013-02-20 17:49:42', 'Carlos Eduardo <b>Responsable Regional Cochabamba</b> salio al sistema', '::1', NULL, NULL),
(541, 12, 14, '2013-02-20 17:49:59', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(542, 12, 14, '2013-02-20 17:50:10', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(543, 3, 19, '2013-02-20 17:50:18', 'Carlos Eduardo <b>Responsable Regional Cochabamba</b> ingresó al sistema', '::1', NULL, NULL),
(544, 3, 19, '2013-02-20 17:50:27', 'Carlos Eduardo <b>Responsable Regional Cochabamba</b> salio al sistema', '::1', NULL, NULL),
(545, 12, 15, '2013-02-20 17:50:37', 'Juan Carlos <b>Profesional Auditor Senior</b> ingresó al sistema', '::1', NULL, NULL),
(546, 12, 15, '2013-02-20 17:51:03', 'Juan Carlos <b>Profesional Auditor Senior</b> salio al sistema', '::1', NULL, NULL),
(547, 12, 14, '2013-02-20 17:51:08', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(548, 12, 14, '2013-02-20 17:52:12', 'Luis Fernando | <b>Jefe Unidad Auditoria Interna</b> Deriva la Hoja de Ruta ZFC/2013-00010(Oficial) a Juan Carlos | <b>Profesional Auditor Senior</b>', '::1', NULL, NULL),
(549, 12, 14, '2013-02-20 17:52:16', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(550, 12, 15, '2013-02-20 17:52:24', 'Juan Carlos <b>Profesional Auditor Senior</b> ingresó al sistema', '::1', NULL, NULL),
(551, 12, 15, '2013-02-20 17:52:41', 'Juan Carlos | <b>Profesional Auditor Senior</b> Recepciono la hoja de ruta ZFC/2013-00010', '::1', NULL, NULL),
(552, 12, 15, '2013-02-20 17:54:04', 'Juan Carlos <b>Profesional Auditor Senior</b> salio al sistema', '::1', NULL, NULL),
(553, 12, 14, '2013-02-20 17:54:13', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(554, 12, 14, '2013-02-20 17:55:36', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(555, 12, 15, '2013-02-20 17:55:47', 'Juan Carlos <b>Profesional Auditor Senior</b> ingresó al sistema', '::1', NULL, NULL),
(556, 12, 15, '2013-02-20 18:00:48', 'Juan Carlos <b>Profesional Auditor Senior</b> salio al sistema', '::1', NULL, NULL),
(557, 12, 14, '2013-02-20 18:00:54', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(558, 12, 14, '2013-02-20 18:02:04', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(559, 12, 15, '2013-02-20 18:02:10', 'Juan Carlos <b>Profesional Auditor Senior</b> ingresó al sistema', '::1', NULL, NULL),
(560, 12, 15, '2013-02-20 18:06:24', 'Juan Carlos | <b>Profesional Auditor Senior</b> Deriva la Hoja de Ruta ZFC/2013-00014(Oficial) a Luis Fernando | <b>Jefe Unidad Auditoria Interna</b>', '::1', NULL, NULL),
(561, 12, 15, '2013-02-20 18:06:27', 'Juan Carlos <b>Profesional Auditor Senior</b> salio al sistema', '::1', NULL, NULL),
(562, 12, 15, '2013-02-20 18:06:44', 'Juan Carlos <b>Profesional Auditor Senior</b> ingresó al sistema', '::1', NULL, NULL),
(563, 12, 15, '2013-02-20 18:06:58', 'Juan Carlos <b>Profesional Auditor Senior</b> salio al sistema', '::1', NULL, NULL),
(564, 12, 14, '2013-02-20 18:07:25', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(565, 12, 14, '2013-02-20 18:07:38', 'Luis Fernando | <b>Jefe Unidad Auditoria Interna</b> Recepciono la hoja de ruta ZFC/2013-00014', '::1', NULL, NULL),
(566, 12, 14, '2013-02-20 18:07:42', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(567, 12, 15, '2013-02-20 18:07:49', 'Juan Carlos <b>Profesional Auditor Senior</b> ingresó al sistema', '::1', NULL, NULL),
(568, 12, 15, '2013-02-20 18:15:32', 'Juan Carlos <b>Profesional Auditor Senior</b> salio al sistema', '::1', NULL, NULL),
(569, 12, 14, '2013-02-20 18:15:38', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(570, 12, 14, '2013-02-20 18:16:20', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(571, 12, 15, '2013-02-20 18:16:38', 'Juan Carlos <b>Profesional Auditor Senior</b> ingresó al sistema', '::1', NULL, NULL),
(572, 12, 15, '2013-02-20 18:17:31', 'Juan Carlos | <b>Profesional Auditor Senior</b> Deriva la Hoja de Ruta ZFC/2013-00010(Oficial) a Luis Fernando | <b>Jefe Unidad Auditoria Interna</b>', '::1', NULL, NULL),
(573, 12, 15, '2013-02-20 18:17:34', 'Juan Carlos <b>Profesional Auditor Senior</b> salio al sistema', '::1', NULL, NULL),
(574, 12, 14, '2013-02-20 18:17:41', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(575, 12, 14, '2013-02-20 18:17:53', 'Luis Fernando | <b>Jefe Unidad Auditoria Interna</b> Recepciono la hoja de ruta ZFC/2013-00010', '::1', NULL, NULL),
(576, 12, 14, '2013-02-20 18:19:20', 'Luis Fernando | <b>Jefe Unidad Auditoria Interna</b> Deriva la Hoja de Ruta ZFC/2013-00010(Oficial) a Karla Patricia | <b>Supervisor Auditoria Interna</b>', '::1', NULL, NULL),
(577, 12, 14, '2013-02-20 18:19:28', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(578, 12, 15, '2013-02-20 18:19:35', 'Juan Carlos <b>Profesional Auditor Senior</b> ingresó al sistema', '::1', NULL, NULL),
(579, 12, 15, '2013-02-20 18:25:33', 'Juan Carlos <b>Profesional Auditor Senior</b> salio al sistema', '::1', NULL, NULL),
(580, 12, 14, '2013-02-20 18:25:39', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(581, 12, 14, '2013-02-20 18:29:26', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(582, 12, 15, '2013-02-20 18:29:34', 'Juan Carlos <b>Profesional Auditor Senior</b> ingresó al sistema', '::1', NULL, NULL),
(583, 12, 15, '2013-02-21 08:52:09', 'Juan Carlos <b>Profesional Auditor Senior</b> salio al sistema', '::1', NULL, NULL),
(584, 3, 19, '2013-02-21 08:52:20', 'Carlos Eduardo <b>Responsable Regional Cochabamba</b> ingresó al sistema', '::1', NULL, NULL),
(585, 3, 19, '2013-02-21 08:54:47', 'Carlos Eduardo <b>Responsable Regional Cochabamba</b> salio al sistema', '::1', NULL, NULL),
(586, 12, 14, '2013-02-21 08:54:55', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(587, 12, 14, '2013-02-21 08:56:01', 'Luis Fernando | <b>Jefe Unidad Auditoria Interna</b> Recepciono la hoja de ruta ZFC/2013-00003', '::1', NULL, NULL),
(588, 12, 14, '2013-02-21 08:56:25', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(589, 12, 17, '2013-02-21 08:56:39', 'Juan Perez <b>Tecnico Auditor Junior</b> ingresó al sistema', '::1', NULL, NULL),
(590, 12, 17, '2013-02-21 09:08:12', 'Juan Perez | <b>Tecnico Auditor Junior</b> Deriva la Hoja de Ruta ZFC/2013-00017(Oficial) a Luis Fernando | <b>Jefe Unidad Auditoria Interna</b>', '::1', NULL, NULL),
(591, 12, 17, '2013-02-21 09:08:16', 'Juan Perez <b>Tecnico Auditor Junior</b> salio al sistema', '::1', NULL, NULL),
(592, 12, 16, '2013-02-21 09:09:09', 'Karla Patricia <b>Supervisor Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(593, 12, 16, '2013-02-21 09:09:27', 'Karla Patricia | <b>Supervisor Auditoria Interna</b> Recepciono la hoja de ruta ZFC/2013-00010', '::1', NULL, NULL),
(594, 12, 16, '2013-02-21 09:11:39', 'Karla Patricia | <b>Supervisor Auditoria Interna</b> Deriva la Hoja de Ruta ZFC/2013-00018(Copia) a Luis Fernando | <b>Jefe Unidad Auditoria Interna</b>', '::1', NULL, NULL),
(595, 12, 16, '2013-02-21 09:11:43', 'Karla Patricia <b>Supervisor Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(596, 12, 14, '2013-02-21 09:11:54', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(597, 12, 14, '2013-02-21 09:12:17', 'Luis Fernando | <b>Jefe Unidad Auditoria Interna</b> Recepciono la hoja de ruta ZFC/2013-00018', '::1', NULL, NULL),
(598, 12, 14, '2013-02-21 09:12:54', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(599, 12, 15, '2013-02-21 09:13:05', 'Juan Carlos <b>Profesional Auditor Senior</b> ingresó al sistema', '::1', NULL, NULL),
(600, 12, 15, '2013-02-21 09:23:50', 'Juan Carlos | <b>Profesional Auditor Senior</b> Deriva la Hoja de Ruta ZFC/2013-00019(Oficial) a Luis Fernando | <b>Jefe Unidad Auditoria Interna</b>', '::1', NULL, NULL),
(601, 12, 15, '2013-02-21 09:23:55', 'Juan Carlos <b>Profesional Auditor Senior</b> salio al sistema', '::1', NULL, NULL),
(602, 12, 14, '2013-02-21 09:24:02', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(603, 12, 14, '2013-02-21 09:24:30', 'Luis Fernando | <b>Jefe Unidad Auditoria Interna</b> Recepciono la hoja de ruta ZFC/2013-00017', '::1', NULL, NULL),
(604, 12, 14, '2013-02-21 09:24:43', 'Luis Fernando | <b>Jefe Unidad Auditoria Interna</b> Recepciono la hoja de ruta ZFC/2013-00019', '::1', NULL, NULL),
(605, 12, 14, '2013-02-21 09:26:49', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(606, 12, 15, '2013-02-21 09:26:56', 'Juan Carlos <b>Profesional Auditor Senior</b> ingresó al sistema', '::1', NULL, NULL),
(607, 12, 15, '2013-02-21 09:27:41', 'Juan Carlos <b>Profesional Auditor Senior</b> salio al sistema', '::1', NULL, NULL),
(608, 12, 14, '2013-02-21 09:27:58', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(609, 12, 14, '2013-02-21 09:30:24', 'Luis Fernando | <b>Jefe Unidad Auditoria Interna</b> Deriva la Hoja de Ruta ZFC/2013-00020(Oficial) a Karla Patricia | <b>Supervisor Auditoria Interna</b>', '::1', NULL, NULL),
(610, 12, 14, '2013-02-21 09:30:32', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(611, 12, 14, '2013-02-21 09:39:14', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(612, 12, 14, '2013-02-21 09:39:22', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(613, 12, 16, '2013-02-21 09:39:32', 'Karla Patricia <b>Supervisor Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(614, 12, 16, '2013-02-21 09:39:41', 'Karla Patricia | <b>Supervisor Auditoria Interna</b> Recepciono la hoja de ruta ZFC/2013-00020', '::1', NULL, NULL),
(615, 12, 16, '2013-02-21 09:43:08', 'Karla Patricia | <b>Supervisor Auditoria Interna</b> Deriva la Hoja de Ruta ZFC/2013-00021(Oficial) a Luis Fernando | <b>Jefe Unidad Auditoria Interna</b>', '::1', NULL, NULL),
(616, 12, 16, '2013-02-21 09:43:12', 'Karla Patricia <b>Supervisor Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(617, 12, 14, '2013-02-21 09:43:19', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(618, 12, 14, '2013-02-21 09:43:29', 'Luis Fernando | <b>Jefe Unidad Auditoria Interna</b> Recepciono la hoja de ruta ZFC/2013-00021', '::1', NULL, NULL),
(619, 12, 14, '2013-02-21 09:44:51', 'Luis Fernando | <b>Jefe Unidad Auditoria Interna</b> Deriva la Hoja de Ruta ZFC/2013-00021(Oficial) a Juan Carlos | <b>Profesional Auditor Senior</b>', '::1', NULL, NULL),
(620, 12, 14, '2013-02-21 09:44:56', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(621, 12, 15, '2013-02-21 09:45:07', 'Juan Carlos <b>Profesional Auditor Senior</b> ingresó al sistema', '::1', NULL, NULL),
(622, 12, 15, '2013-02-21 09:45:36', 'Juan Carlos | <b>Profesional Auditor Senior</b> Recepciono la hoja de ruta ZFC/2013-00021', '::1', NULL, NULL),
(623, 1, 1, '2013-02-21 10:21:25', 'Freddy Velasco <b>Administrador del sistema</b> salio al sistema', '::1', NULL, NULL),
(624, 12, 14, '2013-02-21 10:21:33', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(625, 12, 14, '2013-02-21 10:23:57', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(626, 12, 16, '2013-02-21 10:24:17', 'Karla Patricia <b>Supervisor Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(627, 12, 16, '2013-02-21 10:24:43', 'Karla Patricia | <b>Supervisor Auditoria Interna</b> Deriva la Hoja de Ruta ZFC/2013-00018(Oficial) a Luis Fernando | <b>Jefe Unidad Auditoria Interna</b>', '::1', NULL, NULL),
(628, 12, 16, '2013-02-21 10:24:46', 'Karla Patricia <b>Supervisor Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(629, 12, 14, '2013-02-21 10:24:52', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(630, 12, 14, '2013-02-21 10:32:35', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(631, 12, 15, '2013-02-21 10:32:40', 'Juan Carlos <b>Profesional Auditor Senior</b> ingresó al sistema', '::1', NULL, NULL),
(632, 12, 15, '2013-02-21 10:40:44', 'Juan Carlos <b>Profesional Auditor Senior</b> salio al sistema', '::1', NULL, NULL),
(633, 12, 14, '2013-02-21 10:40:50', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(634, 12, 14, '2013-02-21 10:41:14', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(635, 3, 19, '2013-02-21 10:41:20', 'Carlos Eduardo <b>Responsable Regional Cochabamba</b> ingresó al sistema', '::1', NULL, NULL),
(636, 3, 19, '2013-02-21 10:41:40', 'Carlos Eduardo <b>Responsable Regional Cochabamba</b> salio al sistema', '::1', NULL, NULL),
(637, 3, 22, '2013-02-21 10:41:47', 'Maria Fernanda <b>Tecnico Metrología Legal I</b> ingresó al sistema', '::1', NULL, NULL),
(638, 3, 22, '2013-02-21 10:42:06', 'Maria Fernanda <b>Tecnico Metrología Legal I</b> salio al sistema', '::1', NULL, NULL),
(639, 3, 21, '2013-02-21 10:42:14', 'Jose María <b>Supervisor Técnico</b> ingresó al sistema', '::1', NULL, NULL),
(640, 3, 21, '2013-02-21 10:42:33', 'Jose María <b>Supervisor Técnico</b> salio al sistema', '::1', NULL, NULL),
(641, 3, 22, '2013-02-21 10:42:50', 'Maria Fernanda <b>Tecnico Metrología Legal I</b> ingresó al sistema', '::1', NULL, NULL),
(642, 3, 22, '2013-02-21 10:43:48', 'Maria Fernanda <b>Tecnico Metrología Legal I</b> salio al sistema', '::1', NULL, NULL),
(643, 3, 22, '2013-02-21 10:43:54', 'Maria Fernanda <b>Tecnico Metrología Legal I</b> ingresó al sistema', '::1', NULL, NULL),
(644, 3, 22, '2013-02-21 10:45:31', 'Maria Fernanda <b>Tecnico Metrología Legal I</b> salio al sistema', '::1', NULL, NULL),
(645, 12, 14, '2013-02-21 10:45:37', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(646, 12, 14, '2013-02-21 10:56:47', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(647, 1, 3, '2013-02-21 10:57:23', 'Ana Teresa Morales Olivera <b>Ministra</b> ingresó al sistema', '::1', NULL, NULL),
(648, 1, 3, '2013-02-21 10:58:20', 'Ana Teresa Morales Olivera <b>Ministra</b> salio al sistema', '::1', NULL, NULL),
(649, 12, 14, '2013-02-21 10:59:03', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(650, 12, 14, '2013-02-21 11:10:55', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(651, 12, 14, '2013-02-21 11:28:52', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(652, 3, 19, '2013-02-21 11:28:59', 'Carlos Eduardo <b>Responsable Regional Cochabamba</b> ingresó al sistema', '::1', NULL, NULL),
(653, 3, 19, '2013-02-21 11:35:14', 'Carlos Eduardo <b>Responsable Regional Cochabamba</b> salio al sistema', '::1', NULL, NULL),
(654, 12, 14, '2013-02-21 11:35:20', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(655, 12, 14, '2013-02-21 15:16:19', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(656, 12, 15, '2013-02-21 15:16:27', 'Juan Carlos <b>Profesional Auditor Senior</b> ingresó al sistema', '::1', NULL, NULL),
(657, 12, 15, '2013-02-21 15:16:34', 'Juan Carlos <b>Profesional Auditor Senior</b> salio al sistema', '::1', NULL, NULL),
(658, 12, 16, '2013-02-21 15:16:43', 'Karla Patricia <b>Supervisor Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(659, 12, 16, '2013-02-21 15:16:49', 'Karla Patricia <b>Supervisor Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(660, 12, 14, '2013-02-21 15:17:47', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(661, 12, 14, '2013-02-21 15:23:49', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(662, 12, 14, '2013-02-21 15:24:00', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(663, 12, 14, '2013-02-21 15:29:59', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> Cambio su contrase&ntilde;', '::1', NULL, NULL),
(664, 12, 14, '2013-02-21 15:30:04', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(665, 12, 14, '2013-02-21 15:30:10', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(666, 12, 14, '2013-02-21 15:30:25', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> Cambio su contrase&ntilde;', '::1', NULL, NULL),
(667, 12, 14, '2013-02-21 16:44:45', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(668, 12, 14, '2013-02-21 16:44:54', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(669, 12, 14, '2013-02-21 17:57:44', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(670, 12, 15, '2013-02-21 17:57:51', 'Juan Carlos <b>Profesional Auditor Senior</b> ingresó al sistema', '::1', NULL, NULL),
(671, 12, 15, '2013-02-22 09:17:57', 'Juan Carlos <b>Profesional Auditor Senior</b> salio al sistema', '::1', NULL, NULL),
(672, 12, 14, '2013-02-22 09:18:03', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(673, 12, 14, '2013-02-22 11:40:48', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(674, 12, 14, '2013-02-22 11:40:55', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(675, 12, 14, '2013-02-22 11:41:12', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(676, 3, 19, '2013-02-22 11:41:18', 'Carlos Eduardo <b>Responsable Regional Cochabamba</b> ingresó al sistema', '::1', NULL, NULL),
(677, 3, 19, '2013-02-22 11:42:03', 'Carlos Eduardo <b>Responsable Regional Cochabamba</b> salio al sistema', '::1', NULL, NULL),
(678, 12, 15, '2013-02-22 11:42:13', 'Juan Carlos <b>Profesional Auditor Senior</b> ingresó al sistema', '::1', NULL, NULL),
(679, 12, 15, '2013-02-22 11:43:06', 'Juan Carlos <b>Profesional Auditor Senior</b> salio al sistema', '::1', NULL, NULL),
(680, 12, 16, '2013-02-22 11:43:15', 'Karla Patricia <b>Supervisor Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(681, 12, 16, '2013-02-22 11:49:21', 'Karla Patricia <b>Supervisor Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(682, 12, 16, '2013-02-22 11:49:29', 'Karla Patricia <b>Supervisor Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(683, 12, 16, '2013-02-22 11:49:38', 'Karla Patricia <b>Supervisor Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(684, 12, 17, '2013-02-22 11:49:47', 'Juan Perez <b>Tecnico Auditor Junior</b> ingresó al sistema', '::1', NULL, NULL),
(685, 12, 17, '2013-02-22 11:49:57', 'Juan Perez <b>Tecnico Auditor Junior</b> salio al sistema', '::1', NULL, NULL),
(686, 12, 14, '2013-02-22 11:50:03', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(687, 12, 14, '2013-02-22 11:50:12', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(688, 3, 22, '2013-02-22 11:50:26', 'Maria Fernanda <b>Tecnico Metrología Legal I</b> ingresó al sistema', '::1', NULL, NULL),
(689, 3, 22, '2013-02-22 11:50:36', 'Maria Fernanda <b>Tecnico Metrología Legal I</b> salio al sistema', '::1', NULL, NULL),
(690, 12, 16, '2013-02-22 11:51:05', 'Karla Patricia <b>Supervisor Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(691, 12, 16, '2013-02-22 12:09:54', 'Karla Patricia | <b>Supervisor Auditoria Interna</b> Deriva la Hoja de Ruta ZFC/2013-00010(Oficial) a Luis Fernando | <b>Jefe Unidad Auditoria Interna</b>', '::1', NULL, NULL),
(692, 12, 16, '2013-02-22 12:12:11', 'Karla Patricia | <b>Supervisor Auditoria Interna</b> Deriva la Hoja de Ruta ZFC/2013-00020(Oficial) a Luis Fernando | <b>Jefe Unidad Auditoria Interna</b>', '::1', NULL, NULL),
(693, 12, 16, '2013-02-22 12:16:42', 'Karla Patricia | <b>Supervisor Auditoria Interna</b> Deriva la Hoja de Ruta ZFC/2013-00020(Oficial) a Luis Fernando | <b>Jefe Unidad Auditoria Interna</b>', '::1', NULL, NULL),
(694, 0, 16, '2013-02-22 12:16:47', 'Karla Patricia | <b>Supervisor Auditoria Interna</b> Cancela derivacion de la Hoja de Ruta ZFC/2013-00020(Oficial) a Luis Fernando', '::1', NULL, NULL),
(695, 12, 16, '2013-02-22 12:16:56', 'Karla Patricia | <b>Supervisor Auditoria Interna</b> Deriva la Hoja de Ruta ZFC/2013-00020(Oficial) a Luis Fernando | <b>Jefe Unidad Auditoria Interna</b>', '::1', NULL, NULL),
(696, 0, 16, '2013-02-22 12:17:08', 'Karla Patricia | <b>Supervisor Auditoria Interna</b> Cancela derivacion de la Hoja de Ruta ZFC/2013-00020(Oficial) a Luis Fernando', '::1', NULL, NULL),
(697, 12, 16, '2013-02-22 12:17:10', 'Karla Patricia | <b>Supervisor Auditoria Interna</b> Deriva la Hoja de Ruta ZFC/2013-00020(Oficial) a Luis Fernando | <b>Jefe Unidad Auditoria Interna</b>', '::1', NULL, NULL),
(698, 12, 16, '2013-02-22 14:04:15', 'Karla Patricia <b>Supervisor Auditoria Interna</b> salio al sistema', '::1', NULL, NULL),
(699, 12, 14, '2013-02-22 14:04:20', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(700, 12, 14, '2013-02-25 16:33:40', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '::1', NULL, NULL),
(701, 1, 2, '2013-03-11 08:19:13', 'Antonio Garcia M. <b>Encargado de Sistemas</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(702, 1, 2, '2013-03-11 08:19:19', 'Antonio Garcia M. <b>Encargado de Sistemas</b> salio al sistema', '127.0.0.1', NULL, NULL),
(703, 1, 2, '2013-03-11 08:19:25', 'Antonio Garcia M. <b>Encargado de Sistemas</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(704, 12, 15, '2013-03-12 16:47:08', 'Juan Carlos <b>Profesional Auditor Senior</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(705, 12, 15, '2013-03-12 16:53:58', 'Juan Carlos <b>Profesional Auditor Senior</b> salio al sistema', '127.0.0.1', NULL, NULL),
(706, 12, 14, '2013-03-12 16:55:17', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(707, 12, 14, '2013-03-13 12:36:50', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '127.0.0.1', NULL, NULL),
(708, 12, 14, '2013-03-15 12:07:18', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(709, 2, 7, '2013-03-19 14:39:53', 'Carlos Ponce <b>ventanilla</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(710, 2, 7, '2013-03-19 14:48:21', 'Carlos Ponce <b>ventanilla</b> salio al sistema', '127.0.0.1', NULL, NULL),
(711, 1, 1, '2013-03-19 14:48:32', 'Freddy Velasco <b>Administrador del sistema</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(712, 1, 1, '2013-03-19 14:52:25', 'Freddy Velasco <b>Administrador del sistema</b> salio al sistema', '127.0.0.1', NULL, NULL),
(713, 3, 24, '2013-03-19 14:52:33', 'Jose Luis <b>correspondencia</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(714, 3, 24, '2013-03-19 16:57:52', 'Jose Luis <b>correspondencia</b> salio al sistema', '127.0.0.1', NULL, NULL),
(715, 3, 21, '2013-03-19 16:58:07', 'Jose María <b>Supervisor Técnico</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(716, 3, 21, '2013-03-19 17:01:04', 'Jose María <b>Supervisor Técnico</b> salio al sistema', '127.0.0.1', NULL, NULL),
(717, 3, 24, '2013-03-19 17:01:13', 'Jose Luis <b>correspondencia</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(718, 3, 24, '2013-03-19 17:17:38', 'Jose Luis <b>correspondencia</b> salio al sistema', '127.0.0.1', NULL, NULL),
(719, 3, 21, '2013-03-19 17:17:47', 'Jose María <b>Supervisor Técnico</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(720, 3, 21, '2013-03-19 17:18:53', 'Jose María <b>Supervisor Técnico</b> salio al sistema', '127.0.0.1', NULL, NULL),
(721, 3, 24, '2013-03-19 17:18:59', 'Jose Luis <b>correspondencia</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(722, 3, 24, '2013-03-19 17:23:45', 'Jose Luis <b>correspondencia</b> salio al sistema', '127.0.0.1', NULL, NULL),
(723, 12, 16, '2013-03-19 17:23:51', 'Karla Patricia <b>Supervisor Auditoria Interna</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(724, 12, 16, '2013-03-19 17:24:56', 'Karla Patricia <b>Supervisor Auditoria Interna</b> salio al sistema', '127.0.0.1', NULL, NULL),
(725, 3, 24, '2013-03-19 17:25:02', 'Jose Luis <b>correspondencia</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(726, 3, 24, '2013-03-19 18:19:52', 'Jose Luis <b>correspondencia</b> salio al sistema', '127.0.0.1', NULL, NULL),
(727, 3, 19, '2013-03-19 18:20:02', 'Carlos Eduardo <b>Responsable Regional Cochabamba</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(728, 3, 19, '2013-03-19 18:20:11', 'Carlos Eduardo <b>Responsable Regional Cochabamba</b> salio al sistema', '127.0.0.1', NULL, NULL),
(729, 12, 16, '2013-03-19 18:20:20', 'Karla Patricia <b>Supervisor Auditoria Interna</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(730, 12, 16, '2013-03-19 18:23:31', 'Karla Patricia <b>Supervisor Auditoria Interna</b> salio al sistema', '127.0.0.1', NULL, NULL),
(731, 3, 24, '2013-03-19 18:23:36', 'Jose Luis <b>correspondencia</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(732, 3, 24, '2013-03-19 18:25:23', 'Jose Luis | <b>correspondencia</b> Deriva la Hoja de Ruta E-IBM/2013-00010(Oficial) a Carlos Eduardo | <b>Responsable Regional Cochabamba</b>', '127.0.0.1', NULL, NULL),
(733, 0, 24, '2013-03-19 18:25:26', 'Jose Luis | <b>correspondencia</b> Cancela derivacion de la Hoja de Ruta E-IBM/2013-00010(Oficial) a Carlos Eduardo', '127.0.0.1', NULL, NULL),
(734, 3, 24, '2013-03-19 18:25:27', 'Jose Luis | <b>correspondencia</b> Deriva la Hoja de Ruta E-IBM/2013-00010(Oficial) a Carlos Eduardo | <b>Responsable Regional Cochabamba</b>', '127.0.0.1', NULL, NULL),
(735, 0, 24, '2013-03-19 18:25:29', 'Jose Luis | <b>correspondencia</b> Cancela derivacion de la Hoja de Ruta E-IBM/2013-00010(Oficial) a Carlos Eduardo', '127.0.0.1', NULL, NULL),
(736, 3, 24, '2013-03-19 18:25:47', 'Jose Luis | <b>correspondencia</b> Deriva la Hoja de Ruta E-IBM/2013-00010(Oficial) a Carlos Eduardo | <b>Responsable Regional Cochabamba</b>', '127.0.0.1', NULL, NULL),
(737, 3, 24, '2013-03-19 18:31:38', 'Jose Luis | <b>correspondencia</b> Deriva la Hoja de Ruta IBM/2013-00006(Oficial) a Carlos Eduardo | <b>Responsable Regional Cochabamba</b>', '127.0.0.1', NULL, NULL),
(738, 0, 24, '2013-03-19 18:31:40', 'Jose Luis | <b>correspondencia</b> Cancela derivacion de la Hoja de Ruta IBM/2013-00006(Oficial) a Carlos Eduardo', '127.0.0.1', NULL, NULL),
(739, 3, 24, '2013-03-19 18:32:51', 'Jose Luis | <b>correspondencia</b> Deriva la Hoja de Ruta IBM/2013-00006(Oficial) a Carlos Eduardo | <b>Responsable Regional Cochabamba</b>', '127.0.0.1', NULL, NULL),
(740, 3, 24, '2013-03-20 09:08:00', 'Jose Luis <b>correspondencia</b> salio al sistema', '127.0.0.1', NULL, NULL),
(741, 12, 14, '2013-03-20 09:08:06', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(742, 12, 14, '2013-03-20 09:19:11', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '127.0.0.1', NULL, NULL),
(743, 3, 24, '2013-03-20 09:19:24', 'Jose Luis <b>correspondencia</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(744, 3, 24, '2013-03-20 09:31:40', 'Jose Luis <b>correspondencia</b> salio al sistema', '127.0.0.1', NULL, NULL),
(745, 12, 14, '2013-03-20 09:31:44', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(746, 12, 14, '2013-03-20 09:33:45', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '127.0.0.1', NULL, NULL),
(747, 3, 24, '2013-03-20 09:33:50', 'Jose Luis <b>correspondencia</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(748, 3, 24, '2013-03-20 09:35:34', 'Jose Luis <b>correspondencia</b> salio al sistema', '127.0.0.1', NULL, NULL),
(749, 12, 14, '2013-03-20 09:35:40', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(750, 12, 14, '2013-03-20 09:37:25', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '127.0.0.1', NULL, NULL),
(751, 3, 24, '2013-03-20 09:37:30', 'Jose Luis <b>correspondencia</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(752, 3, 24, '2013-03-20 14:48:48', 'Jose Luis | <b>correspondencia</b> Deriva la Hoja de Ruta IBM/2013-00006(Oficial) a Luis Fernando | <b>Jefe Unidad Auditoria Interna</b>', '127.0.0.1', NULL, NULL),
(753, 3, 24, '2013-03-20 14:51:21', 'Jose Luis <b>correspondencia</b> salio al sistema', '127.0.0.1', NULL, NULL),
(754, 12, 14, '2013-03-20 14:51:26', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '127.0.0.1', NULL, NULL);
INSERT INTO `vitacora` (`id`, `id_entidad`, `id_usuario`, `fecha_hora`, `accion_realizada`, `ip_usuario`, `hostname`, `mac_usuario`) VALUES
(755, 12, 14, '2013-03-20 14:58:21', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '127.0.0.1', NULL, NULL),
(756, 3, 24, '2013-03-20 14:58:28', 'Jose Luis <b>correspondencia</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(757, 3, 24, '2013-03-20 15:07:58', 'Jose Luis | <b>correspondencia</b> Deriva la Hoja de Ruta E-IBM/2013-00012(Oficial) a Luis Fernando | <b>Jefe Unidad Auditoria Interna</b>', '127.0.0.1', NULL, NULL),
(758, 3, 24, '2013-03-20 15:56:01', 'Jose Luis <b>correspondencia</b> salio al sistema', '127.0.0.1', NULL, NULL),
(759, 12, 14, '2013-03-20 15:56:05', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(760, 12, 14, '2013-03-20 16:03:32', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '127.0.0.1', NULL, NULL),
(761, 3, 24, '2013-03-20 16:03:36', 'Jose Luis <b>correspondencia</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(762, 3, 24, '2013-03-20 16:03:50', 'Jose Luis <b>correspondencia</b> salio al sistema', '127.0.0.1', NULL, NULL),
(763, 3, 24, '2013-03-20 16:04:40', 'Jose Luis <b>correspondencia</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(764, 3, 24, '2013-03-20 16:13:35', 'Jose Luis <b>correspondencia</b> salio al sistema', '127.0.0.1', NULL, NULL),
(765, 12, 14, '2013-03-20 16:52:24', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(766, 12, 14, '2013-03-22 12:31:09', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(767, 12, 14, '2013-03-25 11:34:37', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(768, 12, 14, '2013-03-25 11:34:41', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '127.0.0.1', NULL, NULL),
(769, 3, 24, '2013-03-25 11:34:46', 'Jose Luis <b>correspondencia</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(770, 3, 24, '2013-03-25 12:31:40', 'Jose Luis <b>correspondencia</b> salio al sistema', '127.0.0.1', NULL, NULL),
(771, 1, 1, '2013-03-25 15:36:59', 'Freddy Velasco <b>Administrador del sistema</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(772, 1, 1, '2013-03-25 15:37:31', 'Freddy Velasco <b>Administrador del sistema</b> salio al sistema', '127.0.0.1', NULL, NULL),
(773, 1, 2, '2013-03-25 15:37:43', 'Antonio Garcia M. <b>Encargado de Sistemas</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(774, 1, 2, '2013-03-25 15:38:57', 'Antonio Garcia M. <b>Encargado de Sistemas</b> salio al sistema', '127.0.0.1', NULL, NULL),
(775, 1, 1, '2013-03-25 15:39:00', 'Freddy Velasco <b>Administrador del sistema</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(776, 1, 1, '2013-03-25 15:54:16', 'Freddy Velasco <b>Administrador del sistema</b> salio al sistema', '127.0.0.1', NULL, NULL),
(777, 1, 4, '2013-03-25 15:54:30', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(778, 1, 4, '2013-03-25 17:29:21', 'Jhilda Murillo Zarate <b>Directora General Ejecutiva</b> salio al sistema', '127.0.0.1', NULL, NULL),
(779, 1, 1, '2013-03-25 17:29:26', 'Freddy Velasco <b>Administrador del sistema</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(780, 12, 14, '2013-03-27 09:38:54', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(781, 12, 14, '2013-03-27 10:26:33', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '127.0.0.1', NULL, NULL),
(782, 1, 1, '2013-03-27 10:26:36', 'Freddy Velasco <b>Administrador del sistema</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(783, 1, 1, '2013-03-27 10:30:29', 'Freddy Velasco <b>Administrador del sistema</b> salio al sistema', '127.0.0.1', NULL, NULL),
(784, 12, 14, '2013-03-27 10:30:33', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(785, 12, 14, '2013-03-27 15:18:50', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '127.0.0.1', NULL, NULL),
(786, 1, 1, '2013-03-27 15:18:53', 'Freddy Velasco <b>Administrador del sistema</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(787, 1, 1, '2013-03-27 15:30:23', 'Freddy Velasco <b>Administrador del sistema</b> salio al sistema', '127.0.0.1', NULL, NULL),
(788, 12, 14, '2013-03-27 15:30:32', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(789, 12, 14, '2013-03-27 15:30:34', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '127.0.0.1', NULL, NULL),
(790, 1, 1, '2013-03-27 15:30:47', 'Freddy Velasco <b>Administrador del sistema</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(791, 1, 1, '2013-03-27 15:32:12', 'Freddy Velasco <b>Administrador del sistema</b> salio al sistema', '127.0.0.1', NULL, NULL),
(792, 12, 14, '2013-03-27 15:32:19', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(793, 12, 14, '2013-03-27 15:33:43', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '127.0.0.1', NULL, NULL),
(794, 12, 14, '2013-03-27 15:33:50', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(795, 12, 14, '2013-03-27 16:56:50', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '127.0.0.1', NULL, NULL),
(796, 1, 1, '2013-03-27 16:56:55', 'Freddy Velasco <b>Administrador del sistema</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(797, 1, 1, '2013-03-27 17:34:36', 'Freddy Velasco <b>Administrador del sistema</b> salio al sistema', '127.0.0.1', NULL, NULL),
(798, 12, 14, '2013-03-27 17:34:42', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(799, 12, 14, '2013-03-27 18:21:03', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '127.0.0.1', NULL, NULL),
(800, 12, 14, '2013-03-27 18:21:10', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(801, 12, 14, '2013-03-28 08:47:28', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '127.0.0.1', NULL, NULL),
(802, 1, 1, '2013-03-28 08:47:32', 'Freddy Velasco <b>Administrador del sistema</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(803, 1, 1, '2013-03-28 08:56:52', 'Freddy Velasco <b>Administrador del sistema</b> salio al sistema', '127.0.0.1', NULL, NULL),
(804, 12, 15, '2013-03-28 08:57:19', 'Juan Carlos <b>Profesional Auditor Senior</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(805, 1, 1, '2013-04-22 14:57:02', 'Freddy Velasco <b>Administrador del sistema</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(806, 1, 1, '2013-04-22 14:57:05', 'Freddy Velasco <b>Administrador del sistema</b> salio al sistema', '127.0.0.1', NULL, NULL),
(807, 12, 15, '2013-04-22 14:57:13', 'Juan Carlos <b>Profesional Auditor Senior</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(808, 12, 15, '2013-04-23 16:41:19', 'Juan Carlos <b>Profesional Auditor Senior</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(809, 1, 1, '2013-04-25 14:53:17', 'Freddy Velasco <b>Administrador del sistema</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(810, 1, 1, '2013-04-25 14:53:22', 'Freddy Velasco <b>Administrador del sistema</b> salio al sistema', '127.0.0.1', NULL, NULL),
(811, 1, 1, '2013-04-25 15:52:56', 'Freddy Velasco <b>Administrador del sistema</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(812, 1, 1, '2013-04-25 16:50:20', 'Freddy Velasco <b>Administrador del sistema</b> salio al sistema', '127.0.0.1', NULL, NULL),
(813, 12, 15, '2013-04-25 16:50:34', 'Juan Carlos <b>Profesional Auditor Senior</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(814, 12, 15, '2013-04-26 09:04:02', 'Juan Carlos <b>Profesional Auditor Senior</b> salio al sistema', '127.0.0.1', NULL, NULL),
(815, 12, 15, '2013-04-26 09:04:07', 'Juan Carlos <b>Profesional Auditor Senior</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(816, 12, 15, '2013-04-29 11:46:01', 'Juan Carlos <b>Profesional Auditor Senior</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(817, 12, 15, '2013-04-29 12:21:40', 'Juan Carlos <b>Profesional Auditor Senior</b> salio al sistema', '127.0.0.1', NULL, NULL),
(818, 12, 14, '2013-04-29 12:22:44', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(819, 3, 21, '2013-05-07 14:41:09', 'Jose María <b>Supervisor Técnico</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(820, 3, 21, '2013-05-20 16:23:56', 'Jose María <b>Supervisor Técnico</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(821, 3, 21, '2013-05-20 16:24:14', 'Jose María | <b>Supervisor Técnico</b> Deriva la Hoja de Ruta IBM/2013-00010(Oficial) a Carlos Eduardo | <b>Responsable Regional Cochabamba</b>', '127.0.0.1', NULL, NULL),
(822, 0, 21, '2013-05-20 16:24:21', 'Jose María | <b>Supervisor Técnico</b> Cancela derivacion de la Hoja de Ruta IBM/2013-00010(Oficial) a Carlos Eduardo', '127.0.0.1', NULL, NULL),
(823, 3, 21, '2013-05-20 16:24:41', 'Jose María | <b>Supervisor Técnico</b> Deriva la Hoja de Ruta IBM/2013-00010(Oficial) a Carlos Eduardo | <b>Responsable Regional Cochabamba</b>', '127.0.0.1', NULL, NULL),
(824, 12, 14, '2013-05-31 01:28:30', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(825, 12, 14, '2013-05-31 01:28:44', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '127.0.0.1', NULL, NULL),
(826, 1, 1, '2013-05-31 01:35:50', 'admin <b>Administrador del sistema</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(827, 1, 1, '2013-05-31 03:03:33', 'admin <b>Administrador del sistema</b> salio al sistema', '127.0.0.1', NULL, NULL),
(828, 12, 14, '2013-05-31 03:28:53', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(829, 12, 14, '2013-05-31 05:03:36', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '127.0.0.1', NULL, NULL),
(830, 1, 1, '2013-05-31 05:03:39', 'admin <b>Administrador del sistema</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(831, 1, 1, '2013-05-31 05:57:29', 'admin <b>Administrador del sistema</b> salio al sistema', '127.0.0.1', NULL, NULL),
(832, 1, 37, '2013-05-31 05:57:38', 'Juan Carlos Chavez Iporre <b>Jefe de la Unidad Financiera</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(833, 1, 37, '2013-05-31 05:58:00', 'Juan Carlos Chavez Iporre <b>Jefe de la Unidad Financiera</b> salio al sistema', '127.0.0.1', NULL, NULL),
(834, 1, 1, '2013-05-31 05:58:03', 'admin <b>Administrador del sistema</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(835, 1, 1, '2013-05-31 06:24:08', 'admin <b>Administrador del sistema</b> salio al sistema', '127.0.0.1', NULL, NULL),
(836, 1, 37, '2013-05-31 06:24:18', 'Juan Carlos Chavez Iporre <b>Jefe de la Unidad Financiera</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(837, 1, 37, '2013-05-31 06:32:23', 'Juan Carlos Chavez Iporre <b>Jefe de la Unidad Financiera</b> salio al sistema', '127.0.0.1', NULL, NULL),
(838, 12, 14, '2013-05-31 06:32:30', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(839, 1, 37, '2013-05-31 08:59:53', 'Juan Carlos Chavez Iporre <b>Jefe de la Unidad Financiera</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(840, 1, 37, '2013-05-31 09:13:35', 'Juan Carlos Chavez Iporre <b>Jefe de la Unidad Financiera</b> salio al sistema', '127.0.0.1', NULL, NULL),
(841, 1, 1, '2013-05-31 09:13:37', 'admin <b>Administrador del sistema</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(842, 1, 1, '2013-05-31 10:19:06', 'admin <b>Administrador del sistema</b> salio al sistema', '127.0.0.1', NULL, NULL),
(843, 1, 37, '2013-05-31 10:19:16', 'Juan Carlos Chavez Iporre <b>Jefe de la Unidad Financiera</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(844, 1, 37, '2013-05-31 10:19:20', 'Juan Carlos Chavez Iporre <b>Jefe de la Unidad Financiera</b> salio al sistema', '127.0.0.1', NULL, NULL),
(845, 12, 14, '2013-05-31 10:19:26', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(846, 12, 14, '2013-05-31 10:49:03', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '127.0.0.1', NULL, NULL),
(847, 12, 14, '2013-05-31 10:49:14', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(848, 12, 14, '2013-05-31 10:51:02', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '127.0.0.1', NULL, NULL),
(849, 1, 25, '2013-05-31 10:51:25', 'Ana Teresa Morales Olivera <b>Ministra</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(850, 1, 25, '2013-05-31 11:02:18', 'Ana Teresa Morales Olivera <b>Ministra</b> salio al sistema', '127.0.0.1', NULL, NULL),
(851, 1, 37, '2013-05-31 11:02:24', 'Juan Carlos Chavez Iporre <b>Jefe de la Unidad Financiera</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(852, 1, 37, '2013-05-31 11:02:28', 'Juan Carlos Chavez Iporre <b>Jefe de la Unidad Financiera</b> salio al sistema', '127.0.0.1', NULL, NULL),
(853, 12, 14, '2013-05-31 11:02:38', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(854, 12, 14, '2013-05-31 11:05:58', 'Luis Fernando <b>Jefe Unidad Auditoria Interna</b> salio al sistema', '127.0.0.1', NULL, NULL),
(855, 1, 37, '2013-05-31 11:06:12', 'Juan Carlos Chavez Iporre <b>Jefe de la Unidad Financiera</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(856, 1, 37, '2013-05-31 11:41:41', 'Juan Carlos Chavez Iporre <b>Jefe de la Unidad Financiera</b> salio al sistema', '127.0.0.1', NULL, NULL),
(857, 1, 37, '2013-05-31 11:41:47', 'Juan Carlos Chavez Iporre <b>Jefe de la Unidad Financiera</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(858, 1, 37, '2013-05-31 12:16:08', 'Juan Carlos Chavez Iporre <b>Jefe de la Unidad Financiera</b> salio al sistema', '127.0.0.1', NULL, NULL),
(859, 1, 25, '2013-05-31 12:18:16', 'Ana Teresa Morales Olivera <b>Ministra</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(860, 1, 25, '2013-05-31 12:18:51', 'Ana Teresa Morales Olivera <b>Ministra</b> salio al sistema', '127.0.0.1', NULL, NULL),
(861, 1, 26, '2013-05-31 12:19:00', 'Maria Luisa Quezada Portugal <b>Jefe de Gabinete</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(862, 1, 26, '2013-05-31 12:19:05', 'Maria Luisa Quezada Portugal <b>Jefe de Gabinete</b> salio al sistema', '127.0.0.1', NULL, NULL),
(863, 1, 27, '2013-05-31 12:19:19', 'Romina Medina Santy <b>Secretaria de Despacho</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(864, 1, 27, '2013-05-31 12:20:07', 'Romina Medina Santy <b>Secretaria de Despacho</b> salio al sistema', '127.0.0.1', NULL, NULL),
(865, 1, 27, '2013-05-31 12:20:13', 'Romina Medina Santy <b>Secretaria de Despacho</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(866, 1, 27, '2013-05-31 12:20:18', 'Romina Medina Santy <b>Secretaria de Despacho</b> salio al sistema', '127.0.0.1', NULL, NULL),
(867, 1, 27, '2013-05-31 12:21:28', 'Romina Medina Santy <b>Secretaria de Despacho</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(868, 1, 27, '2013-05-31 12:24:20', 'Romina Medina Santy <b>Secretaria de Despacho</b> salio al sistema', '127.0.0.1', NULL, NULL),
(869, 1, 36, '2013-05-31 12:24:29', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(870, 1, 36, '2013-05-31 12:25:35', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> salio al sistema', '127.0.0.1', NULL, NULL),
(871, 1, 25, '2013-05-31 12:25:41', 'Ana Teresa Morales Olivera <b>Ministra</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(872, 1, 25, '2013-05-31 12:25:43', 'Ana Teresa Morales Olivera <b>Ministra</b> salio al sistema', '127.0.0.1', NULL, NULL),
(873, 1, 35, '2013-05-31 12:25:56', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(874, 1, 35, '2013-05-31 12:28:49', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> salio al sistema', '127.0.0.1', NULL, NULL),
(875, 1, 36, '2013-05-31 12:28:56', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(876, 1, 36, '2013-05-31 12:29:07', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> salio al sistema', '127.0.0.1', NULL, NULL),
(877, 1, 35, '2013-05-31 12:31:18', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(878, 1, 35, '2013-05-31 12:31:28', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> salio al sistema', '127.0.0.1', NULL, NULL),
(879, 1, 36, '2013-05-31 12:31:36', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(880, 1, 36, '2013-05-31 12:47:21', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> salio al sistema', '127.0.0.1', NULL, NULL),
(881, 1, 36, '2013-05-31 12:47:27', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(882, 1, 36, '2013-05-31 12:47:31', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> salio al sistema', '127.0.0.1', NULL, NULL),
(883, 2, 7, '2013-05-31 12:47:39', 'Carlos Ponce <b>ventanilla</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(884, 2, 7, '2013-05-31 12:57:38', 'Carlos Ponce <b>ventanilla</b> salio al sistema', '127.0.0.1', NULL, NULL),
(885, 1, 36, '2013-05-31 12:57:53', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(886, 1, 36, '2013-05-31 12:58:44', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> salio al sistema', '127.0.0.1', NULL, NULL),
(887, 1, 25, '2013-05-31 13:01:07', 'Ana Teresa Morales Olivera <b>Ministra</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(888, 1, 25, '2013-05-31 13:09:43', 'Ana Teresa Morales Olivera <b>Ministra</b> salio al sistema', '127.0.0.1', NULL, NULL),
(889, 1, 35, '2013-05-31 13:09:53', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(890, 1, 35, '2013-05-31 13:12:19', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> salio al sistema', '127.0.0.1', NULL, NULL),
(891, 1, 1, '2013-05-31 13:12:23', 'admin <b>Administrador del sistema</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(892, 1, 1, '2013-05-31 13:12:39', 'admin <b>Administrador del sistema</b> salio al sistema', '127.0.0.1', NULL, NULL),
(893, 1, 35, '2013-05-31 13:12:51', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(894, 1, 35, '2013-05-31 13:15:17', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> salio al sistema', '127.0.0.1', NULL, NULL),
(895, 1, 1, '2013-05-31 13:15:20', 'admin <b>Administrador del sistema</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(896, 1, 1, '2013-05-31 13:16:31', 'admin <b>Administrador del sistema</b> salio al sistema', '127.0.0.1', NULL, NULL),
(897, 1, 35, '2013-05-31 13:16:37', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(898, 1, 35, '2013-05-31 13:18:42', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> salio al sistema', '127.0.0.1', NULL, NULL),
(899, 1, 1, '2013-05-31 13:31:58', 'admin <b>Administrador del sistema</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(900, 1, 1, '2013-05-31 13:40:13', 'admin <b>Administrador del sistema</b> salio al sistema', '127.0.0.1', NULL, NULL),
(901, 1, 35, '2013-05-31 13:42:30', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(902, 1, 35, '2013-05-31 14:12:24', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> salio al sistema', '127.0.0.1', NULL, NULL),
(903, 1, 36, '2013-05-31 14:12:29', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(904, 1, 36, '2013-05-31 14:39:40', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> salio al sistema', '127.0.0.1', NULL, NULL),
(905, 1, 1, '2013-05-31 14:39:42', 'admin <b>Administrador del sistema</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(906, 1, 1, '2013-05-31 14:39:59', 'admin <b>Administrador del sistema</b> salio al sistema', '127.0.0.1', NULL, NULL),
(907, 1, 36, '2013-05-31 14:40:08', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(908, 1, 36, '2013-05-31 18:09:30', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> salio al sistema', '127.0.0.1', NULL, NULL),
(909, 1, 35, '2013-05-31 18:10:09', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(910, 1, 35, '2013-06-03 09:40:37', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(911, 1, 35, '2013-06-03 10:16:14', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> salio al sistema', '127.0.0.1', NULL, NULL),
(912, 1, 35, '2013-06-03 10:16:28', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(913, 1, 35, '2013-06-03 10:16:33', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> salio al sistema', '127.0.0.1', NULL, NULL),
(914, 1, 36, '2013-06-03 10:16:54', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(915, 1, 36, '2013-06-03 10:21:52', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> salio al sistema', '127.0.0.1', NULL, NULL),
(916, 1, 35, '2013-06-03 10:21:57', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(917, 1, 35, '2013-06-03 10:37:24', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> salio al sistema', '127.0.0.1', NULL, NULL),
(918, 1, 1, '2013-06-03 10:37:27', 'admin <b>Administrador del sistema</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(919, 1, 1, '2013-06-03 10:51:06', 'admin <b>Administrador del sistema</b> salio al sistema', '127.0.0.1', NULL, NULL),
(920, 2, 7, '2013-06-03 10:51:12', 'Carlos Ponce <b>ventanilla</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(921, 2, 7, '2013-06-03 10:58:27', 'Carlos Ponce <b>ventanilla</b> salio al sistema', '127.0.0.1', NULL, NULL),
(922, 1, 35, '2013-06-03 10:58:34', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(923, 1, 35, '2013-06-03 11:26:35', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> salio al sistema', '127.0.0.1', NULL, NULL),
(924, 1, 35, '2013-06-03 11:26:40', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(925, 1, 35, '2013-06-03 11:53:21', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> salio al sistema', '127.0.0.1', NULL, NULL),
(926, 1, 35, '2013-06-03 11:53:27', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(927, 1, 35, '2013-06-03 12:08:30', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> salio al sistema', '127.0.0.1', NULL, NULL),
(928, 1, 35, '2013-06-03 12:08:36', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(929, 1, 35, '2013-06-03 12:16:24', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> salio al sistema', '127.0.0.1', NULL, NULL),
(930, 1, 35, '2013-06-03 12:58:33', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(931, 1, 35, '2013-06-04 02:41:36', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> salio al sistema', '127.0.0.1', NULL, NULL),
(932, 1, 37, '2013-06-04 02:42:14', 'Juan Carlos Chavez Iporre <b>Jefe de la Unidad Financiera</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(933, 1, 37, '2013-06-04 02:43:28', 'Juan Carlos Chavez Iporre <b>Jefe de la Unidad Financiera</b> salio al sistema', '127.0.0.1', NULL, NULL),
(934, 1, 1, '2013-06-04 02:43:35', 'admin <b>Administrador del sistema</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(935, 1, 1, '2013-06-04 02:44:09', 'admin <b>Administrador del sistema</b> salio al sistema', '127.0.0.1', NULL, NULL),
(936, 1, 37, '2013-06-04 02:44:14', 'Juan Carlos Chavez Iporre <b>Jefe de la Unidad Financiera</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(937, 1, 37, '2013-06-04 02:44:57', 'Juan Carlos Chavez Iporre <b>Jefe de la Unidad Financiera</b> salio al sistema', '127.0.0.1', NULL, NULL),
(938, 1, 1, '2013-06-04 02:45:00', 'admin <b>Administrador del sistema</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(939, 1, 1, '2013-06-04 02:45:51', 'admin <b>Administrador del sistema</b> salio al sistema', '127.0.0.1', NULL, NULL),
(940, 1, 37, '2013-06-04 02:45:58', 'Juan Carlos Chavez Iporre <b>Jefe de la Unidad Financiera</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(941, 1, 37, '2013-06-04 02:55:22', 'Juan Carlos Chavez Iporre | <b>Jefe de la Unidad Financiera</b> Deriva la Hoja de Ruta MDPyEP/2013-00011(Oficial) a Norma Flores Marcani | <b>Secretaria de la Unidad Financiera</b>', '127.0.0.1', NULL, NULL),
(942, 0, 37, '2013-06-04 03:07:51', 'Juan Carlos Chavez Iporre | <b>Jefe de la Unidad Financiera</b> Cancela derivacion de la Hoja de Ruta MDPyEP/2013-00011(Oficial) a Norma Flores Marcani', '127.0.0.1', NULL, NULL),
(943, 1, 37, '2013-06-04 03:08:28', 'Juan Carlos Chavez Iporre | <b>Jefe de la Unidad Financiera</b> Deriva la Hoja de Ruta MDPyEP/2013-00011(Oficial) a Norma Flores Marcani | <b>Secretaria de la Unidad Financiera</b>', '127.0.0.1', NULL, NULL),
(944, 1, 37, '2013-06-04 03:09:52', 'Juan Carlos Chavez Iporre <b>Jefe de la Unidad Financiera</b> salio al sistema', '127.0.0.1', NULL, NULL),
(945, 1, 38, '2013-06-04 03:10:02', 'Norma Flores Marcani <b>Secretaria de la Unidad Financiera</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(946, 1, 38, '2013-06-04 03:10:49', 'Norma Flores Marcani | <b>Secretaria de la Unidad Financiera</b> Recepciono la hoja de ruta MDPyEP/2013-00011', '127.0.0.1', NULL, NULL),
(947, 1, 38, '2013-06-04 03:37:40', 'Norma Flores Marcani | <b>Secretaria de la Unidad Financiera</b> Deriva la Hoja de Ruta MDPyEP/2013-00011(Oficial) a Juan Carlos Chavez Iporre | <b>Jefe de la Unidad Financiera</b>', '127.0.0.1', NULL, NULL),
(948, 1, 38, '2013-06-04 03:41:09', 'Norma Flores Marcani <b>Secretaria de la Unidad Financiera</b> salio al sistema', '127.0.0.1', NULL, NULL),
(949, 1, 37, '2013-06-04 03:41:15', 'Juan Carlos Chavez Iporre <b>Jefe de la Unidad Financiera</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(950, 1, 37, '2013-06-04 03:51:13', 'Juan Carlos Chavez Iporre | <b>Jefe de la Unidad Financiera</b> Recepciono la hoja de ruta MDPyEP/2013-00011', '127.0.0.1', NULL, NULL),
(951, 1, 37, '2013-06-04 03:55:02', 'Juan Carlos Chavez Iporre | <b>Jefe de la Unidad Financiera</b> Deriva la Hoja de Ruta MDPyEP/2013-00011(Oficial) a Jose Elias Stolzer | <b>Profesional encargado de presupuesto</b>', '127.0.0.1', NULL, NULL),
(952, 1, 37, '2013-06-04 04:01:13', 'Juan Carlos Chavez Iporre <b>Jefe de la Unidad Financiera</b> salio al sistema', '127.0.0.1', NULL, NULL),
(953, 1, 37, '2013-06-04 04:01:29', 'Juan Carlos Chavez Iporre <b>Jefe de la Unidad Financiera</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(954, 1, 37, '2013-06-04 04:03:11', 'Juan Carlos Chavez Iporre <b>Jefe de la Unidad Financiera</b> salio al sistema', '127.0.0.1', NULL, NULL),
(955, 1, 35, '2013-06-04 04:04:14', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(956, 1, 35, '2013-06-04 05:30:12', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> salio al sistema', '127.0.0.1', NULL, NULL),
(957, 1, 35, '2013-06-04 05:30:32', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(958, 1, 35, '2013-06-04 16:56:50', 'Walter Erick Quevedo Flores | <b>Director General de Asuntos Administrativos</b> Deriva la Hoja de Ruta MDPyEP/2013-00034(Oficial) a  | <b></b>', '127.0.0.1', NULL, NULL),
(959, 0, 35, '2013-06-04 16:56:52', 'Walter Erick Quevedo Flores | <b>Director General de Asuntos Administrativos</b> Cancela derivacion de la Hoja de Ruta MDPyEP/2013-00034(Oficial) a ', '127.0.0.1', NULL, NULL),
(960, 1, 35, '2013-06-05 08:53:55', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(961, 1, 35, '2013-06-05 11:15:28', 'Walter Erick Quevedo Flores | <b>Director General de Asuntos Administrativos</b> Deriva la Hoja de Ruta MDPyEP/2013-00034(Oficial) a Maria Elena Alfaro Castillo | <b>Secretaria D.G.A.A.</b>', '127.0.0.1', NULL, NULL),
(962, 1, 35, '2013-06-05 11:17:23', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> salio al sistema', '127.0.0.1', NULL, NULL),
(963, 1, 36, '2013-06-05 11:17:31', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(964, 1, 36, '2013-06-05 11:20:06', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> salio al sistema', '127.0.0.1', NULL, NULL),
(965, 1, 35, '2013-06-05 11:20:11', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(966, 1, 35, '2013-06-05 11:28:05', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> salio al sistema', '127.0.0.1', NULL, NULL),
(967, 1, 36, '2013-06-05 11:30:10', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(968, 1, 36, '2013-06-05 11:33:00', 'Maria Elena Alfaro Castillo | <b>Secretaria D.G.A.A.</b> Recepciono la hoja de ruta MDPyEP/2013-00034', '127.0.0.1', NULL, NULL),
(969, 1, 36, '2013-06-05 11:46:07', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> salio al sistema', '127.0.0.1', NULL, NULL),
(970, 1, 35, '2013-06-05 11:57:12', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(971, 1, 35, '2013-06-05 12:17:28', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> salio al sistema', '127.0.0.1', NULL, NULL),
(972, 1, 37, '2013-06-05 12:17:46', 'Juan Carlos Chavez Iporre <b>Jefe de la Unidad Financiera</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(973, 1, 37, '2013-06-05 12:21:00', 'Juan Carlos Chavez Iporre <b>Jefe de la Unidad Financiera</b> salio al sistema', '127.0.0.1', NULL, NULL),
(974, 1, 35, '2013-06-05 12:21:05', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(975, 1, 35, '2013-06-05 12:21:13', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> salio al sistema', '127.0.0.1', NULL, NULL),
(976, 1, 35, '2013-06-05 12:21:32', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(977, 1, 35, '2013-06-05 12:22:55', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> salio al sistema', '127.0.0.1', NULL, NULL),
(978, 1, 36, '2013-06-05 12:23:00', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(979, 1, 36, '2013-06-05 12:26:32', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> salio al sistema', '127.0.0.1', NULL, NULL),
(980, 1, 37, '2013-06-05 12:26:38', 'Juan Carlos Chavez Iporre <b>Jefe de la Unidad Financiera</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(981, 1, 37, '2013-06-05 12:27:07', 'Juan Carlos Chavez Iporre <b>Jefe de la Unidad Financiera</b> salio al sistema', '127.0.0.1', NULL, NULL),
(982, 1, 36, '2013-06-05 12:27:19', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(983, 1, 36, '2013-06-05 12:28:00', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> salio al sistema', '127.0.0.1', NULL, NULL),
(984, 1, 37, '2013-06-05 12:28:05', 'Juan Carlos Chavez Iporre <b>Jefe de la Unidad Financiera</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(985, 1, 37, '2013-06-05 12:28:29', 'Juan Carlos Chavez Iporre <b>Jefe de la Unidad Financiera</b> salio al sistema', '127.0.0.1', NULL, NULL),
(986, 1, 36, '2013-06-05 12:28:46', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(987, 1, 36, '2013-06-05 12:29:34', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> salio al sistema', '127.0.0.1', NULL, NULL),
(988, 1, 1, '2013-06-05 12:29:36', 'admin <b>Administrador del sistema</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(989, 1, 1, '2013-06-05 12:30:01', 'admin <b>Administrador del sistema</b> salio al sistema', '127.0.0.1', NULL, NULL),
(990, 1, 37, '2013-06-05 12:30:06', 'Juan Carlos Chavez Iporre <b>Jefe de la Unidad Financiera</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(991, 1, 37, '2013-06-05 12:31:43', 'Juan Carlos Chavez Iporre <b>Jefe de la Unidad Financiera</b> salio al sistema', '127.0.0.1', NULL, NULL),
(992, 1, 36, '2013-06-05 12:31:47', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(993, 1, 36, '2013-06-05 12:57:44', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> salio al sistema', '127.0.0.1', NULL, NULL),
(994, 1, 37, '2013-06-05 13:09:19', 'Juan Carlos Chavez Iporre <b>Jefe de la Unidad Financiera</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(995, 1, 37, '2013-06-05 13:09:23', 'Juan Carlos Chavez Iporre <b>Jefe de la Unidad Financiera</b> salio al sistema', '127.0.0.1', NULL, NULL),
(996, 12, 15, '2013-06-05 18:22:44', 'Juan Carlos <b>Profesional Auditor Senior</b> salio al sistema', '127.0.0.1', NULL, NULL),
(997, 1, 35, '2013-06-05 18:23:00', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(998, 1, 35, '2013-06-10 09:07:20', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(999, 1, 35, '2013-06-10 09:25:19', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1000, 1, 35, '2013-06-10 09:26:31', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1001, 1, 35, '2013-06-10 09:36:11', 'Walter Erick Quevedo Flores | <b>Director General de Asuntos Administrativos</b> Deriva la Hoja de Ruta MDPyEP/2013-00032(Oficial) a Maria Elena Alfaro Castillo | <b>Secretaria D.G.A.A.</b>', '127.0.0.1', NULL, NULL),
(1002, 1, 35, '2013-06-10 09:38:08', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1003, 1, 36, '2013-06-10 09:38:29', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1004, 1, 36, '2013-06-10 10:13:10', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1005, 1, 1, '2013-06-10 10:13:13', 'admin <b>Administrador del sistema</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1006, 1, 1, '2013-06-10 10:16:02', 'admin <b>Administrador del sistema</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1007, 1, 1, '2013-06-10 10:16:04', 'admin <b>Administrador del sistema</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1008, 1, 1, '2013-06-10 10:19:16', 'admin <b>Administrador del sistema</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1009, 1, 36, '2013-06-10 10:20:40', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1010, 1, 36, '2013-06-10 10:43:00', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1011, 1, 36, '2013-06-10 10:43:24', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1012, 1, 36, '2013-06-10 10:48:58', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1013, 1, 35, '2013-06-10 10:49:04', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1014, 1, 35, '2013-06-10 10:50:53', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1015, 1, 36, '2013-06-10 10:50:57', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1016, 1, 36, '2013-06-11 10:30:07', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1017, 1, 36, '2013-06-11 10:38:30', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1018, 1, 35, '2013-06-11 10:38:54', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1019, 1, 35, '2013-06-11 10:41:01', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1020, 1, 36, '2013-06-11 10:41:06', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1021, 1, 36, '2013-06-11 10:43:55', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1022, 1, 35, '2013-06-11 10:44:00', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1023, 1, 35, '2013-06-11 11:40:33', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1024, 1, 36, '2013-06-11 11:40:42', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1025, 1, 36, '2013-06-11 15:19:36', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1026, 1, 1, '2013-06-11 15:19:39', 'admin <b>Administrador del sistema</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1027, 1, 1, '2013-06-11 16:00:40', 'admin <b>Administrador del sistema</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1028, 1, 36, '2013-06-11 16:00:46', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1029, 1, 36, '2013-06-11 16:29:29', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1030, 1, 36, '2013-06-11 17:33:37', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1031, 1, 38, '2013-06-11 17:33:44', 'Norma Flores Marcani <b>Secretaria de la Unidad Financiera</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1032, 1, 38, '2013-06-11 17:33:55', 'Norma Flores Marcani <b>Secretaria de la Unidad Financiera</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1033, 1, 1, '2013-06-11 17:33:58', 'admin <b>Administrador del sistema</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1034, 1, 1, '2013-06-11 17:39:17', 'admin <b>Administrador del sistema</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1035, 1, 38, '2013-06-11 17:39:21', 'Norma Flores Marcani <b>Secretaria de la Unidad Financiera</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1036, 1, 38, '2013-06-11 17:39:48', 'Norma Flores Marcani <b>Secretaria de la Unidad Financiera</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1037, 1, 36, '2013-06-11 17:39:53', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1038, 1, 36, '2013-06-11 17:40:01', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1039, 1, 38, '2013-06-11 17:40:12', 'Norma Flores Marcani <b>Secretaria de la Unidad Financiera</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1040, 1, 38, '2013-06-11 18:00:17', 'Norma Flores Marcani <b>Secretaria de la Unidad Financiera</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1041, 1, 36, '2013-06-11 18:00:26', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1042, 1, 36, '2013-06-11 18:57:57', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1043, 1, 35, '2013-06-11 18:58:01', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1044, 1, 35, '2013-06-11 18:58:13', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1045, 1, 36, '2013-06-11 18:58:17', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1046, 1, 36, '2013-06-11 18:59:13', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1047, 1, 36, '2013-06-12 08:47:20', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1048, 1, 36, '2013-06-12 09:19:43', 'Maria Elena Alfaro Castillo | <b>Secretaria D.G.A.A.</b> Deriva la Hoja de Ruta MDPyEP/2013-00034(Oficial) a Walter Erick Quevedo Flores | <b>Director General de Asuntos Administrativos</b>', '127.0.0.1', NULL, NULL),
(1049, 1, 36, '2013-06-12 09:21:52', 'Maria Elena Alfaro Castillo | <b>Secretaria D.G.A.A.</b> Deriva la Hoja de Ruta MDPyEP/2013-00034(Oficial) a Walter Erick Quevedo Flores | <b>Director General de Asuntos Administrativos</b>', '127.0.0.1', NULL, NULL),
(1050, 1, 36, '2013-06-12 11:46:35', 'Maria Elena Alfaro Castillo | <b>Secretaria D.G.A.A.</b> Recepciono la hoja de ruta MDPyEP/2013-00032', '127.0.0.1', NULL, NULL),
(1051, 1, 36, '2013-06-13 17:28:00', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> ingresó al sistema', '::1', NULL, NULL),
(1052, 1, 36, '2013-06-13 18:29:46', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1053, 1, 36, '2013-06-14 17:09:48', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1054, 1, 36, '2013-06-14 17:09:57', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1055, 1, 36, '2013-06-14 17:44:02', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1056, 1, 36, '2013-06-14 17:44:14', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1057, 1, 36, '2013-06-14 18:54:31', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1058, 1, 36, '2013-06-14 18:54:36', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1059, 1, 36, '2013-06-17 08:43:40', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1060, 1, 36, '2013-06-18 14:47:42', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1061, 1, 36, '2013-06-19 10:09:17', 'Maria Elena Alfaro Castillo | <b>Secretaria D.G.A.A.</b> Deriva la Hoja de Ruta MDPyEP/2013-00211(Oficial) a Walter Erick Quevedo Flores | <b>Director General de Asuntos Administrativos</b>', '127.0.0.1', NULL, NULL),
(1062, 1, 36, '2013-06-19 10:09:20', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1063, 1, 35, '2013-06-19 10:09:25', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1064, 1, 35, '2013-06-19 10:09:46', 'Walter Erick Quevedo Flores | <b>Director General de Asuntos Administrativos</b> Recepciono la hoja de ruta MDPyEP/2013-00211', '127.0.0.1', NULL, NULL),
(1065, 1, 35, '2013-06-19 10:10:43', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1066, 1, 36, '2013-06-19 10:11:10', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1067, 1, 36, '2013-06-19 14:37:45', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1068, 1, 35, '2013-06-19 14:37:51', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1069, 1, 35, '2013-06-19 14:46:49', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1070, 1, 36, '2013-06-19 14:46:56', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1071, 1, 36, '2013-06-20 13:55:56', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1072, 1, 36, '2013-06-20 13:56:43', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1073, 1, 36, '2013-06-20 13:58:59', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1074, 1, 36, '2013-06-24 08:47:42', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1075, 1, 36, '2013-06-24 09:46:51', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1076, 1, 36, '2013-06-25 12:41:45', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1077, 1, 33, '2013-06-25 12:41:55', 'Rosario Jimena Tellez Quenallata <b>Secretaria Direccion General de Planificacion</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1078, 1, 33, '2013-06-25 12:42:02', 'Rosario Jimena Tellez Quenallata <b>Secretaria Direccion General de Planificacion</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1079, 1, 1, '2013-06-25 12:42:06', 'admin <b>Administrador del sistema</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1080, 1, 1, '2013-06-25 12:42:40', 'admin <b>Administrador del sistema</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1081, 1, 33, '2013-06-25 12:42:45', 'Rosario Jimena Tellez Quenallata <b>Secretaria Direccion General de Planificacion</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1082, 1, 33, '2013-06-25 14:00:46', 'Rosario Jimena Tellez Quenallata <b>Secretaria Direccion General de Planificacion</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1083, 1, 1, '2013-06-25 14:00:49', 'admin <b>Administrador del sistema</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1084, 1, 1, '2013-06-25 14:01:18', 'admin <b>Administrador del sistema</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1085, 1, 27, '2013-06-25 14:01:55', 'Romina Medina Santy <b>Secretaria de Despacho</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1086, 1, 27, '2013-06-25 14:57:27', 'Romina Medina Santy <b>Secretaria de Despacho</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1087, 1, 1, '2013-06-25 14:57:29', 'admin <b>Administrador del sistema</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1088, 1, 1, '2013-06-25 15:36:33', 'admin <b>Administrador del sistema</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1089, 1, 27, '2013-06-25 15:36:37', 'Romina Medina Santy <b>Secretaria de Despacho</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1090, 1, 27, '2013-06-25 16:09:28', 'Romina Medina Santy <b>Secretaria de Despacho</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1091, 1, 36, '2013-06-25 16:09:32', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1092, 1, 36, '2013-06-25 16:09:44', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1093, 1, 27, '2013-06-25 16:09:55', 'Romina Medina Santy <b>Secretaria de Despacho</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1094, 1, 27, '2013-06-26 15:53:21', 'Romina Medina Santy <b>Secretaria de Despacho</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1095, 1, 36, '2013-06-26 15:53:29', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1096, 1, 36, '2013-06-26 16:27:24', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1097, 1, 27, '2013-06-26 16:27:30', 'Romina Medina Santy <b>Secretaria de Despacho</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1098, 1, 27, '2013-06-26 18:05:29', 'Romina Medina Santy <b>Secretaria de Despacho</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1099, 1, 36, '2013-06-26 18:05:34', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1100, 1, 36, '2013-06-27 09:46:04', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1101, 1, 27, '2013-06-27 09:46:14', 'Romina Medina Santy <b>Secretaria de Despacho</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1102, 1, 27, '2013-06-27 10:09:27', 'Romina Medina Santy <b>Secretaria de Despacho</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1103, 1, 27, '2013-06-27 10:09:37', 'Romina Medina Santy <b>Secretaria de Despacho</b> ingresó al sistema', '127.0.0.1', NULL, NULL);
INSERT INTO `vitacora` (`id`, `id_entidad`, `id_usuario`, `fecha_hora`, `accion_realizada`, `ip_usuario`, `hostname`, `mac_usuario`) VALUES
(1104, 1, 27, '2013-06-27 10:17:32', 'Romina Medina Santy <b>Secretaria de Despacho</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1105, 1, 36, '2013-06-27 10:17:46', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1106, 1, 36, '2013-06-27 12:16:47', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1107, 1, 27, '2013-06-27 12:16:56', 'Romina Medina Santy <b>Secretaria de Despacho</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1108, 1, 27, '2013-06-27 15:00:45', 'Romina Medina Santy <b>Secretaria de Despacho</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1109, 1, 35, '2013-06-27 15:01:01', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1110, 1, 35, '2013-06-27 15:16:15', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1111, 1, 32, '2013-06-27 15:16:24', 'Ariel Zabala David <b>Director General de Planificacion</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1112, 1, 32, '2013-06-27 15:25:44', 'Ariel Zabala David | <b>Director General de Planificacion</b> Deriva la Hoja de Ruta MDPyEP/2013-00257(Oficial) a Rosario Jimena Tellez Quenallata | <b>Secretaria Direccion General de Planificacion</b>', '127.0.0.1', NULL, NULL),
(1113, 1, 32, '2013-06-27 15:26:34', 'Ariel Zabala David <b>Director General de Planificacion</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1114, 1, 33, '2013-06-27 15:26:44', 'Rosario Jimena Tellez Quenallata <b>Secretaria Direccion General de Planificacion</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1115, 1, 33, '2013-06-27 16:12:41', 'Rosario Jimena Tellez Quenallata | <b>Secretaria Direccion General de Planificacion</b> Recepciono la hoja de ruta MDPyEP/2013-00257', '127.0.0.1', NULL, NULL),
(1116, 1, 33, '2013-06-27 16:27:21', 'Rosario Jimena Tellez Quenallata | <b>Secretaria Direccion General de Planificacion</b> Deriva la Hoja de Ruta MDPyEP/2013-00257(Oficial) a Ariel Zabala David | <b>Director General de Planificacion</b>', '127.0.0.1', NULL, NULL),
(1117, 1, 33, '2013-06-27 16:27:24', 'Rosario Jimena Tellez Quenallata <b>Secretaria Direccion General de Planificacion</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1118, 1, 32, '2013-06-27 16:27:32', 'Ariel Zabala David <b>Director General de Planificacion</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1119, 1, 32, '2013-06-27 16:27:53', 'Ariel Zabala David <b>Director General de Planificacion</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1120, 1, 33, '2013-06-27 16:28:00', 'Rosario Jimena Tellez Quenallata <b>Secretaria Direccion General de Planificacion</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1121, 1, 33, '2013-06-27 16:37:14', 'Rosario Jimena Tellez Quenallata <b>Secretaria Direccion General de Planificacion</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1122, 1, 32, '2013-06-27 16:37:48', 'Ariel Zabala David <b>Director General de Planificacion</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1123, 1, 32, '2013-06-27 16:38:25', 'Ariel Zabala David | <b>Director General de Planificacion</b> Recepciono la hoja de ruta MDPyEP/2013-00257', '127.0.0.1', NULL, NULL),
(1124, 1, 32, '2013-06-27 16:39:38', 'Ariel Zabala David | <b>Director General de Planificacion</b> Deriva la Hoja de Ruta MDPyEP/2013-00257(Oficial) a Rosario Jimena Tellez Quenallata | <b>Secretaria Direccion General de Planificacion</b>', '127.0.0.1', NULL, NULL),
(1125, 1, 32, '2013-06-27 16:39:42', 'Ariel Zabala David <b>Director General de Planificacion</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1126, 1, 33, '2013-06-27 16:39:47', 'Rosario Jimena Tellez Quenallata <b>Secretaria Direccion General de Planificacion</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1127, 1, 33, '2013-06-27 16:39:53', 'Rosario Jimena Tellez Quenallata | <b>Secretaria Direccion General de Planificacion</b> Recepciono la hoja de ruta MDPyEP/2013-00257', '127.0.0.1', NULL, NULL),
(1128, 1, 33, '2013-06-27 17:09:44', 'Rosario Jimena Tellez Quenallata | <b>Secretaria Direccion General de Planificacion</b> Deriva la Hoja de Ruta MDPyEP/2013-00257(Oficial) a Ariel Zabala David | <b>Director General de Planificacion</b>', '127.0.0.1', NULL, NULL),
(1129, 1, 33, '2013-06-27 17:09:46', 'Rosario Jimena Tellez Quenallata <b>Secretaria Direccion General de Planificacion</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1130, 1, 32, '2013-06-27 17:09:52', 'Ariel Zabala David <b>Director General de Planificacion</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1131, 1, 32, '2013-06-27 17:10:01', 'Ariel Zabala David | <b>Director General de Planificacion</b> Recepciono la hoja de ruta MDPyEP/2013-00257', '127.0.0.1', NULL, NULL),
(1132, 1, 32, '2013-06-27 17:54:15', 'Ariel Zabala David <b>Director General de Planificacion</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1133, 1, 32, '2013-06-27 18:00:06', 'Ariel Zabala David <b>Director General de Planificacion</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1134, 1, 36, '2013-06-27 23:25:49', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1135, 1, 1, '2013-06-27 23:25:52', 'admin <b>Administrador del sistema</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1136, 1, 1, '2013-06-27 23:32:23', 'admin <b>Administrador del sistema</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1137, 1, 36, '2013-06-27 23:32:31', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1138, 1, 36, '2013-06-27 23:37:08', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1139, 1, 33, '2013-06-27 23:37:21', 'Rosario Jimena Tellez Quenallata <b>Secretaria Direccion General de Planificacion</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1140, 1, 33, '2013-06-27 23:44:54', 'Rosario Jimena Tellez Quenallata <b>Secretaria Direccion General de Planificacion</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1141, 1, 36, '2013-06-27 23:45:01', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1142, 1, 36, '2013-06-28 01:10:44', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1143, 1, 33, '2013-06-28 01:10:50', 'Rosario Jimena Tellez Quenallata <b>Secretaria Direccion General de Planificacion</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1144, 1, 33, '2013-06-28 01:10:58', 'Rosario Jimena Tellez Quenallata <b>Secretaria Direccion General de Planificacion</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1145, 1, 32, '2013-06-28 01:11:18', 'Ariel Zabala David <b>Director General de Planificacion</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1146, 1, 32, '2013-06-28 01:14:17', 'Ariel Zabala David <b>Director General de Planificacion</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1147, 1, 33, '2013-06-28 01:14:22', 'Rosario Jimena Tellez Quenallata <b>Secretaria Direccion General de Planificacion</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1148, 1, 33, '2013-06-28 01:21:50', 'Rosario Jimena Tellez Quenallata | <b>Secretaria Direccion General de Planificacion</b> Deriva la Hoja de Ruta MDPyEP/2013-00261(Oficial) a Ariel Zabala David | <b>Director General de Planificacion</b>', '127.0.0.1', NULL, NULL),
(1149, 1, 33, '2013-06-28 01:22:09', 'Rosario Jimena Tellez Quenallata <b>Secretaria Direccion General de Planificacion</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1150, 1, 32, '2013-06-28 01:22:16', 'Ariel Zabala David <b>Director General de Planificacion</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1151, 1, 32, '2013-06-28 09:09:24', 'Ariel Zabala David <b>Director General de Planificacion</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1152, 1, 33, '2013-06-28 09:09:36', 'Rosario Jimena Tellez Quenallata <b>Secretaria Direccion General de Planificacion</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1153, 1, 33, '2013-06-28 09:09:40', 'Rosario Jimena Tellez Quenallata <b>Secretaria Direccion General de Planificacion</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1154, 1, 35, '2013-06-28 09:09:46', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1155, 1, 35, '2013-06-28 09:11:16', 'Walter Erick Quevedo Flores | <b>Director General de Asuntos Administrativos</b> Recepciono la hoja de ruta MDPyEP/2013-00034', '127.0.0.1', NULL, NULL),
(1156, 1, 35, '2013-06-28 11:52:06', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1157, 1, 36, '2013-06-28 11:52:10', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1158, 1, 36, '2013-06-28 12:15:58', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1159, 1, 35, '2013-06-28 12:16:03', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1160, 1, 35, '2013-06-28 12:24:10', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1161, 1, 36, '2013-06-28 12:24:14', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1162, 1, 36, '2013-06-28 12:57:16', 'Maria Elena Alfaro Castillo | <b>Secretaria D.G.A.A.</b> Deriva la Hoja de Ruta MDPyEP/2013-00264(Oficial) a Walter Erick Quevedo Flores | <b>Director General de Asuntos Administrativos</b>', '127.0.0.1', NULL, NULL),
(1163, 1, 36, '2013-06-28 12:57:19', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1164, 1, 35, '2013-06-28 12:57:26', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1165, 1, 35, '2013-06-28 13:08:39', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1166, 1, 33, '2013-06-28 13:08:45', 'Rosario Jimena Tellez Quenallata <b>Secretaria Direccion General de Planificacion</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1167, 1, 33, '2013-06-28 13:14:48', 'Rosario Jimena Tellez Quenallata <b>Secretaria Direccion General de Planificacion</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1168, 1, 35, '2013-06-28 13:15:02', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1169, 1, 35, '2013-06-28 14:54:44', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1170, 1, 36, '2013-06-28 14:54:59', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1171, 1, 36, '2013-06-28 14:55:17', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1172, 1, 36, '2013-06-28 14:55:23', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1173, 1, 36, '2013-06-28 14:55:31', 'Maria Elena Alfaro Castillo <b>Secretaria D.G.A.A.</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1174, 1, 35, '2013-06-28 14:55:37', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1175, 1, 35, '2013-06-28 14:58:25', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1176, 1, 32, '2013-06-28 14:58:31', 'Ariel Zabala David <b>Director General de Planificacion</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1177, 1, 32, '2013-06-28 14:59:01', 'Ariel Zabala David <b>Director General de Planificacion</b> salio al sistema', '127.0.0.1', NULL, NULL),
(1178, 1, 35, '2013-06-28 14:59:13', 'Walter Erick Quevedo Flores <b>Director General de Asuntos Administrativos</b> ingresó al sistema', '127.0.0.1', NULL, NULL),
(1179, 1, 35, '2013-06-28 15:52:15', 'Walter Erick Quevedo Flores | <b>Director General de Asuntos Administrativos</b> Recepciono la hoja de ruta MDPyEP/2013-00264', '127.0.0.1', NULL, NULL);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `roles_users`
--
ALTER TABLE `roles_users`
  ADD CONSTRAINT `roles_users_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `roles_users_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `user_tokens`
--
ALTER TABLE `user_tokens`
  ADD CONSTRAINT `user_tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
