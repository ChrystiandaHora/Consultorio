-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           5.7.33 - MySQL Community Server (GPL)
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para consultorio
CREATE DATABASE IF NOT EXISTS `consultorio` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `consultorio`;

-- Copiando estrutura para tabela consultorio.consulta
CREATE TABLE IF NOT EXISTS `consulta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paciente_id` varchar(255) NOT NULL,
  `titulo` varchar(200) NOT NULL,
  `medico_id` varchar(255) NOT NULL,
  `area_do_medico_nome` int(11) NOT NULL,
  `dtinicio` datetime NOT NULL,
  `dtfim` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela consultorio.consulta: ~16 rows (aproximadamente)
/*!40000 ALTER TABLE `consulta` DISABLE KEYS */;
INSERT INTO `consulta` (`id`, `paciente_id`, `titulo`, `medico_id`, `area_do_medico_nome`, `dtinicio`, `dtfim`) VALUES
	(1, '1', 'Consulta - Primeira Vez', '2', 2, '2022-06-09 17:15:00', '2022-06-09 17:30:00'),
	(2, '2', 'Exame', '3', 3, '2022-06-10 16:50:00', '2022-06-10 17:20:00'),
	(3, '3', 'Consulta - Primeira Vez', '4', 4, '2022-06-13 14:50:00', '2022-06-13 15:20:00'),
	(4, '4', 'Consulta - Primeira Vez', '5', 5, '2022-06-14 15:50:00', '2022-06-14 16:20:00'),
	(5, '5', 'Consulta - Primeira Vez', '6', 6, '2022-06-15 16:10:00', '2022-06-15 16:40:00'),
	(6, '6', 'Consulta - Primeira Vez', '7', 7, '2022-06-16 13:10:00', '2022-06-16 13:40:00'),
	(7, '7', 'Consulta - Primeira Vez', '8', 8, '2022-06-17 15:50:00', '2022-06-17 16:20:00'),
	(8, '8', 'Consulta - Primeira Vez', '9', 9, '2022-06-22 14:50:00', '2022-06-22 15:20:00'),
	(9, '9', 'Exame', '10', 10, '2022-06-23 14:50:00', '2022-06-23 15:20:00'),
	(10, '10', 'Consulta - Primeira Vez', '1', 1, '2022-06-24 14:40:00', '2022-06-24 15:10:00'),
	(11, '11', 'Consulta - Primeira Vez', '2', 2, '2022-06-28 16:20:23', '2022-06-28 18:00:00'),
	(12, '12', 'Exame', '3', 3, '2022-06-21 14:50:00', '2022-06-21 15:20:00'),
	(13, '13', 'Consulta - Primeira Vez', '4', 4, '2022-06-20 14:50:00', '2022-06-20 15:20:00'),
	(14, '14', 'Exame', '5', 5, '2022-06-29 15:00:00', '2022-06-29 15:35:00'),
	(15, '15', 'Exame', '6', 6, '2022-06-27 12:50:00', '2022-06-27 13:20:00'),
	(16, '16', 'Consulta - Primeira Vez', '5', 5, '2022-06-30 11:40:00', '2022-06-30 18:55:00'),
	(17, '9', 'Exame', '9', 9, '2022-07-04 12:10:00', '2022-07-04 18:00:00');
/*!40000 ALTER TABLE `consulta` ENABLE KEYS */;

-- Copiando estrutura para tabela consultorio.medico
CREATE TABLE IF NOT EXISTS `medico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `sexo` char(1) NOT NULL,
  `idade` int(3) NOT NULL,
  `cpf` varchar(30) NOT NULL,
  `area_do_medico` varchar(200) NOT NULL,
  `telefone` varchar(30) NOT NULL,
  `email` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela consultorio.medico: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `medico` DISABLE KEYS */;
INSERT INTO `medico` (`id`, `nome`, `sexo`, `idade`, `cpf`, `area_do_medico`, `telefone`, `email`) VALUES
	(1, 'Victor Anderson dos Santos', 'M', 42, '190.872.874-45', 'Nefrologista', '(84) 98695-5283', 'victorandersondossantos@righettorosa.com.br'),
	(2, 'Thomas Thiago Leandro Fernandes', 'M', 35, '335.787.744-99', 'Pediatra', '(84) 98546-3281', 'thomas_thiago_fernandes@semco.com.br'),
	(3, 'Valentina Heloisa Allana Lima', 'F', 37, '396.525.884-23', 'Odonto', '(84) 98636-1222', 'valentinaheloisalima@macroengenharia.com'),
	(4, 'Sabrina Raimunda Fátima da Silva', 'F', 38, '345.814.524-90', 'Cardiologista', '(84) 99604-5341', 'sabrina-dasilva96@dizain.com.br'),
	(5, 'Ana Elaine Baptista', 'F', 29, '426.585.694-24', 'Nutrição', '(84) 98234-4370', 'ana-baptista96@scuderiagwr.com.br'),
	(6, 'Isaac Rodrigo Augusto Gonçalves', 'M', 35, '186.287.214-79', 'Ortopedista', '(84) 99874-6536', 'isaac-goncalves76@corp.globo.com'),
	(7, 'Yuri Kevin Pereira', 'M', 33, '894.824.274-16', 'Clínico', '(84) 98144-1890', 'yuri-pereira78@db9.com.br'),
	(8, 'Maitê Eliane Ferreira', 'F', 41, '244.131.739-37', 'Psiquiatra', '(86) 99346-4530', 'maite.eliane.ferreira@depotit.com.br'),
	(9, 'Hugo Severino Henry Bernardes', 'M', 41, '151.859.171-05', 'Dermatologia', '(92) 99221-9524', 'hugo.severino.bernardes@tecnew.net'),
	(10, 'Ruan Filipe Filipe Moraes', 'M', 39, '855.104.415-00', 'Neurologia', '(28) 99975-4851', 'ruan.filipe.moraes@mmarques.com');
/*!40000 ALTER TABLE `medico` ENABLE KEYS */;

-- Copiando estrutura para tabela consultorio.nota_fiscal
CREATE TABLE IF NOT EXISTS `nota_fiscal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_paciente` varchar(255) NOT NULL,
  `id_area_do_medico` int(11) NOT NULL,
  `payment` varchar(18) NOT NULL,
  `dtinicio` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela consultorio.nota_fiscal: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `nota_fiscal` DISABLE KEYS */;
INSERT INTO `nota_fiscal` (`id`, `id_paciente`, `id_area_do_medico`, `payment`, `dtinicio`) VALUES
	(1, '1', 1, '222,22', '2022-06-15 14:50:00'),
	(2, '2', 6, '200,00', '2022-06-14 14:50:00'),
	(3, '3', 2, '260,00', '2022-06-15 15:53:00'),
	(4, '4', 7, '270,00', '2022-06-22 11:54:00'),
	(5, '5', 5, '555,55', '2022-06-15 16:15:00'),
	(6, '6', 6, '666,66', '2022-06-16 13:05:00'),
	(7, '7', 7, '222,22', '2022-06-23 14:32:00'),
	(8, '10', 3, '555,55', '2022-06-23 14:37:00'),
	(9, '11', 2, '333,33', '2022-06-30 15:07:00');
/*!40000 ALTER TABLE `nota_fiscal` ENABLE KEYS */;

-- Copiando estrutura para tabela consultorio.paciente
CREATE TABLE IF NOT EXISTS `paciente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `sexo` char(1) NOT NULL,
  `idade` int(3) NOT NULL,
  `cpf` varchar(20) NOT NULL,
  `endereco` varchar(200) NOT NULL,
  `cidade` varchar(100) NOT NULL,
  `numero` varchar(5) NOT NULL,
  `bairro` varchar(200) NOT NULL,
  `uf` varchar(100) NOT NULL,
  `complemento` text NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `email` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela consultorio.paciente: ~17 rows (aproximadamente)
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
INSERT INTO `paciente` (`id`, `nome`, `sexo`, `idade`, `cpf`, `endereco`, `cidade`, `numero`, `bairro`, `uf`, `complemento`, `telefone`, `email`) VALUES
	(1, 'Manuela Camila Fabiana da Luz', 'F', 23, '986.019.354-19', 'Rua Vicente Martins Fernandes', 'Recife', '554', 'Piedade', 'PE', 'Proximo a padaria 3 irmãos', '(81) 99969-9853', 'manuelacamiladaluz@temavonfeccaosjc.com.br'),
	(2, 'Theo Renan da Rocha', 'M', 33, '825.802.754-95', 'Rua Santa Flora', 'Natal', '122', 'Pajuçara', 'RN', 'Próximo ao comercio popular', '(84) 98868-2016', 'theorenandarocha@p4ed.com'),
	(3, 'Diogo Renan Lucca da Mata', 'M', 43, '598.119.124-40', 'Rua Açude Dourado', 'Natal', '108', 'Pajuçara', 'RN', 'Próximo a Av. Capitão', '(84) 98611-6086', 'diogorenandamata@grupoamericaville.com.br'),
	(4, 'Caroline Patrícia Aurora Rocha', 'F', 27, '980.091.054-90', 'Rua Principal', 'Lagoa Nova', '921', 'Sitio Manoel Domingo', 'RN', 'Próximo a BR 101', '(84) 99591-5383', 'caroline-rocha70@casaarte.com.br'),
	(5, 'Augusto Caio Silveira', 'M', 46, '903.709.584-46', 'Rua Doutor Sílvio B. de Melo', 'Lagoa Nova', '279', 'Centro', 'RN', 'Próximo aos Correios', '(84) 99387-6024', 'augusto_caio_silveira@wnetrj.com.br'),
	(6, 'Camila Benedita da Mata', 'F', 30, '579.240.324-44', 'Rua Ladir Borges dos Santos', 'Parnamirim', '876', 'Passagem de Areia', 'RN', 'Próximo ao colégio Fenix', '(84) 99971-472', 'camilabeneditadamata@sitran.com.br'),
	(7, 'Erick Ryan Kaique Alves', 'M', 31, '038.769.334-39', 'Rua São Benedito', 'Parnamirim', '109', 'Emaús', 'RN', 'Do lado da Padaria Rei do Pão', '(84) 98159-1164', 'erickryanalves@redex.com.br'),
	(8, 'Patrícia Natália Assis', 'F', 21, '111.137.634-42', 'Rua Jacupiranga', 'Natal', '361', 'Lagoa Azul', 'RN', 'Próximo à br 101', '(84) 98535-9662', 'patricia_assis@soespodonto.com.br'),
	(9, 'Maya Jennifer Galvão', 'F', 24, '948.530.234-70', 'Rua da Saudade', 'Natal', '686', 'Nova Descoberta', 'RN', 'Próximo a farmácia PagMenos', '(84) 99142-7196', 'maya_jennifer_galvao@controtel.com.br'),
	(10, 'Filipe Theo Almeida', 'M', 31, '789.784.334-30', 'Rua Ponta de Serrambi', 'Natal', '559', 'Ponta Negra', 'RN', 'Próximo a farmácia Drogasil', '(84) 98338-9319', 'filipe_almeida@geniustyres.com.br'),
	(11, 'Anderson Ferreira', 'M', 21, '123.123.222-1', 'Rua Potengi', 'Natal', '02', 'Potengi', 'RN', 'Próximo a praia', '(84) 95124-8412', 'anderson.louco0992@gmail.com'),
	(12, 'Gael Enzo Cardoso', 'M', 21, '502.922.854-34', 'Rua Verdejante', 'Petrolina', '589', 'São José', 'PE', 'Ao lado da Escola pública São João', '(87) 38092-417', 'gaelenzocardoso@sectron.com.br'),
	(13, 'Anderson Ferreira', 'M', 21, '123.123.222-1', 'Rua Potengi', 'Natal', '02', 'Potengi', 'RN', 'Ao lado do supermercado Nordestão', '(84) 95124-8412', 'ander_ferreira@asconinternet.com.br'),
	(14, 'Fábio Fábio Tomás Cardoso', 'M', 27, '735.800.494-96', 'Rua Antônio Pereira', 'Natal', '657', 'Lagoa Azul', 'RN', 'Ao lado do predio empresarial Bernado Melo', '(84) 98476-6666', 'fabio_fabio_cardoso@cuppari.com.br'),
	(15, 'Severino Mateus Matheus Aparício', 'M', 41, '277.477.176-52', 'Rua Cônego Ramos', 'Anápolis', '652', 'Jundiaí', 'GO', 'Perto da Av. Governador Felipe', '(62) 98447-4648', 'severinomateusaparicio@recnev.com.br'),
	(16, 'Bento Gustavo Ian Silveira', 'M', 23, '123.616.554-38', 'Rua Ex-Combatente José Conceição da Silva', 'Natal', '244', 'Lagoa Azul', 'RN', 'Perto da Br 101', '(84) 99717-1974', 'bento_silveira@yahool.com.br'),
	(20, 'Daiane Antonella Viana', 'M', 34, '372.636.508-78', 'Rua Dois', 'Aracaju', '125', 'Santos Dumont', 'SE', 'Ao lado da Farmacia', '(79) 99353-6501', 'daiane-viana86@uniara.com.br');
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;

