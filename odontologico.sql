/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : odontologico

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2019-10-29 14:45:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `atendimento`
-- ----------------------------
DROP TABLE IF EXISTS `atendimento`;
CREATE TABLE `atendimento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paciente_id` int(11) DEFAULT NULL,
  `dentista_id` int(11) DEFAULT NULL,
  `descricao` text,
  `data` timestamp NULL DEFAULT NULL,
  `hora` time DEFAULT '00:00:00',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_a_paciente_id` (`paciente_id`) USING BTREE,
  KEY `fk_a_dentista_id` (`dentista_id`) USING BTREE,
  CONSTRAINT `fk_a_dentista_id` FOREIGN KEY (`dentista_id`) REFERENCES `dentista` (`id`),
  CONSTRAINT `fk_a_paciente_id` FOREIGN KEY (`paciente_id`) REFERENCES `paciente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of atendimento
-- ----------------------------
INSERT INTO `atendimento` VALUES ('1', '1', '2', 'ADescricao1', '2019-10-21 21:41:28', '00:00:00');
INSERT INTO `atendimento` VALUES ('2', '1', '1', 'ADescricao2', '2019-10-21 21:42:01', '00:00:00');
INSERT INTO `atendimento` VALUES ('3', '2', '1', 'ADescricao3', '2019-10-21 21:48:22', '00:00:00');
INSERT INTO `atendimento` VALUES ('4', '1', '2', '', '0000-00-00 00:00:00', '10:10:00');
INSERT INTO `atendimento` VALUES ('5', '1', '2', 'TESTE', '0000-00-00 00:00:00', '10:10:00');
INSERT INTO `atendimento` VALUES ('6', '1', '2', 'TESTE', '0000-00-00 00:00:00', '10:10:00');
INSERT INTO `atendimento` VALUES ('7', '1', '2', 'TESTE2', '1977-01-08 00:00:00', '10:10:00');
INSERT INTO `atendimento` VALUES ('8', '2', '1', 'TESTE24', '1977-01-08 00:00:00', '10:10:00');
INSERT INTO `atendimento` VALUES ('9', '7', '1', 'hdghdghsdg', '2019-10-29 00:00:00', '18:30:00');

