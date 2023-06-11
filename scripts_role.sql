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
-- Table `eventos_has_usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eventos_has_usuarios` (
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
  `descricao` VARCHAR(120) NULL,
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
  PRIMARY KEY (`id_transacao`),
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


-- INSERT

-- Endereços

INSERT INTO enderecos (cep, logradouro, bairro, cidade, estado, país) VALUES (74593766, 'Morning', '2nd', 'San Antonio', 'Texas', 'United States');
INSERT INTO enderecos (cep, logradouro, bairro, cidade, estado, país) VALUES (93223589, 'Onsgard', 'Fisk', 'Lakewood', 'Washington', 'United States');
INSERT INTO enderecos (cep, logradouro, bairro, cidade, estado, país) VALUES (13536075, 'Schiller', 'Westerfield', 'Bronx', 'New York', 'United States');
INSERT INTO enderecos (cep, logradouro, bairro, cidade, estado, país) VALUES (53081891, 'Mallard', 'Quincy', 'Arlington', 'Virginia', 'United States');
INSERT INTO enderecos (cep, logradouro, bairro, cidade, estado, país) VALUES (61110426, 'Mallory', 'Kropf', 'Jamaica', 'New York', 'United States');
INSERT INTO enderecos (cep, logradouro, bairro, cidade, estado, país) VALUES (23401390, 'Vidon', 'Cascade', 'Lincoln', 'Nebraska', 'United States');
INSERT INTO enderecos (cep, logradouro, bairro, cidade, estado, país) VALUES (36709009, 'Shopko', 'Express', 'Spokane', 'Washington', 'United States');
INSERT INTO enderecos (cep, logradouro, bairro, cidade, estado, país) VALUES (10964764, 'Bluejay', 'Hallows', 'Worcester', 'Massachusetts', 'United States');
INSERT INTO enderecos (cep, logradouro, bairro, cidade, estado, país) VALUES (91238710, 'Menomonie', 'Bultman', 'Washington', 'District of Columbia', 'United States');
INSERT INTO enderecos (cep, logradouro, bairro, cidade, estado, país) VALUES (36151819, 'Sugar', 'Thompson', 'Chico', 'California', 'United States');
INSERT INTO enderecos (cep, logradouro, bairro, cidade, estado, país) VALUES (41962435, 'Toban', 'Carioca', 'Los Angeles', 'California', 'United States');
INSERT INTO enderecos (cep, logradouro, bairro, cidade, estado, país) VALUES (29944539, 'Anhalt', 'Kim', 'San Antonio', 'Texas', 'United States');
INSERT INTO enderecos (cep, logradouro, bairro, cidade, estado, país) VALUES (78562040, 'Valley Edge', 'Algoma', 'New Orleans', 'Louisiana', 'United States');
INSERT INTO enderecos (cep, logradouro, bairro, cidade, estado, país) VALUES (57183222, 'Elgar', 'Steensland', 'Oklahoma City', 'Oklahoma', 'United States');
INSERT INTO enderecos (cep, logradouro, bairro, cidade, estado, país) VALUES (16451100, 'Monterey', 'Farwell', 'Nashville', 'Tennessee', 'United States');
INSERT INTO enderecos (cep, logradouro, bairro, cidade, estado, país) VALUES (98887714, 'Scoville', 'Pearson', 'Beaufort', 'South Carolina', 'United States');
INSERT INTO enderecos (cep, logradouro, bairro, cidade, estado, país) VALUES (46460967, 'Maple', 'Pond', 'Albany', 'New York', 'United States');
INSERT INTO enderecos (cep, logradouro, bairro, cidade, estado, país) VALUES (48628173, 'Butternut', 'Grim', 'Orlando', 'Florida', 'United States');
INSERT INTO enderecos (cep, logradouro, bairro, cidade, estado, país) VALUES (32678411, 'Brentwood', 'Clove', 'Memphis', 'Tennessee', 'United States');
INSERT INTO enderecos (cep, logradouro, bairro, cidade, estado, país) VALUES (26007116, 'Meadow Valley', 'Texas', 'Tucson', 'Arizona', 'United States');
INSERT INTO enderecos (cep, logradouro, bairro, cidade, estado, país) VALUES (30523723, 'Spohn', 'Golden Leaf', 'Kansas City', 'Missouri', 'United States');
INSERT INTO enderecos (cep, logradouro, bairro, cidade, estado, país) VALUES (24511114, 'Algoma', 'Linden', 'El Paso', 'Texas', 'United States');
INSERT INTO enderecos (cep, logradouro, bairro, cidade, estado, país) VALUES (52913607, 'Dahle', 'Havey', 'Newark', 'Delaware', 'United States');
INSERT INTO enderecos (cep, logradouro, bairro, cidade, estado, país) VALUES (29212462, 'Judy', 'Pierstorff', 'Saint Augustine', 'Florida', 'United States');
INSERT INTO enderecos (cep, logradouro, bairro, cidade, estado, país) VALUES (36803847, 'Longview', 'Mcguire', 'Birmingham', 'Alabama', 'United States');


-- Eventos

INSERT INTO eventos (id_evento, nome, data_inicio, data_fim, enderecos_cep, complemento_endereco) VALUES (1, 'Bolander''s Yampah', '2022-09-22 18:55:22', '2023-01-08 09:01:29', 74593766, 'Hill');
INSERT INTO eventos (id_evento, nome, data_inicio, data_fim, enderecos_cep, complemento_endereco) VALUES (2, 'Showy Sunflower', '2022-11-04 22:13:14', '2022-10-23 20:25:05', 74593766, 'Circle');
INSERT INTO eventos (id_evento, nome, data_inicio, data_fim, enderecos_cep, complemento_endereco) VALUES (3, 'Alfalfa', '2022-07-17 04:36:45', '2022-12-11 10:06:08', 74593766, 'Pass');
INSERT INTO eventos (id_evento, nome, data_inicio, data_fim, enderecos_cep, complemento_endereco) VALUES (4, 'Knob Sedge', '2022-07-11 02:33:52', '2022-09-28 06:01:26', 74593766, 'Court');
INSERT INTO eventos (id_evento, nome, data_inicio, data_fim, enderecos_cep, complemento_endereco) VALUES (5, 'Rattlebox', '2022-06-11 01:49:13', '2023-02-07 08:25:17', 74593766, 'Lane');
INSERT INTO eventos (id_evento, nome, data_inicio, data_fim, enderecos_cep, complemento_endereco) VALUES (6, 'Crabseye Lichen', '2023-03-19 04:51:26', '2022-08-26 18:29:37', 74593766, 'Hill');
INSERT INTO eventos (id_evento, nome, data_inicio, data_fim, enderecos_cep, complemento_endereco) VALUES (7, 'Lecidella Lichen', '2023-01-28 14:13:27', '2023-01-05 14:37:11', 74593766, 'Terrace');
INSERT INTO eventos (id_evento, nome, data_inicio, data_fim, enderecos_cep, complemento_endereco) VALUES (8, 'Evergreen Candytuft', '2023-01-03 10:12:25', '2023-03-03 22:16:31', 74593766, 'Way');
INSERT INTO eventos (id_evento, nome, data_inicio, data_fim, enderecos_cep, complemento_endereco) VALUES (9, 'Thompson''s Beardtongue', '2022-10-09 07:48:06', '2022-09-23 08:24:09', 74593766, 'Way');
INSERT INTO eventos (id_evento, nome, data_inicio, data_fim, enderecos_cep, complemento_endereco) VALUES (10, 'Eastern Featherbells', '2022-08-29 08:46:00', '2022-10-10 04:45:50', 74593766, 'Plaza');
INSERT INTO eventos (id_evento, nome, data_inicio, data_fim, enderecos_cep, complemento_endereco) VALUES (11, 'Gordon''s Buckwheat', '2022-09-16 07:14:23', '2022-12-01 16:30:27', 74593766, 'Junction');
INSERT INTO eventos (id_evento, nome, data_inicio, data_fim, enderecos_cep, complemento_endereco) VALUES (12, 'Boundary Peak Rockcress', '2023-02-05 04:06:14', '2023-01-11 06:33:34', 74593766, 'Pass');
INSERT INTO eventos (id_evento, nome, data_inicio, data_fim, enderecos_cep, complemento_endereco) VALUES (13, 'European Purple Lousewort', '2023-01-08 03:06:24', '2023-01-11 22:55:56', 74593766, 'Junction');
INSERT INTO eventos (id_evento, nome, data_inicio, data_fim, enderecos_cep, complemento_endereco) VALUES (14, 'Berg''s Hedgenettle', '2023-03-12 21:50:09', '2023-03-19 21:44:29', 74593766, 'Parkway');
INSERT INTO eventos (id_evento, nome, data_inicio, data_fim, enderecos_cep, complemento_endereco) VALUES (15, 'Buddlejaleaf Viburnum', '2022-10-25 22:07:36', '2022-11-27 13:12:19', 74593766, 'Junction');
INSERT INTO eventos (id_evento, nome, data_inicio, data_fim, enderecos_cep, complemento_endereco) VALUES (16, 'Carolina Oatgrass', '2023-01-30 20:01:38', '2022-12-09 06:47:49', 74593766, 'Trail');
INSERT INTO eventos (id_evento, nome, data_inicio, data_fim, enderecos_cep, complemento_endereco) VALUES (17, 'Hairy Nightshade', '2022-09-29 23:31:23', '2022-10-26 01:43:16', 74593766, 'Hill');
INSERT INTO eventos (id_evento, nome, data_inicio, data_fim, enderecos_cep, complemento_endereco) VALUES (18, 'Cleft Phlox', '2022-08-09 03:02:11', '2022-11-11 17:20:25', 74593766, 'Road');
INSERT INTO eventos (id_evento, nome, data_inicio, data_fim, enderecos_cep, complemento_endereco) VALUES (19, 'Ross'' Avens', '2022-07-04 14:21:32', '2022-06-21 00:05:10', 74593766, 'Lane');
INSERT INTO eventos (id_evento, nome, data_inicio, data_fim, enderecos_cep, complemento_endereco) VALUES (20, 'Longleaf False Goldeneye', '2022-06-08 12:01:23', '2022-08-17 15:58:16', 74593766, 'Court');
INSERT INTO eventos (id_evento, nome, data_inicio, data_fim, enderecos_cep, complemento_endereco) VALUES (21, 'Welsh''s Bugseed', '2022-06-03 16:55:02', '2023-02-08 02:21:41', 74593766, 'Terrace');
INSERT INTO eventos (id_evento, nome, data_inicio, data_fim, enderecos_cep, complemento_endereco) VALUES (22, 'Red Grama', '2023-03-02 16:46:42', '2022-06-05 00:40:39', 74593766, 'Parkway');
INSERT INTO eventos (id_evento, nome, data_inicio, data_fim, enderecos_cep, complemento_endereco) VALUES (23, 'Woolly Brickellbush', '2023-02-16 22:01:53', '2022-07-12 07:09:38', 74593766, 'Hill');
INSERT INTO eventos (id_evento, nome, data_inicio, data_fim, enderecos_cep, complemento_endereco) VALUES (24, 'Plagiobryum Moss', '2022-06-21 13:01:20', '2022-06-24 11:16:10', 74593766, 'Road');
INSERT INTO eventos (id_evento, nome, data_inicio, data_fim, enderecos_cep, complemento_endereco) VALUES (25, 'Henbane', '2023-04-19 22:30:47', '2022-06-01 18:48:44', 74593766, 'Lane');


-- Usuários

INSERT INTO usuarios (id_usuario, nome, foto_de_perfil_url) VALUES (1, 'Donella', 'http://dummyimage.com/193x100.png/cc0000/ffffff');
INSERT INTO usuarios (id_usuario, nome, foto_de_perfil_url) VALUES (2, 'Emory', 'http://dummyimage.com/214x100.png/ff4444/ffffff');
INSERT INTO usuarios (id_usuario, nome, foto_de_perfil_url) VALUES (3, 'Charlotta', 'http://dummyimage.com/102x100.png/cc0000/ffffff');
INSERT INTO usuarios (id_usuario, nome, foto_de_perfil_url) VALUES (4, 'Denyse', 'http://dummyimage.com/249x100.png/cc0000/ffffff');
INSERT INTO usuarios (id_usuario, nome, foto_de_perfil_url) VALUES (5, 'Ludovico', 'http://dummyimage.com/167x100.png/ff4444/ffffff');
INSERT INTO usuarios (id_usuario, nome, foto_de_perfil_url) VALUES (6, 'Kimberlyn', 'http://dummyimage.com/221x100.png/ff4444/ffffff');
INSERT INTO usuarios (id_usuario, nome, foto_de_perfil_url) VALUES (7, 'Lazaro', 'http://dummyimage.com/232x100.png/cc0000/ffffff');
INSERT INTO usuarios (id_usuario, nome, foto_de_perfil_url) VALUES (8, 'Jayson', 'http://dummyimage.com/228x100.png/ff4444/ffffff');
INSERT INTO usuarios (id_usuario, nome, foto_de_perfil_url) VALUES (9, 'Robinetta', 'http://dummyimage.com/179x100.png/dddddd/000000');
INSERT INTO usuarios (id_usuario, nome, foto_de_perfil_url) VALUES (10, 'Mychal', 'http://dummyimage.com/109x100.png/ff4444/ffffff');
INSERT INTO usuarios (id_usuario, nome, foto_de_perfil_url) VALUES (11, 'Arvy', 'http://dummyimage.com/223x100.png/cc0000/ffffff');
INSERT INTO usuarios (id_usuario, nome, foto_de_perfil_url) VALUES (12, 'Cristobal', 'http://dummyimage.com/147x100.png/5fa2dd/ffffff');
INSERT INTO usuarios (id_usuario, nome, foto_de_perfil_url) VALUES (13, 'Padraic', 'http://dummyimage.com/206x100.png/dddddd/000000');
INSERT INTO usuarios (id_usuario, nome, foto_de_perfil_url) VALUES (14, 'Dominic', 'http://dummyimage.com/220x100.png/ff4444/ffffff');
INSERT INTO usuarios (id_usuario, nome, foto_de_perfil_url) VALUES (15, 'Munroe', 'http://dummyimage.com/170x100.png/ff4444/ffffff');
INSERT INTO usuarios (id_usuario, nome, foto_de_perfil_url) VALUES (16, 'Orelee', 'http://dummyimage.com/101x100.png/5fa2dd/ffffff');
INSERT INTO usuarios (id_usuario, nome, foto_de_perfil_url) VALUES (17, 'Ali', 'http://dummyimage.com/161x100.png/cc0000/ffffff');
INSERT INTO usuarios (id_usuario, nome, foto_de_perfil_url) VALUES (18, 'Brianne', 'http://dummyimage.com/120x100.png/cc0000/ffffff');
INSERT INTO usuarios (id_usuario, nome, foto_de_perfil_url) VALUES (19, 'Darb', 'http://dummyimage.com/194x100.png/ff4444/ffffff');
INSERT INTO usuarios (id_usuario, nome, foto_de_perfil_url) VALUES (20, 'Nessa', 'http://dummyimage.com/248x100.png/cc0000/ffffff');
INSERT INTO usuarios (id_usuario, nome, foto_de_perfil_url) VALUES (21, 'Urson', 'http://dummyimage.com/160x100.png/cc0000/ffffff');
INSERT INTO usuarios (id_usuario, nome, foto_de_perfil_url) VALUES (22, 'Martyn', 'http://dummyimage.com/219x100.png/5fa2dd/ffffff');
INSERT INTO usuarios (id_usuario, nome, foto_de_perfil_url) VALUES (23, 'Barb', 'http://dummyimage.com/247x100.png/cc0000/ffffff');
INSERT INTO usuarios (id_usuario, nome, foto_de_perfil_url) VALUES (24, 'Jillene', 'http://dummyimage.com/181x100.png/5fa2dd/ffffff');
INSERT INTO usuarios (id_usuario, nome, foto_de_perfil_url) VALUES (25, 'Monro', 'http://dummyimage.com/184x100.png/ff4444/ffffff');


-- Eventos has usuarios

INSERT INTO eventos_has_usuarios (eventos_id_evento, usuarios_id_usuario) VALUES (1, 1);
INSERT INTO eventos_has_usuarios (eventos_id_evento, usuarios_id_usuario) VALUES (1, 2);
INSERT INTO eventos_has_usuarios (eventos_id_evento, usuarios_id_usuario) VALUES (1, 3);
INSERT INTO eventos_has_usuarios (eventos_id_evento, usuarios_id_usuario) VALUES (1, 4);
INSERT INTO eventos_has_usuarios (eventos_id_evento, usuarios_id_usuario) VALUES (1, 5);
INSERT INTO eventos_has_usuarios (eventos_id_evento, usuarios_id_usuario) VALUES (2, 1);
INSERT INTO eventos_has_usuarios (eventos_id_evento, usuarios_id_usuario) VALUES (2, 2);
INSERT INTO eventos_has_usuarios (eventos_id_evento, usuarios_id_usuario) VALUES (2, 3);
INSERT INTO eventos_has_usuarios (eventos_id_evento, usuarios_id_usuario) VALUES (2, 4);
INSERT INTO eventos_has_usuarios (eventos_id_evento, usuarios_id_usuario) VALUES (2, 5);
INSERT INTO eventos_has_usuarios (eventos_id_evento, usuarios_id_usuario) VALUES (3, 1);
INSERT INTO eventos_has_usuarios (eventos_id_evento, usuarios_id_usuario) VALUES (3, 2);
INSERT INTO eventos_has_usuarios (eventos_id_evento, usuarios_id_usuario) VALUES (3, 3);
INSERT INTO eventos_has_usuarios (eventos_id_evento, usuarios_id_usuario) VALUES (3, 4);
INSERT INTO eventos_has_usuarios (eventos_id_evento, usuarios_id_usuario) VALUES (3, 5);
INSERT INTO eventos_has_usuarios (eventos_id_evento, usuarios_id_usuario) VALUES (4, 1);
INSERT INTO eventos_has_usuarios (eventos_id_evento, usuarios_id_usuario) VALUES (4, 2);
INSERT INTO eventos_has_usuarios (eventos_id_evento, usuarios_id_usuario) VALUES (4, 3);
INSERT INTO eventos_has_usuarios (eventos_id_evento, usuarios_id_usuario) VALUES (4, 4);
INSERT INTO eventos_has_usuarios (eventos_id_evento, usuarios_id_usuario) VALUES (4, 5);
INSERT INTO eventos_has_usuarios (eventos_id_evento, usuarios_id_usuario) VALUES (5, 1);
INSERT INTO eventos_has_usuarios (eventos_id_evento, usuarios_id_usuario) VALUES (5, 2);
INSERT INTO eventos_has_usuarios (eventos_id_evento, usuarios_id_usuario) VALUES (5, 3);
INSERT INTO eventos_has_usuarios (eventos_id_evento, usuarios_id_usuario) VALUES (5, 4);
INSERT INTO eventos_has_usuarios (eventos_id_evento, usuarios_id_usuario) VALUES (5, 5);


-- Insumos

INSERT INTO insumos (id_insumo, tipo, nome, descricao) VALUES (1, 2, 'Ivy', 'Hedera L.');
INSERT INTO insumos (id_insumo, tipo, nome, descricao) VALUES (2, 3, 'Donner Lake Lupine', 'Lupinus sellulus Kellogg ssp. sellulus var. sellulus');
INSERT INTO insumos (id_insumo, tipo, nome, descricao) VALUES (3, 2, 'Cassia', 'Cinnamomum aromaticum Nees');
INSERT INTO insumos (id_insumo, tipo, nome, descricao) VALUES (4, 1, 'Candyleaf', 'Stevia rebaudiana (Bertoni) Bertoni');
INSERT INTO insumos (id_insumo, tipo, nome, descricao) VALUES (5, 1, 'Western White Clematis', 'Clematis ligusticifolia Nutt.');
INSERT INTO insumos (id_insumo, tipo, nome, descricao) VALUES (6, 2, 'Canna', 'Canna L.');
INSERT INTO insumos (id_insumo, tipo, nome, descricao) VALUES (7, 5, 'Needle Lichen', 'Chaenotheca xyloxena Nadv.');
INSERT INTO insumos (id_insumo, tipo, nome, descricao) VALUES (8, 1, 'Lecidea Lichen', 'Lecidea atromarginata H. Magn.');
INSERT INTO insumos (id_insumo, tipo, nome, descricao) VALUES (9, 4, 'Mandarin Lime', 'Citrus ×limonia Osbeck (pro sp.)');
INSERT INTO insumos (id_insumo, tipo, nome, descricao) VALUES (10, 1, 'Islandthicket Threeawn', 'Aristida refracta Griseb.');
INSERT INTO insumos (id_insumo, tipo, nome, descricao) VALUES (11, 2, 'Diphyscium Moss', 'Diphyscium D. Mohr');
INSERT INTO insumos (id_insumo, tipo, nome, descricao) VALUES (12, 5, 'Foxtail Barley', 'Hordeum jubatum L. ssp. jubatum');
INSERT INTO insumos (id_insumo, tipo, nome, descricao) VALUES (13, 3, 'Waimea Pipturus', 'Pipturus albidus (Hook. & Arn.) A. Gray');
INSERT INTO insumos (id_insumo, tipo, nome, descricao) VALUES (14, 3, 'Broomwort', 'Scoparia montevidensis (Spreng.) R.E. Fries var. glandulifera (Fritsch) R.E. Fries');
INSERT INTO insumos (id_insumo, tipo, nome, descricao) VALUES (15, 2, 'Yellow Indian Paintbrush', 'Castilleja flava S. Watson');
INSERT INTO insumos (id_insumo, tipo, nome, descricao) VALUES (16, 2, 'Desert Evening Primrose', 'Oenothera primiveris A. Gray ssp. bufonis (M.E. Jones) Munz');
INSERT INTO insumos (id_insumo, tipo, nome, descricao) VALUES (17, 3, 'Epimedium', 'Epimedium L.');
INSERT INTO insumos (id_insumo, tipo, nome, descricao) VALUES (18, 5, 'Broadleaf Rush', 'Juncus planifolius R. Br.');
INSERT INTO insumos (id_insumo, tipo, nome, descricao) VALUES (19, 1, 'Woolly Sage', 'Salvia funerea M.E. Jones');
INSERT INTO insumos (id_insumo, tipo, nome, descricao) VALUES (20, 2, 'Frosted Buckwheat', 'Eriogonum incanum Torr. & A. Gray');
INSERT INTO insumos (id_insumo, tipo, nome, descricao) VALUES (21, 1, 'Bog Birch', 'Betula pumila L. var. renifolia Fernald');
INSERT INTO insumos (id_insumo, tipo, nome, descricao) VALUES (22, 1, 'Isachne', 'Isachne purpurascens Glassman');
INSERT INTO insumos (id_insumo, tipo, nome, descricao) VALUES (23, 3, 'Fendler''s Flatsedge', 'Cyperus fendlerianus Boeckeler');
INSERT INTO insumos (id_insumo, tipo, nome, descricao) VALUES (24, 5, 'Corn', 'Zea mays L.');
INSERT INTO insumos (id_insumo, tipo, nome, descricao) VALUES (25, 4, 'Navajo Evening Primrose', 'Oenothera caespitosa Nutt. ssp. navajoensis W.L. Wagner, Stockhouse & Klein');


-- Transações

INSERT INTO transacoes (id_transacao, valor, data, usuarios_id_usuario, insumos_id_insumo) VALUES (1, 457.34, '2022-09-16 12:17:43', 1, 1);
INSERT INTO transacoes (id_transacao, valor, data, usuarios_id_usuario, insumos_id_insumo) VALUES (2, 320.09, '2022-08-03 07:54:58', 2, 2);
INSERT INTO transacoes (id_transacao, valor, data, usuarios_id_usuario, insumos_id_insumo) VALUES (3, 325.75, '2022-08-06 12:36:34', 3, 3);
INSERT INTO transacoes (id_transacao, valor, data, usuarios_id_usuario, insumos_id_insumo) VALUES (4, 10.33, '2023-03-07 15:25:31', 4, 4);
INSERT INTO transacoes (id_transacao, valor, data, usuarios_id_usuario, insumos_id_insumo) VALUES (5, 113.87, '2023-01-23 15:36:15', 5, 5);
INSERT INTO transacoes (id_transacao, valor, data, usuarios_id_usuario, insumos_id_insumo) VALUES (6, 200.38, '2022-10-06 22:50:35', 1, 6);
INSERT INTO transacoes (id_transacao, valor, data, usuarios_id_usuario, insumos_id_insumo) VALUES (7, 255.0, '2023-02-04 10:05:28', 2, 7);
INSERT INTO transacoes (id_transacao, valor, data, usuarios_id_usuario, insumos_id_insumo) VALUES (8, 339.45, '2023-04-30 02:22:52', 3, 8);
INSERT INTO transacoes (id_transacao, valor, data, usuarios_id_usuario, insumos_id_insumo) VALUES (9, 312.3, '2023-03-07 22:09:15', 4, 9);
INSERT INTO transacoes (id_transacao, valor, data, usuarios_id_usuario, insumos_id_insumo) VALUES (10, 251.27, '2022-06-27 15:08:11', 5, 10);
INSERT INTO transacoes (id_transacao, valor, data, usuarios_id_usuario, insumos_id_insumo) VALUES (11, 93.82, '2022-11-14 08:58:50', 1, 11);
INSERT INTO transacoes (id_transacao, valor, data, usuarios_id_usuario, insumos_id_insumo) VALUES (12, 85.17, '2022-11-17 19:47:20', 2, 12);
INSERT INTO transacoes (id_transacao, valor, data, usuarios_id_usuario, insumos_id_insumo) VALUES (13, 414.71, '2023-05-07 17:17:38', 3, 13);
INSERT INTO transacoes (id_transacao, valor, data, usuarios_id_usuario, insumos_id_insumo) VALUES (14, 260.51, '2022-07-10 23:48:16', 4, 14);
INSERT INTO transacoes (id_transacao, valor, data, usuarios_id_usuario, insumos_id_insumo) VALUES (15, 96.81, '2023-02-13 05:34:07', 5, 15);
INSERT INTO transacoes (id_transacao, valor, data, usuarios_id_usuario, insumos_id_insumo) VALUES (16, 233.84, '2023-02-14 18:42:52', 1, 16);
INSERT INTO transacoes (id_transacao, valor, data, usuarios_id_usuario, insumos_id_insumo) VALUES (17, 133.34, '2023-04-20 20:11:54', 2, 17);
INSERT INTO transacoes (id_transacao, valor, data, usuarios_id_usuario, insumos_id_insumo) VALUES (18, 88.73, '2023-01-30 17:16:51', 3, 18);
INSERT INTO transacoes (id_transacao, valor, data, usuarios_id_usuario, insumos_id_insumo) VALUES (19, 214.66, '2023-05-26 15:34:32', 4, 19);
INSERT INTO transacoes (id_transacao, valor, data, usuarios_id_usuario, insumos_id_insumo) VALUES (20, 391.03, '2022-07-08 01:41:55', 5, 20);
INSERT INTO transacoes (id_transacao, valor, data, usuarios_id_usuario, insumos_id_insumo) VALUES (21, 227.34, '2022-08-31 07:31:29', 1, 21);
INSERT INTO transacoes (id_transacao, valor, data, usuarios_id_usuario, insumos_id_insumo) VALUES (22, 251.28, '2023-01-11 16:17:14', 2, 22);
INSERT INTO transacoes (id_transacao, valor, data, usuarios_id_usuario, insumos_id_insumo) VALUES (23, 224.15, '2022-12-08 03:21:18', 3, 23);
INSERT INTO transacoes (id_transacao, valor, data, usuarios_id_usuario, insumos_id_insumo) VALUES (24, 122.14, '2022-12-05 07:46:10', 4, 24);
INSERT INTO transacoes (id_transacao, valor, data, usuarios_id_usuario, insumos_id_insumo) VALUES (25, 320.0, '2023-06-01 11:46:06', 5, 25);


-- Eventos has insumos

INSERT INTO eventos_has_insumos (eventos_id_evento, insumos_id_insumo) VALUES (1, 1);
INSERT INTO eventos_has_insumos (eventos_id_evento, insumos_id_insumo) VALUES (1, 2);
INSERT INTO eventos_has_insumos (eventos_id_evento, insumos_id_insumo) VALUES (1, 3);
INSERT INTO eventos_has_insumos (eventos_id_evento, insumos_id_insumo) VALUES (1, 4);
INSERT INTO eventos_has_insumos (eventos_id_evento, insumos_id_insumo) VALUES (1, 5);
INSERT INTO eventos_has_insumos (eventos_id_evento, insumos_id_insumo) VALUES (2, 6);
INSERT INTO eventos_has_insumos (eventos_id_evento, insumos_id_insumo) VALUES (2, 7);
INSERT INTO eventos_has_insumos (eventos_id_evento, insumos_id_insumo) VALUES (2, 8);
INSERT INTO eventos_has_insumos (eventos_id_evento, insumos_id_insumo) VALUES (2, 9);
INSERT INTO eventos_has_insumos (eventos_id_evento, insumos_id_insumo) VALUES (2, 10);
INSERT INTO eventos_has_insumos (eventos_id_evento, insumos_id_insumo) VALUES (3, 11);
INSERT INTO eventos_has_insumos (eventos_id_evento, insumos_id_insumo) VALUES (3, 12);
INSERT INTO eventos_has_insumos (eventos_id_evento, insumos_id_insumo) VALUES (3, 13);
INSERT INTO eventos_has_insumos (eventos_id_evento, insumos_id_insumo) VALUES (3, 14);
INSERT INTO eventos_has_insumos (eventos_id_evento, insumos_id_insumo) VALUES (3, 15);
INSERT INTO eventos_has_insumos (eventos_id_evento, insumos_id_insumo) VALUES (4, 16);
INSERT INTO eventos_has_insumos (eventos_id_evento, insumos_id_insumo) VALUES (4, 17);
INSERT INTO eventos_has_insumos (eventos_id_evento, insumos_id_insumo) VALUES (4, 18);
INSERT INTO eventos_has_insumos (eventos_id_evento, insumos_id_insumo) VALUES (4, 19);
INSERT INTO eventos_has_insumos (eventos_id_evento, insumos_id_insumo) VALUES (4, 20);
INSERT INTO eventos_has_insumos (eventos_id_evento, insumos_id_insumo) VALUES (5, 21);
INSERT INTO eventos_has_insumos (eventos_id_evento, insumos_id_insumo) VALUES (5, 22);
INSERT INTO eventos_has_insumos (eventos_id_evento, insumos_id_insumo) VALUES (5, 23);
INSERT INTO eventos_has_insumos (eventos_id_evento, insumos_id_insumo) VALUES (5, 24);
INSERT INTO eventos_has_insumos (eventos_id_evento, insumos_id_insumo) VALUES (5, 25);


-- UPDATE 

--Transacoes
UPDATE transacoes SET valor = 554.43, data = '2023-01-15 14:27:43' WHERE id_transacao = 1;
UPDATE transacoes SET valor = 45.45, data = '2020-12-23 06:26:55' WHERE id_transacao = 5; 
UPDATE transacoes SET valor = 04.27, data = '2022-05-30 12:30:00' WHERE id_transacao = 22; 
UPDATE transacoes SET valor = 700.40, data = '2020-12-23 16:14:44' WHERE id_transacao = 13;
UPDATE transacoes SET valor = 60.00, data = '2022-15-24 18:30:16' WHERE id_transacao = 19;
UPDATE transacoes SET valor = 26.00, data = '2023-10-14 15:34:20' WHERE id_transacao = 8;
UPDATE transacoes SET valor = 300.00, data = '2023-06-27 12:30:00' WHERE id_transacao = 7;
UPDATE transacoes SET valor = 455.60, data = '2023-03-16 09:44:00' WHERE id_transacao = 16;
UPDATE transacoes SET valor = 756.10, data = '2020-08-14 05:55:00' WHERE id_transacao = 25;
UPDATE transacoes SET valor = 100.00, data = '2022-11-17 15:33:00' WHERE id_transacao = 4;

-- Insumos
UPDATE insumos SET tipo = 3, nome = 'Canwes Lincon' WHERE id_insumo = 3;
UPDATE insumos SET tipo = 2, nome = 'Darslen Needly' WHERE id_insumo = 7;
UPDATE insumos SET tipo = 4, nome = 'Ivy Lin' WHERE id_insumo = 10;
UPDATE insumos SET tipo = 1, nome = 'Broomwort' WHERE id_insumo = 13;
UPDATE insumos SET tipo = 5, nome = 'Corns  dogy' WHERE id_insumo = 25;
UPDATE insumos SET tipo = 2, nome = 'Waimea Pipturus' WHERE id_insumo = 14;
UPDATE insumos SET tipo = 5, nome = 'Issac King' WHERE id_insumo = 5;
UPDATE insumos SET tipo = 1, nome = 'Pinters Onw' WHERE id_insumo = 18;
UPDATE insumos SET tipo = 3, nome = 'Poplolli Little' WHERE id_insumo = 1;

--Usuarios
UPDATE usuarios SET nome = 'Charlotte' WHERE id_usuario = 3;
UPDATE usuarios SET nome = 'Donatella' WHERE id_usuario = 1;
-- DELETE

-- Endereços
DELETE FROM enderecos WHERE cep = 30523723;
DELETE FROM enderecos WHERE cep = 24511114;
DELETE FROM enderecos WHERE cep = 52913607;
DELETE FROM enderecos WHERE cep = 29212462;
DELETE FROM enderecos WHERE cep = 36803847;

-- Eventos
DELETE FROM eventos WHERE id_evento = 21;
DELETE FROM eventos WHERE id_evento = 22;
DELETE FROM eventos WHERE id_evento = 23;
DELETE FROM eventos WHERE id_evento = 24;
DELETE FROM eventos WHERE id_evento = 25;

-- Usuários
DELETE FROM usuarios WHERE id_usuario = 21;
DELETE FROM usuarios WHERE id_usuario = 22;
DELETE FROM usuarios WHERE id_usuario = 23;
DELETE FROM usuarios WHERE id_usuario = 24;
DELETE FROM usuarios WHERE id_usuario = 25;

-- Eventos has insumos
DELETE FROM eventos_has_insumos WHERE insumos_id_insumo = 5;
DELETE FROM eventos_has_insumos WHERE insumos_id_insumo = 10;
DELETE FROM eventos_has_insumos WHERE insumos_id_insumo = 15;
DELETE FROM eventos_has_insumos WHERE insumos_id_insumo = 20;
DELETE FROM eventos_has_insumos WHERE insumos_id_insumo = 25;

-- Transações
DELETE FROM transacoes WHERE id_transacao = 5;
DELETE FROM transacoes WHERE id_transacao = 10;
DELETE FROM transacoes WHERE id_transacao = 15;
DELETE FROM transacoes WHERE id_transacao = 20;
DELETE FROM transacoes WHERE id_transacao = 25;

-- Insumos
DELETE FROM insumos WHERE id_insumo = 5;
DELETE FROM insumos WHERE id_insumo = 10;
DELETE FROM insumos WHERE id_insumo = 15;
DELETE FROM insumos WHERE id_insumo = 20;
DELETE FROM insumos WHERE id_insumo = 25;

-- Eventos has usuários (redundante para satisfazer 5 comandos)
DELETE FROM eventos_has_usuarios WHERE eventos_id_evento = 1 AND usuarios_id_usuario = 5;
DELETE FROM eventos_has_usuarios WHERE eventos_id_evento = 2 AND usuarios_id_usuario = 5;
DELETE FROM eventos_has_usuarios WHERE eventos_id_evento = 3 AND usuarios_id_usuario = 5;
DELETE FROM eventos_has_usuarios WHERE eventos_id_evento = 4 AND usuarios_id_usuario = 5;
DELETE FROM eventos_has_usuarios WHERE eventos_id_evento = 5 AND usuarios_id_usuario = 5;


-- SELECT

-- SELECT COUNT
SELECT COUNT(*) FROM enderecos;
SELECT COUNT(*) FROM eventos;
SELECT COUNT(*) FROM usuarios;
SELECT COUNT(*) FROM insumos;
SELECT COUNT(*) FROM transacoes;
SELECT COUNT(*) FROM eventos_has_insumos;
SELECT COUNT(*) FROM eventos_has_usuarios;

-- SELECT ALL
SELECT * FROM enderecos ORDER BY cep;
SELECT * FROM eventos ORDER BY id_evento;
SELECT * FROM usuarios ORDER BY id_usuario;
SELECT * FROM insumos ORDER BY id_insumo;
SELECT * FROM transacoes ORDER BY id_transacao;
SELECT * FROM eventos_has_insumos ORDER BY eventos_id_evento;
SELECT * FROM eventos_has_usuarios ORDER BY eventos_id_evento;

-- SELECT JOIN
SELECT 
    insumos.tipo AS tipo_insumo,
    insumos.nome AS nome_insumo,
    insumos.descricao AS descricao_insumo,
    transacoes.valor AS valor_transacao,
    transacoes.data AS data_transacao,
    usuarios.nome AS nome_usuario
FROM
    transacoes
        INNER JOIN
    usuarios ON transacoes.usuarios_id_usuario = usuarios.id_usuario
        INNER JOIN
    insumos ON transacoes.insumos_id_insumo = insumos.id_insumo
ORDER BY
	insumos.tipo;
		

