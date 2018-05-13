-- version 4.7.7\
-- https://www.phpmyadmin.net/\
--\
-- Servidor: localhost\
-- Tiempo de generaci\'f3n: 19-03-2018 a las 04:26:07\
-- Versi\'f3n del servidor: 5.6.38\
-- Versi\'f3n de PHP: 7.2.1\
\
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";\
SET time_zone = "+00:00";\
\
--\
-- Base de datos: `arte_app_local`\
--\
\
-- --------------------------------------------------------\
\
--\
-- Estructura de tabla para la tabla `categoria`\
--\
\
CREATE TABLE `categoria` (\
  `id_categiria` int(50) NOT NULL,\
  `nombre_categoria` varchar(50) NOT NULL\
) ENGINE=MyISAM DEFAULT CHARSET=latin1;\
\
-- --------------------------------------------------------\
\
--\
-- Estructura de tabla para la tabla `comentario`\
--\
\
CREATE TABLE `comentario` (\
  `id_comentario` int(50) NOT NULL,\
  `id_obra` int(50) NOT NULL,\
  `texto` varchar(100) NOT NULL,\
  `id_usuario` int(50) NOT NULL\
) ENGINE=MyISAM DEFAULT CHARSET=latin1;\
\
-- --------------------------------------------------------\
\
--\
-- Estructura de tabla para la tabla `denunciado`\
--\
\
CREATE TABLE `denunciado` (\
  `id_denuncia` int(50) NOT NULL,\
  `id_obra` int(50) NOT NULL,\
  `id_motivo` int(50) NOT NULL,\
  `info_adicional` varchar(50) DEFAULT NULL\
) ENGINE=MyISAM DEFAULT CHARSET=latin1;\
\
-- --------------------------------------------------------\
\
--\
-- Estructura de tabla para la tabla `motivo`\
--\
\
CREATE TABLE `motivo` (\
  `id_motivo` int(50) NOT NULL,\
  `nombre_motivo` varchar(50) NOT NULL\
) ENGINE=MyISAM DEFAULT CHARSET=latin1;\
\
-- --------------------------------------------------------\
\
--\
-- Estructura de tabla para la tabla `obra`\
--\
\
CREATE TABLE `obra` (\
  `id_obra` int(50) NOT NULL,\
  `id_usuario` int(50) NOT NULL,\
  `id_categoria` int(50) NOT NULL,\
  `ruta` varchar(100) NOT NULL,\
  `titulo` varchar(50) NOT NULL\
) ENGINE=MyISAM DEFAULT CHARSET=latin1;\
\
-- --------------------------------------------------------\
\
--\
-- Estructura de tabla para la tabla `obras_reacciones`\
--\
\
CREATE TABLE `obras_reacciones` (\
  `id_obra_reacciom` int(50) NOT NULL,\
  `id_obra` int(50) NOT NULL,\
  `id_reaccion` int(50) NOT NULL\
) ENGINE=MyISAM DEFAULT CHARSET=latin1;\
\
-- --------------------------------------------------------\
\
--\
-- Estructura de tabla para la tabla `obras_tags`\
--\
\
CREATE TABLE `obras_tags` (\
  `id_obra` int(50) NOT NULL,\
  `id_tag` int(50) NOT NULL,\
  `id_obra_tag` int(50) NOT NULL\
) ENGINE=MyISAM DEFAULT CHARSET=latin1;\
\
-- --------------------------------------------------------\
\
--\
-- Estructura de tabla para la tabla `operaciones`\
--\
\
CREATE TABLE `operaciones` (\
  `id_obra` int(50) NOT NULL,\
  `id_usuario` int(50) NOT NULL,\
  `id_tipo_op` int(50) NOT NULL,\
  `id_operacion` int(50) NOT NULL\
) ENGINE=MyISAM DEFAULT CHARSET=latin1;\
\
-- --------------------------------------------------------\
\
--\
-- Estructura de tabla para la tabla `reaccion`\
--\
\
CREATE TABLE `reaccion` (\
  `id_reaccion` int(50) NOT NULL,\
  `ruta_icono` varchar(100) NOT NULL,\
  `nombre_reaccion` varchar(50) NOT NULL\
) ENGINE=MyISAM DEFAULT CHARSET=latin1;\
\
-- --------------------------------------------------------\
\
--\
-- Estructura de tabla para la tabla `tags`\
--\
\
CREATE TABLE `tags` (\
  `id_tag` int(50) NOT NULL,\
  `nombre` varchar(50) NOT NULL\
) ENGINE=MyISAM DEFAULT CHARSET=latin1;\
\
-- --------------------------------------------------------\
\
--\
-- Estructura de tabla para la tabla `tipo_operacion`\
--\
\
CREATE TABLE `tipo_operacion` (\
  `id_tipo_ope` int(50) NOT NULL,\
  `descripcion` varchar(50) NOT NULL\
) ENGINE=MyISAM DEFAULT CHARSET=latin1;\
\
-- --------------------------------------------------------\
\
--\
-- Estructura de tabla para la tabla `usuario`\
--\
\
CREATE TABLE `usuario` (\
  `nombre` varchar(50) NOT NULL,\
  `contrasena` varchar(50) NOT NULL,\
  `id_usuario` int(50) NOT NULL,\
  `nick_name` varchar(50) NOT NULL,\
  `apikey` varchar(50) NOT NULL,\
  `correo` varchar(50) NOT NULL,\
  `foto_perfil` varchar(100) NOT NULL,\
  `fecha_nac` datetime(6) NOT NULL\
) ENGINE=MyISAM DEFAULT CHARSET=latin1;\
\
-- --------------------------------------------------------\
\
--\
-- Estructura de tabla para la tabla `usuario_obras`\
--\
\
CREATE TABLE `usuario_obras` (\
  `id_usuario` int(50) NOT NULL,\
  `id_obra` int(50) NOT NULL,\
  `id_usuario_obra` int(50) NOT NULL\
) ENGINE=MyISAM DEFAULT CHARSET=latin1;\
\
--\
-- \'cdndices para tablas volcadas\
--\
\
--\
-- Indices de la tabla `categoria`\
--\
ALTER TABLE `categoria`\
  ADD PRIMARY KEY (`id_categiria`);\
\
--\
-- Indices de la tabla `comentario`\
--\
ALTER TABLE `comentario`\
  ADD PRIMARY KEY (`id_comentario`),\
  ADD KEY `comentario_obra_FK` (`id_obra`),\
  ADD KEY `comentario_usuario_FK` (`id_usuario`);\
\
--\
-- Indices de la tabla `denunciado`\
--\
ALTER TABLE `denunciado`\
  ADD PRIMARY KEY (`id_denuncia`),\
  ADD KEY `denunciado_motivo_FK` (`id_motivo`),\
  ADD KEY `denunciado_obra_FK` (`id_obra`);\
\
--\
-- Indices de la tabla `motivo`\
--\
ALTER TABLE `motivo`\
  ADD PRIMARY KEY (`id_motivo`);\
\
--\
-- Indices de la tabla `obra`\
--\
ALTER TABLE `obra`\
  ADD PRIMARY KEY (`id_obra`),\
  ADD KEY `obra_usuario_FK` (`id_usuario`),\
  ADD KEY `obra_categoria_FK` (`id_categoria`);\
\
--\
-- Indices de la tabla `obras_reacciones`\
--\
ALTER TABLE `obras_reacciones`\
  ADD PRIMARY KEY (`id_obra_reacciom`),\
  ADD KEY `obras_reacciones_obra_FK` (`id_obra`),\
  ADD KEY `obras_reacciones_reaccion_FK` (`id_reaccion`);\
\
--\
-- Indices de la tabla `obras_tags`\
--\
ALTER TABLE `obras_tags`\
  ADD PRIMARY KEY (`id_obra_tag`);\
\
--\
-- Indices de la tabla `operaciones`\
--\
ALTER TABLE `operaciones`\
  ADD PRIMARY KEY (`id_operacion`),\
  ADD KEY `operaciones_obra_FK` (`id_obra`),\
  ADD KEY `operaciones_usuario_FK` (`id_usuario`),\
  ADD KEY `operaciones_tipo_Op_FK` (`id_tipo_op`);\
\
--\
-- Indices de la tabla `reaccion`\
--\
ALTER TABLE `reaccion`\
  ADD PRIMARY KEY (`id_reaccion`);\
\
--\
-- Indices de la tabla `tags`\
--\
ALTER TABLE `tags`\
  ADD PRIMARY KEY (`id_tag`);\
\
--\
-- Indices de la tabla `tipo_operacion`\
--\
ALTER TABLE `tipo_operacion`\
  ADD PRIMARY KEY (`id_tipo_ope`);\
\
--\
-- Indices de la tabla `usuario`\
--\
ALTER TABLE `usuario`\
  ADD PRIMARY KEY (`id_usuario`);\
\
--\
-- Indices de la tabla `usuario_obras`\
--\
ALTER TABLE `usuario_obras`\
  ADD PRIMARY KEY (`id_usuario_obra`),\
  ADD KEY `usuario_obras_usuario` (`id_usuario`),\
  ADD KEY `usuario_obras_obra_FK` (`id_obra`);\
\
--\
-- AUTO_INCREMENT de las tablas volcadas\
--\
\
--\
-- AUTO_INCREMENT de la tabla `categoria`\
--\
ALTER TABLE `categoria`\
  MODIFY `id_categiria` int(50) NOT NULL AUTO_INCREMENT;\
\
--\
-- AUTO_INCREMENT de la tabla `comentario`\
--\
ALTER TABLE `comentario`\
  MODIFY `id_comentario` int(50) NOT NULL AUTO_INCREMENT;\
\
--\
-- AUTO_INCREMENT de la tabla `denunciado`\
--\
ALTER TABLE `denunciado`\
  MODIFY `id_denuncia` int(50) NOT NULL AUTO_INCREMENT;\
\
--\
-- AUTO_INCREMENT de la tabla `motivo`\
--\
ALTER TABLE `motivo`\
  MODIFY `id_motivo` int(50) NOT NULL AUTO_INCREMENT;\
\
--\
-- AUTO_INCREMENT de la tabla `obra`\
--\
ALTER TABLE `obra`\
  MODIFY `id_obra` int(50) NOT NULL AUTO_INCREMENT;\
\
--\
-- AUTO_INCREMENT de la tabla `obras_reacciones`\
--\
ALTER TABLE `obras_reacciones`\
  MODIFY `id_obra_reacciom` int(50) NOT NULL AUTO_INCREMENT;\
\
--\
-- AUTO_INCREMENT de la tabla `obras_tags`\
--\
ALTER TABLE `obras_tags`\
  MODIFY `id_obra_tag` int(50) NOT NULL AUTO_INCREMENT;\
\
--\
-- AUTO_INCREMENT de la tabla `reaccion`\
--\
ALTER TABLE `reaccion`\
  MODIFY `id_reaccion` int(50) NOT NULL AUTO_INCREMENT;\
\
--\
-- AUTO_INCREMENT de la tabla `tags`\
--\
ALTER TABLE `tags`\
  MODIFY `id_tag` int(50) NOT NULL AUTO_INCREMENT;\
\
--\
-- AUTO_INCREMENT de la tabla `usuario`\
--\
ALTER TABLE `usuario`\
  MODIFY `id_usuario` int(50) NOT NULL AUTO_INCREMENT;\
\
--\
-- AUTO_INCREMENT de la tabla `usuario_obras`\
--\
ALTER TABLE `usuario_obras`\
  MODIFY `id_usuario_obra` int(50) NOT NULL AUTO_INCREMENT;\
