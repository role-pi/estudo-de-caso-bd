-- MySQL Script generated by MySQL Workbench
-- Mon May 29 04:48:57 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering
DROP DATABASE role;

CREATE DATABASE IF NOT EXISTS role;

USE role;

-- -----------------------------------------------------
-- Table `enderecos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `enderecos` (
  `cep` INT NOT NULL,
  `logradouro` VARCHAR(45) NOT NULL,
  `bairro` VARCHAR(45) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `estado` VARCHAR(45) NOT NULL,
  `país` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cep`)
);

-- -----------------------------------------------------
-- Table `eventos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eventos` (
  `id_evento` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `data_inicio` TIMESTAMP NULL,
  `data_fim` TIMESTAMP NULL,
  `enderecos_cep` INT NOT NULL,
  `complemento_endereco` VARCHAR(45) NULL,
  PRIMARY KEY (`id_evento`, `enderecos_cep`),
  CONSTRAINT `fk_eventos_enderecos1` FOREIGN KEY (`enderecos_cep`) REFERENCES `enderecos` (`cep`) 
);

-- -----------------------------------------------------
-- Table `usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuario` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `foto_de_perfil_url` VARCHAR(2000) NULL,
  PRIMARY KEY (`id_usuario`)
);

-- -----------------------------------------------------
-- Table `convidados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `convidados` (
  `eventos_id_evento` INT NOT NULL,
  `usuarios_id_usuario` INT NOT NULL,
  PRIMARY KEY (`eventos_id_evento`, `usuarios_id_usuario`),
  CONSTRAINT `fk_eventos_has_usuarios_eventos` FOREIGN KEY (`eventos_id_evento`) REFERENCES `eventos` (`id_evento`) ,
  CONSTRAINT `fk_eventos_has_usuarios_usuarios1` FOREIGN KEY (`usuarios_id_usuario`) REFERENCES `usuarios` (`id_usuario`) 
);

-- -----------------------------------------------------
-- Table `insumos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `insumos` (
  `id_insumo` INT NOT NULL,
  `tipo` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(45) NULL,
  PRIMARY KEY (`id_insumo`)
);

-- -----------------------------------------------------
-- Table `transacoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transacoes` (
  `id_transacao` INT NOT NULL,
  `valor` DECIMAL(10, 2) NOT NULL,
  `data` TIMESTAMP NOT NULL,
  `usuarios_id_usuario` INT NOT NULL,
  `insumos_id_insumo` INT NOT NULL,
  PRIMARY KEY (
    `id_transacao`,
    `usuarios_id_usuario`,
    `insumos_id_insumo`
  ),
  CONSTRAINT `fk_transacoes_usuarios1` FOREIGN KEY (`usuarios_id_usuario`) REFERENCES `usuarios` (`id_usuario`) ,
  CONSTRAINT `fk_transacoes_insumos1` FOREIGN KEY (`insumos_id_insumo`) REFERENCES `insumos` (`id_insumo`) 
);

-- -----------------------------------------------------
-- Table `eventos_has_insumos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eventos_has_insumos` (
  `eventos_id_evento` INT NOT NULL,
  `insumos_id_insumo` INT NOT NULL,
  PRIMARY KEY (`eventos_id_evento`, `insumos_id_insumo`),
  CONSTRAINT `fk_eventos_has_insumos_eventos1` FOREIGN KEY (`eventos_id_evento`) REFERENCES `eventos` (`id_evento`) ,
  CONSTRAINT `fk_eventos_has_insumos_insumos1` FOREIGN KEY (`insumos_id_insumo`) REFERENCES `insumos` (`id_insumo`) 
);


-- Inserts

-- Usuários

