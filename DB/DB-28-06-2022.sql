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
  `medico_id` varchar(255) NOT NULL,
  `dtinicio` datetime DEFAULT NULL,
  `dtfim` datetime DEFAULT NULL,
  `area_do_medico_nome` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela consultorio.consulta: ~15 rows (aproximadamente)
/*!40000 ALTER TABLE `consulta` DISABLE KEYS */;
INSERT INTO `consulta` (`id`, `paciente_id`, `medico_id`, `dtinicio`, `dtfim`, `area_do_medico_nome`) VALUES
	(1, '1', '2', '2022-06-09 17:15:00', '2022-06-09 17:30:00', 2),
	(2, '2', '3', '2022-06-10 16:50:00', '2022-06-10 17:20:00', 3),
	(3, '3', '4', '2022-06-13 14:50:00', '2022-06-13 15:20:00', 4),
	(4, '4', '5', '2022-06-14 15:50:00', '2022-06-14 16:20:00', 5),
	(5, '5', '6', '2022-06-15 16:10:00', '2022-06-15 16:40:00', 6),
	(6, '6', '7', '2022-06-16 13:10:00', '2022-06-16 13:40:00', 7),
	(7, '7', '8', '2022-06-17 15:50:00', '2022-06-17 16:20:00', 8),
	(8, '8', '9', '2022-06-22 14:50:00', '2022-06-22 15:20:00', 9),
	(9, '9', '10', '2022-06-23 14:50:00', '2022-06-23 15:20:00', 10),
	(10, '10', '1', '2022-06-24 14:40:00', '2022-06-24 15:10:00', 1),
	(11, '11', '2', '2022-06-28 11:48:00', '2022-06-28 18:00:00', 2),
	(12, '12', '3', '2022-06-21 14:50:00', '2022-06-21 15:20:00', 3),
	(13, '13', '4', '2022-06-20 14:50:00', '2022-06-20 15:20:00', 4),
	(14, '14', '5', '2022-06-29 14:00:00', '2022-06-29 14:30:00', 5),
	(15, '15', '6', '2022-06-27 12:50:00', '2022-06-27 13:20:00', 6);
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
  `dtinicio` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

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
	(8, '10', 3, '555,55', '2022-06-23 14:37:00');
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

-- Copiando dados para a tabela consultorio.system_access_log: ~71 rows (aproximadamente)
/*!40000 ALTER TABLE `system_access_log` DISABLE KEYS */;
INSERT INTO `system_access_log` (`id`, `sessionid`, `login`, `login_time`, `login_year`, `login_month`, `login_day`, `logout_time`, `impersonated`, `access_ip`, `impersonated_by`) VALUES
	(1, 'acr0o9gta22hs6eugdthbg5ncq', 'user', '2022-06-08 16:03:35', '2022', '06', '08', '2022-06-08 16:03:38', 'N', '::1', NULL),
	(2, 'rnue6j1ocp5bb7tl6q3dlvv8v3', 'admin', '2022-06-08 16:03:43', '2022', '06', '08', '2022-06-08 16:48:48', 'N', '::1', NULL),
	(3, 'kri1gaf2eu0miugfkhetvea9r6', 'admin', '2022-06-08 16:48:51', '2022', '06', '08', '2022-06-08 16:49:07', 'N', '::1', NULL),
	(4, 'gim21gss8hqp7eugul4f2nf4jv', 'user', '2022-06-08 16:49:11', '2022', '06', '08', '2022-06-08 16:49:15', 'N', '::1', NULL),
	(5, '7efas8867d8h2r8vbnsf2e7jeg', 'admin', '2022-06-08 18:33:28', '2022', '06', '08', '2022-06-08 18:33:38', 'N', '::1', NULL),
	(6, 'n6cje7qu4kiepmpbvlf7vo5loj', 'admin', '2022-06-08 18:35:39', '2022', '06', '08', '2022-06-08 19:40:44', 'N', '::1', NULL),
	(7, 'lj57pnquq93ipdhkrniuass7ho', 'admin', '2022-06-08 19:40:48', '2022', '06', '08', '2022-06-08 21:43:51', 'N', '::1', NULL),
	(8, '9i8s1qh6va1ct881akbsnqo2om', 'admin', '2022-06-08 21:43:55', '2022', '06', '08', NULL, 'N', '::1', NULL),
	(9, '6ub7rfjnc9blg0v3gsmjgqmrv5', 'admin', '2022-06-09 08:46:41', '2022', '06', '09', NULL, 'N', '::1', NULL),
	(10, 't0f4nhl1lokpeb74nbntu3hkek', 'admin', '2022-06-09 13:26:47', '2022', '06', '09', '2022-06-09 13:57:00', 'N', '::1', NULL),
	(70, '38f473igmc495ah68r3s1v9017', 'admin', '2022-06-27 12:00:53', '2022', '06', '27', '2022-06-27 13:35:18', 'N', '::1', NULL),
	(71, 'lqfjvvn44e2crpk2j1qp2mfv91', 'admin', '2022-06-27 13:35:35', '2022', '06', '27', NULL, 'N', '::1', NULL),
	(72, '7joa4e25cseud9jgdi07it4887', 'admin', '2022-06-28 11:47:46', '2022', '06', '28', '2022-06-28 12:11:28', 'N', '::1', NULL),
	(73, 'hgutosqqdc3lj76nj5u9c0d567', 'admin', '2022-06-28 12:11:34', '2022', '06', '28', '2022-06-28 12:54:03', 'N', '::1', NULL),
	(74, 'sjsb6geauk857div568it86klm', 'admin', '2022-06-28 12:54:06', '2022', '06', '28', '2022-06-28 15:24:40', 'N', '::1', NULL),
	(75, '033davoo6kce7449uqk0klnt5r', 'manuela', '2022-06-28 15:24:46', '2022', '06', '28', '2022-06-28 15:24:55', 'N', '::1', NULL),
	(76, 'fcnc2c5jfnnomoorojuljmvqnv', 'admin', '2022-06-28 15:24:58', '2022', '06', '28', NULL, 'N', '::1', NULL);
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