-- Copiando estrutura para tabela consultorio.system_access_log
CREATE TABLE IF NOT EXISTS `system_access_log` (
  `id` int(11) NOT NULL,
  `sessionid` text,
  `login` text,
  `login_time` datetime DEFAULT NULL,
  `login_year` varchar(4) DEFAULT NULL,
  `login_month` varchar(2) DEFAULT NULL,
  `login_day` varchar(2) DEFAULT NULL,
  `logout_time` datetime DEFAULT NULL,
  `impersonated` char(1) DEFAULT NULL,
  `access_ip` varchar(45) DEFAULT NULL,
  `impersonated_by` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela consultorio.system_access_log: ~21 rows (aproximadamente)
/*!40000 ALTER TABLE `system_access_log` DISABLE KEYS */;
INSERT INTO `system_access_log` (`id`, `sessionid`, `login`, `login_time`, `login_year`, `login_month`, `login_day`, `logout_time`, `impersonated`, `access_ip`, `impersonated_by`) VALUES
	(1, 'acr0o9gta22hs6eugdthbg5ncq', 'user', '2022-06-08 16:03:35', '2022', '06', '08', '2022-06-08 16:03:38', 'N', '::1', NULL),
	(2, 'rnue6j1ocp5bb7tl6q3dlvv8v3', 'admin', '2022-06-08 16:03:43', '2022', '06', '08', '2022-06-08 16:48:48', 'N', '::1', NULL),
	(3, 'kri1gaf2eu0miugfkhetvea9r6', 'admin', '2022-06-08 16:48:51', '2022', '06', '08', '2022-06-08 16:49:07', 'N', '::1', NULL),
	(4, 'gim21gss8hqp7eugul4f2nf4jv', 'user', '2022-06-08 16:49:11', '2022', '06', '08', '2022-06-08 16:49:15', 'N', '::1', NULL),
	(5, '7efas8867d8h2r8vbnsf2e7jeg', 'admin', '2022-06-08 18:33:28', '2022', '06', '08', '2022-06-08 18:33:38', 'N', '::1', NULL),
	(6, 'n6cje7qu4kiepmpbvlf7vo5loj', 'admin', '2022-06-08 18:35:39', '2022', '06', '08', '2022-06-08 19:40:44', 'N', '::1', NULL),
	(72, '7joa4e25cseud9jgdi07it4887', 'admin', '2022-06-28 11:47:46', '2022', '06', '28', '2022-06-28 12:11:28', 'N', '::1', NULL),
	(73, 'hgutosqqdc3lj76nj5u9c0d567', 'admin', '2022-06-28 12:11:34', '2022', '06', '28', '2022-06-28 12:54:03', 'N', '::1', NULL),
	(74, 'sjsb6geauk857div568it86klm', 'admin', '2022-06-28 12:54:06', '2022', '06', '28', '2022-06-28 15:24:40', 'N', '::1', NULL),
	(75, '033davoo6kce7449uqk0klnt5r', 'manuela', '2022-06-28 15:24:46', '2022', '06', '28', '2022-06-28 15:24:55', 'N', '::1', NULL),
	(76, 'fcnc2c5jfnnomoorojuljmvqnv', 'admin', '2022-06-28 15:24:58', '2022', '06', '28', NULL, 'N', '::1', NULL),
	(77, 'phf9rvj047albnomg6re4p9529', 'admin', '2022-06-29 11:54:57', '2022', '06', '29', NULL, 'N', '::1', NULL),
	(78, '59kas0ns5pac9lmq9fhlsutq0b', 'admin', '2022-06-30 12:00:26', '2022', '06', '30', '2022-06-30 15:06:02', 'N', '::1', NULL),
	(79, 'mnsgn375uo12o74ke0kv3u6kjl', 'admin', '2022-06-30 15:06:13', '2022', '06', '30', NULL, 'N', '::1', NULL),
	(80, 'e2ek7l4poe122jgjt3s5373q8k', 'admin', '2022-07-04 11:56:52', '2022', '07', '04', '2022-07-04 12:19:31', 'N', '::1', NULL),
	(81, 'snei59mis17kaalcgmejhu7g20', 'admin', '2022-07-04 12:19:35', '2022', '07', '04', '2022-07-04 12:19:47', 'N', '::1', NULL),
	(82, 'moolilg7feojip0roak12m097q', 'manuela', '2022-07-04 12:19:52', '2022', '07', '04', '2022-07-04 12:20:35', 'N', '::1', NULL),
	(83, '9jg5ogf2j6ch758cfsnsb3ptmr', 'admin', '2022-07-04 12:20:39', '2022', '07', '04', '2022-07-04 12:21:24', 'N', '::1', NULL),
	(84, 'iu5r1sblkgn095v1n3hsh037um', 'user', '2022-07-04 12:21:28', '2022', '07', '04', '2022-07-04 12:22:07', 'N', '::1', NULL),
	(85, 'lv1f9srgqt8rbib17fl6dfeqmh', 'admin', '2022-07-04 12:22:10', '2022', '07', '04', '2022-07-04 12:22:37', 'N', '::1', NULL),
	(86, 'fgsev76vc1dkhha29h9ej0j0hp', 'user', '2022-07-04 12:22:41', '2022', '07', '04', '2022-07-04 12:23:13', 'N', '::1', NULL),
	(87, '8l8v1u5gpvecl8sg2g58sk3et0', 'admin', '2022-07-04 12:38:32', '2022', '07', '04', '2022-07-04 12:42:31', 'N', '::1', NULL),
	(88, 'c1ei4m5ftr3k8v2hfkl7ecs35i', 'admin', '2022-07-04 13:31:49', '2022', '07', '04', NULL, 'N', '::1', NULL),
	(89, 'avnnhgaoqivuindnd790n81glr', 'admin', '2022-07-05 11:38:54', '2022', '07', '05', NULL, 'N', '::1', NULL);
/*!40000 ALTER TABLE `system_access_log` ENABLE KEYS */;

-- Copiando estrutura para tabela consultorio.system_access_notification_log
CREATE TABLE IF NOT EXISTS `system_access_notification_log` (
  `id` int(11) NOT NULL,
  `login` text,
  `email` text,
  `ip_address` text,
  `login_time` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela consultorio.system_access_notification_log: ~19 rows (aproximadamente)
/*!40000 ALTER TABLE `system_access_notification_log` DISABLE KEYS */;
INSERT INTO `system_access_notification_log` (`id`, `login`, `email`, `ip_address`, `login_time`) VALUES
	(1, 'user', 'user@user.net', '::1', '2022-06-08 16:03:35'),
	(2, 'admin', 'admin@admin.net', '::1', '2022-06-08 16:03:43'),
	(3, 'admin', 'admin@admin.net', '::1', '2022-06-08 16:48:51'),
	(70, 'admin', 'admin@admin.net', '::1', '2022-06-27 12:00:54'),
	(71, 'admin', 'admin@admin.net', '::1', '2022-06-27 13:35:35'),
	(72, 'admin', 'admin@admin.net', '::1', '2022-06-28 11:47:47'),
	(73, 'admin', 'admin@admin.net', '::1', '2022-06-28 12:11:34'),
	(74, 'admin', 'admin@admin.net', '::1', '2022-06-28 12:54:07'),
	(75, 'manuela', 'manuelacamiladaluz@temavonfeccaosjc.com.br', '::1', '2022-06-28 15:24:46'),
	(76, 'admin', 'admin@admin.net', '::1', '2022-06-28 15:24:58'),
	(77, 'admin', 'admin@admin.net', '::1', '2022-06-29 11:54:57'),
	(78, 'admin', 'admin@admin.net', '::1', '2022-06-30 12:00:26'),
	(79, 'admin', 'admin@admin.net', '::1', '2022-06-30 15:06:13'),
	(80, 'admin', 'admin@admin.net', '::1', '2022-07-04 11:56:52'),
	(81, 'admin', 'admin@admin.net', '::1', '2022-07-04 12:19:35'),
	(82, 'manuela', 'manuelacamiladaluz@temavonfeccaosjc.com.br', '::1', '2022-07-04 12:19:52'),
	(83, 'admin', 'admin@admin.net', '::1', '2022-07-04 12:20:39'),
	(84, 'user', 'user@user.net', '::1', '2022-07-04 12:21:28'),
	(85, 'admin', 'admin@admin.net', '::1', '2022-07-04 12:22:11'),
	(86, 'user', 'user@user.net', '::1', '2022-07-04 12:22:41'),
	(87, 'admin', 'admin@admin.net', '::1', '2022-07-04 12:38:32'),
	(88, 'admin', 'admin@admin.net', '::1', '2022-07-04 13:31:49'),
	(89, 'admin', 'admin@admin.net', '::1', '2022-07-05 11:38:54');
/*!40000 ALTER TABLE `system_access_notification_log` ENABLE KEYS */;

-- Copiando estrutura para tabela consultorio.system_change_log
CREATE TABLE IF NOT EXISTS `system_change_log` (
  `id` int(11) NOT NULL,
  `logdate` datetime DEFAULT NULL,
  `login` text,
  `tablename` text,
  `primarykey` text,
  `pkvalue` text,
  `operation` text,
  `columnname` text,
  `oldvalue` text,
  `newvalue` text,
  `access_ip` text,
  `transaction_id` text,
  `log_trace` text,
  `session_id` text,
  `class_name` text,
  `php_sapi` text,
  `log_year` varchar(4) DEFAULT NULL,
  `log_month` varchar(2) DEFAULT NULL,
  `log_day` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela consultorio.system_change_log: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `system_change_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_change_log` ENABLE KEYS */;

-- Copiando estrutura para tabela consultorio.system_document
CREATE TABLE IF NOT EXISTS `system_document` (
  `id` int(11) NOT NULL,
  `system_user_id` int(11) DEFAULT NULL,
  `title` text,
  `description` text,
  `category_id` int(11) DEFAULT NULL,
  `submission_date` date DEFAULT NULL,
  `archive_date` date DEFAULT NULL,
  `filename` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela consultorio.system_document: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `system_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_document` ENABLE KEYS */;

-- Copiando estrutura para tabela consultorio.system_document_category
CREATE TABLE IF NOT EXISTS `system_document_category` (
  `id` int(11) NOT NULL,
  `name` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela consultorio.system_document_category: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `system_document_category` DISABLE KEYS */;
INSERT INTO `system_document_category` (`id`, `name`) VALUES
	(1, 'Documentação');
/*!40000 ALTER TABLE `system_document_category` ENABLE KEYS */;

-- Copiando estrutura para tabela consultorio.system_document_group
CREATE TABLE IF NOT EXISTS `system_document_group` (
  `id` int(11) NOT NULL,
  `document_id` int(11) DEFAULT NULL,
  `system_group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela consultorio.system_document_group: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `system_document_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_document_group` ENABLE KEYS */;

-- Copiando estrutura para tabela consultorio.system_document_user
CREATE TABLE IF NOT EXISTS `system_document_user` (
  `id` int(11) NOT NULL,
  `document_id` int(11) DEFAULT NULL,
  `system_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela consultorio.system_document_user: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `system_document_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_document_user` ENABLE KEYS */;

-- Copiando estrutura para tabela consultorio.system_group
CREATE TABLE IF NOT EXISTS `system_group` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela consultorio.system_group: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `system_group` DISABLE KEYS */;
INSERT INTO `system_group` (`id`, `name`) VALUES
	(1, 'Admin'),
	(2, 'Secretária'),
	(3, 'Paciente');
/*!40000 ALTER TABLE `system_group` ENABLE KEYS */;

-- Copiando estrutura para tabela consultorio.system_group_program
CREATE TABLE IF NOT EXISTS `system_group_program` (
  `id` int(11) NOT NULL,
  `system_group_id` int(11) DEFAULT NULL,
  `system_program_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sys_group_program_program_idx` (`system_program_id`),
  KEY `sys_group_program_group_idx` (`system_group_id`),
  CONSTRAINT `system_group_program_ibfk_1` FOREIGN KEY (`system_group_id`) REFERENCES `system_group` (`id`),
  CONSTRAINT `system_group_program_ibfk_2` FOREIGN KEY (`system_program_id`) REFERENCES `system_program` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela consultorio.system_group_program: ~73 rows (aproximadamente)
/*!40000 ALTER TABLE `system_group_program` DISABLE KEYS */;
INSERT INTO `system_group_program` (`id`, `system_group_id`, `system_program_id`) VALUES
	(1, 1, 1),
	(2, 1, 2),
	(3, 1, 3),
	(4, 1, 4),
	(5, 1, 5),
	(6, 1, 6),
	(7, 1, 8),
	(8, 1, 9),
	(9, 1, 11),
	(10, 1, 14),
	(11, 1, 15),
	(20, 1, 21),
	(25, 1, 26),
	(26, 1, 27),
	(27, 1, 28),
	(28, 1, 29),
	(30, 1, 31),
	(31, 1, 32),
	(32, 1, 33),
	(33, 1, 34),
	(34, 1, 35),
	(36, 1, 36),
	(37, 1, 37),
	(38, 1, 38),
	(39, 1, 39),
	(40, 1, 40),
	(41, 1, 41),
	(42, 1, 42),
	(43, 1, 48),
	(45, 1, 49),
	(47, 1, 50),
	(49, 1, 51),
	(51, 1, 52),
	(53, 1, 53),
	(55, 1, 54),
	(57, 1, 55),
	(59, 1, 56),
	(61, 1, 57),
	(65, 1, 58),
	(68, 1, 59),
	(71, 1, 60),
	(102, 1, 61),
	(103, 1, 62),
	(104, 3, 53),
	(105, 3, 58),
	(106, 2, 10),
	(107, 2, 12),
	(108, 2, 13),
	(109, 2, 16),
	(110, 2, 17),
	(111, 2, 18),
	(112, 2, 19),
	(113, 2, 20),
	(114, 2, 22),
	(115, 2, 23),
	(116, 2, 24),
	(117, 2, 25),
	(118, 2, 30),
	(119, 2, 48),
	(120, 2, 49),
	(121, 2, 50),
	(122, 2, 51),
	(123, 2, 52),
	(124, 2, 53),
	(125, 2, 54),
	(126, 2, 55),
	(127, 2, 56),
	(128, 2, 57),
	(129, 2, 58),
	(130, 2, 59),
	(131, 2, 60),
	(132, 2, 61),
	(133, 2, 62),
	(134, 1, 63),
	(135, 2, 63);
/*!40000 ALTER TABLE `system_group_program` ENABLE KEYS */;

-- Copiando estrutura para tabela consultorio.system_message
CREATE TABLE IF NOT EXISTS `system_message` (
  `id` int(11) NOT NULL,
  `system_user_id` int(11) DEFAULT NULL,
  `system_user_to_id` int(11) DEFAULT NULL,
  `subject` text,
  `message` text,
  `dt_message` text,
  `checked` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela consultorio.system_message: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `system_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_message` ENABLE KEYS */;

-- Copiando estrutura para tabela consultorio.system_notification
CREATE TABLE IF NOT EXISTS `system_notification` (
  `id` int(11) NOT NULL,
  `system_user_id` int(11) DEFAULT NULL,
  `system_user_to_id` int(11) DEFAULT NULL,
  `subject` text,
  `message` text,
  `dt_message` text,
  `action_url` text,
  `action_label` text,
  `icon` text,
  `checked` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela consultorio.system_notification: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `system_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_notification` ENABLE KEYS */;

-- Copiando estrutura para tabela consultorio.system_preference
CREATE TABLE IF NOT EXISTS `system_preference` (
  `id` text,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela consultorio.system_preference: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `system_preference` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_preference` ENABLE KEYS */;

-- Copiando estrutura para tabela consultorio.system_program
CREATE TABLE IF NOT EXISTS `system_program` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `controller` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela consultorio.system_program: ~60 rows (aproximadamente)
/*!40000 ALTER TABLE `system_program` DISABLE KEYS */;
INSERT INTO `system_program` (`id`, `name`, `controller`) VALUES
	(1, 'System Group Form', 'SystemGroupForm'),
	(2, 'System Group List', 'SystemGroupList'),
	(3, 'System Program Form', 'SystemProgramForm'),
	(4, 'System Program List', 'SystemProgramList'),
	(5, 'System User Form', 'SystemUserForm'),
	(6, 'System User List', 'SystemUserList'),
	(7, 'Common Page', 'CommonPage'),
	(8, 'System PHP Info', 'SystemPHPInfoView'),
	(9, 'System ChangeLog View', 'SystemChangeLogView'),
	(10, 'Welcome View', 'WelcomeView'),
	(11, 'System Sql Log', 'SystemSqlLogList'),
	(12, 'System Profile View', 'SystemProfileView'),
	(13, 'System Profile Form', 'SystemProfileForm'),
	(14, 'System SQL Panel', 'SystemSQLPanel'),
	(15, 'System Access Log', 'SystemAccessLogList'),
	(16, 'System Message Form', 'SystemMessageForm'),
	(17, 'System Message List', 'SystemMessageList'),
	(18, 'System Message Form View', 'SystemMessageFormView'),
	(19, 'System Notification List', 'SystemNotificationList'),
	(20, 'System Notification Form View', 'SystemNotificationFormView'),
	(21, 'System Document Category List', 'SystemDocumentCategoryFormList'),
	(22, 'System Document Form', 'SystemDocumentForm'),
	(23, 'System Document Upload Form', 'SystemDocumentUploadForm'),
	(24, 'System Document List', 'SystemDocumentList'),
	(25, 'System Shared Document List', 'SystemSharedDocumentList'),
	(26, 'System Unit Form', 'SystemUnitForm'),
	(27, 'System Unit List', 'SystemUnitList'),
	(28, 'System Access stats', 'SystemAccessLogStats'),
	(29, 'System Preference form', 'SystemPreferenceForm'),
	(30, 'System Support form', 'SystemSupportForm'),
	(31, 'System PHP Error', 'SystemPHPErrorLogView'),
	(32, 'System Database Browser', 'SystemDatabaseExplorer'),
	(33, 'System Table List', 'SystemTableList'),
	(34, 'System Data Browser', 'SystemDataBrowser'),
	(35, 'System Menu Editor', 'SystemMenuEditor'),
	(36, 'System Request Log', 'SystemRequestLogList'),
	(37, 'System Request Log View', 'SystemRequestLogView'),
	(38, 'System Administration Dashboard', 'SystemAdministrationDashboard'),
	(39, 'System Log Dashboard', 'SystemLogDashboard'),
	(40, 'System Session dump', 'SystemSessionDumpView'),
	(41, 'System Information', 'SystemInformationView'),
	(42, 'System files diff', 'SystemFilesDiff'),
	(43, 'System files diff', 'SystemFilesDiff'),
	(44, 'System files diff', 'SystemFilesDiff'),
	(45, 'System Information', 'SystemInformationView'),
	(46, 'System files diff', 'SystemFilesDiff'),
	(47, 'System Information', 'SystemInformationView'),
	(48, 'Paciente List', 'PacienteList'),
	(49, 'Paciente Form', 'PacienteForm'),
	(50, 'MedicoForm', 'MedicoForm'),
	(51, 'Medico List', 'MedicoList'),
	(52, 'Consulta Form', 'ConsultaForm'),
	(53, 'Consulta List', 'ConsultaList'),
	(54, 'Profissao Form', 'ProfissaoForm'),
	(55, 'Profissao List', 'ProfissaoList'),
	(56, 'Payment Form', 'PaymentForm'),
	(57, 'Payment List', 'PaymentList'),
	(58, 'Calendario', 'Calendario'),
	(59, 'Relatorio Form', 'RelatorioForm'),
	(60, 'Relatorio Consulta', 'RelatorioConsulta'),
	(61, 'Calendar Event Form', 'CalendarEventForm'),
	(62, 'Full Calendar Database View', 'FullCalendarDatabaseView'),
	(63, 'Grafico Colunas', 'GraficoColunas');
/*!40000 ALTER TABLE `system_program` ENABLE KEYS */;

-- Copiando estrutura para tabela consultorio.system_request_log
CREATE TABLE IF NOT EXISTS `system_request_log` (
  `id` int(11) NOT NULL,
  `endpoint` text,
  `logdate` text,
  `log_year` varchar(4) DEFAULT NULL,
  `log_month` varchar(2) DEFAULT NULL,
  `log_day` varchar(2) DEFAULT NULL,
  `session_id` text,
  `login` text,
  `access_ip` text,
  `class_name` text,
  `http_host` text,
  `server_port` text,
  `request_uri` text,
  `request_method` text,
  `query_string` text,
  `request_headers` text,
  `request_body` text,
  `request_duration` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela consultorio.system_request_log: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `system_request_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_request_log` ENABLE KEYS */;

-- Copiando estrutura para tabela consultorio.system_sql_log
CREATE TABLE IF NOT EXISTS `system_sql_log` (
  `id` int(11) NOT NULL,
  `logdate` datetime DEFAULT NULL,
  `login` text,
  `database_name` text,
  `sql_command` text,
  `statement_type` text,
  `access_ip` varchar(45) DEFAULT NULL,
  `transaction_id` text,
  `log_trace` text,
  `session_id` text,
  `class_name` text,
  `php_sapi` text,
  `request_id` text,
  `log_year` varchar(4) DEFAULT NULL,
  `log_month` varchar(2) DEFAULT NULL,
  `log_day` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela consultorio.system_sql_log: ~48 rows (aproximadamente)
/*!40000 ALTER TABLE `system_sql_log` DISABLE KEYS */;
INSERT INTO `system_sql_log` (`id`, `logdate`, `login`, `database_name`, `sql_command`, `statement_type`, `access_ip`, `transaction_id`, `log_trace`, `session_id`, `class_name`, `php_sapi`, `request_id`, `log_year`, `log_month`, `log_day`) VALUES
	(1, '2022-06-08 21:44:29', 'admin', 'permission', 'INSERT INTO system_program (id, name, controller) VALUES (48, \'Paciente List\', \'PacienteList\')', 'INSERT', '::1', '62a1426d06152', '#0 C:\\Users\\chrys\\Desktop\\usbwebserver\\root\\adianti-template-7.4.1\\Consultorio\\lib\\adianti\\database\\TTransaction.php(241): SystemSqlLogService->write(\'INSERT INTO sys...\')\n#1 C:\\Users\\chrys\\Desktop\\usbwebserver\\root\\adianti-template-7.4.1\\Consultorio\\lib\\adianti\\database\\TRecord.php(686): Adianti\\Database\\TTransaction::log(\'INSERT INTO sys...\')\n#2 C:\\Users\\chrys\\Desktop\\usbwebserver\\root\\adianti-template-7.4.1\\Consultorio\\app\\control\\admin\\SystemProgramForm.class.php(210): Adianti\\Database\\TRecord->store()\n#3 [internal function]: SystemProgramForm->onSave(Array)\n#4 C:\\Users\\chrys\\Desktop\\usbwebserver\\root\\adianti-template-7.4.1\\Consultorio\\lib\\adianti\\control\\TPage.php(96): call_user_func(Array, Array)\n#5 C:\\Users\\chrys\\Desktop\\usbwebserver\\root\\adianti-template-7.4.1\\Consultorio\\lib\\adianti\\control\\TPage.php(258): Adianti\\Control\\TPage->run()\n#6 C:\\Users\\chrys\\Desktop\\usbwebserver\\root\\adianti-template-7.4.1\\Consultorio\\lib\\adianti\\core\\AdiantiCoreApplication.php(96): Adianti\\Control\\TPage->show(Array)\n#7 C:\\Users\\chrys\\Desktop\\usbwebserver\\root\\adianti-template-7.4.1\\Consultorio\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#8 C:\\Users\\chrys\\Desktop\\usbwebserver\\root\\adianti-template-7.4.1\\Consultorio\\engine.php(66): TApplication::run()\n#9 {main}', '9i8s1qh6va1ct881akbsnqo2om', 'SystemProgramForm', 'apache2handler', '62a1426ce92c5', '2022', '06', '08'),
	(2, '2022-06-08 21:44:29', 'admin', 'permission', 'DELETE FROM system_group_program WHERE (system_program_id = 48)', 'DELETE', '::1', '62a1426d06152', '#0 C:\\Users\\chrys\\Desktop\\usbwebserver\\root\\adianti-template-7.4.1\\Consultorio\\lib\\adianti\\database\\TTransaction.php(241): SystemSqlLogService->write(\'DELETE FROM sys...\')\n#1 C:\\Users\\chrys\\Desktop\\usbwebserver\\root\\adianti-template-7.4.1\\Consultorio\\lib\\adianti\\database\\TRepository.php(562): Adianti\\Database\\TTransaction::log(\'DELETE FROM sys...\')\n#2 C:\\Users\\chrys\\Desktop\\usbwebserver\\root\\adianti-template-7.4.1\\Consultorio\\app\\model\\admin\\SystemProgram.class.php(82): Adianti\\Database\\TRepository->delete()\n#3 C:\\Users\\chrys\\Desktop\\usbwebserver\\root\\adianti-template-7.4.1\\Consultorio\\app\\control\\admin\\SystemProgramForm.class.php(214): SystemProgram->clearParts()\n#4 [internal function]: SystemProgramForm->onSave(Array)\n#5 C:\\Users\\chrys\\Desktop\\usbwebserver\\root\\adianti-template-7.4.1\\Consultorio\\lib\\adianti\\control\\TPage.php(96): call_user_func(Array, Array)\n#6 C:\\Users\\chrys\\Desktop\\usbwebserver\\root\\adianti-template-7.4.1\\Consultorio\\lib\\adianti\\control\\TPage.php(258): Adianti\\Control\\TPage->run()\n#7 C:\\Users\\chrys\\Desktop\\usbwebserver\\root\\adianti-template-7.4.1\\Consultorio\\lib\\adianti\\core\\AdiantiCoreApplication.php(96): Adianti\\Control\\TPage->show(Array)\n#8 C:\\Users\\chrys\\Desktop\\usbwebserver\\root\\adianti-template-7.4.1\\Consultorio\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#9 C:\\Users\\chrys\\Desktop\\usbwebserver\\root\\adianti-template-7.4.1\\Consultorio\\engine.php(66): TApplication::run()\n#10 {main}', '9i8s1qh6va1ct881akbsnqo2om', 'SystemProgramForm', 'apache2handler', '62a1426ce92c5', '2022', '06', '08'),
	(3, '2022-06-08 21:44:29', 'admin', 'permission', 'INSERT INTO system_group_program (system_program_id, system_group_id, id) VALUES (48, 1, 43)', 'INSERT', '::1', '62a1426d06152', '#0 C:\\Users\\chrys\\Desktop\\usbwebserver\\root\\adianti-template-7.4.1\\Consultorio\\lib\\adianti\\database\\TTransaction.php(241): SystemSqlLogService->write(\'INSERT INTO sys...\')\n#1 C:\\Users\\chrys\\Desktop\\usbwebserver\\root\\adianti-template-7.4.1\\Consultorio\\lib\\adianti\\database\\TRecord.php(686): Adianti\\Database\\TTransaction::log(\'INSERT INTO sys...\')\n#2 C:\\Users\\chrys\\Desktop\\usbwebserver\\root\\adianti-template-7.4.1\\Consultorio\\app\\model\\admin\\SystemProgram.class.php(51): Adianti\\Database\\TRecord->store()\n#3 C:\\Users\\chrys\\Desktop\\usbwebserver\\root\\adianti-template-7.4.1\\Consultorio\\app\\control\\admin\\SystemProgramForm.class.php(220): SystemProgram->addSystemGroup(Object(SystemGroup))\n#4 [internal function]: SystemProgramForm->onSave(Array)\n#5 C:\\Users\\chrys\\Desktop\\usbwebserver\\root\\adianti-template-7.4.1\\Consultorio\\lib\\adianti\\control\\TPage.php(96): call_user_func(Array, Array)\n#6 C:\\Users\\chrys\\Desktop\\usbwebserver\\root\\adianti-template-7.4.1\\Consultorio\\lib\\adianti\\control\\TPage.php(258): Adianti\\Control\\TPage->run()\n#7 C:\\Users\\chrys\\Desktop\\usbwebserver\\root\\adianti-template-7.4.1\\Consultorio\\lib\\adianti\\core\\AdiantiCoreApplication.php(96): Adianti\\Control\\TPage->show(Array)\n#8 C:\\Users\\chrys\\Desktop\\usbwebserver\\root\\adianti-template-7.4.1\\Consultorio\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#9 C:\\Users\\chrys\\Desktop\\usbwebserver\\root\\adianti-template-7.4.1\\Consultorio\\engine.php(66): TApplication::run()\n#10 {main}', '9i8s1qh6va1ct881akbsnqo2om', 'SystemProgramForm', 'apache2handler', '62a1426ce92c5', '2022', '06', '08'),
	(441, '2022-06-29 15:24:17', 'admin', 'permission', 'UPDATE consulta SET titulo = \'Exame\', paciente_id = \'12\', medico_id = \'3\', area_do_medico_nome = \'3\', dtinicio = \'2022-06-21 14:50\', dtfim = \'2022-06-21 15:20\' WHERE (id = \'12\')', 'UPDATE', '::1', '62bc98d1771da', '#0 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TTransaction.php(241): SystemSqlLogService->write(\'UPDATE consulta...\')\n#1 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TRecord.php(686): Adianti\\Database\\TTransaction::log(\'UPDATE consulta...\')\n#2 C:\\laragon\\www\\Consultorio\\lib\\adianti\\base\\AdiantiStandardFormTrait.php(72): Adianti\\Database\\TRecord->store()\n#3 [internal function]: Adianti\\Base\\TStandardForm->onSave(Array)\n#4 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(96): call_user_func(Array, Array)\n#5 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(258): Adianti\\Control\\TPage->run()\n#6 C:\\laragon\\www\\Consultorio\\lib\\adianti\\core\\AdiantiCoreApplication.php(96): Adianti\\Control\\TPage->show(Array)\n#7 C:\\laragon\\www\\Consultorio\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#8 C:\\laragon\\www\\Consultorio\\engine.php(66): TApplication::run()\n#9 {main}', 'phf9rvj047albnomg6re4p9529', 'ConsultaForm', 'apache2handler', '62bc98d15c103', '2022', '06', '29'),
	(442, '2022-06-29 15:24:26', 'admin', 'permission', 'UPDATE consulta SET titulo = \'Consulta - Primeira Vez com o Médico(a)\', paciente_id = \'13\', medico_id = \'4\', area_do_medico_nome = \'4\', dtinicio = \'2022-06-20 14:50\', dtfim = \'2022-06-20 15:20\' WHERE (id = \'13\')', 'UPDATE', '::1', '62bc98da42b4b', '#0 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TTransaction.php(241): SystemSqlLogService->write(\'UPDATE consulta...\')\n#1 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TRecord.php(686): Adianti\\Database\\TTransaction::log(\'UPDATE consulta...\')\n#2 C:\\laragon\\www\\Consultorio\\lib\\adianti\\base\\AdiantiStandardFormTrait.php(72): Adianti\\Database\\TRecord->store()\n#3 [internal function]: Adianti\\Base\\TStandardForm->onSave(Array)\n#4 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(96): call_user_func(Array, Array)\n#5 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(258): Adianti\\Control\\TPage->run()\n#6 C:\\laragon\\www\\Consultorio\\lib\\adianti\\core\\AdiantiCoreApplication.php(96): Adianti\\Control\\TPage->show(Array)\n#7 C:\\laragon\\www\\Consultorio\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#8 C:\\laragon\\www\\Consultorio\\engine.php(66): TApplication::run()\n#9 {main}', 'phf9rvj047albnomg6re4p9529', 'ConsultaForm', 'apache2handler', '62bc98da226f4', '2022', '06', '29'),
	(443, '2022-06-29 15:24:35', 'admin', 'permission', 'UPDATE consulta SET titulo = \'Consulta - Primeira Vez com o Médico(a)\', paciente_id = \'14\', medico_id = \'5\', area_do_medico_nome = \'5\', dtinicio = \'2022-06-29 17:00\', dtfim = \'2022-06-29 14:30\' WHERE (id = \'14\')', 'UPDATE', '::1', '62bc98e3a8479', '#0 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TTransaction.php(241): SystemSqlLogService->write(\'UPDATE consulta...\')\n#1 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TRecord.php(686): Adianti\\Database\\TTransaction::log(\'UPDATE consulta...\')\n#2 C:\\laragon\\www\\Consultorio\\lib\\adianti\\base\\AdiantiStandardFormTrait.php(72): Adianti\\Database\\TRecord->store()\n#3 [internal function]: Adianti\\Base\\TStandardForm->onSave(Array)\n#4 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(96): call_user_func(Array, Array)\n#5 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(258): Adianti\\Control\\TPage->run()\n#6 C:\\laragon\\www\\Consultorio\\lib\\adianti\\core\\AdiantiCoreApplication.php(96): Adianti\\Control\\TPage->show(Array)\n#7 C:\\laragon\\www\\Consultorio\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#8 C:\\laragon\\www\\Consultorio\\engine.php(66): TApplication::run()\n#9 {main}', 'phf9rvj047albnomg6re4p9529', 'ConsultaForm', 'apache2handler', '62bc98e39181a', '2022', '06', '29'),
	(444, '2022-06-29 15:24:43', 'admin', 'permission', 'UPDATE consulta SET titulo = \'Exame\', paciente_id = \'15\', medico_id = \'6\', area_do_medico_nome = \'6\', dtinicio = \'2022-06-27 12:50\', dtfim = \'2022-06-27 13:20\' WHERE (id = \'15\')', 'UPDATE', '::1', '62bc98ebc5232', '#0 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TTransaction.php(241): SystemSqlLogService->write(\'UPDATE consulta...\')\n#1 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TRecord.php(686): Adianti\\Database\\TTransaction::log(\'UPDATE consulta...\')\n#2 C:\\laragon\\www\\Consultorio\\lib\\adianti\\base\\AdiantiStandardFormTrait.php(72): Adianti\\Database\\TRecord->store()\n#3 [internal function]: Adianti\\Base\\TStandardForm->onSave(Array)\n#4 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(96): call_user_func(Array, Array)\n#5 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(258): Adianti\\Control\\TPage->run()\n#6 C:\\laragon\\www\\Consultorio\\lib\\adianti\\core\\AdiantiCoreApplication.php(96): Adianti\\Control\\TPage->show(Array)\n#7 C:\\laragon\\www\\Consultorio\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#8 C:\\laragon\\www\\Consultorio\\engine.php(66): TApplication::run()\n#9 {main}', 'phf9rvj047albnomg6re4p9529', 'ConsultaForm', 'apache2handler', '62bc98eba4b47', '2022', '06', '29'),
	(445, '2022-06-29 16:22:59', 'admin', 'permission', 'UPDATE consulta SET titulo = \'Consulta - Primeira Vez\', paciente_id = \'1\', medico_id = \'2\', area_do_medico_nome = \'2\', dtinicio = \'2022-06-09 17:15\', dtfim = \'2022-06-09 17:30\' WHERE (id = \'1\')', 'UPDATE', '::1', '62bca693a52ea', '#0 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TTransaction.php(241): SystemSqlLogService->write(\'UPDATE consulta...\')\n#1 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TRecord.php(686): Adianti\\Database\\TTransaction::log(\'UPDATE consulta...\')\n#2 C:\\laragon\\www\\Consultorio\\lib\\adianti\\base\\AdiantiStandardFormTrait.php(72): Adianti\\Database\\TRecord->store()\n#3 [internal function]: Adianti\\Base\\TStandardForm->onSave(Array)\n#4 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(96): call_user_func(Array, Array)\n#5 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(258): Adianti\\Control\\TPage->run()\n#6 C:\\laragon\\www\\Consultorio\\lib\\adianti\\core\\AdiantiCoreApplication.php(96): Adianti\\Control\\TPage->show(Array)\n#7 C:\\laragon\\www\\Consultorio\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#8 C:\\laragon\\www\\Consultorio\\engine.php(66): TApplication::run()\n#9 {main}', 'phf9rvj047albnomg6re4p9529', 'ConsultaForm', 'apache2handler', '62bca69384769', '2022', '06', '29'),
	(446, '2022-06-30 13:16:24', 'admin', 'permission', 'INSERT INTO consulta (titulo, paciente_id, medico_id, area_do_medico_nome, dtinicio, dtfim) VALUES (\'Consulta - Primeira Vez\', \'16\', \'5\', \'5\', \'2022-06-30 13:15\', \'2022-06-30 13:25\')', 'INSERT', '::1', '62bdcc58a0e8a', '#0 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TTransaction.php(241): SystemSqlLogService->write(\'INSERT INTO con...\')\n#1 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TRecord.php(686): Adianti\\Database\\TTransaction::log(\'INSERT INTO con...\')\n#2 C:\\laragon\\www\\Consultorio\\lib\\adianti\\base\\AdiantiStandardFormTrait.php(72): Adianti\\Database\\TRecord->store()\n#3 [internal function]: Adianti\\Base\\TStandardForm->onSave(Array)\n#4 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(96): call_user_func(Array, Array)\n#5 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(258): Adianti\\Control\\TPage->run()\n#6 C:\\laragon\\www\\Consultorio\\lib\\adianti\\core\\AdiantiCoreApplication.php(96): Adianti\\Control\\TPage->show(Array)\n#7 C:\\laragon\\www\\Consultorio\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#8 C:\\laragon\\www\\Consultorio\\engine.php(66): TApplication::run()\n#9 {main}', '59kas0ns5pac9lmq9fhlsutq0b', 'ConsultaForm', 'apache2handler', '62bdcc58772e3', '2022', '06', '30'),
	(447, '2022-06-30 15:07:20', 'admin', 'permission', 'INSERT INTO nota_fiscal (id_paciente, id_area_do_medico, payment, dtinicio) VALUES (\'11\', \'2\', \'333,33\', \'2022-06-30 15:07\')', 'INSERT', '::1', '62bde6582574a', '#0 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TTransaction.php(241): SystemSqlLogService->write(\'INSERT INTO not...\')\n#1 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TRecord.php(686): Adianti\\Database\\TTransaction::log(\'INSERT INTO not...\')\n#2 C:\\laragon\\www\\Consultorio\\lib\\adianti\\base\\AdiantiStandardFormTrait.php(72): Adianti\\Database\\TRecord->store()\n#3 [internal function]: Adianti\\Base\\TStandardForm->onSave(Array)\n#4 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(96): call_user_func(Array, Array)\n#5 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(258): Adianti\\Control\\TPage->run()\n#6 C:\\laragon\\www\\Consultorio\\lib\\adianti\\core\\AdiantiCoreApplication.php(96): Adianti\\Control\\TPage->show(Array)\n#7 C:\\laragon\\www\\Consultorio\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#8 C:\\laragon\\www\\Consultorio\\engine.php(66): TApplication::run()\n#9 {main}', 'mnsgn375uo12o74ke0kv3u6kjl', 'PaymentForm', 'apache2handler', '62bde658064bf', '2022', '06', '30'),
	(448, '2022-07-04 12:21:11', 'admin', 'permission', 'UPDATE system_group SET name = \'Paciente\' WHERE (id = \'3\')', 'UPDATE', '::1', '62c305671f03a', '#0 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TTransaction.php(241): SystemSqlLogService->write(\'UPDATE system_g...\')\n#1 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TRecord.php(686): Adianti\\Database\\TTransaction::log(\'UPDATE system_g...\')\n#2 C:\\laragon\\www\\Consultorio\\app\\control\\admin\\SystemGroupForm.class.php(131): Adianti\\Database\\TRecord->store()\n#3 [internal function]: SystemGroupForm->onSave(Array)\n#4 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(96): call_user_func(Array, Array)\n#5 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(258): Adianti\\Control\\TPage->run()\n#6 C:\\laragon\\www\\Consultorio\\lib\\adianti\\core\\AdiantiCoreApplication.php(96): Adianti\\Control\\TPage->show(Array)\n#7 C:\\laragon\\www\\Consultorio\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#8 C:\\laragon\\www\\Consultorio\\engine.php(66): TApplication::run()\n#9 {main}', '9jg5ogf2j6ch758cfsnsb3ptmr', 'SystemGroupForm', 'apache2handler', '62c30566eff38', '2022', '07', '04'),
	(449, '2022-07-04 12:21:11', 'admin', 'permission', 'DELETE FROM system_group_program WHERE (system_group_id = \'3\')', 'DELETE', '::1', '62c305671f03a', '#0 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TTransaction.php(241): SystemSqlLogService->write(\'DELETE FROM sys...\')\n#1 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TRepository.php(562): Adianti\\Database\\TTransaction::log(\'DELETE FROM sys...\')\n#2 C:\\laragon\\www\\Consultorio\\app\\model\\admin\\SystemGroup.class.php(140): Adianti\\Database\\TRepository->delete()\n#3 C:\\laragon\\www\\Consultorio\\app\\control\\admin\\SystemGroupForm.class.php(132): SystemGroup->clearParts()\n#4 [internal function]: SystemGroupForm->onSave(Array)\n#5 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(96): call_user_func(Array, Array)\n#6 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(258): Adianti\\Control\\TPage->run()\n#7 C:\\laragon\\www\\Consultorio\\lib\\adianti\\core\\AdiantiCoreApplication.php(96): Adianti\\Control\\TPage->show(Array)\n#8 C:\\laragon\\www\\Consultorio\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#9 C:\\laragon\\www\\Consultorio\\engine.php(66): TApplication::run()\n#10 {main}', '9jg5ogf2j6ch758cfsnsb3ptmr', 'SystemGroupForm', 'apache2handler', '62c30566eff38', '2022', '07', '04'),
	(450, '2022-07-04 12:21:11', 'admin', 'permission', 'DELETE FROM system_user_group WHERE (system_group_id = \'3\')', 'DELETE', '::1', '62c305671f03a', '#0 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TTransaction.php(241): SystemSqlLogService->write(\'DELETE FROM sys...\')\n#1 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TRepository.php(562): Adianti\\Database\\TTransaction::log(\'DELETE FROM sys...\')\n#2 C:\\laragon\\www\\Consultorio\\app\\model\\admin\\SystemGroup.class.php(141): Adianti\\Database\\TRepository->delete()\n#3 C:\\laragon\\www\\Consultorio\\app\\control\\admin\\SystemGroupForm.class.php(132): SystemGroup->clearParts()\n#4 [internal function]: SystemGroupForm->onSave(Array)\n#5 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(96): call_user_func(Array, Array)\n#6 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(258): Adianti\\Control\\TPage->run()\n#7 C:\\laragon\\www\\Consultorio\\lib\\adianti\\core\\AdiantiCoreApplication.php(96): Adianti\\Control\\TPage->show(Array)\n#8 C:\\laragon\\www\\Consultorio\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#9 C:\\laragon\\www\\Consultorio\\engine.php(66): TApplication::run()\n#10 {main}', '9jg5ogf2j6ch758cfsnsb3ptmr', 'SystemGroupForm', 'apache2handler', '62c30566eff38', '2022', '07', '04'),
	(451, '2022-07-04 12:21:11', 'admin', 'permission', 'INSERT INTO system_group_program (system_program_id, system_group_id, id) VALUES (\'53\', \'3\', 104)', 'INSERT', '::1', '62c305671f03a', '#0 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TTransaction.php(241): SystemSqlLogService->write(\'INSERT INTO sys...\')\n#1 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TRecord.php(686): Adianti\\Database\\TTransaction::log(\'INSERT INTO sys...\')\n#2 C:\\laragon\\www\\Consultorio\\app\\model\\admin\\SystemGroup.class.php(67): Adianti\\Database\\TRecord->store()\n#3 C:\\laragon\\www\\Consultorio\\app\\control\\admin\\SystemGroupForm.class.php(138): SystemGroup->addSystemProgram(Object(SystemProgram))\n#4 [internal function]: SystemGroupForm->onSave(Array)\n#5 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(96): call_user_func(Array, Array)\n#6 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(258): Adianti\\Control\\TPage->run()\n#7 C:\\laragon\\www\\Consultorio\\lib\\adianti\\core\\AdiantiCoreApplication.php(96): Adianti\\Control\\TPage->show(Array)\n#8 C:\\laragon\\www\\Consultorio\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#9 C:\\laragon\\www\\Consultorio\\engine.php(66): TApplication::run()\n#10 {main}', '9jg5ogf2j6ch758cfsnsb3ptmr', 'SystemGroupForm', 'apache2handler', '62c30566eff38', '2022', '07', '04'),
	(452, '2022-07-04 12:21:11', 'admin', 'permission', 'INSERT INTO system_group_program (system_program_id, system_group_id, id) VALUES (\'58\', \'3\', 105)', 'INSERT', '::1', '62c305671f03a', '#0 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TTransaction.php(241): SystemSqlLogService->write(\'INSERT INTO sys...\')\n#1 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TRecord.php(686): Adianti\\Database\\TTransaction::log(\'INSERT INTO sys...\')\n#2 C:\\laragon\\www\\Consultorio\\app\\model\\admin\\SystemGroup.class.php(67): Adianti\\Database\\TRecord->store()\n#3 C:\\laragon\\www\\Consultorio\\app\\control\\admin\\SystemGroupForm.class.php(138): SystemGroup->addSystemProgram(Object(SystemProgram))\n#4 [internal function]: SystemGroupForm->onSave(Array)\n#5 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(96): call_user_func(Array, Array)\n#6 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(258): Adianti\\Control\\TPage->run()\n#7 C:\\laragon\\www\\Consultorio\\lib\\adianti\\core\\AdiantiCoreApplication.php(96): Adianti\\Control\\TPage->show(Array)\n#8 C:\\laragon\\www\\Consultorio\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#9 C:\\laragon\\www\\Consultorio\\engine.php(66): TApplication::run()\n#10 {main}', '9jg5ogf2j6ch758cfsnsb3ptmr', 'SystemGroupForm', 'apache2handler', '62c30566eff38', '2022', '07', '04'),
	(453, '2022-07-04 12:21:11', 'admin', 'permission', 'INSERT INTO system_user_group (system_user_id, system_group_id, id) VALUES (\'3\', \'3\', 11)', 'INSERT', '::1', '62c305671f03a', '#0 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TTransaction.php(241): SystemSqlLogService->write(\'INSERT INTO sys...\')\n#1 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TRecord.php(686): Adianti\\Database\\TTransaction::log(\'INSERT INTO sys...\')\n#2 C:\\laragon\\www\\Consultorio\\app\\model\\admin\\SystemGroup.class.php(82): Adianti\\Database\\TRecord->store()\n#3 C:\\laragon\\www\\Consultorio\\app\\control\\admin\\SystemGroupForm.class.php(146): SystemGroup->addSystemUser(Object(SystemUser))\n#4 [internal function]: SystemGroupForm->onSave(Array)\n#5 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(96): call_user_func(Array, Array)\n#6 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(258): Adianti\\Control\\TPage->run()\n#7 C:\\laragon\\www\\Consultorio\\lib\\adianti\\core\\AdiantiCoreApplication.php(96): Adianti\\Control\\TPage->show(Array)\n#8 C:\\laragon\\www\\Consultorio\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#9 C:\\laragon\\www\\Consultorio\\engine.php(66): TApplication::run()\n#10 {main}', '9jg5ogf2j6ch758cfsnsb3ptmr', 'SystemGroupForm', 'apache2handler', '62c30566eff38', '2022', '07', '04'),
	(454, '2022-07-04 12:22:33', 'admin', 'permission', 'UPDATE system_group SET name = \'Secretária\' WHERE (id = \'2\')', 'UPDATE', '::1', '62c305b9994e7', '#0 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TTransaction.php(241): SystemSqlLogService->write(\'UPDATE system_g...\')\n#1 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TRecord.php(686): Adianti\\Database\\TTransaction::log(\'UPDATE system_g...\')\n#2 C:\\laragon\\www\\Consultorio\\app\\control\\admin\\SystemGroupForm.class.php(131): Adianti\\Database\\TRecord->store()\n#3 [internal function]: SystemGroupForm->onSave(Array)\n#4 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(96): call_user_func(Array, Array)\n#5 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(258): Adianti\\Control\\TPage->run()\n#6 C:\\laragon\\www\\Consultorio\\lib\\adianti\\core\\AdiantiCoreApplication.php(96): Adianti\\Control\\TPage->show(Array)\n#7 C:\\laragon\\www\\Consultorio\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#8 C:\\laragon\\www\\Consultorio\\engine.php(66): TApplication::run()\n#9 {main}', 'lv1f9srgqt8rbib17fl6dfeqmh', 'SystemGroupForm', 'apache2handler', '62c305b976a67', '2022', '07', '04'),
	(455, '2022-07-04 12:22:33', 'admin', 'permission', 'DELETE FROM system_group_program WHERE (system_group_id = \'2\')', 'DELETE', '::1', '62c305b9994e7', '#0 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TTransaction.php(241): SystemSqlLogService->write(\'DELETE FROM sys...\')\n#1 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TRepository.php(562): Adianti\\Database\\TTransaction::log(\'DELETE FROM sys...\')\n#2 C:\\laragon\\www\\Consultorio\\app\\model\\admin\\SystemGroup.class.php(140): Adianti\\Database\\TRepository->delete()\n#3 C:\\laragon\\www\\Consultorio\\app\\control\\admin\\SystemGroupForm.class.php(132): SystemGroup->clearParts()\n#4 [internal function]: SystemGroupForm->onSave(Array)\n#5 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(96): call_user_func(Array, Array)\n#6 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(258): Adianti\\Control\\TPage->run()\n#7 C:\\laragon\\www\\Consultorio\\lib\\adianti\\core\\AdiantiCoreApplication.php(96): Adianti\\Control\\TPage->show(Array)\n#8 C:\\laragon\\www\\Consultorio\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#9 C:\\laragon\\www\\Consultorio\\engine.php(66): TApplication::run()\n#10 {main}', 'lv1f9srgqt8rbib17fl6dfeqmh', 'SystemGroupForm', 'apache2handler', '62c305b976a67', '2022', '07', '04'),
	(456, '2022-07-04 12:22:33', 'admin', 'permission', 'DELETE FROM system_user_group WHERE (system_group_id = \'2\')', 'DELETE', '::1', '62c305b9994e7', '#0 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TTransaction.php(241): SystemSqlLogService->write(\'DELETE FROM sys...\')\n#1 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TRepository.php(562): Adianti\\Database\\TTransaction::log(\'DELETE FROM sys...\')\n#2 C:\\laragon\\www\\Consultorio\\app\\model\\admin\\SystemGroup.class.php(141): Adianti\\Database\\TRepository->delete()\n#3 C:\\laragon\\www\\Consultorio\\app\\control\\admin\\SystemGroupForm.class.php(132): SystemGroup->clearParts()\n#4 [internal function]: SystemGroupForm->onSave(Array)\n#5 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(96): call_user_func(Array, Array)\n#6 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(258): Adianti\\Control\\TPage->run()\n#7 C:\\laragon\\www\\Consultorio\\lib\\adianti\\core\\AdiantiCoreApplication.php(96): Adianti\\Control\\TPage->show(Array)\n#8 C:\\laragon\\www\\Consultorio\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#9 C:\\laragon\\www\\Consultorio\\engine.php(66): TApplication::run()\n#10 {main}', 'lv1f9srgqt8rbib17fl6dfeqmh', 'SystemGroupForm', 'apache2handler', '62c305b976a67', '2022', '07', '04'),
	(457, '2022-07-04 12:22:33', 'admin', 'permission', 'INSERT INTO system_group_program (system_program_id, system_group_id, id) VALUES (\'10\', \'2\', 106)', 'INSERT', '::1', '62c305b9994e7', '#0 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TTransaction.php(241): SystemSqlLogService->write(\'INSERT INTO sys...\')\n#1 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TRecord.php(686): Adianti\\Database\\TTransaction::log(\'INSERT INTO sys...\')\n#2 C:\\laragon\\www\\Consultorio\\app\\model\\admin\\SystemGroup.class.php(67): Adianti\\Database\\TRecord->store()\n#3 C:\\laragon\\www\\Consultorio\\app\\control\\admin\\SystemGroupForm.class.php(138): SystemGroup->addSystemProgram(Object(SystemProgram))\n#4 [internal function]: SystemGroupForm->onSave(Array)\n#5 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(96): call_user_func(Array, Array)\n#6 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(258): Adianti\\Control\\TPage->run()\n#7 C:\\laragon\\www\\Consultorio\\lib\\adianti\\core\\AdiantiCoreApplication.php(96): Adianti\\Control\\TPage->show(Array)\n#8 C:\\laragon\\www\\Consultorio\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#9 C:\\laragon\\www\\Consultorio\\engine.php(66): TApplication::run()\n#10 {main}', 'lv1f9srgqt8rbib17fl6dfeqmh', 'SystemGroupForm', 'apache2handler', '62c305b976a67', '2022', '07', '04'),
	(458, '2022-07-04 12:22:33', 'admin', 'permission', 'INSERT INTO system_group_program (system_program_id, system_group_id, id) VALUES (\'12\', \'2\', 107)', 'INSERT', '::1', '62c305b9994e7', '#0 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TTransaction.php(241): SystemSqlLogService->write(\'INSERT INTO sys...\')\n#1 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TRecord.php(686): Adianti\\Database\\TTransaction::log(\'INSERT INTO sys...\')\n#2 C:\\laragon\\www\\Consultorio\\app\\model\\admin\\SystemGroup.class.php(67): Adianti\\Database\\TRecord->store()\n#3 C:\\laragon\\www\\Consultorio\\app\\control\\admin\\SystemGroupForm.class.php(138): SystemGroup->addSystemProgram(Object(SystemProgram))\n#4 [internal function]: SystemGroupForm->onSave(Array)\n#5 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(96): call_user_func(Array, Array)\n#6 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(258): Adianti\\Control\\TPage->run()\n#7 C:\\laragon\\www\\Consultorio\\lib\\adianti\\core\\AdiantiCoreApplication.php(96): Adianti\\Control\\TPage->show(Array)\n#8 C:\\laragon\\www\\Consultorio\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#9 C:\\laragon\\www\\Consultorio\\engine.php(66): TApplication::run()\n#10 {main}', 'lv1f9srgqt8rbib17fl6dfeqmh', 'SystemGroupForm', 'apache2handler', '62c305b976a67', '2022', '07', '04'),
	(459, '2022-07-04 12:22:33', 'admin', 'permission', 'INSERT INTO system_group_program (system_program_id, system_group_id, id) VALUES (\'13\', \'2\', 108)', 'INSERT', '::1', '62c305b9994e7', '#0 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TTransaction.php(241): SystemSqlLogService->write(\'INSERT INTO sys...\')\n#1 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TRecord.php(686): Adianti\\Database\\TTransaction::log(\'INSERT INTO sys...\')\n#2 C:\\laragon\\www\\Consultorio\\app\\model\\admin\\SystemGroup.class.php(67): Adianti\\Database\\TRecord->store()\n#3 C:\\laragon\\www\\Consultorio\\app\\control\\admin\\SystemGroupForm.class.php(138): SystemGroup->addSystemProgram(Object(SystemProgram))\n#4 [internal function]: SystemGroupForm->onSave(Array)\n#5 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(96): call_user_func(Array, Array)\n#6 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(258): Adianti\\Control\\TPage->run()\n#7 C:\\laragon\\www\\Consultorio\\lib\\adianti\\core\\AdiantiCoreApplication.php(96): Adianti\\Control\\TPage->show(Array)\n#8 C:\\laragon\\www\\Consultorio\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#9 C:\\laragon\\www\\Consultorio\\engine.php(66): TApplication::run()\n#10 {main}', 'lv1f9srgqt8rbib17fl6dfeqmh', 'SystemGroupForm', 'apache2handler', '62c305b976a67', '2022', '07', '04'),
	(460, '2022-07-04 12:22:33', 'admin', 'permission', 'INSERT INTO system_group_program (system_program_id, system_group_id, id) VALUES (\'16\', \'2\', 109)', 'INSERT', '::1', '62c305b9994e7', '#0 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TTransaction.php(241): SystemSqlLogService->write(\'INSERT INTO sys...\')\n#1 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TRecord.php(686): Adianti\\Database\\TTransaction::log(\'INSERT INTO sys...\')\n#2 C:\\laragon\\www\\Consultorio\\app\\model\\admin\\SystemGroup.class.php(67): Adianti\\Database\\TRecord->store()\n#3 C:\\laragon\\www\\Consultorio\\app\\control\\admin\\SystemGroupForm.class.php(138): SystemGroup->addSystemProgram(Object(SystemProgram))\n#4 [internal function]: SystemGroupForm->onSave(Array)\n#5 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(96): call_user_func(Array, Array)\n#6 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(258): Adianti\\Control\\TPage->run()\n#7 C:\\laragon\\www\\Consultorio\\lib\\adianti\\core\\AdiantiCoreApplication.php(96): Adianti\\Control\\TPage->show(Array)\n#8 C:\\laragon\\www\\Consultorio\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#9 C:\\laragon\\www\\Consultorio\\engine.php(66): TApplication::run()\n#10 {main}', 'lv1f9srgqt8rbib17fl6dfeqmh', 'SystemGroupForm', 'apache2handler', '62c305b976a67', '2022', '07', '04'),
	(461, '2022-07-04 12:22:34', 'admin', 'permission', 'INSERT INTO system_group_program (system_program_id, system_group_id, id) VALUES (\'17\', \'2\', 110)', 'INSERT', '::1', '62c305b9994e7', '#0 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TTransaction.php(241): SystemSqlLogService->write(\'INSERT INTO sys...\')\n#1 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TRecord.php(686): Adianti\\Database\\TTransaction::log(\'INSERT INTO sys...\')\n#2 C:\\laragon\\www\\Consultorio\\app\\model\\admin\\SystemGroup.class.php(67): Adianti\\Database\\TRecord->store()\n#3 C:\\laragon\\www\\Consultorio\\app\\control\\admin\\SystemGroupForm.class.php(138): SystemGroup->addSystemProgram(Object(SystemProgram))\n#4 [internal function]: SystemGroupForm->onSave(Array)\n#5 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(96): call_user_func(Array, Array)\n#6 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(258): Adianti\\Control\\TPage->run()\n#7 C:\\laragon\\www\\Consultorio\\lib\\adianti\\core\\AdiantiCoreApplication.php(96): Adianti\\Control\\TPage->show(Array)\n#8 C:\\laragon\\www\\Consultorio\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#9 C:\\laragon\\www\\Consultorio\\engine.php(66): TApplication::run()\n#10 {main}', 'lv1f9srgqt8rbib17fl6dfeqmh', 'SystemGroupForm', 'apache2handler', '62c305b976a67', '2022', '07', '04'),
	(462, '2022-07-04 12:22:34', 'admin', 'permission', 'INSERT INTO system_group_program (system_program_id, system_group_id, id) VALUES (\'18\', \'2\', 111)', 'INSERT', '::1', '62c305b9994e7', '#0 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TTransaction.php(241): SystemSqlLogService->write(\'INSERT INTO sys...\')\n#1 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TRecord.php(686): Adianti\\Database\\TTransaction::log(\'INSERT INTO sys...\')\n#2 C:\\laragon\\www\\Consultorio\\app\\model\\admin\\SystemGroup.class.php(67): Adianti\\Database\\TRecord->store()\n#3 C:\\laragon\\www\\Consultorio\\app\\control\\admin\\SystemGroupForm.class.php(138): SystemGroup->addSystemProgram(Object(SystemProgram))\n#4 [internal function]: SystemGroupForm->onSave(Array)\n#5 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(96): call_user_func(Array, Array)\n#6 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(258): Adianti\\Control\\TPage->run()\n#7 C:\\laragon\\www\\Consultorio\\lib\\adianti\\core\\AdiantiCoreApplication.php(96): Adianti\\Control\\TPage->show(Array)\n#8 C:\\laragon\\www\\Consultorio\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#9 C:\\laragon\\www\\Consultorio\\engine.php(66): TApplication::run()\n#10 {main}', 'lv1f9srgqt8rbib17fl6dfeqmh', 'SystemGroupForm', 'apache2handler', '62c305b976a67', '2022', '07', '04'),
	(463, '2022-07-04 12:22:34', 'admin', 'permission', 'INSERT INTO system_group_program (system_program_id, system_group_id, id) VALUES (\'19\', \'2\', 112)', 'INSERT', '::1', '62c305b9994e7', '#0 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TTransaction.php(241): SystemSqlLogService->write(\'INSERT INTO sys...\')\n#1 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TRecord.php(686): Adianti\\Database\\TTransaction::log(\'INSERT INTO sys...\')\n#2 C:\\laragon\\www\\Consultorio\\app\\model\\admin\\SystemGroup.class.php(67): Adianti\\Database\\TRecord->store()\n#3 C:\\laragon\\www\\Consultorio\\app\\control\\admin\\SystemGroupForm.class.php(138): SystemGroup->addSystemProgram(Object(SystemProgram))\n#4 [internal function]: SystemGroupForm->onSave(Array)\n#5 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(96): call_user_func(Array, Array)\n#6 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(258): Adianti\\Control\\TPage->run()\n#7 C:\\laragon\\www\\Consultorio\\lib\\adianti\\core\\AdiantiCoreApplication.php(96): Adianti\\Control\\TPage->show(Array)\n#8 C:\\laragon\\www\\Consultorio\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#9 C:\\laragon\\www\\Consultorio\\engine.php(66): TApplication::run()\n#10 {main}', 'lv1f9srgqt8rbib17fl6dfeqmh', 'SystemGroupForm', 'apache2handler', '62c305b976a67', '2022', '07', '04'),
	(464, '2022-07-04 12:22:34', 'admin', 'permission', 'INSERT INTO system_group_program (system_program_id, system_group_id, id) VALUES (\'20\', \'2\', 113)', 'INSERT', '::1', '62c305b9994e7', '#0 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TTransaction.php(241): SystemSqlLogService->write(\'INSERT INTO sys...\')\n#1 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TRecord.php(686): Adianti\\Database\\TTransaction::log(\'INSERT INTO sys...\')\n#2 C:\\laragon\\www\\Consultorio\\app\\model\\admin\\SystemGroup.class.php(67): Adianti\\Database\\TRecord->store()\n#3 C:\\laragon\\www\\Consultorio\\app\\control\\admin\\SystemGroupForm.class.php(138): SystemGroup->addSystemProgram(Object(SystemProgram))\n#4 [internal function]: SystemGroupForm->onSave(Array)\n#5 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(96): call_user_func(Array, Array)\n#6 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(258): Adianti\\Control\\TPage->run()\n#7 C:\\laragon\\www\\Consultorio\\lib\\adianti\\core\\AdiantiCoreApplication.php(96): Adianti\\Control\\TPage->show(Array)\n#8 C:\\laragon\\www\\Consultorio\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#9 C:\\laragon\\www\\Consultorio\\engine.php(66): TApplication::run()\n#10 {main}', 'lv1f9srgqt8rbib17fl6dfeqmh', 'SystemGroupForm', 'apache2handler', '62c305b976a67', '2022', '07', '04'),
	(465, '2022-07-04 12:22:34', 'admin', 'permission', 'INSERT INTO system_group_program (system_program_id, system_group_id, id) VALUES (\'22\', \'2\', 114)', 'INSERT', '::1', '62c305b9994e7', '#0 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TTransaction.php(241): SystemSqlLogService->write(\'INSERT INTO sys...\')\n#1 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TRecord.php(686): Adianti\\Database\\TTransaction::log(\'INSERT INTO sys...\')\n#2 C:\\laragon\\www\\Consultorio\\app\\model\\admin\\SystemGroup.class.php(67): Adianti\\Database\\TRecord->store()\n#3 C:\\laragon\\www\\Consultorio\\app\\control\\admin\\SystemGroupForm.class.php(138): SystemGroup->addSystemProgram(Object(SystemProgram))\n#4 [internal function]: SystemGroupForm->onSave(Array)\n#5 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(96): call_user_func(Array, Array)\n#6 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(258): Adianti\\Control\\TPage->run()\n#7 C:\\laragon\\www\\Consultorio\\lib\\adianti\\core\\AdiantiCoreApplication.php(96): Adianti\\Control\\TPage->show(Array)\n#8 C:\\laragon\\www\\Consultorio\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#9 C:\\laragon\\www\\Consultorio\\engine.php(66): TApplication::run()\n#10 {main}', 'lv1f9srgqt8rbib17fl6dfeqmh', 'SystemGroupForm', 'apache2handler', '62c305b976a67', '2022', '07', '04'),
	(466, '2022-07-04 12:22:34', 'admin', 'permission', 'INSERT INTO system_group_program (system_program_id, system_group_id, id) VALUES (\'23\', \'2\', 115)', 'INSERT', '::1', '62c305b9994e7', '#0 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TTransaction.php(241): SystemSqlLogService->write(\'INSERT INTO sys...\')\n#1 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TRecord.php(686): Adianti\\Database\\TTransaction::log(\'INSERT INTO sys...\')\n#2 C:\\laragon\\www\\Consultorio\\app\\model\\admin\\SystemGroup.class.php(67): Adianti\\Database\\TRecord->store()\n#3 C:\\laragon\\www\\Consultorio\\app\\control\\admin\\SystemGroupForm.class.php(138): SystemGroup->addSystemProgram(Object(SystemProgram))\n#4 [internal function]: SystemGroupForm->onSave(Array)\n#5 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(96): call_user_func(Array, Array)\n#6 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(258): Adianti\\Control\\TPage->run()\n#7 C:\\laragon\\www\\Consultorio\\lib\\adianti\\core\\AdiantiCoreApplication.php(96): Adianti\\Control\\TPage->show(Array)\n#8 C:\\laragon\\www\\Consultorio\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#9 C:\\laragon\\www\\Consultorio\\engine.php(66): TApplication::run()\n#10 {main}', 'lv1f9srgqt8rbib17fl6dfeqmh', 'SystemGroupForm', 'apache2handler', '62c305b976a67', '2022', '07', '04'),
	(467, '2022-07-04 12:22:34', 'admin', 'permission', 'INSERT INTO system_group_program (system_program_id, system_group_id, id) VALUES (\'24\', \'2\', 116)', 'INSERT', '::1', '62c305b9994e7', '#0 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TTransaction.php(241): SystemSqlLogService->write(\'INSERT INTO sys...\')\n#1 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TRecord.php(686): Adianti\\Database\\TTransaction::log(\'INSERT INTO sys...\')\n#2 C:\\laragon\\www\\Consultorio\\app\\model\\admin\\SystemGroup.class.php(67): Adianti\\Database\\TRecord->store()\n#3 C:\\laragon\\www\\Consultorio\\app\\control\\admin\\SystemGroupForm.class.php(138): SystemGroup->addSystemProgram(Object(SystemProgram))\n#4 [internal function]: SystemGroupForm->onSave(Array)\n#5 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(96): call_user_func(Array, Array)\n#6 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(258): Adianti\\Control\\TPage->run()\n#7 C:\\laragon\\www\\Consultorio\\lib\\adianti\\core\\AdiantiCoreApplication.php(96): Adianti\\Control\\TPage->show(Array)\n#8 C:\\laragon\\www\\Consultorio\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#9 C:\\laragon\\www\\Consultorio\\engine.php(66): TApplication::run()\n#10 {main}', 'lv1f9srgqt8rbib17fl6dfeqmh', 'SystemGroupForm', 'apache2handler', '62c305b976a67', '2022', '07', '04'),
	(468, '2022-07-04 12:22:34', 'admin', 'permission', 'INSERT INTO system_group_program (system_program_id, system_group_id, id) VALUES (\'25\', \'2\', 117)', 'INSERT', '::1', '62c305b9994e7', '#0 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TTransaction.php(241): SystemSqlLogService->write(\'INSERT INTO sys...\')\n#1 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TRecord.php(686): Adianti\\Database\\TTransaction::log(\'INSERT INTO sys...\')\n#2 C:\\laragon\\www\\Consultorio\\app\\model\\admin\\SystemGroup.class.php(67): Adianti\\Database\\TRecord->store()\n#3 C:\\laragon\\www\\Consultorio\\app\\control\\admin\\SystemGroupForm.class.php(138): SystemGroup->addSystemProgram(Object(SystemProgram))\n#4 [internal function]: SystemGroupForm->onSave(Array)\n#5 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(96): call_user_func(Array, Array)\n#6 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(258): Adianti\\Control\\TPage->run()\n#7 C:\\laragon\\www\\Consultorio\\lib\\adianti\\core\\AdiantiCoreApplication.php(96): Adianti\\Control\\TPage->show(Array)\n#8 C:\\laragon\\www\\Consultorio\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#9 C:\\laragon\\www\\Consultorio\\engine.php(66): TApplication::run()\n#10 {main}', 'lv1f9srgqt8rbib17fl6dfeqmh', 'SystemGroupForm', 'apache2handler', '62c305b976a67', '2022', '07', '04'),
	(469, '2022-07-04 12:22:34', 'admin', 'permission', 'INSERT INTO system_group_program (system_program_id, system_group_id, id) VALUES (\'30\', \'2\', 118)', 'INSERT', '::1', '62c305b9994e7', '#0 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TTransaction.php(241): SystemSqlLogService->write(\'INSERT INTO sys...\')\n#1 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TRecord.php(686): Adianti\\Database\\TTransaction::log(\'INSERT INTO sys...\')\n#2 C:\\laragon\\www\\Consultorio\\app\\model\\admin\\SystemGroup.class.php(67): Adianti\\Database\\TRecord->store()\n#3 C:\\laragon\\www\\Consultorio\\app\\control\\admin\\SystemGroupForm.class.php(138): SystemGroup->addSystemProgram(Object(SystemProgram))\n#4 [internal function]: SystemGroupForm->onSave(Array)\n#5 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(96): call_user_func(Array, Array)\n#6 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(258): Adianti\\Control\\TPage->run()\n#7 C:\\laragon\\www\\Consultorio\\lib\\adianti\\core\\AdiantiCoreApplication.php(96): Adianti\\Control\\TPage->show(Array)\n#8 C:\\laragon\\www\\Consultorio\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#9 C:\\laragon\\www\\Consultorio\\engine.php(66): TApplication::run()\n#10 {main}', 'lv1f9srgqt8rbib17fl6dfeqmh', 'SystemGroupForm', 'apache2handler', '62c305b976a67', '2022', '07', '04'),
	(470, '2022-07-04 12:22:34', 'admin', 'permission', 'INSERT INTO system_group_program (system_program_id, system_group_id, id) VALUES (\'48\', \'2\', 119)', 'INSERT', '::1', '62c305b9994e7', '#0 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TTransaction.php(241): SystemSqlLogService->write(\'INSERT INTO sys...\')\n#1 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TRecord.php(686): Adianti\\Database\\TTransaction::log(\'INSERT INTO sys...\')\n#2 C:\\laragon\\www\\Consultorio\\app\\model\\admin\\SystemGroup.class.php(67): Adianti\\Database\\TRecord->store()\n#3 C:\\laragon\\www\\Consultorio\\app\\control\\admin\\SystemGroupForm.class.php(138): SystemGroup->addSystemProgram(Object(SystemProgram))\n#4 [internal function]: SystemGroupForm->onSave(Array)\n#5 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(96): call_user_func(Array, Array)\n#6 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(258): Adianti\\Control\\TPage->run()\n#7 C:\\laragon\\www\\Consultorio\\lib\\adianti\\core\\AdiantiCoreApplication.php(96): Adianti\\Control\\TPage->show(Array)\n#8 C:\\laragon\\www\\Consultorio\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#9 C:\\laragon\\www\\Consultorio\\engine.php(66): TApplication::run()\n#10 {main}', 'lv1f9srgqt8rbib17fl6dfeqmh', 'SystemGroupForm', 'apache2handler', '62c305b976a67', '2022', '07', '04'),
	(471, '2022-07-04 12:22:34', 'admin', 'permission', 'INSERT INTO system_group_program (system_program_id, system_group_id, id) VALUES (\'49\', \'2\', 120)', 'INSERT', '::1', '62c305b9994e7', '#0 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TTransaction.php(241): SystemSqlLogService->write(\'INSERT INTO sys...\')\n#1 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TRecord.php(686): Adianti\\Database\\TTransaction::log(\'INSERT INTO sys...\')\n#2 C:\\laragon\\www\\Consultorio\\app\\model\\admin\\SystemGroup.class.php(67): Adianti\\Database\\TRecord->store()\n#3 C:\\laragon\\www\\Consultorio\\app\\control\\admin\\SystemGroupForm.class.php(138): SystemGroup->addSystemProgram(Object(SystemProgram))\n#4 [internal function]: SystemGroupForm->onSave(Array)\n#5 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(96): call_user_func(Array, Array)\n#6 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(258): Adianti\\Control\\TPage->run()\n#7 C:\\laragon\\www\\Consultorio\\lib\\adianti\\core\\AdiantiCoreApplication.php(96): Adianti\\Control\\TPage->show(Array)\n#8 C:\\laragon\\www\\Consultorio\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#9 C:\\laragon\\www\\Consultorio\\engine.php(66): TApplication::run()\n#10 {main}', 'lv1f9srgqt8rbib17fl6dfeqmh', 'SystemGroupForm', 'apache2handler', '62c305b976a67', '2022', '07', '04'),
	(472, '2022-07-04 12:22:34', 'admin', 'permission', 'INSERT INTO system_group_program (system_program_id, system_group_id, id) VALUES (\'50\', \'2\', 121)', 'INSERT', '::1', '62c305b9994e7', '#0 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TTransaction.php(241): SystemSqlLogService->write(\'INSERT INTO sys...\')\n#1 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TRecord.php(686): Adianti\\Database\\TTransaction::log(\'INSERT INTO sys...\')\n#2 C:\\laragon\\www\\Consultorio\\app\\model\\admin\\SystemGroup.class.php(67): Adianti\\Database\\TRecord->store()\n#3 C:\\laragon\\www\\Consultorio\\app\\control\\admin\\SystemGroupForm.class.php(138): SystemGroup->addSystemProgram(Object(SystemProgram))\n#4 [internal function]: SystemGroupForm->onSave(Array)\n#5 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(96): call_user_func(Array, Array)\n#6 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(258): Adianti\\Control\\TPage->run()\n#7 C:\\laragon\\www\\Consultorio\\lib\\adianti\\core\\AdiantiCoreApplication.php(96): Adianti\\Control\\TPage->show(Array)\n#8 C:\\laragon\\www\\Consultorio\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#9 C:\\laragon\\www\\Consultorio\\engine.php(66): TApplication::run()\n#10 {main}', 'lv1f9srgqt8rbib17fl6dfeqmh', 'SystemGroupForm', 'apache2handler', '62c305b976a67', '2022', '07', '04'),
	(473, '2022-07-04 12:22:34', 'admin', 'permission', 'INSERT INTO system_group_program (system_program_id, system_group_id, id) VALUES (\'51\', \'2\', 122)', 'INSERT', '::1', '62c305b9994e7', '#0 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TTransaction.php(241): SystemSqlLogService->write(\'INSERT INTO sys...\')\n#1 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TRecord.php(686): Adianti\\Database\\TTransaction::log(\'INSERT INTO sys...\')\n#2 C:\\laragon\\www\\Consultorio\\app\\model\\admin\\SystemGroup.class.php(67): Adianti\\Database\\TRecord->store()\n#3 C:\\laragon\\www\\Consultorio\\app\\control\\admin\\SystemGroupForm.class.php(138): SystemGroup->addSystemProgram(Object(SystemProgram))\n#4 [internal function]: SystemGroupForm->onSave(Array)\n#5 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(96): call_user_func(Array, Array)\n#6 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(258): Adianti\\Control\\TPage->run()\n#7 C:\\laragon\\www\\Consultorio\\lib\\adianti\\core\\AdiantiCoreApplication.php(96): Adianti\\Control\\TPage->show(Array)\n#8 C:\\laragon\\www\\Consultorio\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#9 C:\\laragon\\www\\Consultorio\\engine.php(66): TApplication::run()\n#10 {main}', 'lv1f9srgqt8rbib17fl6dfeqmh', 'SystemGroupForm', 'apache2handler', '62c305b976a67', '2022', '07', '04'),
	(474, '2022-07-04 12:22:34', 'admin', 'permission', 'INSERT INTO system_group_program (system_program_id, system_group_id, id) VALUES (\'52\', \'2\', 123)', 'INSERT', '::1', '62c305b9994e7', '#0 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TTransaction.php(241): SystemSqlLogService->write(\'INSERT INTO sys...\')\n#1 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TRecord.php(686): Adianti\\Database\\TTransaction::log(\'INSERT INTO sys...\')\n#2 C:\\laragon\\www\\Consultorio\\app\\model\\admin\\SystemGroup.class.php(67): Adianti\\Database\\TRecord->store()\n#3 C:\\laragon\\www\\Consultorio\\app\\control\\admin\\SystemGroupForm.class.php(138): SystemGroup->addSystemProgram(Object(SystemProgram))\n#4 [internal function]: SystemGroupForm->onSave(Array)\n#5 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(96): call_user_func(Array, Array)\n#6 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(258): Adianti\\Control\\TPage->run()\n#7 C:\\laragon\\www\\Consultorio\\lib\\adianti\\core\\AdiantiCoreApplication.php(96): Adianti\\Control\\TPage->show(Array)\n#8 C:\\laragon\\www\\Consultorio\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#9 C:\\laragon\\www\\Consultorio\\engine.php(66): TApplication::run()\n#10 {main}', 'lv1f9srgqt8rbib17fl6dfeqmh', 'SystemGroupForm', 'apache2handler', '62c305b976a67', '2022', '07', '04'),
	(475, '2022-07-04 12:22:34', 'admin', 'permission', 'INSERT INTO system_group_program (system_program_id, system_group_id, id) VALUES (\'53\', \'2\', 124)', 'INSERT', '::1', '62c305b9994e7', '#0 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TTransaction.php(241): SystemSqlLogService->write(\'INSERT INTO sys...\')\n#1 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TRecord.php(686): Adianti\\Database\\TTransaction::log(\'INSERT INTO sys...\')\n#2 C:\\laragon\\www\\Consultorio\\app\\model\\admin\\SystemGroup.class.php(67): Adianti\\Database\\TRecord->store()\n#3 C:\\laragon\\www\\Consultorio\\app\\control\\admin\\SystemGroupForm.class.php(138): SystemGroup->addSystemProgram(Object(SystemProgram))\n#4 [internal function]: SystemGroupForm->onSave(Array)\n#5 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(96): call_user_func(Array, Array)\n#6 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(258): Adianti\\Control\\TPage->run()\n#7 C:\\laragon\\www\\Consultorio\\lib\\adianti\\core\\AdiantiCoreApplication.php(96): Adianti\\Control\\TPage->show(Array)\n#8 C:\\laragon\\www\\Consultorio\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#9 C:\\laragon\\www\\Consultorio\\engine.php(66): TApplication::run()\n#10 {main}', 'lv1f9srgqt8rbib17fl6dfeqmh', 'SystemGroupForm', 'apache2handler', '62c305b976a67', '2022', '07', '04'),
	(476, '2022-07-04 12:22:34', 'admin', 'permission', 'INSERT INTO system_group_program (system_program_id, system_group_id, id) VALUES (\'54\', \'2\', 125)', 'INSERT', '::1', '62c305b9994e7', '#0 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TTransaction.php(241): SystemSqlLogService->write(\'INSERT INTO sys...\')\n#1 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TRecord.php(686): Adianti\\Database\\TTransaction::log(\'INSERT INTO sys...\')\n#2 C:\\laragon\\www\\Consultorio\\app\\model\\admin\\SystemGroup.class.php(67): Adianti\\Database\\TRecord->store()\n#3 C:\\laragon\\www\\Consultorio\\app\\control\\admin\\SystemGroupForm.class.php(138): SystemGroup->addSystemProgram(Object(SystemProgram))\n#4 [internal function]: SystemGroupForm->onSave(Array)\n#5 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(96): call_user_func(Array, Array)\n#6 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(258): Adianti\\Control\\TPage->run()\n#7 C:\\laragon\\www\\Consultorio\\lib\\adianti\\core\\AdiantiCoreApplication.php(96): Adianti\\Control\\TPage->show(Array)\n#8 C:\\laragon\\www\\Consultorio\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#9 C:\\laragon\\www\\Consultorio\\engine.php(66): TApplication::run()\n#10 {main}', 'lv1f9srgqt8rbib17fl6dfeqmh', 'SystemGroupForm', 'apache2handler', '62c305b976a67', '2022', '07', '04'),
	(477, '2022-07-04 12:22:34', 'admin', 'permission', 'INSERT INTO system_group_program (system_program_id, system_group_id, id) VALUES (\'55\', \'2\', 126)', 'INSERT', '::1', '62c305b9994e7', '#0 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TTransaction.php(241): SystemSqlLogService->write(\'INSERT INTO sys...\')\n#1 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TRecord.php(686): Adianti\\Database\\TTransaction::log(\'INSERT INTO sys...\')\n#2 C:\\laragon\\www\\Consultorio\\app\\model\\admin\\SystemGroup.class.php(67): Adianti\\Database\\TRecord->store()\n#3 C:\\laragon\\www\\Consultorio\\app\\control\\admin\\SystemGroupForm.class.php(138): SystemGroup->addSystemProgram(Object(SystemProgram))\n#4 [internal function]: SystemGroupForm->onSave(Array)\n#5 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(96): call_user_func(Array, Array)\n#6 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(258): Adianti\\Control\\TPage->run()\n#7 C:\\laragon\\www\\Consultorio\\lib\\adianti\\core\\AdiantiCoreApplication.php(96): Adianti\\Control\\TPage->show(Array)\n#8 C:\\laragon\\www\\Consultorio\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#9 C:\\laragon\\www\\Consultorio\\engine.php(66): TApplication::run()\n#10 {main}', 'lv1f9srgqt8rbib17fl6dfeqmh', 'SystemGroupForm', 'apache2handler', '62c305b976a67', '2022', '07', '04'),
	(478, '2022-07-04 12:22:34', 'admin', 'permission', 'INSERT INTO system_group_program (system_program_id, system_group_id, id) VALUES (\'56\', \'2\', 127)', 'INSERT', '::1', '62c305b9994e7', '#0 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TTransaction.php(241): SystemSqlLogService->write(\'INSERT INTO sys...\')\n#1 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TRecord.php(686): Adianti\\Database\\TTransaction::log(\'INSERT INTO sys...\')\n#2 C:\\laragon\\www\\Consultorio\\app\\model\\admin\\SystemGroup.class.php(67): Adianti\\Database\\TRecord->store()\n#3 C:\\laragon\\www\\Consultorio\\app\\control\\admin\\SystemGroupForm.class.php(138): SystemGroup->addSystemProgram(Object(SystemProgram))\n#4 [internal function]: SystemGroupForm->onSave(Array)\n#5 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(96): call_user_func(Array, Array)\n#6 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(258): Adianti\\Control\\TPage->run()\n#7 C:\\laragon\\www\\Consultorio\\lib\\adianti\\core\\AdiantiCoreApplication.php(96): Adianti\\Control\\TPage->show(Array)\n#8 C:\\laragon\\www\\Consultorio\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#9 C:\\laragon\\www\\Consultorio\\engine.php(66): TApplication::run()\n#10 {main}', 'lv1f9srgqt8rbib17fl6dfeqmh', 'SystemGroupForm', 'apache2handler', '62c305b976a67', '2022', '07', '04'),
	(479, '2022-07-04 12:22:34', 'admin', 'permission', 'INSERT INTO system_group_program (system_program_id, system_group_id, id) VALUES (\'57\', \'2\', 128)', 'INSERT', '::1', '62c305b9994e7', '#0 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TTransaction.php(241): SystemSqlLogService->write(\'INSERT INTO sys...\')\n#1 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TRecord.php(686): Adianti\\Database\\TTransaction::log(\'INSERT INTO sys...\')\n#2 C:\\laragon\\www\\Consultorio\\app\\model\\admin\\SystemGroup.class.php(67): Adianti\\Database\\TRecord->store()\n#3 C:\\laragon\\www\\Consultorio\\app\\control\\admin\\SystemGroupForm.class.php(138): SystemGroup->addSystemProgram(Object(SystemProgram))\n#4 [internal function]: SystemGroupForm->onSave(Array)\n#5 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(96): call_user_func(Array, Array)\n#6 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(258): Adianti\\Control\\TPage->run()\n#7 C:\\laragon\\www\\Consultorio\\lib\\adianti\\core\\AdiantiCoreApplication.php(96): Adianti\\Control\\TPage->show(Array)\n#8 C:\\laragon\\www\\Consultorio\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#9 C:\\laragon\\www\\Consultorio\\engine.php(66): TApplication::run()\n#10 {main}', 'lv1f9srgqt8rbib17fl6dfeqmh', 'SystemGroupForm', 'apache2handler', '62c305b976a67', '2022', '07', '04'),
	(480, '2022-07-04 12:22:34', 'admin', 'permission', 'INSERT INTO system_group_program (system_program_id, system_group_id, id) VALUES (\'58\', \'2\', 129)', 'INSERT', '::1', '62c305b9994e7', '#0 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TTransaction.php(241): SystemSqlLogService->write(\'INSERT INTO sys...\')\n#1 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TRecord.php(686): Adianti\\Database\\TTransaction::log(\'INSERT INTO sys...\')\n#2 C:\\laragon\\www\\Consultorio\\app\\model\\admin\\SystemGroup.class.php(67): Adianti\\Database\\TRecord->store()\n#3 C:\\laragon\\www\\Consultorio\\app\\control\\admin\\SystemGroupForm.class.php(138): SystemGroup->addSystemProgram(Object(SystemProgram))\n#4 [internal function]: SystemGroupForm->onSave(Array)\n#5 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(96): call_user_func(Array, Array)\n#6 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(258): Adianti\\Control\\TPage->run()\n#7 C:\\laragon\\www\\Consultorio\\lib\\adianti\\core\\AdiantiCoreApplication.php(96): Adianti\\Control\\TPage->show(Array)\n#8 C:\\laragon\\www\\Consultorio\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#9 C:\\laragon\\www\\Consultorio\\engine.php(66): TApplication::run()\n#10 {main}', 'lv1f9srgqt8rbib17fl6dfeqmh', 'SystemGroupForm', 'apache2handler', '62c305b976a67', '2022', '07', '04'),
	(481, '2022-07-04 12:22:34', 'admin', 'permission', 'INSERT INTO system_group_program (system_program_id, system_group_id, id) VALUES (\'59\', \'2\', 130)', 'INSERT', '::1', '62c305b9994e7', '#0 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TTransaction.php(241): SystemSqlLogService->write(\'INSERT INTO sys...\')\n#1 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TRecord.php(686): Adianti\\Database\\TTransaction::log(\'INSERT INTO sys...\')\n#2 C:\\laragon\\www\\Consultorio\\app\\model\\admin\\SystemGroup.class.php(67): Adianti\\Database\\TRecord->store()\n#3 C:\\laragon\\www\\Consultorio\\app\\control\\admin\\SystemGroupForm.class.php(138): SystemGroup->addSystemProgram(Object(SystemProgram))\n#4 [internal function]: SystemGroupForm->onSave(Array)\n#5 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(96): call_user_func(Array, Array)\n#6 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(258): Adianti\\Control\\TPage->run()\n#7 C:\\laragon\\www\\Consultorio\\lib\\adianti\\core\\AdiantiCoreApplication.php(96): Adianti\\Control\\TPage->show(Array)\n#8 C:\\laragon\\www\\Consultorio\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#9 C:\\laragon\\www\\Consultorio\\engine.php(66): TApplication::run()\n#10 {main}', 'lv1f9srgqt8rbib17fl6dfeqmh', 'SystemGroupForm', 'apache2handler', '62c305b976a67', '2022', '07', '04'),
	(482, '2022-07-04 12:22:34', 'admin', 'permission', 'INSERT INTO system_group_program (system_program_id, system_group_id, id) VALUES (\'60\', \'2\', 131)', 'INSERT', '::1', '62c305b9994e7', '#0 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TTransaction.php(241): SystemSqlLogService->write(\'INSERT INTO sys...\')\n#1 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TRecord.php(686): Adianti\\Database\\TTransaction::log(\'INSERT INTO sys...\')\n#2 C:\\laragon\\www\\Consultorio\\app\\model\\admin\\SystemGroup.class.php(67): Adianti\\Database\\TRecord->store()\n#3 C:\\laragon\\www\\Consultorio\\app\\control\\admin\\SystemGroupForm.class.php(138): SystemGroup->addSystemProgram(Object(SystemProgram))\n#4 [internal function]: SystemGroupForm->onSave(Array)\n#5 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(96): call_user_func(Array, Array)\n#6 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(258): Adianti\\Control\\TPage->run()\n#7 C:\\laragon\\www\\Consultorio\\lib\\adianti\\core\\AdiantiCoreApplication.php(96): Adianti\\Control\\TPage->show(Array)\n#8 C:\\laragon\\www\\Consultorio\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#9 C:\\laragon\\www\\Consultorio\\engine.php(66): TApplication::run()\n#10 {main}', 'lv1f9srgqt8rbib17fl6dfeqmh', 'SystemGroupForm', 'apache2handler', '62c305b976a67', '2022', '07', '04'),
	(483, '2022-07-04 12:22:34', 'admin', 'permission', 'INSERT INTO system_group_program (system_program_id, system_group_id, id) VALUES (\'61\', \'2\', 132)', 'INSERT', '::1', '62c305b9994e7', '#0 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TTransaction.php(241): SystemSqlLogService->write(\'INSERT INTO sys...\')\n#1 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TRecord.php(686): Adianti\\Database\\TTransaction::log(\'INSERT INTO sys...\')\n#2 C:\\laragon\\www\\Consultorio\\app\\model\\admin\\SystemGroup.class.php(67): Adianti\\Database\\TRecord->store()\n#3 C:\\laragon\\www\\Consultorio\\app\\control\\admin\\SystemGroupForm.class.php(138): SystemGroup->addSystemProgram(Object(SystemProgram))\n#4 [internal function]: SystemGroupForm->onSave(Array)\n#5 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(96): call_user_func(Array, Array)\n#6 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(258): Adianti\\Control\\TPage->run()\n#7 C:\\laragon\\www\\Consultorio\\lib\\adianti\\core\\AdiantiCoreApplication.php(96): Adianti\\Control\\TPage->show(Array)\n#8 C:\\laragon\\www\\Consultorio\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#9 C:\\laragon\\www\\Consultorio\\engine.php(66): TApplication::run()\n#10 {main}', 'lv1f9srgqt8rbib17fl6dfeqmh', 'SystemGroupForm', 'apache2handler', '62c305b976a67', '2022', '07', '04'),
	(484, '2022-07-04 12:22:35', 'admin', 'permission', 'INSERT INTO system_group_program (system_program_id, system_group_id, id) VALUES (\'62\', \'2\', 133)', 'INSERT', '::1', '62c305b9994e7', '#0 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TTransaction.php(241): SystemSqlLogService->write(\'INSERT INTO sys...\')\n#1 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TRecord.php(686): Adianti\\Database\\TTransaction::log(\'INSERT INTO sys...\')\n#2 C:\\laragon\\www\\Consultorio\\app\\model\\admin\\SystemGroup.class.php(67): Adianti\\Database\\TRecord->store()\n#3 C:\\laragon\\www\\Consultorio\\app\\control\\admin\\SystemGroupForm.class.php(138): SystemGroup->addSystemProgram(Object(SystemProgram))\n#4 [internal function]: SystemGroupForm->onSave(Array)\n#5 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(96): call_user_func(Array, Array)\n#6 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(258): Adianti\\Control\\TPage->run()\n#7 C:\\laragon\\www\\Consultorio\\lib\\adianti\\core\\AdiantiCoreApplication.php(96): Adianti\\Control\\TPage->show(Array)\n#8 C:\\laragon\\www\\Consultorio\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#9 C:\\laragon\\www\\Consultorio\\engine.php(66): TApplication::run()\n#10 {main}', 'lv1f9srgqt8rbib17fl6dfeqmh', 'SystemGroupForm', 'apache2handler', '62c305b976a67', '2022', '07', '04'),
	(485, '2022-07-04 12:22:35', 'admin', 'permission', 'INSERT INTO system_user_group (system_user_id, system_group_id, id) VALUES (\'2\', \'2\', 12)', 'INSERT', '::1', '62c305b9994e7', '#0 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TTransaction.php(241): SystemSqlLogService->write(\'INSERT INTO sys...\')\n#1 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TRecord.php(686): Adianti\\Database\\TTransaction::log(\'INSERT INTO sys...\')\n#2 C:\\laragon\\www\\Consultorio\\app\\model\\admin\\SystemGroup.class.php(82): Adianti\\Database\\TRecord->store()\n#3 C:\\laragon\\www\\Consultorio\\app\\control\\admin\\SystemGroupForm.class.php(146): SystemGroup->addSystemUser(Object(SystemUser))\n#4 [internal function]: SystemGroupForm->onSave(Array)\n#5 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(96): call_user_func(Array, Array)\n#6 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(258): Adianti\\Control\\TPage->run()\n#7 C:\\laragon\\www\\Consultorio\\lib\\adianti\\core\\AdiantiCoreApplication.php(96): Adianti\\Control\\TPage->show(Array)\n#8 C:\\laragon\\www\\Consultorio\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#9 C:\\laragon\\www\\Consultorio\\engine.php(66): TApplication::run()\n#10 {main}', 'lv1f9srgqt8rbib17fl6dfeqmh', 'SystemGroupForm', 'apache2handler', '62c305b976a67', '2022', '07', '04'),
	(486, '2022-07-04 14:09:16', 'admin', 'permission', 'INSERT INTO consulta (titulo, paciente_id, medico_id, area_do_medico_nome, dtinicio, dtfim) VALUES (\'Exame\', \'9\', \'4\', \'4\', \'2022-07-04 12:10\', \'2022-07-04 18:00\')', 'INSERT', '::1', '62c31ebc444e4', '#0 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TTransaction.php(241): SystemSqlLogService->write(\'INSERT INTO con...\')\n#1 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TRecord.php(686): Adianti\\Database\\TTransaction::log(\'INSERT INTO con...\')\n#2 C:\\laragon\\www\\Consultorio\\lib\\adianti\\base\\AdiantiStandardFormTrait.php(72): Adianti\\Database\\TRecord->store()\n#3 [internal function]: Adianti\\Base\\TStandardForm->onSave(Array)\n#4 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(96): call_user_func(Array, Array)\n#5 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(258): Adianti\\Control\\TPage->run()\n#6 C:\\laragon\\www\\Consultorio\\lib\\adianti\\core\\AdiantiCoreApplication.php(96): Adianti\\Control\\TPage->show(Array)\n#7 C:\\laragon\\www\\Consultorio\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#8 C:\\laragon\\www\\Consultorio\\engine.php(66): TApplication::run()\n#9 {main}', 'c1ei4m5ftr3k8v2hfkl7ecs35i', 'ConsultaForm', 'apache2handler', '62c31ebc18299', '2022', '07', '04'),
	(487, '2022-07-05 12:50:20', 'admin', 'permission', 'INSERT INTO system_program (id, name, controller) VALUES (63, \'Grafico Colunas\', \'GraficoColunas\')', 'INSERT', '::1', '62c45dbc26677', '#0 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TTransaction.php(241): SystemSqlLogService->write(\'INSERT INTO sys...\')\n#1 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TRecord.php(686): Adianti\\Database\\TTransaction::log(\'INSERT INTO sys...\')\n#2 C:\\laragon\\www\\Consultorio\\app\\control\\admin\\SystemProgramForm.class.php(210): Adianti\\Database\\TRecord->store()\n#3 [internal function]: SystemProgramForm->onSave(Array)\n#4 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(96): call_user_func(Array, Array)\n#5 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(258): Adianti\\Control\\TPage->run()\n#6 C:\\laragon\\www\\Consultorio\\lib\\adianti\\core\\AdiantiCoreApplication.php(96): Adianti\\Control\\TPage->show(Array)\n#7 C:\\laragon\\www\\Consultorio\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#8 C:\\laragon\\www\\Consultorio\\engine.php(66): TApplication::run()\n#9 {main}', 'avnnhgaoqivuindnd790n81glr', 'SystemProgramForm', 'apache2handler', '62c45dbc021be', '2022', '07', '05'),
	(488, '2022-07-05 12:50:20', 'admin', 'permission', 'DELETE FROM system_group_program WHERE (system_program_id = 63)', 'DELETE', '::1', '62c45dbc26677', '#0 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TTransaction.php(241): SystemSqlLogService->write(\'DELETE FROM sys...\')\n#1 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TRepository.php(562): Adianti\\Database\\TTransaction::log(\'DELETE FROM sys...\')\n#2 C:\\laragon\\www\\Consultorio\\app\\model\\admin\\SystemProgram.class.php(82): Adianti\\Database\\TRepository->delete()\n#3 C:\\laragon\\www\\Consultorio\\app\\control\\admin\\SystemProgramForm.class.php(214): SystemProgram->clearParts()\n#4 [internal function]: SystemProgramForm->onSave(Array)\n#5 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(96): call_user_func(Array, Array)\n#6 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(258): Adianti\\Control\\TPage->run()\n#7 C:\\laragon\\www\\Consultorio\\lib\\adianti\\core\\AdiantiCoreApplication.php(96): Adianti\\Control\\TPage->show(Array)\n#8 C:\\laragon\\www\\Consultorio\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#9 C:\\laragon\\www\\Consultorio\\engine.php(66): TApplication::run()\n#10 {main}', 'avnnhgaoqivuindnd790n81glr', 'SystemProgramForm', 'apache2handler', '62c45dbc021be', '2022', '07', '05'),
	(489, '2022-07-05 12:50:20', 'admin', 'permission', 'INSERT INTO system_group_program (system_program_id, system_group_id, id) VALUES (63, \'1\', 134)', 'INSERT', '::1', '62c45dbc26677', '#0 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TTransaction.php(241): SystemSqlLogService->write(\'INSERT INTO sys...\')\n#1 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TRecord.php(686): Adianti\\Database\\TTransaction::log(\'INSERT INTO sys...\')\n#2 C:\\laragon\\www\\Consultorio\\app\\model\\admin\\SystemProgram.class.php(51): Adianti\\Database\\TRecord->store()\n#3 C:\\laragon\\www\\Consultorio\\app\\control\\admin\\SystemProgramForm.class.php(220): SystemProgram->addSystemGroup(Object(SystemGroup))\n#4 [internal function]: SystemProgramForm->onSave(Array)\n#5 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(96): call_user_func(Array, Array)\n#6 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(258): Adianti\\Control\\TPage->run()\n#7 C:\\laragon\\www\\Consultorio\\lib\\adianti\\core\\AdiantiCoreApplication.php(96): Adianti\\Control\\TPage->show(Array)\n#8 C:\\laragon\\www\\Consultorio\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#9 C:\\laragon\\www\\Consultorio\\engine.php(66): TApplication::run()\n#10 {main}', 'avnnhgaoqivuindnd790n81glr', 'SystemProgramForm', 'apache2handler', '62c45dbc021be', '2022', '07', '05'),
	(490, '2022-07-05 12:50:20', 'admin', 'permission', 'INSERT INTO system_group_program (system_program_id, system_group_id, id) VALUES (63, \'2\', 135)', 'INSERT', '::1', '62c45dbc26677', '#0 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TTransaction.php(241): SystemSqlLogService->write(\'INSERT INTO sys...\')\n#1 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TRecord.php(686): Adianti\\Database\\TTransaction::log(\'INSERT INTO sys...\')\n#2 C:\\laragon\\www\\Consultorio\\app\\model\\admin\\SystemProgram.class.php(51): Adianti\\Database\\TRecord->store()\n#3 C:\\laragon\\www\\Consultorio\\app\\control\\admin\\SystemProgramForm.class.php(220): SystemProgram->addSystemGroup(Object(SystemGroup))\n#4 [internal function]: SystemProgramForm->onSave(Array)\n#5 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(96): call_user_func(Array, Array)\n#6 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(258): Adianti\\Control\\TPage->run()\n#7 C:\\laragon\\www\\Consultorio\\lib\\adianti\\core\\AdiantiCoreApplication.php(96): Adianti\\Control\\TPage->show(Array)\n#8 C:\\laragon\\www\\Consultorio\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#9 C:\\laragon\\www\\Consultorio\\engine.php(66): TApplication::run()\n#10 {main}', 'avnnhgaoqivuindnd790n81glr', 'SystemProgramForm', 'apache2handler', '62c45dbc021be', '2022', '07', '05');
/*!40000 ALTER TABLE `system_sql_log` ENABLE KEYS */;

-- Copiando estrutura para tabela consultorio.system_unit
CREATE TABLE IF NOT EXISTS `system_unit` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `connection_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela consultorio.system_unit: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `system_unit` DISABLE KEYS */;
INSERT INTO `system_unit` (`id`, `name`, `connection_name`) VALUES
	(1, 'Unit A', 'unit_a'),
	(2, 'Unit B', 'unit_b');
/*!40000 ALTER TABLE `system_unit` ENABLE KEYS */;

-- Copiando estrutura para tabela consultorio.system_user
CREATE TABLE IF NOT EXISTS `system_user` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `login` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `accepted_term_policy` char(1) DEFAULT NULL,
  `accepted_term_policy_at` text,
  `frontpage_id` int(11) DEFAULT NULL,
  `system_unit_id` int(11) DEFAULT NULL,
  `active` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sys_user_program_idx` (`frontpage_id`),
  CONSTRAINT `system_user_ibfk_1` FOREIGN KEY (`frontpage_id`) REFERENCES `system_program` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela consultorio.system_user: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `system_user` DISABLE KEYS */;
INSERT INTO `system_user` (`id`, `name`, `login`, `password`, `email`, `accepted_term_policy`, `accepted_term_policy_at`, `frontpage_id`, `system_unit_id`, `active`) VALUES
	(1, 'Administrator', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin@admin.net', 'N', NULL, 38, NULL, 'Y'),
	(2, 'User', 'user', 'ee11cbb19052e40b07aac0ca060c23ee', 'user@user.net', 'N', NULL, 7, NULL, 'Y'),
	(3, 'Manuela', 'manuela', '4b2e12b43338e42361077cb6516ad63e', 'manuelacamiladaluz@temavonfeccaosjc.com.br', NULL, NULL, 58, NULL, 'Y');
/*!40000 ALTER TABLE `system_user` ENABLE KEYS */;

-- Copiando estrutura para tabela consultorio.system_user_group
CREATE TABLE IF NOT EXISTS `system_user_group` (
  `id` int(11) NOT NULL,
  `system_user_id` int(11) DEFAULT NULL,
  `system_group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sys_user_group_group_idx` (`system_group_id`),
  KEY `sys_user_group_user_idx` (`system_user_id`),
  CONSTRAINT `system_user_group_ibfk_1` FOREIGN KEY (`system_user_id`) REFERENCES `system_user` (`id`),
  CONSTRAINT `system_user_group_ibfk_2` FOREIGN KEY (`system_group_id`) REFERENCES `system_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela consultorio.system_user_group: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `system_user_group` DISABLE KEYS */;
INSERT INTO `system_user_group` (`id`, `system_user_id`, `system_group_id`) VALUES
	(10, 1, 1),
	(11, 3, 3),
	(12, 2, 2);
/*!40000 ALTER TABLE `system_user_group` ENABLE KEYS */;

-- Copiando estrutura para tabela consultorio.system_user_program
CREATE TABLE IF NOT EXISTS `system_user_program` (
  `id` int(11) NOT NULL,
  `system_user_id` int(11) DEFAULT NULL,
  `system_program_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sys_user_program_program_idx` (`system_program_id`),
  KEY `sys_user_program_user_idx` (`system_user_id`),
  CONSTRAINT `system_user_program_ibfk_1` FOREIGN KEY (`system_user_id`) REFERENCES `system_user` (`id`),
  CONSTRAINT `system_user_program_ibfk_2` FOREIGN KEY (`system_program_id`) REFERENCES `system_program` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela consultorio.system_user_program: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `system_user_program` DISABLE KEYS */;
INSERT INTO `system_user_program` (`id`, `system_user_id`, `system_program_id`) VALUES
	(1, 2, 7);
/*!40000 ALTER TABLE `system_user_program` ENABLE KEYS */;

-- Copiando estrutura para tabela consultorio.system_user_unit
CREATE TABLE IF NOT EXISTS `system_user_unit` (
  `id` int(11) NOT NULL,
  `system_user_id` int(11) DEFAULT NULL,
  `system_unit_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_user_id` (`system_user_id`),
  KEY `system_unit_id` (`system_unit_id`),
  CONSTRAINT `system_user_unit_ibfk_1` FOREIGN KEY (`system_user_id`) REFERENCES `system_user` (`id`),
  CONSTRAINT `system_user_unit_ibfk_2` FOREIGN KEY (`system_unit_id`) REFERENCES `system_unit` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela consultorio.system_user_unit: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `system_user_unit` DISABLE KEYS */;
INSERT INTO `system_user_unit` (`id`, `system_user_id`, `system_unit_id`) VALUES
	(3, 2, 1),
	(4, 2, 2),
	(5, 1, 1),
	(6, 1, 2);
/*!40000 ALTER TABLE `system_user_unit` ENABLE KEYS */;

-- Copiando estrutura para view consultorio.vw_calendario
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `vw_calendario` (
	`P_id` INT(11) NOT NULL,
	`P_nome` VARCHAR(200) NOT NULL COLLATE 'latin1_swedish_ci',
	`dtinicio` DATETIME NOT NULL,
	`dtfim` DATETIME NOT NULL,
	`M_id` INT(11) NOT NULL,
	`M_nome` VARCHAR(200) NOT NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;

-- Copiando estrutura para view consultorio.vw_calendario
-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `vw_calendario`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vw_calendario` AS SELECT paciente.id AS P_id, paciente.nome AS P_nome, c.dtinicio, c.dtfim, medico.id AS M_id, medico.nome AS M_nome 
FROM  consulta AS c
INNER JOIN medico ON c.medico_id = medico.id
INNER JOIN paciente ON c.paciente_id = paciente.id
ORDER BY c.paciente_id WITH CASCADED CHECK OPTION ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