insert into usuarios (id_usuario, nome, foto_de_perfil_url) values (1, 'Donella', 'http://dummyimage.com/193x100.png/cc0000/ffffff');
insert into usuarios (id_usuario, nome, foto_de_perfil_url) values (2, 'Emory', 'http://dummyimage.com/214x100.png/ff4444/ffffff');
insert into usuarios (id_usuario, nome, foto_de_perfil_url) values (3, 'Charlotta', 'http://dummyimage.com/102x100.png/cc0000/ffffff');
insert into usuarios (id_usuario, nome, foto_de_perfil_url) values (4, 'Denyse', 'http://dummyimage.com/249x100.png/cc0000/ffffff');
insert into usuarios (id_usuario, nome, foto_de_perfil_url) values (5, 'Ludovico', 'http://dummyimage.com/167x100.png/ff4444/ffffff');
insert into usuarios (id_usuario, nome, foto_de_perfil_url) values (6, 'Kimberlyn', 'http://dummyimage.com/221x100.png/ff4444/ffffff');
insert into usuarios (id_usuario, nome, foto_de_perfil_url) values (7, 'Lazaro', 'http://dummyimage.com/232x100.png/cc0000/ffffff');
insert into usuarios (id_usuario, nome, foto_de_perfil_url) values (8, 'Jayson', 'http://dummyimage.com/228x100.png/ff4444/ffffff');
insert into usuarios (id_usuario, nome, foto_de_perfil_url) values (9, 'Robinetta', 'http://dummyimage.com/179x100.png/dddddd/000000');
insert into usuarios (id_usuario, nome, foto_de_perfil_url) values (10, 'Mychal', 'http://dummyimage.com/109x100.png/ff4444/ffffff');
insert into usuarios (id_usuario, nome, foto_de_perfil_url) values (11, 'Arvy', 'http://dummyimage.com/223x100.png/cc0000/ffffff');
insert into usuarios (id_usuario, nome, foto_de_perfil_url) values (12, 'Cristobal', 'http://dummyimage.com/147x100.png/5fa2dd/ffffff');
insert into usuarios (id_usuario, nome, foto_de_perfil_url) values (13, 'Padraic', 'http://dummyimage.com/206x100.png/dddddd/000000');
insert into usuarios (id_usuario, nome, foto_de_perfil_url) values (14, 'Dominic', 'http://dummyimage.com/220x100.png/ff4444/ffffff');
insert into usuarios (id_usuario, nome, foto_de_perfil_url) values (15, 'Munroe', 'http://dummyimage.com/170x100.png/ff4444/ffffff');
insert into usuarios (id_usuario, nome, foto_de_perfil_url) values (16, 'Orelee', 'http://dummyimage.com/101x100.png/5fa2dd/ffffff');
insert into usuarios (id_usuario, nome, foto_de_perfil_url) values (17, 'Ali', 'http://dummyimage.com/161x100.png/cc0000/ffffff');
insert into usuarios (id_usuario, nome, foto_de_perfil_url) values (18, 'Brianne', 'http://dummyimage.com/120x100.png/cc0000/ffffff');
insert into usuarios (id_usuario, nome, foto_de_perfil_url) values (19, 'Darb', 'http://dummyimage.com/194x100.png/ff4444/ffffff');
insert into usuarios (id_usuario, nome, foto_de_perfil_url) values (20, 'Nessa', 'http://dummyimage.com/248x100.png/cc0000/ffffff');
insert into usuarios (id_usuario, nome, foto_de_perfil_url) values (21, 'Urson', 'http://dummyimage.com/160x100.png/cc0000/ffffff');
insert into usuarios (id_usuario, nome, foto_de_perfil_url) values (22, 'Martyn', 'http://dummyimage.com/219x100.png/5fa2dd/ffffff');
insert into usuarios (id_usuario, nome, foto_de_perfil_url) values (23, 'Barb', 'http://dummyimage.com/247x100.png/cc0000/ffffff');
insert into usuarios (id_usuario, nome, foto_de_perfil_url) values (24, 'Jillene', 'http://dummyimage.com/181x100.png/5fa2dd/ffffff');
insert into usuarios (id_usuario, nome, foto_de_perfil_url) values (25, 'Monro', 'http://dummyimage.com/184x100.png/ff4444/ffffff');

-- Endereços

