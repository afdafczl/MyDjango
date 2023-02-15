-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: myblog
-- ------------------------------------------------------
-- Server version	8.0.32-0ubuntu0.22.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `MyBlog_blog`
--

DROP TABLE IF EXISTS `MyBlog_blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MyBlog_blog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `author` varchar(16) NOT NULL,
  `content` longtext NOT NULL,
  `pub` date NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `MyBlog_blog_category_id_f1d68dd6_fk_MyBlog_category_id` (`category_id`),
  CONSTRAINT `MyBlog_blog_category_id_f1d68dd6_fk_MyBlog_category_id` FOREIGN KEY (`category_id`) REFERENCES `MyBlog_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MyBlog_blog`
--

LOCK TABLES `MyBlog_blog` WRITE;
/*!40000 ALTER TABLE `MyBlog_blog` DISABLE KEYS */;
INSERT INTO `MyBlog_blog` VALUES (1,'The first blog (Test)','Zion','## 软件概况：\r\n\r\n- 传统 OJ 平台代码评测完全是基于输入、输出结果比对的黑盒评测，着重结果之上的评价方法并不利于培养软件工程能力，而且一般不支持多文件结构的代码评测，本项目旨在研究面向项目级的代码评测、质量评价方法，实现对代码质量的综合评价。\r\n- 研究基于完整项目的代码质量评价方法，除支持基本的代码正确性评测的话，能够基于提交代码的结构、代码规范和可能的漏洞等对代码质量进行综合评价方法，并通过集成各类代码检测工具实现自动评测。\r\n\r\n## 具体功能需求：\r\n\r\n### 集成化代码质量评价\r\n\r\n在前期学习中，初级开发者对代码编写、风格规范等尚不太够明晰，而代码风格等通过人工检查、评价耗时耗力，而已有的插件较为分散，且需要自行逐一配置，常常为初级开发者所忽略，因而通过集成静态、动态代码检查插件并给出相应的评分，帮助初级开发者更快发现问题，并对代码质量有更加清晰的评估。\r\n\r\n- 集成各类代码质量评价工具，从词法、语法、语义、内存、代码风格等方面提供检查，例如：CodeChecker、Gitleaks、Mobile Security Framework (MobSF)、ShellCheck、ErrorPone（Java 编译时捕获错误）、Brakeman（Ruby）、TscanCode（Lua、C#、C++），\r\n- 集成代码格式检查（如 Alibaba Java Coding Guidelines）并提供修改建议。\r\n- 项目评分：\r\n  - 对各类质量评价工具的结果做加权评价\r\n  - 能力图等方式直观展现项目的问题与优缺点。\r\n\r\n### 类设计与项目结构评价\r\n\r\nUML 类图可以清晰地展现项目各个类之间的层次关系，而初级开发者常常在类的设计上出现冗余或难以维护的调用、继承关系，借助 UML 类图并加以分析可以对项目结构、设计模式、类设计加以分析评价，还可通过静态分析的方式批量生成指定 Java 方法向下的完整调用链，结合项目的文件结构，进一步分析项目结构。\r\n\r\n- **评价内容与方式（研究中）：**\r\n  - 在项目开发前搭建关系图，进行图的分析，可提供参考项目结构\r\n  - 抽象类与类之间的关系\r\n  - 对类与类之间关系图（调用，重写，继承等）的分析\r\n    - 1. 与标准/参照关系图比对，提供参考建议\r\n    - 2. 根据类关系图，评判鲁棒性等\r\n    - 3. 根据类关系图的变化，评判项目结构是否优化/劣化\r\n    - 4. 对单一功能涉及到的类做分析（加载到标准项目/分析部分图的性质）\r\n\r\n### 多端功能：\r\n\r\n该项目既可作为自行学习、开发的自评工具，也可作为教学使用的辅助工具，以下为一些可能的方案：\r\n\r\n- 在迭代类型的作业中，给出参考的项目结构图/UML 类图，供学习者参考，便于在开发中对未来可能的功能需求留出相应接口，也便于搭建起合理的项目结构。\r\n- 生成的项目结构图可作为参考，方便使用者/助教老师了解项目结构，参考类设计与项目评价结果提出相关意见，也可作为评分参考。\r\n- 在练习类任务（如完成某一项目的部分类，要求使用单例模式），通过教师端提供整体的类设计图方便初学者了解实际项目中使用各类设计模式的场景，更加易于理解与掌握。\r\n\r\n### 后端\r\n\r\nUbuntu + Python + Django\r\n\r\n基本思路：\r\n\r\n- （身份验证：学生端）->代码输入->代码正确性评估（动态、静态）->代码结构性评估->代码风格评估->结果输出及记录\r\n- （身份验证：管理端）->创建任务->创建代码结构->创建评分规则->查看作业情况\r\n\r\n涉及技术：Linux 系统编程、Python 编程、Django 后端架构、nginx 代理、Token 认证授权（JWT）、Git flow 工作流、OJ 实现（sandbox、RabbitMQ、Redis、内核进程管理等）、SQL 管理、前后端交互。\r\n\r\n前端：Vue+Element\r\n\r\n1.  需求分析：了解软件的目标用户，需求和功能。\r\n\r\n2.  概要设计：制定软件的整体架构，包括数据结构，功能模块和接口等。\r\n\r\n3.  详细设计：细化软件各个功能模块的实现方式，包括数据存储，算法实现和界面设计等。\r\n\r\n4.  编码实现：按照详细设计的要求进行代码编写。\r\n\r\n5.  测试：对软件进行测试，包括单元测试，集成测试和系统测试等。\r\n\r\n6.  调试：解决测试过程中发现的问题，修正代码。\r\n\r\n7.  部署：将软件部署到生产环境。\r\n\r\n8.  维护：对软件进行维护，包括代码优化，功能更新等。','2023-02-15',1),(2,'asdf','adsf','## 软件概况：\r\n\r\n- 传统 OJ 平台代码评测完全是基于输入、输出结果比对的黑盒评测，着重结果之上的评价方法并不利于培养软件工程能力，而且一般不支持多文件结构的代码评测，本项目旨在研究面向项目级的代码评测、质量评价方法，实现对代码质量的综合评价。\r\n- 研究基于完整项目的代码质量评价方法，除支持基本的代码正确性评测的话，能够基于提交代码的结构、代码规范和可能的漏洞等对代码质量进行综合评价方法，并通过集成各类代码检测工具实现自动评测。\r\n\r\n## 具体功能需求：\r\n\r\n### 集成化代码质量评价\r\n\r\n在前期学习中，初级开发者对代码编写、风格规范等尚不太够明晰，而代码风格等通过人工检查、评价耗时耗力，而已有的插件较为分散，且需要自行逐一配置，常常为初级开发者所忽略，因而通过集成静态、动态代码检查插件并给出相应的评分，帮助初级开发者更快发现问题，并对代码质量有更加清晰的评估。\r\n\r\n- 集成各类代码质量评价工具，从词法、语法、语义、内存、代码风格等方面提供检查，例如：CodeChecker、Gitleaks、Mobile Security Framework (MobSF)、ShellCheck、ErrorPone（Java 编译时捕获错误）、Brakeman（Ruby）、TscanCode（Lua、C#、C++），\r\n- 集成代码格式检查（如 Alibaba Java Coding Guidelines）并提供修改建议。\r\n- 项目评分：\r\n  - 对各类质量评价工具的结果做加权评价\r\n  - 能力图等方式直观展现项目的问题与优缺点。\r\n\r\n### 类设计与项目结构评价\r\n\r\nUML 类图可以清晰地展现项目各个类之间的层次关系，而初级开发者常常在类的设计上出现冗余或难以维护的调用、继承关系，借助 UML 类图并加以分析可以对项目结构、设计模式、类设计加以分析评价，还可通过静态分析的方式批量生成指定 Java 方法向下的完整调用链，结合项目的文件结构，进一步分析项目结构。\r\n\r\n- **评价内容与方式（研究中）：**\r\n  - 在项目开发前搭建关系图，进行图的分析，可提供参考项目结构\r\n  - 抽象类与类之间的关系\r\n  - 对类与类之间关系图（调用，重写，继承等）的分析\r\n    - 1. 与标准/参照关系图比对，提供参考建议\r\n    - 2. 根据类关系图，评判鲁棒性等\r\n    - 3. 根据类关系图的变化，评判项目结构是否优化/劣化\r\n    - 4. 对单一功能涉及到的类做分析（加载到标准项目/分析部分图的性质）\r\n\r\n### 多端功能：\r\n\r\n该项目既可作为自行学习、开发的自评工具，也可作为教学使用的辅助工具，以下为一些可能的方案：\r\n\r\n- 在迭代类型的作业中，给出参考的项目结构图/UML 类图，供学习者参考，便于在开发中对未来可能的功能需求留出相应接口，也便于搭建起合理的项目结构。\r\n- 生成的项目结构图可作为参考，方便使用者/助教老师了解项目结构，参考类设计与项目评价结果提出相关意见，也可作为评分参考。\r\n- 在练习类任务（如完成某一项目的部分类，要求使用单例模式），通过教师端提供整体的类设计图方便初学者了解实际项目中使用各类设计模式的场景，更加易于理解与掌握。\r\n\r\n### 后端\r\n\r\nUbuntu + Python + Django\r\n\r\n基本思路：\r\n\r\n- （身份验证：学生端）->代码输入->代码正确性评估（动态、静态）->代码结构性评估->代码风格评估->结果输出及记录\r\n- （身份验证：管理端）->创建任务->创建代码结构->创建评分规则->查看作业情况\r\n\r\n涉及技术：Linux 系统编程、Python 编程、Django 后端架构、nginx 代理、Token 认证授权（JWT）、Git flow 工作流、OJ 实现（sandbox、RabbitMQ、Redis、内核进程管理等）、SQL 管理、前后端交互。\r\n\r\n前端：Vue+Element\r\n\r\n1.  需求分析：了解软件的目标用户，需求和功能。\r\n\r\n2.  概要设计：制定软件的整体架构，包括数据结构，功能模块和接口等。\r\n\r\n3.  详细设计：细化软件各个功能模块的实现方式，包括数据存储，算法实现和界面设计等。\r\n\r\n4.  编码实现：按照详细设计的要求进行代码编写。\r\n\r\n5.  测试：对软件进行测试，包括单元测试，集成测试和系统测试等。\r\n\r\n6.  调试：解决测试过程中发现的问题，修正代码。\r\n\r\n7.  部署：将软件部署到生产环境。\r\n\r\n8.  维护：对软件进行维护，包括代码优化，功能更新等。','2023-02-15',1);
/*!40000 ALTER TABLE `MyBlog_blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MyBlog_blog_tag`
--

DROP TABLE IF EXISTS `MyBlog_blog_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MyBlog_blog_tag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `blog_id` int NOT NULL,
  `tag_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `MyBlog_blog_tag_blog_id_tag_id_6b60e3d3_uniq` (`blog_id`,`tag_id`),
  KEY `MyBlog_blog_tag_tag_id_d7a10907_fk_MyBlog_tag_id` (`tag_id`),
  CONSTRAINT `MyBlog_blog_tag_blog_id_77404e24_fk_MyBlog_blog_id` FOREIGN KEY (`blog_id`) REFERENCES `MyBlog_blog` (`id`),
  CONSTRAINT `MyBlog_blog_tag_tag_id_d7a10907_fk_MyBlog_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `MyBlog_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MyBlog_blog_tag`