-- Copiando dados para a tabela consultorio.system_access_notification_log: ~71 rows (aproximadamente)
/*!40000 ALTER TABLE `system_access_notification_log` DISABLE KEYS */;
INSERT INTO `system_access_notification_log` (`id`, `login`, `email`, `ip_address`, `login_time`) VALUES
	(1, 'user', 'user@user.net', '::1', '2022-06-08 16:03:35'),
	(2, 'admin', 'admin@admin.net', '::1', '2022-06-08 16:03:43'),
	(3, 'admin', 'admin@admin.net', '::1', '2022-06-08 16:48:51'),
	(4, 'user', 'user@user.net', '::1', '2022-06-08 16:49:11'),
	(5, 'admin', 'admin@admin.net', '::1', '2022-06-08 18:33:28'),
	(6, 'admin', 'admin@admin.net', '::1', '2022-06-08 18:35:39'),
	(7, 'admin', 'admin@admin.net', '::1', '2022-06-08 19:40:48'),
	(8, 'admin', 'admin@admin.net', '::1', '2022-06-08 21:43:55'),
	(9, 'admin', 'admin@admin.net', '::1', '2022-06-09 08:46:41'),
	(10, 'admin', 'admin@admin.net', '::1', '2022-06-09 13:26:47'),
	(11, 'user', 'user@user.net', '::1', '2022-06-09 13:57:03'),
	(12, 'admin', 'admin@admin.net', '::1', '2022-06-09 13:58:47'),
	(13, 'admin', 'admin@admin.net', '::1', '2022-06-10 12:55:05'),
	(14, 'user', 'user@user.net', '::1', '2022-06-10 16:25:58'),
	(15, 'admin', 'admin@admin.net', '::1', '2022-06-10 16:26:14'),
	(65, 'admin', 'admin@admin.net', '::1', '2022-06-23 16:02:03'),
	(66, 'admin', 'admin@admin.net', '::1', '2022-06-23 16:02:54'),
	(67, 'manuela', 'manuelacamiladaluz@temavonfeccaosjc.com.br', '::1', '2022-06-23 16:03:06'),
	(68, 'admin', 'admin@admin.net', '::1', '2022-06-23 16:03:20'),
	(69, 'admin', 'admin@admin.net', '::1', '2022-06-24 12:54:19'),
	(70, 'admin', 'admin@admin.net', '::1', '2022-06-27 12:00:54'),
	(71, 'admin', 'admin@admin.net', '::1', '2022-06-27 13:35:35'),
	(72, 'admin', 'admin@admin.net', '::1', '2022-06-28 11:47:47'),
	(73, 'admin', 'admin@admin.net', '::1', '2022-06-28 12:11:34'),
	(74, 'admin', 'admin@admin.net', '::1', '2022-06-28 12:54:07'),
	(75, 'manuela', 'manuelacamiladaluz@temavonfeccaosjc.com.br', '::1', '2022-06-28 15:24:46'),
	(76, 'admin', 'admin@admin.net', '::1', '2022-06-28 15:24:58');
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