insert into enderecos (cep, logradouro, bairro, cidade, estado, país) values (74593766, 'Morning', '2nd', 'San Antonio', 'Texas', 'United States');
insert into enderecos (cep, logradouro, bairro, cidade, estado, país) values (93223589, 'Onsgard', 'Fisk', 'Lakewood', 'Washington', 'United States');
insert into enderecos (cep, logradouro, bairro, cidade, estado, país) values (13536075, 'Schiller', 'Westerfield', 'Bronx', 'New York', 'United States');
insert into enderecos (cep, logradouro, bairro, cidade, estado, país) values (53081891, 'Mallard', 'Quincy', 'Arlington', 'Virginia', 'United States');
insert into enderecos (cep, logradouro, bairro, cidade, estado, país) values (61110426, 'Mallory', 'Kropf', 'Jamaica', 'New York', 'United States');
insert into enderecos (cep, logradouro, bairro, cidade, estado, país) values (2340139, 'Vidon', 'Cascade', 'Lincoln', 'Nebraska', 'United States');
insert into enderecos (cep, logradouro, bairro, cidade, estado, país) values (36709009, 'Shopko', 'Express', 'Spokane', 'Washington', 'United States');
insert into enderecos (cep, logradouro, bairro, cidade, estado, país) values (10964764, 'Bluejay', 'Hallows', 'Worcester', 'Massachusetts', 'United States');
insert into enderecos (cep, logradouro, bairro, cidade, estado, país) values (9123871, 'Menomonie', 'Bultman', 'Washington', 'District of Columbia', 'United States');
insert into enderecos (cep, logradouro, bairro, cidade, estado, país) values (36151819, 'Sugar', 'Thompson', 'Chico', 'California', 'United States');
insert into enderecos (cep, logradouro, bairro, cidade, estado, país) values (41962435, 'Toban', 'Carioca', 'Los Angeles', 'California', 'United States');
insert into enderecos (cep, logradouro, bairro, cidade, estado, país) values (29944539, 'Anhalt', 'Kim', 'San Antonio', 'Texas', 'United States');
insert into enderecos (cep, logradouro, bairro, cidade, estado, país) values (7856204, 'Valley Edge', 'Algoma', 'New Orleans', 'Louisiana', 'United States');
insert into enderecos (cep, logradouro, bairro, cidade, estado, país) values (57183222, 'Elgar', 'Steensland', 'Oklahoma City', 'Oklahoma', 'United States');
insert into enderecos (cep, logradouro, bairro, cidade, estado, país) values (164511, 'Monterey', 'Farwell', 'Nashville', 'Tennessee', 'United States');
insert into enderecos (cep, logradouro, bairro, cidade, estado, país) values (98887714, 'Scoville', 'Pearson', 'Beaufort', 'South Carolina', 'United States');
insert into enderecos (cep, logradouro, bairro, cidade, estado, país) values (46460967, 'Maple', 'Pond', 'Albany', 'New York', 'United States');
insert into enderecos (cep, logradouro, bairro, cidade, estado, país) values (48628173, 'Butternut', 'Grim', 'Orlando', 'Florida', 'United States');
insert into enderecos (cep, logradouro, bairro, cidade, estado, país) values (32678411, 'Brentwood', 'Clove', 'Memphis', 'Tennessee', 'United States');
insert into enderecos (cep, logradouro, bairro, cidade, estado, país) values (26007116, 'Meadow Valley', 'Texas', 'Tucson', 'Arizona', 'United States');
insert into enderecos (cep, logradouro, bairro, cidade, estado, país) values (30523723, 'Spohn', 'Golden Leaf', 'Kansas City', 'Missouri', 'United States');
insert into enderecos (cep, logradouro, bairro, cidade, estado, país) values (24511114, 'Algoma', 'Linden', 'El Paso', 'Texas', 'United States');
insert into enderecos (cep, logradouro, bairro, cidade, estado, país) values (52913607, 'Dahle', 'Havey', 'Newark', 'Delaware', 'United States');
insert into enderecos (cep, logradouro, bairro, cidade, estado, país) values (29212462, 'Judy', 'Pierstorff', 'Saint Augustine', 'Florida', 'United States');
insert into enderecos (cep, logradouro, bairro, cidade, estado, país) values (36803847, 'Longview', 'Mcguire', 'Birmingham', 'Alabama', 'United States');


-- Eventos