--

LOCK TABLES `MyBlog_blog_tag` WRITE;
/*!40000 ALTER TABLE `MyBlog_blog_tag` DISABLE KEYS */;
INSERT INTO `MyBlog_blog_tag` VALUES (1,1,1),(2,2,1);
/*!40000 ALTER TABLE `MyBlog_blog_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MyBlog_category`
--

DROP TABLE IF EXISTS `MyBlog_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MyBlog_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MyBlog_category`
--

LOCK TABLES `MyBlog_category` WRITE;
/*!40000 ALTER TABLE `MyBlog_category` DISABLE KEYS */;
INSERT INTO `MyBlog_category` VALUES (1,'server');
/*!40000 ALTER TABLE `MyBlog_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MyBlog_comment`
--

DROP TABLE IF EXISTS `MyBlog_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MyBlog_comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  `email` varchar(254) NOT NULL,
  `content` varchar(240) NOT NULL,
  `pub` date NOT NULL,
  `blog_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `MyBlog_comment_blog_id_6cb5b6e5_fk_MyBlog_blog_id` (`blog_id`),
  CONSTRAINT `MyBlog_comment_blog_id_6cb5b6e5_fk_MyBlog_blog_id` FOREIGN KEY (`blog_id`) REFERENCES `MyBlog_blog` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MyBlog_comment`
--

LOCK TABLES `MyBlog_comment` WRITE;
/*!40000 ALTER TABLE `MyBlog_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `MyBlog_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MyBlog_tag`
--

DROP TABLE IF EXISTS `MyBlog_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MyBlog_tag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MyBlog_tag`
--

LOCK TABLES `MyBlog_tag` WRITE;
/*!40000 ALTER TABLE `MyBlog_tag` DISABLE KEYS */;
INSERT INTO `MyBlog_tag` VALUES (1,'server');
/*!40000 ALTER TABLE `MyBlog_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add 博客',7,'add_blog'),(26,'Can change 博客',7,'change_blog'),(27,'Can delete 博客',7,'delete_blog'),(28,'Can view 博客',7,'view_blog'),(29,'Can add 类别',8,'add_category'),(30,'Can change 类别',8,'change_category'),(31,'Can delete 类别',8,'delete_category'),(32,'Can view 类别',8,'view_category'),(33,'Can add 评论',9,'add_comment'),(34,'Can change 评论',9,'change_comment'),(35,'Can delete 评论',9,'delete_comment'),(36,'Can view 评论',9,'view_comment'),(37,'Can add 标签',10,'add_tag'),(38,'Can change 标签',10,'change_tag'),(39,'Can delete 标签',10,'delete_tag'),(40,'Can view 标签',10,'view_tag');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$150000$qs5vs0teY4aX$1wRxTe9amFgy/QgTf0yVAWnXG4xHR9iYpgwxnct6nqQ=','2023-02-15 03:59:07.625690',1,'czl','','','2522820243@qq.com',1,1,'2023-02-15 03:58:41.874168');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-02-15 06:38:21.756447','1','Category object (1)',1,'[{\"added\": {}}]',8,1),(2,'2023-02-15 06:38:32.894316','1','Tag object (1)',1,'[{\"added\": {}}]',10,1),(3,'2023-02-15 06:38:35.314680','1','Blog object (1)',1,'[{\"added\": {}}]',7,1),(4,'2023-02-15 07:35:35.167245','1','Blog object (1)',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',7,1),(5,'2023-02-15 08:56:10.512183','2','Blog object (2)',1,'[{\"added\": {}}]',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'MyBlog','blog'),(8,'MyBlog','category'),(9,'MyBlog','comment'),(10,'MyBlog','tag'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'MyBlog','0001_initial','2023-02-15 03:48:15.604498'),(2,'contenttypes','0001_initial','2023-02-15 03:48:15.716275'),(3,'auth','0001_initial','2023-02-15 03:48:15.798657'),(4,'admin','0001_initial','2023-02-15 03:48:15.961717'),(5,'admin','0002_logentry_remove_auto_add','2023-02-15 03:48:16.002451'),(6,'admin','0003_logentry_add_action_flag_choices','2023-02-15 03:48:16.007806'),(7,'contenttypes','0002_remove_content_type_name','2023-02-15 03:48:16.047371'),(8,'auth','0002_alter_permission_name_max_length','2023-02-15 03:48:16.072310'),(9,'auth','0003_alter_user_email_max_length','2023-02-15 03:48:16.090622'),(10,'auth','0004_alter_user_username_opts','2023-02-15 03:48:16.098178'),(11,'auth','0005_alter_user_last_login_null','2023-02-15 03:48:16.122460'),(12,'auth','0006_require_contenttypes_0002','2023-02-15 03:48:16.125079'),(13,'auth','0007_alter_validators_add_error_messages','2023-02-15 03:48:16.131749'),(14,'auth','0008_alter_user_username_max_length','2023-02-15 03:48:16.165398'),(15,'auth','0009_alter_user_last_name_max_length','2023-02-15 03:48:16.192595'),(16,'auth','0010_alter_group_name_max_length','2023-02-15 03:48:16.205370'),(17,'auth','0011_update_proxy_permissions','2023-02-15 03:48:16.213813'),(18,'sessions','0001_initial','2023-02-15 03:48:16.227076'),(19,'MyBlog','0002_auto_20230215_0854','2023-02-15 08:55:07.217143');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-15 18:58:18