-- Copiando dados para a tabela consultorio.system_group_program: ~71 rows (aproximadamente)
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
	(73, 3, 53),
	(74, 3, 57),
	(75, 3, 58),
	(76, 2, 10),
	(77, 2, 12),
	(78, 2, 13),
	(79, 2, 16),
	(80, 2, 17),
	(81, 2, 18),
	(82, 2, 19),
	(83, 2, 20),
	(84, 2, 22),
	(85, 2, 23),
	(86, 2, 24),
	(87, 2, 25),
	(88, 2, 30),
	(89, 2, 48),
	(90, 2, 49),
	(91, 2, 50),
	(92, 2, 51),
	(93, 2, 52),
	(94, 2, 53),
	(95, 2, 54),
	(96, 2, 55),
	(97, 2, 56),
	(98, 2, 57),
	(99, 2, 58),
	(100, 2, 59),
	(101, 2, 60),
	(102, 1, 61),
	(103, 1, 62);
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

-- Copiando dados para a tabela consultorio.system_program: ~61 rows (aproximadamente)
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
	(62, 'Full Calendar Database View', 'FullCalendarDatabaseView');
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

-- Copiando dados para a tabela consultorio.system_sql_log: ~350 rows (aproximadamente)
/*!40000 ALTER TABLE `system_sql_log` DISABLE KEYS */;
INSERT INTO `system_sql_log` (`id`, `logdate`, `login`, `database_name`, `sql_command`, `statement_type`, `access_ip`, `transaction_id`, `log_trace`, `session_id`, `class_name`, `php_sapi`, `request_id`, `log_year`, `log_month`, `log_day`) VALUES
	(1, '2022-06-08 21:44:29', 'admin', 'permission', 'INSERT INTO system_program (id, name, controller) VALUES (48, \'Paciente List\', \'PacienteList\')', 'INSERT', '::1', '62a1426d06152', '#0 C:\\Users\\chrys\\Desktop\\usbwebserver\\root\\adianti-template-7.4.1\\Consultorio\\lib\\adianti\\database\\TTransaction.php(241): SystemSqlLogService->write(\'INSERT INTO sys...\')\n#1 C:\\Users\\chrys\\Desktop\\usbwebserver\\root\\adianti-template-7.4.1\\Consultorio\\lib\\adianti\\database\\TRecord.php(686): Adianti\\Database\\TTransaction::log(\'INSERT INTO sys...\')\n#2 C:\\Users\\chrys\\Desktop\\usbwebserver\\root\\adianti-template-7.4.1\\Consultorio\\app\\control\\admin\\SystemProgramForm.class.php(210): Adianti\\Database\\TRecord->store()\n#3 [internal function]: SystemProgramForm->onSave(Array)\n#4 C:\\Users\\chrys\\Desktop\\usbwebserver\\root\\adianti-template-7.4.1\\Consultorio\\lib\\adianti\\control\\TPage.php(96): call_user_func(Array, Array)\n#5 C:\\Users\\chrys\\Desktop\\usbwebserver\\root\\adianti-template-7.4.1\\Consultorio\\lib\\adianti\\control\\TPage.php(258): Adianti\\Control\\TPage->run()\n#6 C:\\Users\\chrys\\Desktop\\usbwebserver\\root\\adianti-template-7.4.1\\Consultorio\\lib\\adianti\\core\\AdiantiCoreApplication.php(96): Adianti\\Control\\TPage->show(Array)\n#7 C:\\Users\\chrys\\Desktop\\usbwebserver\\root\\adianti-template-7.4.1\\Consultorio\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#8 C:\\Users\\chrys\\Desktop\\usbwebserver\\root\\adianti-template-7.4.1\\Consultorio\\engine.php(66): TApplication::run()\n#9 {main}', '9i8s1qh6va1ct881akbsnqo2om', 'SystemProgramForm', 'apache2handler', '62a1426ce92c5', '2022', '06', '08'),
	(2, '2022-06-08 21:44:29', 'admin', 'permission', 'DELETE FROM system_group_program WHERE (system_program_id = 48)', 'DELETE', '::1', '62a1426d06152', '#0 C:\\Users\\chrys\\Desktop\\usbwebserver\\root\\adianti-template-7.4.1\\Consultorio\\lib\\adianti\\database\\TTransaction.php(241): SystemSqlLogService->write(\'DELETE FROM sys...\')\n#1 C:\\Users\\chrys\\Desktop\\usbwebserver\\root\\adianti-template-7.4.1\\Consultorio\\lib\\adianti\\database\\TRepository.php(562): Adianti\\Database\\TTransaction::log(\'DELETE FROM sys...\')\n#2 C:\\Users\\chrys\\Desktop\\usbwebserver\\root\\adianti-template-7.4.1\\Consultorio\\app\\model\\admin\\SystemProgram.class.php(82): Adianti\\Database\\TRepository->delete()\n#3 C:\\Users\\chrys\\Desktop\\usbwebserver\\root\\adianti-template-7.4.1\\Consultorio\\app\\control\\admin\\SystemProgramForm.class.php(214): SystemProgram->clearParts()\n#4 [internal function]: SystemProgramForm->onSave(Array)\n#5 C:\\Users\\chrys\\Desktop\\usbwebserver\\root\\adianti-template-7.4.1\\Consultorio\\lib\\adianti\\control\\TPage.php(96): call_user_func(Array, Array)\n#6 C:\\Users\\chrys\\Desktop\\usbwebserver\\root\\adianti-template-7.4.1\\Consultorio\\lib\\adianti\\control\\TPage.php(258): Adianti\\Control\\TPage->run()\n#7 C:\\Users\\chrys\\Desktop\\usbwebserver\\root\\adianti-template-7.4.1\\Consultorio\\lib\\adianti\\core\\AdiantiCoreApplication.php(96): Adianti\\Control\\TPage->show(Array)\n#8 C:\\Users\\chrys\\Desktop\\usbwebserver\\root\\adianti-template-7.4.1\\Consultorio\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#9 C:\\Users\\chrys\\Desktop\\usbwebserver\\root\\adianti-template-7.4.1\\Consultorio\\engine.php(66): TApplication::run()\n#10 {main}', '9i8s1qh6va1ct881akbsnqo2om', 'SystemProgramForm', 'apache2handler', '62a1426ce92c5', '2022', '06', '08'),
	(3, '2022-06-08 21:44:29', 'admin', 'permission', 'INSERT INTO system_group_program (system_program_id, system_group_id, id) VALUES (48, 1, 43)', 'INSERT', '::1', '62a1426d06152', '#0 C:\\Users\\chrys\\Desktop\\usbwebserver\\root\\adianti-template-7.4.1\\Consultorio\\lib\\adianti\\database\\TTransaction.php(241): SystemSqlLogService->write(\'INSERT INTO sys...\')\n#1 C:\\Users\\chrys\\Desktop\\usbwebserver\\root\\adianti-template-7.4.1\\Consultorio\\lib\\adianti\\database\\TRecord.php(686): Adianti\\Database\\TTransaction::log(\'INSERT INTO sys...\')\n#2 C:\\Users\\chrys\\Desktop\\usbwebserver\\root\\adianti-template-7.4.1\\Consultorio\\app\\model\\admin\\SystemProgram.class.php(51): Adianti\\Database\\TRecord->store()\n#3 C:\\Users\\chrys\\Desktop\\usbwebserver\\root\\adianti-template-7.4.1\\Consultorio\\app\\control\\admin\\SystemProgramForm.class.php(220): SystemProgram->addSystemGroup(Object(SystemGroup))\n#4 [internal function]: SystemProgramForm->onSave(Array)\n#5 C:\\Users\\chrys\\Desktop\\usbwebserver\\root\\adianti-template-7.4.1\\Consultorio\\lib\\adianti\\control\\TPage.php(96): call_user_func(Array, Array)\n#6 C:\\Users\\chrys\\Desktop\\usbwebserver\\root\\adianti-template-7.4.1\\Consultorio\\lib\\adianti\\control\\TPage.php(258): Adianti\\Control\\TPage->run()\n#7 C:\\Users\\chrys\\Desktop\\usbwebserver\\root\\adianti-template-7.4.1\\Consultorio\\lib\\adianti\\core\\AdiantiCoreApplication.php(96): Adianti\\Control\\TPage->show(Array)\n#8 C:\\Users\\chrys\\Desktop\\usbwebserver\\root\\adianti-template-7.4.1\\Consultorio\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#9 C:\\Users\\chrys\\Desktop\\usbwebserver\\root\\adianti-template-7.4.1\\Consultorio\\engine.php(66): TApplication::run()\n#10 {main}', '9i8s1qh6va1ct881akbsnqo2om', 'SystemProgramForm', 'apache2handler', '62a1426ce92c5', '2022', '06', '08'),
	(4, '2022-06-08 21:44:29', 'admin', 'permission', 'INSERT INTO system_group_program (system_program_id, system_group_id, id) VALUES (48, 2, 44)', 'INSERT', '::1', '62a1426d06152', '#0 C:\\Users\\chrys\\Desktop\\usbwebserver\\root\\adianti-template-7.4.1\\Consultorio\\lib\\adianti\\database\\TTransaction.php(241): SystemSqlLogService->write(\'INSERT INTO sys...\')\n#1 C:\\Users\\chrys\\Desktop\\usbwebserver\\root\\adianti-template-7.4.1\\Consultorio\\lib\\adianti\\database\\TRecord.php(686): Adianti\\Database\\TTransaction::log(\'INSERT INTO sys...\')\n#2 C:\\Users\\chrys\\Desktop\\usbwebserver\\root\\adianti-template-7.4.1\\Consultorio\\app\\model\\admin\\SystemProgram.class.php(51): Adianti\\Database\\TRecord->store()\n#3 C:\\Users\\chrys\\Desktop\\usbwebserver\\root\\adianti-template-7.4.1\\Consultorio\\app\\control\\admin\\SystemProgramForm.class.php(220): SystemProgram->addSystemGroup(Object(SystemGroup))\n#4 [internal function]: SystemProgramForm->onSave(Array)\n#5 C:\\Users\\chrys\\Desktop\\usbwebserver\\root\\adianti-template-7.4.1\\Consultorio\\lib\\adianti\\control\\TPage.php(96): call_user_func(Array, Array)\n#6 C:\\Users\\chrys\\Desktop\\usbwebserver\\root\\adianti-template-7.4.1\\Consultorio\\lib\\adianti\\control\\TPage.php(258): Adianti\\Control\\TPage->run()\n#7 C:\\Users\\chrys\\Desktop\\usbwebserver\\root\\adianti-template-7.4.1\\Consultorio\\lib\\adianti\\core\\AdiantiCoreApplication.php(96): Adianti\\Control\\TPage->show(Array)\n#8 C:\\Users\\chrys\\Desktop\\usbwebserver\\root\\adianti-template-7.4.1\\Consultorio\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#9 C:\\Users\\chrys\\Desktop\\usbwebserver\\root\\adianti-template-7.4.1\\Consultorio\\engine.php(66): TApplication::run()\n#10 {main}', '9i8s1qh6va1ct881akbsnqo2om', 'SystemProgramForm', 'apache2handler', '62a1426ce92c5', '2022', '06', '08'),
	(426, '2022-06-28 14:51:10', 'admin', 'permission', 'UPDATE consulta SET area_do_medico_nome = \'5\', paciente_id = \'14\', medico_id = \'5\', dtinicio = \'2022-06-29 14:05\', dtfim = \'2022-06-29 14:15\' WHERE (id = \'14\')', 'UPDATE', '::1', '62bb3f8eb67ff', '#0 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TTransaction.php(241): SystemSqlLogService->write(\'UPDATE consulta...\')\n#1 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TRecord.php(686): Adianti\\Database\\TTransaction::log(\'UPDATE consulta...\')\n#2 C:\\laragon\\www\\Consultorio\\lib\\adianti\\base\\AdiantiStandardFormTrait.php(72): Adianti\\Database\\TRecord->store()\n#3 [internal function]: Adianti\\Base\\TStandardForm->onSave(Array)\n#4 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(96): call_user_func(Array, Array)\n#5 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(258): Adianti\\Control\\TPage->run()\n#6 C:\\laragon\\www\\Consultorio\\lib\\adianti\\core\\AdiantiCoreApplication.php(96): Adianti\\Control\\TPage->show(Array)\n#7 C:\\laragon\\www\\Consultorio\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#8 C:\\laragon\\www\\Consultorio\\engine.php(66): TApplication::run()\n#9 {main}', 'sjsb6geauk857div568it86klm', 'ConsultaForm', 'apache2handler', '62bb3f8e88bdf', '2022', '06', '28'),
	(427, '2022-06-28 15:21:15', 'admin', 'permission', 'INSERT INTO system_program (id, name, controller) VALUES (62, \'Full Calendar Database View\', \'FullCalendarDatabaseView\')', 'INSERT', '::1', '62bb469ba1d03', '#0 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TTransaction.php(241): SystemSqlLogService->write(\'INSERT INTO sys...\')\n#1 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TRecord.php(686): Adianti\\Database\\TTransaction::log(\'INSERT INTO sys...\')\n#2 C:\\laragon\\www\\Consultorio\\app\\control\\admin\\SystemProgramForm.class.php(210): Adianti\\Database\\TRecord->store()\n#3 [internal function]: SystemProgramForm->onSave(Array)\n#4 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(96): call_user_func(Array, Array)\n#5 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(258): Adianti\\Control\\TPage->run()\n#6 C:\\laragon\\www\\Consultorio\\lib\\adianti\\core\\AdiantiCoreApplication.php(96): Adianti\\Control\\TPage->show(Array)\n#7 C:\\laragon\\www\\Consultorio\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#8 C:\\laragon\\www\\Consultorio\\engine.php(66): TApplication::run()\n#9 {main}', 'sjsb6geauk857div568it86klm', 'SystemProgramForm', 'apache2handler', '62bb469b84a1e', '2022', '06', '28'),
	(428, '2022-06-28 15:21:15', 'admin', 'permission', 'DELETE FROM system_group_program WHERE (system_program_id = 62)', 'DELETE', '::1', '62bb469ba1d03', '#0 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TTransaction.php(241): SystemSqlLogService->write(\'DELETE FROM sys...\')\n#1 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TRepository.php(562): Adianti\\Database\\TTransaction::log(\'DELETE FROM sys...\')\n#2 C:\\laragon\\www\\Consultorio\\app\\model\\admin\\SystemProgram.class.php(82): Adianti\\Database\\TRepository->delete()\n#3 C:\\laragon\\www\\Consultorio\\app\\control\\admin\\SystemProgramForm.class.php(214): SystemProgram->clearParts()\n#4 [internal function]: SystemProgramForm->onSave(Array)\n#5 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(96): call_user_func(Array, Array)\n#6 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(258): Adianti\\Control\\TPage->run()\n#7 C:\\laragon\\www\\Consultorio\\lib\\adianti\\core\\AdiantiCoreApplication.php(96): Adianti\\Control\\TPage->show(Array)\n#8 C:\\laragon\\www\\Consultorio\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#9 C:\\laragon\\www\\Consultorio\\engine.php(66): TApplication::run()\n#10 {main}', 'sjsb6geauk857div568it86klm', 'SystemProgramForm', 'apache2handler', '62bb469b84a1e', '2022', '06', '28'),
	(429, '2022-06-28 15:21:15', 'admin', 'permission', 'INSERT INTO system_group_program (system_program_id, system_group_id, id) VALUES (62, \'1\', 103)', 'INSERT', '::1', '62bb469ba1d03', '#0 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TTransaction.php(241): SystemSqlLogService->write(\'INSERT INTO sys...\')\n#1 C:\\laragon\\www\\Consultorio\\lib\\adianti\\database\\TRecord.php(686): Adianti\\Database\\TTransaction::log(\'INSERT INTO sys...\')\n#2 C:\\laragon\\www\\Consultorio\\app\\model\\admin\\SystemProgram.class.php(51): Adianti\\Database\\TRecord->store()\n#3 C:\\laragon\\www\\Consultorio\\app\\control\\admin\\SystemProgramForm.class.php(220): SystemProgram->addSystemGroup(Object(SystemGroup))\n#4 [internal function]: SystemProgramForm->onSave(Array)\n#5 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(96): call_user_func(Array, Array)\n#6 C:\\laragon\\www\\Consultorio\\lib\\adianti\\control\\TPage.php(258): Adianti\\Control\\TPage->run()\n#7 C:\\laragon\\www\\Consultorio\\lib\\adianti\\core\\AdiantiCoreApplication.php(96): Adianti\\Control\\TPage->show(Array)\n#8 C:\\laragon\\www\\Consultorio\\engine.php(27): Adianti\\Core\\AdiantiCoreApplication::run(\'1\')\n#9 C:\\laragon\\www\\Consultorio\\engine.php(66): TApplication::run()\n#10 {main}', 'sjsb6geauk857div568it86klm', 'SystemProgramForm', 'apache2handler', '62bb469b84a1e', '2022', '06', '28');
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
	(7, 3, 3),
	(9, 2, 2),
	(10, 1, 1);
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
	`dtinicio` DATETIME NULL,
	`dtfim` DATETIME NULL,
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