insert into eventos (id_evento, nome, data_inicio, data_fim, enderecos_cep, complemento_endereco) values (1, 'Bolander''s Yampah', '2022-09-22 18:55:22', '2023-01-08 09:01:29', 74593766, 'Hill');
insert into eventos (id_evento, nome, data_inicio, data_fim, enderecos_cep, complemento_endereco) values (2, 'Showy Sunflower', '2022-11-04 22:13:14', '2022-10-23 20:25:05', 74593766, 'Circle');
insert into eventos (id_evento, nome, data_inicio, data_fim, enderecos_cep, complemento_endereco) values (3, 'Alfalfa', '2022-07-17 04:36:45', '2022-12-11 10:06:08', 74593766, 'Pass');
insert into eventos (id_evento, nome, data_inicio, data_fim, enderecos_cep, complemento_endereco) values (4, 'Knob Sedge', '2022-07-11 02:33:52', '2022-09-28 06:01:26', 74593766, 'Court');
insert into eventos (id_evento, nome, data_inicio, data_fim, enderecos_cep, complemento_endereco) values (5, 'Rattlebox', '2022-06-11 01:49:13', '2023-02-07 08:25:17', 74593766, 'Lane');
insert into eventos (id_evento, nome, data_inicio, data_fim, enderecos_cep, complemento_endereco) values (6, 'Crabseye Lichen', '2023-03-19 04:51:26', '2022-08-26 18:29:37', 74593766, 'Hill');
insert into eventos (id_evento, nome, data_inicio, data_fim, enderecos_cep, complemento_endereco) values (7, 'Lecidella Lichen', '2023-01-28 14:13:27', '2023-01-05 14:37:11', 74593766, 'Terrace');
insert into eventos (id_evento, nome, data_inicio, data_fim, enderecos_cep, complemento_endereco) values (8, 'Evergreen Candytuft', '2023-01-03 10:12:25', '2023-03-03 22:16:31', 74593766, 'Way');
insert into eventos (id_evento, nome, data_inicio, data_fim, enderecos_cep, complemento_endereco) values (9, 'Thompson''s Beardtongue', '2022-10-09 07:48:06', '2022-09-23 08:24:09', 74593766, 'Way');
insert into eventos (id_evento, nome, data_inicio, data_fim, enderecos_cep, complemento_endereco) values (10, 'Eastern Featherbells', '2022-08-29 08:46:00', '2022-10-10 04:45:50', 74593766, 'Plaza');
insert into eventos (id_evento, nome, data_inicio, data_fim, enderecos_cep, complemento_endereco) values (11, 'Gordon''s Buckwheat', '2022-09-16 07:14:23', '2022-12-01 16:30:27', 74593766, 'Junction');
insert into eventos (id_evento, nome, data_inicio, data_fim, enderecos_cep, complemento_endereco) values (12, 'Boundary Peak Rockcress', '2023-02-05 04:06:14', '2023-01-11 06:33:34', 74593766, 'Pass');
insert into eventos (id_evento, nome, data_inicio, data_fim, enderecos_cep, complemento_endereco) values (13, 'European Purple Lousewort', '2023-01-08 03:06:24', '2023-01-11 22:55:56', 74593766, 'Junction');
insert into eventos (id_evento, nome, data_inicio, data_fim, enderecos_cep, complemento_endereco) values (14, 'Berg''s Hedgenettle', '2023-03-12 21:50:09', '2023-03-19 21:44:29', 74593766, 'Parkway');
insert into eventos (id_evento, nome, data_inicio, data_fim, enderecos_cep, complemento_endereco) values (15, 'Buddlejaleaf Viburnum', '2022-10-25 22:07:36', '2022-11-27 13:12:19', 74593766, 'Junction');
insert into eventos (id_evento, nome, data_inicio, data_fim, enderecos_cep, complemento_endereco) values (16, 'Carolina Oatgrass', '2023-01-30 20:01:38', '2022-12-09 06:47:49', 74593766, 'Trail');
insert into eventos (id_evento, nome, data_inicio, data_fim, enderecos_cep, complemento_endereco) values (17, 'Hairy Nightshade', '2022-09-29 23:31:23', '2022-10-26 01:43:16', 74593766, 'Hill');
insert into eventos (id_evento, nome, data_inicio, data_fim, enderecos_cep, complemento_endereco) values (18, 'Cleft Phlox', '2022-08-09 03:02:11', '2022-11-11 17:20:25', 74593766, 'Road');
insert into eventos (id_evento, nome, data_inicio, data_fim, enderecos_cep, complemento_endereco) values (19, 'Ross'' Avens', '2022-07-04 14:21:32', '2022-06-21 00:05:10', 74593766, 'Lane');
insert into eventos (id_evento, nome, data_inicio, data_fim, enderecos_cep, complemento_endereco) values (20, 'Longleaf False Goldeneye', '2022-06-08 12:01:23', '2022-08-17 15:58:16', 74593766, 'Court');
insert into eventos (id_evento, nome, data_inicio, data_fim, enderecos_cep, complemento_endereco) values (21, 'Welsh''s Bugseed', '2022-06-03 16:55:02', '2023-02-08 02:21:41', 74593766, 'Terrace');
insert into eventos (id_evento, nome, data_inicio, data_fim, enderecos_cep, complemento_endereco) values (22, 'Red Grama', '2023-03-02 16:46:42', '2022-06-05 00:40:39', 74593766, 'Parkway');
insert into eventos (id_evento, nome, data_inicio, data_fim, enderecos_cep, complemento_endereco) values (23, 'Woolly Brickellbush', '2023-02-16 22:01:53', '2022-07-12 07:09:38', 74593766, 'Hill');
insert into eventos (id_evento, nome, data_inicio, data_fim, enderecos_cep, complemento_endereco) values (24, 'Plagiobryum Moss', '2022-06-21 13:01:20', '2022-06-24 11:16:10', 74593766, 'Road');
insert into eventos (id_evento, nome, data_inicio, data_fim, enderecos_cep, complemento_endereco) values (25, 'Henbane', '2023-04-19 22:30:47', '2022-06-01 18:48:44', 74593766, 'Lane');
