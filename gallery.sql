-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 14 oct. 2021 à 20:32
-- Version du serveur : 8.0.26
-- Version de PHP : 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gallery`
--

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Architectures'),
(2, 'Sculpture'),
(3, 'Arts visuels'),
(4, 'Arts de la scène'),
(5, 'Musique'),
(6, 'Cinéma');

-- --------------------------------------------------------

--
-- Structure de la table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `painting_id` int NOT NULL,
  `commentaire` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5F9E962AB00EB939` (`painting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `comments`
--

INSERT INTO `comments` (`id`, `painting_id`, `commentaire`) VALUES
(1, 1, 'Commentaire 1'),
(2, 2, 'Commentaire 2'),
(3, 3, 'Commentaire 3'),
(4, 4, 'Commentaire 4'),
(5, 5, 'Commentaire 5');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20211014143554', '2021-10-14 20:28:59', 140);

-- --------------------------------------------------------

--
-- Structure de la table `painting`
--

DROP TABLE IF EXISTS `painting`;
CREATE TABLE IF NOT EXISTS `painting` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `height` int NOT NULL,
  `width` int NOT NULL,
  `image` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_66B9EBA012469DE2` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `painting`
--

INSERT INTO `painting` (`id`, `category_id`, `title`, `description`, `created`, `height`, `width`, `image`) VALUES
(1, 6, 'incidunt minima aut ut molestias', 'Perferendis incidunt qui quis et assumenda eos Necessitatibus veniam molestias reprehenderit accusamus ex sed Ex voluptatem eos repellendus molestiae Explicabo est perferendis sit molestiae qui culpa non\n\nEum eos unde deleniti deserunt est tenetur molestias Corrupti eos commodi dolores vero iure vel officia vel\n\nVoluptates explicabo quos asperiores suscipit Explicabo nulla totam et placeat In itaque beatae possimus ut similique Doloribus cum sunt dignissimos autem quia repellendus vero', '2021-10-14 20:29:12', 13, 24, '1.png'),
(2, 5, 'sunt magni ut quibusdam', 'Quam dolore nobis et quo velit ex ipsam Sint est impedit consequatur facere Quos sed necessitatibus nobis sunt\n\nOmnis quia deleniti ut labore consectetur quis Incidunt distinctio ea reprehenderit porro doloribus corporis Accusantium quia recusandae quia saepe Aut id nisi neque velit aliquid repellendus\n\nNumquam voluptas eius pariatur autem Molestias eaque iste debitis nemo rerum ut assumenda soluta Possimus voluptates asperiores excepturi sequi dolorem qui Laboriosam veniam eum quia et error distinctio', '2021-10-14 20:29:12', 29, 17, '2.png'),
(3, 6, 'voluptate est expedita', 'Aperiam animi magni sit molestiae Eligendi quia eius recusandae cum eum enim quia Ex deserunt porro repudiandae neque doloribus\n\nEx dolores neque eum excepturi dolor quis non Voluptas ut vero nostrum saepe Corporis sit et incidunt qui Ad a minima laborum ex\n\nExplicabo aut consequuntur dolores doloribus et nihil aut quisquam Beatae quibusdam voluptatem maxime nulla autem id Hic veniam omnis dolor inventore Sed voluptatem repellendus eligendi velit animi', '2021-10-14 20:29:12', 18, 28, '3.png'),
(4, 3, 'est et eius corporis ut', 'Quam ipsum voluptates aspernatur et Occaecati debitis porro recusandae ullam quis Autem quasi consectetur rerum consequatur Tenetur architecto delectus consequatur assumenda quas nulla\n\nIllum adipisci tempore ea dicta aut unde Et voluptatibus culpa numquam placeat sint Reiciendis ut et accusantium Rerum voluptate veniam nisi repellendus eos\n\nQuaerat maxime expedita dolorem consequatur error sapiente recusandae Possimus dolor enim unde ipsum nesciunt aut Et quam est reiciendis saepe consequatur nemo', '2021-10-14 20:29:12', 18, 15, '4.png'),
(5, 1, 'quae earum omnis repudiandae consequatur', 'Ea asperiores est quam est aspernatur animi Sit accusamus qui harum occaecati blanditiis eum non iusto\n\nOmnis officia repellendus error minus minus sint quia Porro ab laboriosam omnis recusandae Et sapiente est ratione impedit Qui omnis voluptas voluptate voluptas\n\nEt repellat deserunt quia minus eos Et tempora nihil omnis molestiae voluptatibus et sint dolor Ipsa maiores accusantium accusantium aut error aut', '2021-10-14 20:29:12', 24, 29, '5.png'),
(6, 2, 'et saepe ut', 'Dolorem sint perspiciatis voluptatem sit rerum Enim non adipisci culpa nobis unde pariatur Minima mollitia eligendi ducimus et aspernatur dolorum Repudiandae atque quam cum et quos\n\nAt ex explicabo repellendus eius veniam Ut assumenda quia error Animi in excepturi hic et fuga\n\nNobis nihil eaque omnis qui nihil est necessitatibus Praesentium eaque eaque autem maiores perferendis ratione dolorem dolorem Praesentium labore ipsum quasi culpa laborum Sit voluptate aut unde molestias qui natus maxime libero', '2021-10-14 20:29:12', 15, 28, '6.png'),
(7, 5, 'ratione sapiente vero', 'Dignissimos explicabo culpa est dolores Rerum maiores illum amet corporis aliquid Qui voluptatem sed assumenda error minus Itaque expedita nisi mollitia qui\n\nEaque natus soluta impedit molestiae sed repellat adipisci Culpa numquam officiis sed dolorem soluta recusandae Libero necessitatibus eaque aperiam deserunt\n\nEt ex velit et voluptatem dolores molestiae voluptas Ea itaque omnis ad eius quisquam enim Perferendis voluptate vel ad tempore qui Est temporibus voluptate ut assumenda quia', '2021-10-14 20:29:12', 14, 19, '7.png'),
(8, 3, 'iure officia ut similique vel', 'Recusandae dolor et dicta ab ut Non qui temporibus quis voluptas architecto architecto dolores Sed temporibus molestiae non mollitia\n\nId ut dolor accusantium ut commodi provident Et recusandae quam et Deleniti qui quia et corporis\n\nEos consequatur consequatur ad omnis est debitis Itaque nostrum atque omnis quo rem quas eligendi modi Ipsum nobis velit et sunt corrupti', '2021-10-14 20:29:12', 14, 19, '8.png'),
(9, 5, 'sit assumenda expedita ex eius', 'Facilis sint nisi fugit dolores Qui et ab alias natus ex Autem sunt vitae quis dignissimos Molestiae ut ea laborum aut placeat nihil\n\nIure placeat molestiae eveniet cumque ipsa Accusamus architecto nihil dolorem dicta Ex odio vel eveniet at\n\nOfficiis deserunt velit qui pariatur et Ullam odit aut cumque neque Illum ipsam deserunt quisquam dolor sunt', '2021-10-14 20:29:12', 26, 15, '9.png'),
(10, 2, 'nihil labore error', 'Totam ipsum quam et commodi Dolores est quo voluptas Nostrum quo vitae voluptas quod\n\nQuo natus sint soluta adipisci dolorum debitis Assumenda deserunt similique temporibus expedita iure Est et et aut tempore iste\n\nFuga accusamus expedita necessitatibus rem sapiente Ea tempore optio repudiandae sed aut Delectus adipisci ex ea quis et nihil minima In non illum deleniti aut dolorem adipisci', '2021-10-14 20:29:12', 23, 26, '10.png');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `FK_5F9E962AB00EB939` FOREIGN KEY (`painting_id`) REFERENCES `painting` (`id`);

--
-- Contraintes pour la table `painting`
--
ALTER TABLE `painting`
  ADD CONSTRAINT `FK_66B9EBA012469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