-- ----------------------------
-- Table structure for `atendimento_tipo`
-- ----------------------------
DROP TABLE IF EXISTS `atendimento_tipo`;
CREATE TABLE `atendimento_tipo` (
  `atendimentotipo_id` int(11) NOT NULL AUTO_INCREMENT,
  `atendimentonome` varchar(50) NOT NULL,
  PRIMARY KEY (`atendimentotipo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of atendimento_tipo
-- ----------------------------
INSERT INTO `atendimento_tipo` VALUES ('1', 'Rotina');
INSERT INTO `atendimento_tipo` VALUES ('2', 'Cirurgia');

-- ----------------------------
-- Table structure for `dentista`
-- ----------------------------
DROP TABLE IF EXISTS `dentista`;
CREATE TABLE `dentista` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `cro` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dentista
-- ----------------------------
INSERT INTO `dentista` VALUES ('1', 'Dentista 1', '111');
INSERT INTO `dentista` VALUES ('2', 'Denstita 2', '222');
INSERT INTO `dentista` VALUES ('3', 'Dentista 3', '1231236');

-- ----------------------------
-- Table structure for `estoque`
-- ----------------------------
DROP TABLE IF EXISTS `estoque`;
CREATE TABLE `estoque` (
  `estoque_id` int(11) NOT NULL,
  `numeroproduto` int(11) DEFAULT NULL,
  `nomeproduto` varchar(200) NOT NULL,
  `categoria` varchar(100) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `fornecedor` varchar(100) DEFAULT NULL,
  `vencimento` date NOT NULL,
  `complemento` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`estoque_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of estoque
-- ----------------------------

-- ----------------------------
-- Table structure for `paciente`
-- ----------------------------
DROP TABLE IF EXISTS `paciente`;
CREATE TABLE `paciente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `cpf` varchar(15) NOT NULL,
  `rg` varchar(15) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `celular` varchar(15) NOT NULL,
  `cep` varchar(15) NOT NULL,
  `endereco` varchar(100) NOT NULL,
  `bairro` varchar(50) NOT NULL,
  `nascimento` date NOT NULL,
  `cidade` varchar(30) NOT NULL,
  `uf` varchar(5) DEFAULT NULL,
  `doencabase` varchar(255) DEFAULT NULL,
  `alergia` varchar(255) DEFAULT NULL,
  `medicamentos` varchar(255) DEFAULT NULL,
  `cirurgia` varchar(255) DEFAULT NULL,
  `internacoes` varchar(255) DEFAULT NULL,
  `pa` varchar(255) DEFAULT NULL,
  `queixaprinc` varchar(255) DEFAULT NULL,
  `situacaoficha` varchar(10) NOT NULL,
  `orcamento` varchar(5) NOT NULL,
  `complemento` varchar(100) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of paciente
-- ----------------------------
INSERT INTO `paciente` VALUES ('1', 'Paciente 1', 'p1@email.com.br', '', '', '', '', '', '', '', '1983-03-11', '', '', '', '', '', '', '', '', '', 'ativa', '', '');
INSERT INTO `paciente` VALUES ('2', 'Paciente 2', 'p2@email.com', '', '', '', '', '', '', '', '0000-00-00', '', null, null, null, null, null, null, null, null, '', '', '');
INSERT INTO `paciente` VALUES ('3', 'paciente 3', 'p3@email.com', '', '', '', '', '', '', '', '0000-00-00', '', null, null, null, null, null, null, null, null, '', '', '');
INSERT INTO `paciente` VALUES ('7', 'Paciente 07', 'le22cerqueira@gmail.com', '123.654.789-00', '111111', '21983656429', '21983656429', 'rj', 'Rua São Miguel, 556 Casa 62', 'Tijuca', '2019-10-16', 'Rio de Janeiro', 'RJ', 'Não Existente', 'Não tem', 'Não', 'Só algumas', 'Uma vez', 'Não', 'Dor de Dente', 'inativa', 'Sim', '556 Casa 62');
INSERT INTO `paciente` VALUES ('8', 'Paciente 4', 'le22cerqueira@yahoo.com.br', '111.222.333-44', '010101', '21983656429', '21983656429', '20530-420', 'Rua São Miguel, 556 Casa 62', 'Tijuca', '2019-10-14', 'Rio de Janeiro', 'RJ', 'Não Existente', 'Sim', 'Não', 'Não', 'Não', 'Não', 'sem', 'ativa', 'Sim', '500 CASA 62');

-- ----------------------------
-- Table structure for `procedimento`
-- ----------------------------
DROP TABLE IF EXISTS `procedimento`;
CREATE TABLE `procedimento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `atendimento_id` int(11) DEFAULT NULL,
  `procedimento_tipo_id` int(11) DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `obs` varchar(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_p_procedimento_tipo_id` (`procedimento_tipo_id`) USING BTREE,
  KEY `fk_p_atendimento_id` (`atendimento_id`) USING BTREE,
  CONSTRAINT `fk_p_atendimento_id` FOREIGN KEY (`atendimento_id`) REFERENCES `atendimento` (`id`),
  CONSTRAINT `fk_p_procedimento_tipo_id` FOREIGN KEY (`procedimento_tipo_id`) REFERENCES `procedimento_tipo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of procedimento
-- ----------------------------
INSERT INTO `procedimento` VALUES ('1', '1', '1', '10', '');
INSERT INTO `procedimento` VALUES ('2', '1', '2', '20', '');
INSERT INTO `procedimento` VALUES ('3', '2', '3', '30', '');
INSERT INTO `procedimento` VALUES ('4', '2', '1', '10', '');
INSERT INTO `procedimento` VALUES ('5', null, null, '150', 'Paciente 2');
INSERT INTO `procedimento` VALUES ('6', null, null, '150', 'teste');
INSERT INTO `procedimento` VALUES ('7', null, null, '150', 'Paciente 2');

-- ----------------------------
-- Table structure for `procedimento_tipo`
-- ----------------------------
DROP TABLE IF EXISTS `procedimento_tipo`;
CREATE TABLE `procedimento_tipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of procedimento_tipo
-- ----------------------------
INSERT INTO `procedimento_tipo` VALUES ('1', 'Revisão');
INSERT INTO `procedimento_tipo` VALUES ('2', 'Limpeza');
INSERT INTO `procedimento_tipo` VALUES ('3', 'Canal');
INSERT INTO `procedimento_tipo` VALUES ('4', '');
INSERT INTO `procedimento_tipo` VALUES ('5', '');
INSERT INTO `procedimento_tipo` VALUES ('6', '');
INSERT INTO `procedimento_tipo` VALUES ('7', 'Restauração');
