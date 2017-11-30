-- MySQL dump 10.13  Distrib 5.7.17, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: aplicacao
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.26-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Prova`
--

DROP TABLE IF EXISTS `Prova`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Prova` (
  `codigo` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `codigo_usuario` bigint(20) unsigned DEFAULT NULL,
  `data_cri` text,
  `nmq` int(11) DEFAULT NULL,
  `categorias` text,
  PRIMARY KEY (`codigo`),
  KEY `fk_Prova_usuario_idx` (`codigo_usuario`),
  CONSTRAINT `fk_Prova_usuario` FOREIGN KEY (`codigo_usuario`) REFERENCES `usuario` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Prova`
--

LOCK TABLES `Prova` WRITE;
/*!40000 ALTER TABLE `Prova` DISABLE KEYS */;
INSERT INTO `Prova` VALUES (5,17,'26-11-2017 14:45:17',10,'Geografia, Historia, '),(6,17,'26-11-2017 14:45:57',4,'Fisica, Matematica, '),(7,17,'26-11-2017 14:56:01',10,'Biologia, Fisica, Geografia, Historia, Ingles, Matematica, Portugues, Quimica, Teste, teste2, '),(8,17,'26-11-2017 15:54:41',5,'Biologia, Fisica, Geografia, '),(11,17,'26-11-2017 17:53:16',4,'Fisica, ');
/*!40000 ALTER TABLE `Prova` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alternativa`
--

DROP TABLE IF EXISTS `alternativa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alternativa` (
  `codigo` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `alternativa` text,
  `codigo_questao` bigint(20) unsigned DEFAULT NULL,
  `valor` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `codigo_questao` (`codigo_questao`),
  CONSTRAINT `fk_alternativa_questao` FOREIGN KEY (`codigo_questao`) REFERENCES `questao` (`codigo`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=621 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alternativa`
--

LOCK TABLES `alternativa` WRITE;
/*!40000 ALTER TABLE `alternativa` DISABLE KEYS */;
INSERT INTO `alternativa` VALUES (253,'612',79,1),(254,'9',79,0),(255,' 1224',79,0),(256,' 2448',79,0),(257,'120',80,0),(258,' 100',80,0),(259,' 90',80,0),(260,' 130',80,1),(261,' 5359200',81,1),(262,'60',81,0),(263,' 267960',81,0),(264,'129600',81,0),(265,'4',82,0),(266,'3',82,0),(267,'6',82,0),(268,' 7',82,1),(269,'10',83,0),(270,'20',83,0),(271,'25',83,1),(272,' 30',83,0),(273,'864cm2',84,0),(274,'726cm2',84,0),(275,' 884cm2',84,1),(276,' 954cm2',84,0),(277,'3/51',85,0),(278,'5/53',85,1),(279,'5/676',85,0),(280,'5/689',85,0),(297,'12,5%',91,1),(298,' 25%',91,0),(299,'50%',91,0),(300,' 75%',91,0),(301,'9/38',92,0),(302,'1/2',92,0),(303,'9/20',92,1),(304,'1/4',92,0),(305,'ocupaÃ§Ã£o da regiÃ£o do Reno, desmilitarizada pelo Tratado de Versalhes.',93,0),(306,'anexaÃ§Ã£o do corredor polonÃªs, restabelecendo a relaÃ§Ã£o com a PrÃºssia.',93,0),(307,'ascensÃ£o de Hitler ao poder.',93,0),(308,'marchar sobre a Ãustria, a sua anexaÃ§Ã£o e a concretizaÃ§Ã£o da ideia do pangermanismo (reunificaÃ§Ã£o das etnias alemÃ£s).',93,1),(309,'russos tomam a iniciativa de anexar o territÃ³rio dos Estados bÃ¡lticos.',94,0),(310,'alemÃ£es invadem a regiÃ£o mediterrÃ¢nica da Ãsia.',94,0),(311,'japoneses atacam a base americana de Pearl Habor.',94,1),(312,' franceses, por determinaÃ§Ã£o de Petain, ocupam o sudeste da Ãsia.',94,0),(313,'Os Estados Unidos entraram na guerra apÃ³s o ataque japonÃªs a Pearl Habor.',95,0),(314,'O Eixo era formado pela Alemanha, ItÃ¡lia e JapÃ£o.',95,0),(315,' A guerra iniciou-se apÃ³s a invasÃ£o da Alemanha no territÃ³rio soviÃ©tico.',95,1),(316,'O evento final da II Guerra Mundial foram as bombas atÃ´micas de Hiroshima e Nagasaki.',95,0),(317,'Alguns setores do PTB, apÃ³s o suicÃ­dio de Vargas, conseguiram uma grande autonomia e defenderam a formaÃ§Ã£o de uma frente popular, a Frente Parlamentar Nacionalista, para neutralizar a ala de centro do Partido.',96,0),(318,'O fortalecimento da ARENA (AlianÃ§a Renovadora Nacional) junto Ã s classes trabalhadoras urbanas deslocou o PTB de sua posiÃ§Ã£o hegemÃ´nica e rompeu o equilÃ­brio polÃ­tico da dÃ©cada de 60.',96,0),(319,'O partido surgiu como instrumento de manipulaÃ§Ã£o do governo Vargas e buscou, em especial, conter o avanÃ§o do Partido Comunista Brasileiro no controle da classe trabalhadora.',96,0),(320,'O PTB manteve uma coligaÃ§Ã£o eleitoral histÃ³rica com o PSD (Partido Social DemocrÃ¡tico), que tinha sua base polÃ­tica no campo e era sustentado pelo localismo e coronelismo.',96,1),(321,'ambos colaboraram para suprimir qualquer fraude nas eleiÃ§Ãµes e faziam forte oposiÃ§Ã£o ao centralismo imperial.',97,0),(322,'as divergÃªncias entre ambos impediram perÃ­odos de conciliaÃ§Ã£o, gerando acentuada instabilidade no sistema parlamentar.',97,0),(323,' organizado de baixo para cima, o parlamentarismo brasileiro chocou-se com os partidos Liberal e Conservador de composiÃ§Ã£o elitista.',97,0),(324,'Liberal e Conservador, sem diferenÃ§as ideolÃ³gicas significativas, alternavam-se no poder, sustentando o parlamentarismo de fachada, manipulado pelo imperador',97,1),(325,'a uma polÃ­tica oficial e deliberada de povoamento, desejosa de fixar contingentes brancos em Ã¡reas estratÃ©gicas e atender grupos de proprietÃ¡rios na obtenÃ§Ã£o de mÃ£o de obra.',98,1),(326,'a uma polÃ­tica organizada pelos abolicionistas para substituir paulatinamente a mÃ£o de obra escrava das regiÃµes cafeeiras e evitar a escravizaÃ§Ã£o em novas Ã¡reas de povoamento no sul do paÃ­s.',98,0),(327,' Ã s polÃ­ticas militares, estabelecidas desde D. JoÃ£o VI, para a ocupaÃ§Ã£o das fronteiras do sul e para a constituiÃ§Ã£o de propriedades de criaÃ§Ã£o de gado destinadas Ã  exportaÃ§Ã£o de charque.',98,0),(328,'Ã  polÃ­tica do partido liberal para atrair novos grupos europeus para as Ã¡reas agrÃ­colas e implantar um meio alternativo de produÃ§Ã£o, baseado em minifÃºndios.',98,0),(329,'em ambos, a guerra Ã© entendida como inevitÃ¡vel e injusta.',99,0),(330,'para Hobbes, a paz Ã© inerente Ã  civilizaÃ§Ã£o e, segundo o texto II, ela nÃ£o Ã© um valor absoluto.',99,1),(331,'de acordo com Hobbes, a guerra Ã© um valor absoluto e, segundo o texto II, a paz Ã© sempre melhor que a guerra.',99,0),(332,'em ambos, a guerra ou a paz sÃ£o boas quando o fim Ã© justo.',99,0),(333,'Mantinha uma nÃ­tida vinculaÃ§Ã£o entre a polÃ­tica e os princÃ­pios morais do cristianismo.',100,0),(334,'Apresentava uma clara defesa da representaÃ§Ã£o popular e dos ideais democrÃ¡ticos.',100,0),(335,'Servia de Base para a ofensiva da Igreja em confronto com os poderes civis na ItÃ¡lia.',100,0),(336,'Sustentava que o objetivo de um governante era a conquista e a manutenÃ§Ã£o do poder.',100,1),(337,'A economia de guerra levou a um intervencionismo de Estado sem precedentes; a â€œuniÃ£o sagradaâ€ foi invocada em favor de sÃ©rias restriÃ§Ãµes Ã s liberdades civis e polÃ­ticas e, em funÃ§Ã£o da guerra recÃ©m-terminada, eclodiram em 1920 graves dificuldades econÃ´micas que abalaram os paÃ­ses liberais sobretudo atravÃ©s da inflaÃ§Ã£o.',101,0),(338,'Em todos os paÃ­ses, a economia de guerra forÃ§ou a abolir os sindicatos operÃ¡rios, a confiscar as fortunas privadas e a fechar os Parlamentos, pondo assim em xeque os pilares bÃ¡sicos da sociedade liberal.',101,0),(339,'Durante a guerra, foi preciso instaurar regimes autoritÃ¡rios e ditatoriais em paÃ­ses antes liberais como a FranÃ§a e a Inglaterra, em um prenÃºncio do fascismo ainda por vir.',101,0),(340,'A guerra transformou Estados antes liberais em gestores de uma economia militarizada que utilizou de novo o trabalho servil para a confecÃ§Ã£o de armas e muniÃ§Ãµes, em flagrante desrespeito Ã s liberdades individuais.',101,1),(341,'Eixo, formado por Alemanha, ItÃ¡lia e JapÃ£o; e os Aliados, composto por FranÃ§a, Inglaterra e Estados Unidos.',102,0),(342,'TrÃ­plice AlianÃ§a, composta pela Alemanha, Ãustria-Hungria e ItÃ¡lia; e a TrÃ­plice Entente, formada pela FranÃ§a, Inglaterra e RÃºssia.',102,1),(343,'Eixo, formado por Alemanha, ItÃ¡lia e JapÃ£o; e TrÃ­plice Entente, formada pela FranÃ§a, Inglaterra e RÃºssia.',102,0),(344,'TrÃ­plice AlianÃ§a, composta pela Alemanha, Ãustria-Hungria e ItÃ¡lia; e os Aliados, composto por FranÃ§a, Inglaterra e Estados Unidos.',102,0),(345,'NaCl',103,0),(346,'Mg(Cl)2',103,0),(347,'CaO',103,0),(348,'HCl',103,1),(349,'Mg3N2',104,1),(350,'Mg2N3',104,0),(351,' MgN3',104,0),(352,'MgN2',104,0),(353,'dissolvidos em Ã¡gua, formam soluÃ§Ãµes Ã¡cidas.',105,0),(354,'dissolvem-se bem em gasolina, diminuindo sua octanagem.',105,0),(355,'fundidos (isto Ã©, no estado lÃ­quido), conduzem corrente elÃ©trica.',105,1),(356,'possuem baixos pontos de fusÃ£o e ebuliÃ§Ã£o.',105,0),(361,'3p3',107,0),(362,'3p5',107,0),(363,'4s2',107,0),(364,'4p6',107,1),(365,'2 â€“ 8 â€“ 10 â€“ 2.',108,0),(366,'2 â€“ 8 â€“ 12.',108,0),(367,'2 â€“ 8 â€“ 8 â€“ 4.',108,0),(368,'2 â€“ 8 â€“ 18 â€“ 18 â€“ 8 â€“ 2. ',108,1),(369,'14',109,0),(370,'16',109,0),(371,'24',109,1),(372,' 26',109,0),(373,'80, 80, 200.',110,0),(374,'80, 200, 80.',110,0),(375,'80, 120, 80.',110,1),(376,'200, 120, 200.',110,0),(377,'35.',111,0),(378,'36.',111,0),(379,'37.',111,1),(380,' 49.',111,0),(381,'83 e 209.',112,1),(382,'83 e 43.',112,0),(383,'83 e 83.',112,0),(384,'209 e 83.',112,0),(385,'18',113,0),(386,'2',113,0),(387,'6',113,1),(388,'6âˆš3',113,0),(389,'A velocidade de RevoluÃ§Ã£o dos planetas Ã© constante.',114,0),(390,'Quanto maior a distÃ¢ncia de um planeta ao Sol, mais rÃ¡pido ele se movimenta.',114,0),(391,'A velocidade de rotaÃ§Ã£o de um planeta nÃ£o depende da sua distÃ¢ncia ao Sol.',114,0),(392,'Quanto menor a distÃ¢ncia de um planeta ao Sol, mais rÃ¡pido ele se movimenta.',114,1),(393,'Todos os imÃ£s possuem dois polos, o polo norte e o sul. O polo sul Ã© o positivo de um imÃ£, enquanto o norte Ã© negativo.',115,0),(394,'Ao quebrar um imÃ£, os seus polos sÃ£o separados, passando a existir um imÃ£ negativo e outro positivo.',115,0),(395,'Ao aproximar os polos iguais de um imÃ£, eles repelem-se. Quando polos diferentes aproximam-se, eles atraem-se.',115,1),(396,'Os materiais ferromagnÃ©ticos sÃ£o os que nÃ£o podem ser atraÃ­dos por imÃ£s.',115,0),(397,'O polo norte geogrÃ¡fico estÃ¡ exatamente sobre o polo sul magnÃ©tico, e o sul geogrÃ¡fico estÃ¡ na mesma posiÃ§Ã£o que o norte magnÃ©tico.',116,0),(398,'O polo norte geogrÃ¡fico estÃ¡ exatamente sobre o polo norte magnÃ©tico, e o sul geogrÃ¡fico estÃ¡ na mesma posiÃ§Ã£o que o sul magnÃ©tico.',116,0),(399,'O polo norte magnÃ©tico estÃ¡ prÃ³ximo do polo sul geogrÃ¡fico, e o polo sul magnÃ©tico estÃ¡ prÃ³ximo ao polo norte geogrÃ¡fico.',116,1),(400,'O polo norte magnÃ©tico estÃ¡ prÃ³ximo do polo norte geogrÃ¡fico, e o polo sul magnÃ©tico estÃ¡ prÃ³ximo do polo sul geogrÃ¡fico.',116,0),(401,'1,2 . 10-5',117,0),(402,'1,8 . 10-4',117,0),(403,'2,0 . 10-4',117,0),(404,'2,4 . 10-4',117,1),(405,'de repulsÃ£o e igual a 6,4N.',118,1),(406,'de repulsÃ£o e igual a 1,6N.',118,0),(407,'de atraÃ§Ã£o e igual a 6,4N',118,0),(408,'de atraÃ§Ã£o e igual a 1,6N',118,0),(409,'A forÃ§a de interaÃ§Ã£o entre duas cargas Ã© proporcional Ã  massa que elas possuem;',119,0),(410,'A forÃ§a elÃ©trica entre duas cargas independe da distÃ¢ncia entre elas;',119,0),(411,'A forÃ§a de interaÃ§Ã£o entre duas cargas elÃ©tricas Ã© diretamente proporcional ao produto entre as cargas;',119,1),(412,'A forÃ§a eletrostÃ¡tica Ã© diretamente proporcional Ã  distÃ¢ncia entre as cargas;',119,0),(413,'105 m',120,0),(414,' 205 m',120,0),(415,'305 m',120,1),(416,'405 m',120,0),(417,'430 s',121,1),(418,'320 s',121,0),(419,'450 s',121,0),(420,'630 s',121,0),(421,'0,5 km',122,0),(422,'1,5 km',122,1),(423,'2 km',122,0),(424,'2,5 km',122,0),(425,'Ã s diferenÃ§as entre os nÃ­veis de ajustamento da polÃ­tica internacional a uma ordem de homogeneizaÃ§Ã£o cultural;',123,0),(426,'Ã  resistÃªncia dos movimentos antiglobalizaÃ§Ã£o frente aos avanÃ§os do sistema capitalista em escala mundial.',123,0),(427,'Ã  forma desigual de difusÃ£o e alcance do processo de mundializaÃ§Ã£o econÃ´mica e polÃ­tica.',123,1),(428,'Ã  impossibilidade da globalizaÃ§Ã£o atingir todo o planeta',123,0),(429,'A globalizaÃ§Ã£o Ã© um processo exclusivamente baseado no desenvolvimento das novas tÃ©cnicas de informaÃ§Ã£o e sua origem estÃ¡ diretamente relacionada com a difusÃ£o e universalizaÃ§Ã£o do uso da internet, que se deu a partir do final da dÃ©cada de 1990.',124,0),(430,'Entre as caracterÃ­sticas prÃ³prias da globalizaÃ§Ã£o temos a alteraÃ§Ã£o profunda na divisÃ£o internacional do trabalho, em que a distribuiÃ§Ã£o das funÃ§Ãµes produtivas tende a se concentrar cada vez mais em poucos paÃ­ses, como Ã© o caso dos Estados Unidos e do JapÃ£o.',124,0),(431,'Sobre as aÃ§Ãµes que asseguram a emergÃªncia do mercado global, o autor estÃ¡ se referindo Ã  doutrina econÃ´mica neoliberal que, entre outros princÃ­pios, defende o fortalecimento do Estado e a intervenÃ§Ã£o estatal como reguladora direta dos mercados â€“ industrial, comercial e financeiro.',124,0),(432,'Atualmente, as relaÃ§Ãµes econÃ´micas mundiais, compreendendo a dinÃ¢mica dos meios de produÃ§Ã£o, das forÃ§as produtivas, da tecnologia, da divisÃ£o internacional do trabalho e do mercado mundial, sÃ£o amplamente influenciadas pelas exigÃªncias das empresas, corporaÃ§Ãµes ou conglomerados multinacionais.',124,1),(433,'A difusÃ£o dos comÃ©rcios localizados em oposiÃ§Ã£o Ã s corporaÃ§Ãµes internacionais.',125,1),(434,'A formaÃ§Ã£o de blocos econÃ´micos regionais.',125,0),(435,'A propagaÃ§Ã£o do inglÃªs como idioma universal.',125,0),(436,'O encolhimento do mundo graÃ§as Ã  reduÃ§Ã£o das dificuldades de comunicaÃ§Ã£o e transporte entre as diferentes regiÃµes do planeta.',125,0),(437,'surgimento do dinheiro.',126,0),(438,'instalaÃ§Ã£o da indÃºstria avanÃ§ada em nÃ­vel global.',126,0),(439,'consolidaÃ§Ã£o da GlobalizaÃ§Ã£o.',126,1),(440,'transformaÃ§Ã£o do capitalismo financeiro em capitalismo industrial.',126,0),(441,'UniÃ£o Europeia',127,0),(442,'Mercosul',127,0),(443,'BRICS',127,1),(444,' Comunidade Andina',127,0),(445,'A projeÃ§Ã£o azimutal fornece uma visÃ£o eurocÃªntrica do mundo e, por isso, ela nÃ£o Ã© mais utilizada.',128,0),(446,'As distorÃ§Ãµes da representaÃ§Ã£o, nas projeÃ§Ãµes cilÃ­ndricas, sÃ£o maiores no Equador e menores nos polos.',128,0),(447,'A projeÃ§Ã£o de Peters Ã© a Ãºnica que nÃ£o pretende privilegiar nenhum continente, porque ela reproduz rigorosamente a realidade.',128,0),(448,'As projeÃ§Ãµes cartogrÃ¡ficas permitem que, na construÃ§Ã£o dos mapas temÃ¡ticos, os meridianos e os paralelos terrestres sejam transformados de uma realidade tridimensional para uma realidade bidimensional.',128,1),(449,'ProjeÃ§Ã£o CÃ´nica',129,0),(450,'ProjeÃ§Ã£o CilÃ­ndrica',129,1),(451,'ProjeÃ§Ã£o Azimutal',129,0),(452,'ProjeÃ§Ã£o Equatorial',129,0),(453,' A Primeira RevoluÃ§Ã£o Industrial, iniciada na Inglaterra, representou um momento importante, no qual foi intensificada a mecanizaÃ§Ã£o e foi introduzida a produÃ§Ã£o em sÃ©rie.',130,0),(454,'A localizaÃ§Ã£o das novas regiÃµes industriais, chamadas de tecnopolos, nÃ£o Ã© definida pela proximidade das matÃ©rias-primas, e sim pela proximidade de importantes centros de pesquisa e ensino universitÃ¡rios.',130,0),(455,'A passagem da Primeira para a Segunda RevoluÃ§Ã£o Industrial foi o marco da introduÃ§Ã£o do petrÃ³leo enquanto principal fonte de energia e do desenvolvimento da indÃºstria automobilÃ­stica.',130,0),(456,'A Terceira RevoluÃ§Ã£o Industrial Ã© tambÃ©m chamada de revoluÃ§Ã£o tÃ©cnico-cientÃ­fica e Ã© marcada pelo desenvolvimento da informÃ¡tica, robÃ³tica, telecomunicaÃ§Ãµes e microeletrÃ´nica, tendo se iniciado, entre outros paÃ­ses, no JapÃ£o.',130,1),(457,'DomÃ­nio de tecnologias avanÃ§adas',131,0),(458,'DescentralizaÃ§Ã£o industrial',131,0),(459,'Procura por mÃ£o de obra barata',131,1),(460,'DescentralizaÃ§Ã£o cientÃ­fica e administrativa',131,0),(461,'Chapada Diamantina, Brasil',132,0),(462,'Parque Nacional de Yellowstone, Estados Unidos.',132,0),(463,'Deserto do Saara, Ãfrica.',132,0),(464,'Cordilheira dos Andes, AmÃ©rica do Sul.',132,1),(465,'efeito estufa.',133,0),(466,'ilhas de calor.',133,0),(467,'inversÃ£o tÃ©rmica.',133,1),(468,'chuva Ã¡cida.',133,0),(469,'propormos - Mantenha - entretesse',134,0),(470,'propusermos - MantÃ©m - entretesse',134,0),(471,'propormos - MantÃ©m - entretivesse',134,0),(472,'propusermos - MantÃ©m â€“ entretivesse',134,1),(473,' Ele, que sempre vivera Ã³rfÃ£o de afeiÃ§Ãµes legÃ­timas e duradouras, como entÃ£o seria feliz!...',135,0),(474,'O quinhÃ£o de ternura que a ela pretendia, estava intacto no coraÃ§Ã£o do filho.',135,0),(475,'Os dois quadros tinham sido ambos bordados por Mariana e Ana Rosa, mÃ£e e filha.',135,1),(476,'E dizia as inÃºmeras viagens que tinha feito atÃ© ali; contava episÃ³dios a respeito do boqueirÃ£o',135,0),(477,'futuro do subjuntivo, presente do subjuntivo',136,0),(478,'infinitivo, pretÃ©rito imperfeito do subjuntivo',136,0),(479,'infinitivo, presente do subjuntivo',136,0),(480,'gerÃºndio, pretÃ©rito perfeito do subjuntivo.',136,1),(481,'Ã‰ preciso que vocÃª faÃ§a a liÃ§Ã£o.',137,0),(482,'Se vocÃª fizer a liÃ§Ã£o, tirarÃ¡ suas dÃºvidas sobre a aula.',137,0),(483,'ConvÃ©m que vocÃª faÃ§a a liÃ§Ã£o.',137,0),(484,'Ã‰ bom que vocÃª faz a liÃ§Ã£o de casa.',137,1),(485,' nÃ£o representa o metal precioso e sim um tipo vulgar de metal sem valor.',138,0),(486,'os nomes dos naipes das cartas sÃ³ podem ser usados neste nÃºmero.',138,1),(487,'estÃ¡ sendo usada num substantivo prÃ³prio.',138,0),(488,'tem que concordar com o cardinal sete, que exige plural.',138,0),(489,' fidalgos â€“ girassÃ³is - mandachuvas.',139,0),(490,'beija-flores â€“ alto-falantes â€“ pontapÃ©s.',139,0),(491,'furtas-cores â€“ beijas-flor â€“ cidade â€“ satÃ©lites.',139,1),(492,'elementos-chaves â€“ licenÃ§as-prÃªmio â€“ girassÃ³is.',139,0),(493,'coser',140,0),(494,'olhar',140,0),(495,'haver',140,1),(496,' vir ',140,0),(497,'expressado, tinto e enxugado',141,0),(498,'expresso, tingido e enxugado',141,0),(499,'expressado, tingido e enxuto',141,0),(500,'expresso, tinto e enxuto.',141,1),(501,'ametÃ¡bolos.',142,1),(502,'hemimetÃ¡bolos.',142,0),(503,'holometÃ¡bolos.',142,0),(504,'isometÃ¡bolos.',142,0),(505,'borboleta, gafanhoto e mosca.',143,0),(506,'mosca, traÃ§a-do-livro e borboleta.',143,0),(507,'traÃ§a-do-livro, gafanhoto e borboleta.',143,1),(508,'traÃ§a-do-livro, borboleta e gafanhoto.',143,0),(509,'holometÃ¡bolos.',144,0),(510,'anisometÃ¡bolos.',144,0),(511,'ametÃ¡bolos.',144,0),(512,'hemimetÃ¡bolos.',144,1),(513,'Carbono, hidrogÃªnio e hÃ©lio.',145,0),(514,'Carbono, oxigÃªnio e hidrogÃªnio.',145,1),(515,'Carbono, cÃ¡lcio e potÃ¡ssio.',145,0),(516,'SÃ³dio, potÃ¡ssio e carbono.',145,0),(521,'O amido nÃ£o Ã© um carboidrato.',147,0),(522,'O amido Ã© um dissacarÃ­deo, assim como a frutose.',147,0),(523,'O amido Ã© um monossacarÃ­deo, assim como a glicose.',147,0),(524,'O amido Ã© um polissacarÃ­deo, assim como o glicogÃªnio e a celulose.',147,1),(529,'amido e celulose.',149,0),(530,'sacarose e celulose.',149,0),(531,'frutose e glicose',149,0),(532,'sacarose e lactose.',149,1),(533,'PrÃ³fase, G1, S e G2.',150,0),(534,'G1, S, G2 e MetÃ¡fase.',150,0),(535,'PrÃ³fase, metÃ¡fase, telÃ³fase e anÃ¡fase.',150,0),(536,'PrÃ³fase, metÃ¡fase, anÃ¡fase e telÃ³fase.',150,1),(537,'prÃ³fase.',151,0),(538,'fragmoplasto.',151,0),(539,'cariocinese.',151,0),(540,'citocinese.',151,1),(545,'NucleocapsÃ­dio.',153,0),(546,'Envelope viral.',153,0),(547,'Interferon.',153,0),(548,'CapsÃ­deo.',153,1),(549,'virulentas.',154,0),(550,'ligantes.',154,1),(551,'conectoras.',154,0),(552,'carregadoras.',154,0),(553,'pentose, Ã¡cido fosfÃ³rico e desoxirribose.',155,0),(554,'glicÃ­dio, Ã¡cido clorÃ­drico e bases nitrogenadas.',155,0),(555,' ribose, Ã¡cido nucleico e desoxirribose.',155,0),(556,'pentose, Ã¡cido fosfÃ³rico e bases nitrogenadas.',155,1),(557,'adenina.',156,0),(558,'citosina.',156,0),(559,'guanina.',156,0),(560,'uracila.',156,1),(561,'ligaÃ§Ãµes metÃ¡licas.',157,0),(562,'ligaÃ§Ãµes de hidrogÃªnio.',157,1),(563,'ligaÃ§Ãµes iÃ´nicas.',157,0),(564,'ligaÃ§Ãµes polipeptÃ­dicas.',157,0),(565,'na pentose e nas bases nitrogenadas.',158,1),(566,'no fosfato e nas bases nitrogenadas.',158,0),(567,'na pentose e no fosfato.',158,0),(568,'na pentose, nas bases nitrogenadas e no fosfato.',158,0),(573,'123',160,1),(574,'123',160,0),(575,'123',160,0),(576,'123',160,0),(577,'123',161,1),(578,'123',161,0),(579,'123',161,0),(580,'123',161,0),(581,'234',162,1),(582,'123',162,0),(583,'123',162,0),(584,'123',162,0),(585,'123',163,1),(586,'545',163,0),(587,'345',163,0),(588,'123',163,0),(589,'123',164,1),(590,'555',164,0),(591,'123',164,0),(592,'12314',164,0),(593,'123',165,1),(594,'5555',165,0),(595,'123123',165,0),(596,'12312',165,0),(597,'1234',166,1),(598,'55234',166,0),(599,'23123',166,0),(600,'124124',166,0),(601,'1231',167,0),(602,'55243',167,1),(603,'23423',167,0),(604,'123123',167,0),(605,'5234',168,1),(606,'12312',168,0),(607,'52342',168,0),(608,'234234',168,0),(613,'123',170,1),(614,'2342',170,0),(615,'235',170,0),(616,'2342',170,0),(617,'tseste',171,1),(618,'tdf',171,0),(619,'er',171,0),(620,'123',171,0);
/*!40000 ALTER TABLE `alternativa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aluno`
--

DROP TABLE IF EXISTS `aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aluno` (
  `codigo` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno`
--

LOCK TABLES `aluno` WRITE;
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
INSERT INTO `aluno` VALUES (1,'Joao Roberto'),(2,'Ana Maria'),(3,'Jose carlos'),(4,'Antonio silva'),(5,'Carlos Mendez'),(6,'Maria Aparecida'),(7,'Gaspar Alves'),(8,'Balthazar Pereira'),(9,'Belchior Ferreira'),(10,'Madalena Romanoel'),(11,'Fernanda Oliveira'),(12,'Milton Santos'),(13,'Pierre Dulaine'),(14,'Elaine Silva'),(15,'Pedro Antonio'),(16,'Lucas Henrique'),(17,'Aline Monique'),(18,'Erick Humberto'),(19,'Isabela Rodrigues '),(20,'Carlos Leandro'),(21,'teste123');
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aluno_disciplina`
--

DROP TABLE IF EXISTS `aluno_disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aluno_disciplina` (
  `codigo_aluno` bigint(20) unsigned NOT NULL,
  `codigo_disciplina` bigint(20) unsigned NOT NULL,
  `matricula` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`codigo_aluno`,`codigo_disciplina`),
  UNIQUE KEY `matricula` (`matricula`),
  KEY `codigo_aluno` (`codigo_aluno`,`codigo_disciplina`),
  KEY `fk_disciplina_aluno` (`codigo_disciplina`),
  CONSTRAINT `fk_aluno_disciplina` FOREIGN KEY (`codigo_aluno`) REFERENCES `aluno` (`codigo`) ON DELETE CASCADE,
  CONSTRAINT `fk_disciplina_aluno` FOREIGN KEY (`codigo_disciplina`) REFERENCES `disciplina` (`codigo`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno_disciplina`
--

LOCK TABLES `aluno_disciplina` WRITE;
/*!40000 ALTER TABLE `aluno_disciplina` DISABLE KEYS */;
INSERT INTO `aluno_disciplina` VALUES (1,1,1),(1,2,2),(1,3,3),(2,1,4),(2,2,5),(2,3,6),(3,1,7),(3,2,8),(3,3,9),(4,1,10),(4,2,11),(4,3,12),(5,1,13),(5,2,14),(5,3,15),(6,1,16),(6,2,17),(6,3,18),(7,1,19),(7,2,20),(7,3,21),(8,1,22),(8,2,23),(8,3,24),(9,1,25),(9,2,26),(9,3,27),(10,1,28),(10,2,29),(10,3,30),(11,1,31),(11,2,32),(11,3,33),(12,1,34),(12,2,35),(12,3,36),(13,1,37),(13,2,38),(14,1,39),(14,2,40),(15,1,41),(15,2,42),(16,1,43),(16,2,44),(17,1,45),(18,1,46),(19,1,47),(20,1,48),(21,4,49);
/*!40000 ALTER TABLE `aluno_disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `codigo` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(40) DEFAULT NULL,
  `descricao` text,
  `codigo_usuario` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `codigo_usuario` (`codigo_usuario`),
  CONSTRAINT `fk_categoria_usuario` FOREIGN KEY (`codigo_usuario`) REFERENCES `usuario` (`codigo`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (75,'Historia','teste',17),(76,'Geografia','teste2',17),(77,'Matematica','teste3',17),(78,'Portugues','teste4',17),(79,'Fisica','aaaaa',17),(80,'Quimica','bbbbbbbbbbb',17),(81,'Biologia','ccccccc',17),(82,'Ingles','ddddd',17),(83,'teste22','123',15),(84,'teste33','123',15),(85,'teste44','123',15),(86,'teste123','123',16),(89,'teste','123',18),(90,'Teste','123',17),(91,'teste2','123',17);
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disciplina`
--

DROP TABLE IF EXISTS `disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disciplina` (
  `codigo` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nome` text,
  `codigo_usuario` bigint(20) unsigned DEFAULT NULL,
  `qtdaulas` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `codigo_usuario` (`codigo_usuario`),
  CONSTRAINT `Fk_disciplina_usuario` FOREIGN KEY (`codigo_usuario`) REFERENCES `usuario` (`codigo`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disciplina`
--

LOCK TABLES `disciplina` WRITE;
/*!40000 ALTER TABLE `disciplina` DISABLE KEYS */;
INSERT INTO `disciplina` VALUES (1,'Matematica',14,0),(2,'Historia',14,171),(3,'Geografia',14,43),(4,'teste',14,32);
/*!40000 ALTER TABLE `disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frequencia`
--

DROP TABLE IF EXISTS `frequencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frequencia` (
  `codigo` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `qdaulas` int(11) DEFAULT NULL,
  `dataAula` date DEFAULT NULL,
  `matricula` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `matricula` (`matricula`),
  CONSTRAINT `fk_fr_ad` FOREIGN KEY (`matricula`) REFERENCES `aluno_disciplina` (`matricula`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=220 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frequencia`
--

LOCK TABLES `frequencia` WRITE;
/*!40000 ALTER TABLE `frequencia` DISABLE KEYS */;
INSERT INTO `frequencia` VALUES (18,5,'2016-09-19',49),(19,63,'2016-09-19',5),(20,0,'2016-09-19',11),(21,63,'2016-09-19',23),(22,63,'2016-09-19',26),(23,0,'2016-09-19',14),(24,63,'2016-09-19',40),(25,0,'2016-09-19',32),(26,63,'2016-09-19',20),(27,63,'2016-09-19',2),(28,63,'2016-09-19',8),(29,0,'2016-09-19',44),(30,63,'2016-09-19',29),(31,0,'2016-09-19',17),(32,0,'2016-09-19',35),(33,63,'2016-09-19',42),(34,0,'2016-09-19',38),(35,4,'2016-09-20',5),(36,0,'2016-09-20',11),(37,0,'2016-09-20',23),(38,4,'2016-09-20',26),(39,4,'2016-09-20',14),(40,4,'2016-09-20',40),(41,0,'2016-09-20',32),(42,4,'2016-09-20',20),(43,4,'2016-09-20',2),(44,4,'2016-09-20',8),(45,4,'2016-09-20',44),(46,4,'2016-09-20',29),(47,4,'2016-09-20',17),(48,4,'2016-09-20',35),(49,4,'2016-09-20',42),(50,0,'2016-09-20',38),(51,4,'2016-09-20',5),(52,4,'2016-09-20',11),(53,4,'2016-09-20',23),(54,4,'2016-09-20',26),(55,4,'2016-09-20',14),(56,4,'2016-09-20',40),(57,4,'2016-09-20',32),(58,4,'2016-09-20',20),(59,4,'2016-09-20',2),(60,4,'2016-09-20',8),(61,4,'2016-09-20',44),(62,4,'2016-09-20',29),(63,4,'2016-09-20',17),(64,4,'2016-09-20',35),(65,4,'2016-09-20',42),(66,4,'2016-09-20',38),(67,0,'2016-09-20',49),(68,0,'2016-09-20',6),(69,5,'2016-09-20',12),(70,5,'2016-09-20',24),(71,5,'2016-09-20',27),(72,5,'2016-09-20',15),(73,0,'2016-09-20',33),(74,5,'2016-09-20',21),(75,5,'2016-09-20',3),(76,5,'2016-09-20',9),(77,5,'2016-09-20',30),(78,5,'2016-09-20',18),(79,0,'2016-09-20',36),(80,1,'2016-09-20',49),(81,100,'2016-09-20',5),(82,100,'2016-09-20',11),(83,100,'2016-09-20',23),(84,100,'2016-09-20',26),(85,100,'2016-09-20',14),(86,100,'2016-09-20',40),(87,100,'2016-09-20',32),(88,100,'2016-09-20',20),(89,100,'2016-09-20',2),(90,100,'2016-09-20',8),(91,100,'2016-09-20',44),(92,100,'2016-09-20',29),(93,100,'2016-09-20',17),(94,100,'2016-09-20',35),(95,100,'2016-09-20',42),(96,100,'2016-09-20',38),(97,0,'2016-09-21',6),(98,4,'2016-09-21',12),(99,4,'2016-09-21',24),(100,0,'2016-09-21',27),(101,4,'2016-09-21',15),(102,0,'2016-09-21',33),(103,4,'2016-09-21',21),(104,4,'2016-09-21',3),(105,4,'2016-09-21',9),(106,4,'2016-09-21',30),(107,4,'2016-09-21',18),(108,0,'2016-09-21',36),(109,0,'2016-09-21',6),(110,5,'2016-09-21',12),(111,5,'2016-09-21',24),(112,0,'2016-09-21',27),(113,5,'2016-09-21',15),(114,5,'2016-09-21',33),(115,5,'2016-09-21',21),(116,0,'2016-09-21',3),(117,5,'2016-09-21',9),(118,0,'2016-09-21',30),(119,5,'2016-09-21',18),(120,0,'2016-09-21',36),(121,5,'2016-09-21',6),(122,0,'2016-09-21',12),(123,0,'2016-09-21',24),(124,5,'2016-09-21',27),(125,5,'2016-09-21',15),(126,0,'2016-09-21',33),(127,5,'2016-09-21',21),(128,5,'2016-09-21',3),(129,5,'2016-09-21',9),(130,5,'2016-09-21',30),(131,5,'2016-09-21',18),(132,0,'2016-09-21',36),(133,5,'2016-09-21',6),(134,0,'2016-09-21',12),(135,5,'2016-09-21',24),(136,5,'2016-09-21',27),(137,0,'2016-09-21',15),(138,5,'2016-09-21',33),(139,5,'2016-09-21',21),(140,0,'2016-09-21',3),(141,5,'2016-09-21',9),(142,5,'2016-09-21',30),(143,5,'2016-09-21',18),(144,0,'2016-09-21',36),(145,5,'2016-09-22',6),(146,0,'2016-09-22',12),(147,5,'2016-09-22',24),(148,5,'2016-09-22',27),(149,0,'2016-09-22',15),(150,5,'2016-09-22',33),(151,5,'2016-09-22',21),(152,5,'2016-09-22',3),(153,5,'2016-09-22',9),(154,5,'2016-09-22',30),(155,5,'2016-09-22',18),(156,0,'2016-09-22',36),(157,5,'2016-09-22',6),(158,5,'2016-09-22',12),(159,5,'2016-09-22',24),(160,5,'2016-09-22',27),(161,5,'2016-09-22',15),(162,5,'2016-09-22',33),(163,5,'2016-09-22',21),(164,5,'2016-09-22',3),(165,5,'2016-09-22',9),(166,5,'2016-09-22',30),(167,5,'2016-09-22',18),(168,5,'2016-09-22',36),(169,1,'2016-09-22',6),(170,1,'2016-09-22',12),(171,1,'2016-09-22',24),(172,1,'2016-09-22',27),(173,1,'2016-09-22',15),(174,1,'2016-09-22',33),(175,1,'2016-09-22',21),(176,1,'2016-09-22',3),(177,1,'2016-09-22',9),(178,0,'2016-09-22',30),(179,1,'2016-09-22',18),(180,1,'2016-09-22',36),(181,1,'2016-09-22',6),(182,1,'2016-09-22',12),(183,0,'2016-09-22',24),(184,1,'2016-09-22',27),(185,1,'2016-09-22',15),(186,1,'2016-09-22',33),(187,1,'2016-09-22',21),(188,1,'2016-09-22',3),(189,0,'2016-09-22',9),(190,1,'2016-09-22',30),(191,1,'2016-09-22',18),(192,1,'2016-09-22',36),(193,1,'2016-09-25',49),(194,4,'2016-09-30',49),(195,5,'2016-09-29',49),(196,0,'2016-09-29',6),(197,0,'2016-09-29',12),(198,1,'2016-09-29',24),(199,1,'2016-09-29',27),(200,1,'2016-09-29',15),(201,1,'2016-09-29',33),(202,1,'2016-09-29',21),(203,1,'2016-09-29',3),(204,1,'2016-09-29',9),(205,1,'2016-09-29',30),(206,1,'2016-09-29',18),(207,1,'2016-09-29',36),(208,0,'2016-09-29',6),(209,0,'2016-09-29',12),(210,0,'2016-09-29',24),(211,6,'2016-09-29',27),(212,6,'2016-09-29',15),(213,6,'2016-09-29',33),(214,6,'2016-09-29',21),(215,6,'2016-09-29',3),(216,6,'2016-09-29',9),(217,6,'2016-09-29',30),(218,6,'2016-09-29',18),(219,6,'2016-09-29',36);
/*!40000 ALTER TABLE `frequencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `papel`
--

DROP TABLE IF EXISTS `papel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `papel` (
  `idPapel` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idPapel`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `papel`
--

LOCK TABLES `papel` WRITE;
/*!40000 ALTER TABLE `papel` DISABLE KEYS */;
INSERT INTO `papel` VALUES (1,'admin','Administrador do sistema'),(2,'guest','Visitante do sistema');
/*!40000 ALTER TABLE `papel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `papel_tem_permissao`
--

DROP TABLE IF EXISTS `papel_tem_permissao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `papel_tem_permissao` (
  `papel_idPapel` bigint(20) NOT NULL,
  `permissao_idPermissao` bigint(20) NOT NULL,
  PRIMARY KEY (`papel_idPapel`,`permissao_idPermissao`),
  KEY `fk_papel_has_permissao_permissao1_idx` (`permissao_idPermissao`),
  KEY `fk_papel_has_permissao_papel1_idx` (`papel_idPapel`),
  CONSTRAINT `fk_papel_has_permissao_papel1` FOREIGN KEY (`papel_idPapel`) REFERENCES `papel` (`idPapel`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_papel_has_permissao_permissao1` FOREIGN KEY (`permissao_idPermissao`) REFERENCES `permissao` (`idPermissao`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `papel_tem_permissao`
--

LOCK TABLES `papel_tem_permissao` WRITE;
/*!40000 ALTER TABLE `papel_tem_permissao` DISABLE KEYS */;
INSERT INTO `papel_tem_permissao` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `papel_tem_permissao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissao`
--

DROP TABLE IF EXISTS `permissao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissao` (
  `idPermissao` bigint(20) NOT NULL AUTO_INCREMENT,
  `valor` varchar(255) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idPermissao`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissao`
--

LOCK TABLES `permissao` WRITE;
/*!40000 ALTER TABLE `permissao` DISABLE KEYS */;
INSERT INTO `permissao` VALUES (1,'*','pode fazer o que quiser'),(2,'visitante:*','pode fazer tudo que um visitante pode');
/*!40000 ALTER TABLE `permissao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prova_questao`
--

DROP TABLE IF EXISTS `prova_questao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prova_questao` (
  `codigo_prova` bigint(20) unsigned NOT NULL,
  `codigo_questao` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`codigo_prova`,`codigo_questao`),
  KEY `fk_prova_questao_Q_idx` (`codigo_questao`),
  CONSTRAINT `fk_prova_questao_P` FOREIGN KEY (`codigo_prova`) REFERENCES `Prova` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_prova_questao_Q` FOREIGN KEY (`codigo_questao`) REFERENCES `questao` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prova_questao`
--

LOCK TABLES `prova_questao` WRITE;
/*!40000 ALTER TABLE `prova_questao` DISABLE KEYS */;
INSERT INTO `prova_questao` VALUES (5,94),(5,95),(5,99),(5,100),(5,101),(5,123),(5,126),(5,128),(5,129),(5,131),(6,82),(6,84),(6,92),(6,116),(7,91),(7,94),(7,103),(7,104),(7,108),(7,112),(7,120),(7,127),(7,136),(7,139),(8,114),(8,117),(8,123),(8,143),(8,150),(11,114),(11,115),(11,119),(11,121);
/*!40000 ALTER TABLE `prova_questao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questao`
--

DROP TABLE IF EXISTS `questao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questao` (
  `codigo` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pergunta` text,
  `descricao` text,
  `codigo_categoria` bigint(20) unsigned DEFAULT NULL,
  `codigo_usuario` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `codigo_usuario` (`codigo_usuario`),
  KEY `codigo_categoria` (`codigo_categoria`),
  CONSTRAINT `fk_questao_categoria` FOREIGN KEY (`codigo_categoria`) REFERENCES `categoria` (`codigo`) ON DELETE CASCADE,
  CONSTRAINT `fk_questao_usuario` FOREIGN KEY (`codigo_usuario`) REFERENCES `usuario` (`codigo`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questao`
--

LOCK TABLES `questao` WRITE;
/*!40000 ALTER TABLE `questao` DISABLE KEYS */;
INSERT INTO `questao` VALUES (79,'A combinaÃ§Ã£o de m elementos tomados 4 a 4, vale 102. EntÃ£o, o arranjo de m elementos, tomados 4 a 4, vale:','Analise combinatoria',77,17),(80,'Sobre uma circunferÃªncia, tomam-se 10 pontos. Quantos triÃ¢ngulos podem ser construÃ­dos com vÃ©rtice nesses pontos','Analise combinatoria',77,17),(81,'Em um congresso hÃ¡ 30 professores de MatemÃ¡tica e 12 de FÃ­sica. Quantas comissÃµes poderÃ­amos organizar, compostas de 3 professores de MatemÃ¡tica e 2 de FÃ­sica?','Analise combinatoria',77,17),(82,' Em um quadrado, se aumentarmos em 2 m um lado e em 3 m o outro lado, obteremos um retÃ¢ngulo cuja Ã¡rea Ã© de 56 m2. A medida do lado do quadrado Ã© de:','Geomentria Plana',77,17),(83,'A hipotenusa de um triÃ¢ngulo retÃ¢ngulo Ã© 8 e o raio do cÃ­rculo inscrito Ã© 2. O perÃ­metro do triÃ¢ngulo Ã© igual a:','Geomentria Plana',77,17),(84,'Calcule a Ã¡rea de um losango cujo o perÃ­metro mede 120m e sua diagonal maior Ã© 48cm.','Geomentria Plana',77,17),(85,'Uma carta Ã© retirada de um baralho comum, de 52 cartas, e, sem saber qual Ã© a carta, Ã© misturada com as cartas de um outro baralho idÃªntico ao primeiro. Retirando, em seguida, uma carta do segundo baralho, a probabilidade de se obter uma dama Ã©:','Probabilidade',77,17),(91,'TrÃªs pessoas A, B e C vÃ£o participar de um concurso num programa de televisÃ£o. O apresentador faz um sorteio entre A e B e, em seguida, faz um sorteio, para decidir quem iniciarÃ¡ o concurso. Se em cada sorteio as duas pessoas tÃªm a mesma chance de ganhar, qual Ã© a probabilidade de A iniciar o concurso?','Probabilidade',77,17),(92,'Escolhem-se ao acaso dois nÃºmeros naturais distintos, de 1 a 20. Qual a probabilidade de que o produto dos nÃºmeros escolhidos seja Ã­mpar?','Probabilidade',77,17),(93,'Realizar o Anchluss era um velho sonho dos nazistas. E isso comeÃ§ou a ser conseguido por Hitler em marÃ§o de 1938. A expressÃ£o entre aspas e a data sÃ£o suficientes para elucidar o sonho nazista de:','Segunda Guerra',75,17),(94,'A Segunda Grande Guerra (1939-1945), a partir de 7 de dezembro de 1941, adquire um carÃ¡ter mundial quando os:','Segunda Guerra',75,17),(95,'A II Guerra Mundial foi o maior conflito armado da histÃ³ria da humanidade, caracterizada pelo desenvolvimento da indÃºstria bÃ©lica, ao ponto de se produzir a bomba atÃ´mica e toda a mortandade decorrente. Sobre o conflito, Ã© incorreto afirmar que:','Segunda Guerra',75,17),(96,'O Partido Trabalhista Brasileiro (PTB) esteve no centro da crise que resultou no golpe polÃ­tico-militar de 1964. Todas as alternativas apresentam afirmaÃ§Ãµes corretas sobre o PTB, EXCETO:','Golpe Militar',75,17),(97,'Sobre o parlamentarismo praticado durante quase todo o Segundo Reinado e a atuaÃ§Ã£o dos partidos Liberal e Conservador, podemos afirmar que:','Segundo Reinado no Brasil',75,17),(98,'No sÃ©culo XIX, a imigraÃ§Ã£o europeia para o Brasil foi um processo ligado:','Segundo Reinado no Brasil',75,17),(99,'I. Para o filÃ³sofo inglÃªs Thomas Hobbes (1588-1679), o estado de natureza Ã© um estado de guerra universal e perpÃ©tua. Contraposto ao estado de natureza, entendido como estado de guerra, o estado de paz Ã© a sociedade civilizada. Dentre outras tendÃªncias que dialogam com as ideias de Hobbes, destaca-se a definida abaixo. II. Nem todas as guerras sÃ£o injustas e, correlativamente, nem toda paz Ã© justa, razÃ£o pela qual a guerra nem sempre Ã© um desvalor, e a paz nem sempre um valor. BOBBIO, N. MATTEUCCI, N. e PASQUINO, G. DicionÃ¡rio de PolÃ­tica. 5ed. BrasÃ­lia: Universidade de BrasÃ­lia. SÃ£o Paulo: Imprensa Oficial do Estado, 2000. Comparando as ideias de Hobbes (texto I) com a tendÃªncia citada no texto II, pode-se afirmar que:','Absolutismo',75,17),(100,'Daqui nasce um dilema: Ã© melhor ser amado que temido, ou o inverso? Respondo que seria preferÃ­vel ser ambas as coisas, mas, como Ã© muito difÃ­cil conciliÃ¡-las, parece-me muito mais seguro ser temido do que amado, se sÃ³ se pode ser uma delas [...]  MAQUIAVEL, N. O prÃ­ncipe. Ed. Europa-AmÃ©rica, 1976. p. 89. A respeito do pensamento polÃ­tico de Maquiavel, Ã© correto afirmar que:','Absolutismo',75,17),(101,'Muitos historiadores consideram a Primeira Guerra Mundial como fator de peso na crise das sociedades liberais contemporÃ¢neas. Assinale a opÃ§Ã£o que contÃ©m argumentos todos corretos a favor de tal opiniÃ£o.','Primeira Guerra Mundial',75,17),(102,'Os paÃ­ses envolvidos na I Guerra Mundial dividiram-se em duas coligaÃ§Ãµes de naÃ§Ãµes que se enfrentaram durante os anos da guerra, formadas inicialmente por seis paÃ­ses. Qual das alternativas indica corretamente as coligaÃ§Ãµes de naÃ§Ãµes e os paÃ­ses participantes?','Primeira Guerra Mundial',75,17),(103,'Dos compostos abaixo, qual nÃ£o realiza ligaÃ§Ã£o iÃ´nica?','LigaÃ§ao Ionica',80,17),(104,'Da combinaÃ§Ã£o quÃ­mica entre os Ã¡tomos de magnÃ©sio (Z=12) e nitrogÃªnio (Z=7) pode resultar a substÃ¢ncia de fÃ³rmula:','LigaÃ§ao Ionica',80,17),(105,'A propriedade que pode ser atribuÃ­da Ã  maioria dos compostos iÃ´nicos (isto Ã©, aos compostos caracterizados predominantemente por ligaÃ§Ãµes iÃ´nicas entre as partÃ­culas) Ã©:','LigaÃ§ao Ionica',80,17),(107,'Ao se realizar a distribuiÃ§Ã£o eletrÃ´nica do titÃ¢nio, que possui nÃºmero atÃ´mico igual a 22, descobre-se que o seu subnÃ­vel mais energÃ©tico e os elÃ©trons distribuÃ­dos nele sÃ£o dados por:','DistribuiÃ§ao eletronica',80,17),(108,'Qual a distribuiÃ§Ã£o eletrÃ´nica em camadas do Ã¡tomo 2656Fe?','DistribuiÃ§ao eletronica',80,17),(109,'O Ã¡tomo de um elemento quÃ­mico tem 14 elÃ©trons no 3Âº nÃ­vel energÃ©tico (n = 3). O nÃºmero atÃ´mico desse elemento Ã©:','DistribuiÃ§ao eletronica',80,17),(110,'Indique o nÃºmero de prÃ³tons, nÃªutrons e elÃ©trons que existem, respectivamente, no Ã¡tomo de mercÃºrio 80200Hg:','Massa atomica',80,17),(111,'Um Ã­on de certo elemento quÃ­mico, de nÃºmero de massa 85, apresenta 36 elÃ©trons e carga +1. Qual Ã© o nÃºmero atÃ´mico desse Ã­on?','Massa atomica',80,17),(112,'O Ã¡tomo de um elemento quÃ­mico possui 83 prÃ³tons, 83 elÃ©trons e 126 nÃªutrons. Qual Ã©, respectivamente, o nÃºmero atÃ´mico e o nÃºmero de massa desse Ã¡tomo?','Massa atomica',80,17),(113,'Dois satÃ©lites artificiais giram em torno da Terra em Ã³rbitas de mesma altura. O primeiro tem massa m1, e o segundo, massa 3m1. Se o primeiro tem perÃ­odo de 6 h, o perÃ­odo do outro serÃ¡, em horas, igual a:','MovimentaÃ§Ã£o planetaria',79,17),(114,'Sobre as Leis de Kepler e o movimento dos planetas, marque a alternativa correta:','MovimentaÃ§Ã£o planetaria',79,17),(115,'Sobre imÃ£s,marque a afirmativa correta:','ImÃ£s',79,17),(116,'A Terra Ã© considerada um imÃ£ gigantesco, que tem as seguintes caracterÃ­sticas:','ImÃ£s',79,17),(117,'Duas partÃ­culas de cargas elÃ©tricas Q1 = 4,0 . 10-16 C e Q2 = 6,0 . 10-16 C estÃ£o separadas no vÃ¡cuo por uma distÃ¢ncia de 3,0 . 10-9 m. Sendo K0 = 9 . 109 N.m2/ C2, a intensidade da forÃ§a de interaÃ§Ã£o entre elas, em Newtons, Ã© de:','Lei de Coulomb',79,17),(118,'Duas partÃ­culas eletricamente carregadas com +8,0 . 10-6 C cada uma sÃ£o colocadas no vÃ¡cuo a uma distÃ¢ncia de 30cm, onde K0 = 9 . 109 N.m2/C2. A forÃ§a de interaÃ§Ã£o entre essas cargas Ã©:','Lei de Coulomb',79,17),(119,'De acordo com a Lei de Coulomb, assinale a alternativa correta:','Lei de Coulomb',79,17),(120,'Um mÃ³vel com velocidade constante igual a 20 m/s parte da posiÃ§Ã£o 5 m de uma reta numerada e anda de acordo com o sentido positivo da reta. Determine a posiÃ§Ã£o do mÃ³vel apÃ³s 15 s de movimento','MovimentaÃ§Ã£o com velocidade constante',79,17),(121,'Um homem sai da posiÃ§Ã£o 15 m de uma pista de caminhada e anda atÃ© a posiÃ§Ã£o 875 m mantendo uma velocidade constante de 2 m/s. Sabendo disso, determine o tempo gasto para completar a caminhada.','MovimentaÃ§Ã£o com velocidade constante',79,17),(122,'Considere dois veÃ­culos deslocando-se em sentidos opostos em uma mesma rodovia. Um veÃ­culo tem velocidade escalar de 72 km/h e o outro de 108 km/h, em mÃ³dulo. Um passageiro, viajando no veÃ­culo mais lento, resolve cronometrar o tempo decorrido atÃ© que os veÃ­culos se cruzem e encontra o intervalo de 30 segundos. A distÃ¢ncia, em km, de separaÃ§Ã£o dos veÃ­culos, no inÃ­cio da cronometragem, era de:','MovimentaÃ§Ã£o com velocidade constante',79,17),(123,'A globalizaÃ§Ã£o constitui o estÃ¡gio mÃ¡ximo da internacionalizaÃ§Ã£o, a amplificaÃ§Ã£o em sistema-mundo de todos os lugares e de todos os indivÃ­duos, logicamente em graus diferentes.Os graus diferentes citados no texto referem-se:','GlobalizaÃ§ao',76,17),(124,'A globalizaÃ§Ã£o Ã©, de certa forma, o Ã¡pice do processo de internacionalizaÃ§Ã£o do mundo capitalista. [...] No fim do sÃ©culo XX e graÃ§as aos avanÃ§os da ciÃªncia, produziu-se um sistema de tÃ©cnicas presidido pelas tÃ©cnicas da informaÃ§Ã£o, que passaram a exercer um papel de elo entre as demais, unindo-as e assegurando ao novo sistema tÃ©cnico uma presenÃ§a planetÃ¡ria. SÃ³ que a globalizaÃ§Ã£o nÃ£o Ã© apenas a existÃªncia desse novo sistema de tÃ©cnicas. Ela Ã© tambÃ©m o resultado das aÃ§Ãµes que asseguram a emergÃªncia de um mercado dito global, responsÃ¡vel pelo essencial dos processos polÃ­ticos atualmente eficazes.SANTOS, Milton. Por uma outra globalizaÃ§Ã£o: do pensamento Ãºnico Ã  consciÃªncia universal. Rio de Janeiro: Record, 2000, p. 23-24. Considerando o enunciado anterior, sobre o processo de globalizaÃ§Ã£o na sociedade contemporÃ¢nea, assinale a alternativa correta.','GlobalizaÃ§ao',76,17),(125,'Assinale um dos eventos abaixo enumerados que nÃ£o possui relaÃ§Ã£o direta com o processo de globalizaÃ§Ã£o:','GlobalizaÃ§ao',76,17),(126,'Os blocos econÃ´micos sÃ£o a mais recente alternativa adotada pela maioria dos Estados do mundo para ampliar as suas respectivas relaÃ§Ãµes econÃ´micas. Tal aspecto vem contribuindo para a construÃ§Ã£o de uma nova forma de regionalizaÃ§Ã£o mundial. Assinale a alternativa que apresente a mais importante entre as causas para a formaÃ§Ã£o dos blocos econÃ´micos no mundo contemporÃ¢neo.','Blocos Economicos',76,17),(127,'A formaÃ§Ã£o de blocos econÃ´micos tem por objetivo criar condiÃ§Ãµes para dinamizar e intensificar a economia num mundo globalizado. Em todas as modalidades de blocos econÃ´micos, o intuito Ã© a reduÃ§Ã£o e/ou eliminaÃ§Ã£o das tarifas ou impostos de importaÃ§Ã£o e exportaÃ§Ã£o entre os paÃ­ses-membros.Com base na conceituaÃ§Ã£o acima apresentada, assinale a alternativa que nÃ£o apresenta um bloco econÃ´mico.','Blocos Economicos',76,17),(128,'Os conhecimentos sobre projeÃ§Ãµes cartogrÃ¡ficas e uso de mapas possibilitam afirmar:','ProjeÃ§Ã£o cartografica',76,17),(129,'Caracteriza-se por ser um tipo de projeÃ§Ã£o que ordena os paralelos e os meridianos em um invÃ³lucro arredondado que Ã© desenrolado e posto em uma superfÃ­cie plana. Os mais famosos exemplos sÃ£o as projeÃ§Ãµes de Mercator, de Peters e de Robinson. Nessa projeÃ§Ã£o, minimizam-se as distorÃ§Ãµes nas regiÃµes prÃ³ximas ao Equador, que se elevam nas regiÃµes mais prÃ³ximas aos polos. Estamos falando da:','ProjeÃ§Ã£o cartografica',76,17),(130,'Ã‰ possÃ­vel indicar a indÃºstria como um dos principais agentes de produÃ§Ã£o do espaÃ§o geogrÃ¡fico. Sobre o processo de desenvolvimento das indÃºstrias, assinale a alternativa INCORRETA.','IndustrializaÃ§Ã£o mundial',76,17),(131,'Sobre as empresas multinacionais, tambÃ©m chamadas de transnacionais ou globais, podemos elencar as seguintes caracterÃ­sticas, exceto:','IndustrializaÃ§Ã£o mundial',76,17),(132,'As rochas metamÃ³rficas sÃ£o estruturas sÃ³lidas formadas a partir do processo de transformaÃ§Ãµes de outras rochas preexistentes. Essa transformaÃ§Ã£o ocorre graÃ§as Ã  alteraÃ§Ã£o das condiÃ§Ãµes de ambiente, temperatura e pressÃ£o em relaÃ§Ã£o ao ponto em que essas rochas se originaram. Com base nessas informaÃ§Ãµes e em seus conhecimentos em Geografia FÃ­sica, assinale a alternativa que indica um local onde Ã© mais provÃ¡vel a ocorrÃªncia do fenÃ´meno citado.','Tipos de rochas',76,17),(133,'No dia 19 de junho de 2010, a cidade do Rio de Janeiro amanheceu sob a influÃªncia de um forte nevoeiro, que dificultava a visibilidade, interferindo no ritmo das atividades urbanas. O ar quente permaneceu acima da camada de ar frio, que ficou retida nas proximidades da superfÃ­cie, favorecendo a concentraÃ§Ã£o de poluentes. O que foi vivenciado nesta cidade Ã© um fenÃ´meno climÃ¡tico que pode ocorrer em qualquer Ã©poca do ano, sendo mais comum no inverno. Nessa Ã©poca, as chuvas sÃ£o mais raras, dificultando, ainda mais, a dispersÃ£o dos poluentes, o que causa um problema ambiental. O fenÃ´meno climÃ¡tico descrito no texto Ã© conhecido como:','Clima',76,17),(134,' Indique a alternativa que completa corretamente as lacunas das frases: I - Se nos ....... a fazer um esforÃ§o conjunto, teremos um paÃ­s sÃ©rio. II - .......o televisor ligado, para te informares dos Ãºltimos acontecimentos. III - NÃ£o havia programa que .......o povo, apÃ³s o Ãºltimo noticiÃ¡rio.','Verbo',78,17),(135,'Em todas as frases, os verbos estÃ£o na voz ativa, exceto em:','Verbo',78,17),(136,'Assinale a alternativa em que estÃ£o devidamente classificadas as seguintes formas verbais: Chegando do trabalho, espero que jÃ¡ tenha terminado a liÃ§Ã£o de casa.','Verbo',78,17),(137,'Imagine a situaÃ§Ã£o em que uma professora responda a seu aluno e que nessa resposta denote-se erro do emprego verbal. Identifique-o: Professora, eu preciso fazer a liÃ§Ã£o de casa?','Verbo',78,17),(138,'Era um burrinho pedrÃªs, miÃºdo e resignado [â€¦]. Chamava-se Sete-de-Ouros, e jÃ¡ fora tÃ£o bom, como outro nÃ£o existiu e nem pode haver igual. GuimarÃ£es Rosa, Sagarana. A palavra Ouros estÃ¡ no plural, no nome do burrinho, porque:','Flexoes do substantivo',78,17),(139,'De acordo com as regras que regem o plural dos substantivos compostos, assinale a alternativa cuja sequÃªncia esteja incorreta:','Flexoes do substantivo',78,17),(140,'Acesas Ã© particÃ­pio adjetivo de acender, verbo chamado abundante, porque possui dupla forma de particÃ­pio (acendido e aceso). Em abundÃ¢ncia, que Ã© geralmente do particÃ­pio, em alguns verbos ocorre em outras formas. Assim, por exemplo, Ã© o caso de:','ClassificaÃ§Ã£o dos verbos',78,17),(141,'Das alternativas abaixo, a que apresenta o particÃ­pio irregular dos verbos expressar, tingir e enxugar Ã©:','ClassificaÃ§Ã£o dos verbos',78,17),(142,'Existem insetos que nÃ£o sofrem metamorfose. Ã‰ o caso da traÃ§a-do-livro que jÃ¡ eclode do ovo com aparÃªncia de um inseto adulto, exceto pelo tamanho do corpo. Esses insetos sÃ£o chamados de:','Desenvolvimento dos Insetos',81,17),(143,'Marque a alternativa em que estÃ¡ indicado corretamente um exemplo de inseto ametÃ¡bolo, hemimetÃ¡bolo e holometÃ¡bolo, respectivamente.','Desenvolvimento dos Insetos',81,17),(144,'Dos ovos postos, apÃ³s a inclusÃ£o, saem formas parecidas com os adultos, diferenciando-se apenas pela ausÃªncia de asas, pela coloraÃ§Ã£o do corpo, tamanho e sistema reprodutor que ainda nÃ£o se acha desenvolvido. Essas formas que saem dos ovos sÃ£o chamadas ninfas e, se forem aquÃ¡ticas, nÃ¡iades. Elas mudam de pele vÃ¡rias vezes e os caracteres do adulto vÃ£o progressivamente tomando forma. Isto ocorre, por exemplo, em gafanhotos e baratas. A descriÃ§Ã£o acima aplica-se ao estudo do desenvolvimento dos insetos:','Desenvolvimento dos Insetos',81,17),(145,'Marque a alternativa que indica quais os elementos quÃ­micos fundamentais encontrados na composiÃ§Ã£o de um carboidrato.','Carboidratos',81,17),(147,'Sabemos que o amido Ã© uma importante substÃ¢ncia de reserva encontrada em plantas e algumas algas. Marque a alternativa correta a respeito do amido.','Carboidratos',81,17),(149,'Podemos classificar os glicÃ­dios em trÃªs grupos principais: monossacarÃ­deos, dissacarÃ­deos e polissacarÃ­deos. Marque a alternativa onde encontramos apenas glicÃ­dios formados pela uniÃ£o de dois monossacarÃ­deos.','Carboidratos',81,17),(150,'A mitose Ã© um processo de divisÃ£o celular que pode ser dividido em quatro etapas. Marque a alternativa que indica corretamente as etapas e a sequÃªncia correta em que elas ocorrem.','Mitose',81,17),(151,'Sabemos que no final da mitose o citoplasma divide-se para formar duas cÃ©lulas-filhas. O processo de divisÃ£o do citoplasma Ã© denominado:','Mitose',81,17),(153,'Os vÃ­rus sÃ£o formados basicamente por molÃ©culas de Ã¡cido nucleico, que pode ser DNA ou RNA, envoltas por proteÃ­nas. A capa de proteÃ­na que envolve o Ã¡cido nucleico Ã© chamada de:','Virus',81,17),(154,'Cada vÃ­rus sÃ³ Ã© capaz de parasitar cÃ©lulas especÃ­ficas, uma vez que em sua superfÃ­cie sÃ£o encontradas proteÃ­nas que se encaixam perfeitamente em receptores localizados na membrana das cÃ©lulas hospedeiras. As proteÃ­nas encontradas na superfÃ­cie do capsÃ­dio ou do envelope lipoproteico recebem o nome de:','Virus',81,17),(155,'O DNA (Ã¡cido desoxirribonucleico) Ã© o Ã¡cido nucleico que contÃ©m as informaÃ§Ãµes genÃ©ticas dos indivÃ­duos. Ele Ã© constituÃ­do, assim como o RNA, por trÃªs componentes bÃ¡sicos que formam os nucleotÃ­dios. SÃ£o eles:','DNA',81,17),(156,'O DNA e o RNA diferenciam-se, entre outras caracterÃ­sticas, pela base nitrogenada que possuem. Entre as bases citadas a seguir, marque a Ãºnica que nÃ£o ocorre em uma molÃ©cula de DNA.','DNA',81,17),(157,'As molÃ©culas de DNA sÃ£o polinucleotÃ­dios formados por duas cadeias dispostas em forma de hÃ©lice. As duas cadeias estÃ£o unidas entre si pelas bases nitrogenadas, que se ligam por meio de:','DNA',81,17),(158,'O DNA e o RNA sÃ£o constituÃ­dos de muitas unidades, os nucleotÃ­deos. Cada nucleotÃ­deo Ã© constituÃ­do por um grupo fosfato, uma pentose e uma base nitrogenada. A diferenÃ§a entre DNA e RNA estÃ¡:','DNA',81,17),(160,'tete123','123',83,15),(161,'1233','123',83,15),(162,'12334','1234',83,15),(163,'12345','55123',84,15),(164,'123455','1235',84,15),(165,'34534','123123',83,15),(166,'555123','23123',83,15),(167,'66565','123123',83,15),(168,'64564','12314',84,15),(170,'teste34356','123',86,16),(171,'b90b7fa5','fdteste45',90,17);
/*!40000 ALTER TABLE `questao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `codigo` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(40) DEFAULT NULL,
  `login` varchar(40) DEFAULT NULL,
  `senha` text,
  `email` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (14,'Raphael','teste','MTIz','raphapaes_al1@hotmail.com'),(15,'Jaozim','teste2','MTIz','raphaknight44@gmail.com'),(16,'jao','teste123','MTIz','123@htoinai'),(17,'Raphael Paes Alves','adm','$shiro1$SHA-256$500000$TC4oRdH8gbuZtJKbLiEFTg==$dC9k7AdpYNuTJG0ggZf7WG8jEtIrCEQYsB4rjHK1CMM=','raphapaes_al@gmail.com'),(18,'Raphael Paes Alves','adm2','$shiro1$SHA-256$500000$ZSStlYeRXj1AzVov7y8aJg==$q9hHJW1UplJa9y+fpWHrYD2rH/5yr9nzRhiCVvpuZRQ=','raphaknight44@gmail.com'),(19,'Jao da Silva','adm3','$shiro1$SHA-256$500000$Fk7LiXwNbzy++35uIxx+5w==$9zAz1bPFyaEaCfnGhPlcrRTwwCW97MRMRZis2jQnUJQ=','jao@hotmail.com'),(20,'Invocation Array','morrigan','$shiro1$SHA-256$500000$uU6fIGAOXkj39Dvw2MMeUg==$qGly9q67JXfOEjd+PTH+9pHYtL5KRmJWzZACVVapNXM=','Array@hotmail.com'),(21,'6575',NULL,NULL,NULL),(22,'456',NULL,'$shiro1$SHA-256$500000$Gw7uWxNfh4t5dHtd1FcP+Q==$8LlkRcIfuixLugxcWDXeY5pb9rBh6QD6TT5x9z9KFUQ=','423@gssdf'),(23,'Joao Alves','adm4','$shiro1$SHA-256$500000$sSG4/Hws7IkWfN4agOLuDw==$NUWP40VKLthP1yLLw6XznhNGpT03gXkAoXZSjoqZ3Yg=','jao@gmail.com');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_tem_papel`
--

DROP TABLE IF EXISTS `usuario_tem_papel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_tem_papel` (
  `usuario_codigo` bigint(20) unsigned NOT NULL,
  `papel_idPapel` bigint(20) NOT NULL,
  PRIMARY KEY (`usuario_codigo`,`papel_idPapel`),
  KEY `fk_usuario_has_papel_papel1_idx` (`papel_idPapel`),
  CONSTRAINT `fk_usuario_has_papel_papel1` FOREIGN KEY (`papel_idPapel`) REFERENCES `papel` (`idPapel`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_tem_papel_1_usuario` FOREIGN KEY (`usuario_codigo`) REFERENCES `usuario` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_tem_papel`
--

LOCK TABLES `usuario_tem_papel` WRITE;
/*!40000 ALTER TABLE `usuario_tem_papel` DISABLE KEYS */;
INSERT INTO `usuario_tem_papel` VALUES (17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1);
/*!40000 ALTER TABLE `usuario_tem_papel` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-27 17:43:23
