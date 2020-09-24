-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 25-Set-2020 às 00:40
-- Versão do servidor: 10.4.14-MariaDB
-- versão do PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `materialaulasremotas`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `disciplina`
--

CREATE TABLE `disciplina` (
  `idDisciplina` int(11) NOT NULL,
  `nomeDisciplina` varchar(20) NOT NULL,
  `cargaHoraria` varchar(20) NOT NULL,
  `ativoDisciplina` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `disciplina`
--

INSERT INTO `disciplina` (`idDisciplina`, `nomeDisciplina`, `cargaHoraria`, `ativoDisciplina`) VALUES
(1, 'Matemática', '50h/a', 0),
(2, 'Língua Portuguesa', '50h/a', 0),
(3, 'Ciências', '30h/a', 0),
(4, 'Geografia', '30h/a', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `materiais`
--

CREATE TABLE `materiais` (
  `idMaterial` int(11) NOT NULL,
  `idProfessor` int(11) NOT NULL,
  `idDisciplina` int(11) NOT NULL,
  `idTurma` int(11) NOT NULL,
  `TituloMaterial` varchar(50) NOT NULL,
  `DescricaoMaterial` text NOT NULL,
  `LinkdaAula` varchar(30) NOT NULL,
  `LinkMaterial` varchar(50) NOT NULL,
  `AtivoMat` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `materiais`
--

INSERT INTO `materiais` (`idMaterial`, `idProfessor`, `idDisciplina`, `idTurma`, `TituloMaterial`, `DescricaoMaterial`, `LinkdaAula`, `LinkMaterial`, `AtivoMat`) VALUES
(1, 1, 1, 4, 'Atividades sobre projeção geom', 'Aqui o professor escrever todas as instruções para que o aluno possa realizar a atividade/trabalho/avaliação online.\r\nTambém pode colocar um links de uma aula que acontecerá ou que já foi gravada e após um link complementar para esse material que poderá ser um link de um compartilhamento no google drive.', 'meet.google.com/wqw-qaz-ttt', 'linkdecompartilhamento aqui', 0),
(2, 2, 2, 4, 'Material sobre concordância verbal', 'Bom dia!\r\nSegue material de nossa disciplina sobre concordância verbal que será pré-requisito para a concordância nominal. Leiam e façam as atividades dos links postados.\r\nQuaisquer dúvidas, estou à disposição para auxiliá-los nas mensagens.\r\nObrigada!', 'meet.google.com/qwe-ttt-iii', 'pode ser o link de um formulár', 0),
(3, 3, 4, 2, 'Atividades de Geografia para as crianças', 'Bom dia!\r\nSegue o material para continuarmos o assunto que vimos hoje durante a nossa aula online.', 'link da aula gravada aqui ok', 'linkdecompartilhamento aqui', 0),
(4, 4, 3, 3, 'Material de Ciências - atividade', 'Olá,\r\n\r\nsegue material complementar de nossa aula. Conteúdo para ser estudado para nossa avaliação da próxima semana.', 'link da aula aqui', 'pode ser o link de um formulário', 1),
(5, 0, 0, 0, 'Aula de História - teste', 'Bom dia, \r\nsegue o material, certo?', 'link aqui link correto agora', 'link aqui', 0),
(6, 0, 0, 0, 'Novo material no grid', 'Boa noite,\r\n\r\nsegue o link da aula gravada e  material para o nosso próximo assunto.', 'https://meet.google.com/mvf-ei', 'docs.google.com%2Fdocumen', 0),
(9, 0, 0, 0, 'Um teste em outro computador', 'Este é mais uma teste em outro computador. ', 'Com link da aula aqui', 'Material complementar aqui', 0),
(10, 0, 0, 0, 'Inserção de um novo material em 22/09', 'Este é um questionário para entregar em 01/10. Bom trabalho a todos.', 'https://meet.google.com/abc-er', 'link ', 0),
(11, 0, 0, 0, 'Mais um material em 21/09', 'Boa noite, pessoal!\r\n\r\nEstamos fazendo um teste aqui.\r\nObrigada!', 'Insira aqui o link da aula', 'Insira aqui link complementar, caso tenha.', 1),
(13, 0, 0, 0, '', '', '', '', 1),
(14, 0, 0, 0, 'Um material digitado mais tarde - fora do horário ', 'Boa noite', 'hkjhkjhkj', 'hkhkhk', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `professor`
--

CREATE TABLE `professor` (
  `idProfessor` int(11) NOT NULL,
  `nomeProfessor` varchar(30) NOT NULL,
  `enderecoProfessor` varchar(30) NOT NULL,
  `cidadeProfessor` varchar(30) NOT NULL,
  `telefoneProfessor` varchar(20) NOT NULL,
  `emailProfessor` varchar(30) NOT NULL,
  `ativoProfessor` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `professor`
--

INSERT INTO `professor` (`idProfessor`, `nomeProfessor`, `enderecoProfessor`, `cidadeProfessor`, `telefoneProfessor`, `emailProfessor`, `ativoProfessor`) VALUES
(1, 'Fernanda Fernandes', 'Rua Xv de novembro,900', 'Blumenau', '47-99111112', 'fernanda@fernanda.com.br', 0),
(2, 'Ana Paula Antares', 'Rua 7 de setembro, 890', 'Blumenau', '47-9876-0000', 'ana@ana.com.br', 0),
(3, 'Kátia Felipone', 'Rua República Argentina, 900', 'Itajaí', '47-9898-0000', 'katia@katia.com.br', 0),
(4, 'Raul Raulino', 'Rua das canoas, 700', 'Ilhota', '47-8989-6543', 'raul@raul.com.br', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `segmento`
--

CREATE TABLE `segmento` (
  `idSegmento` int(11) NOT NULL,
  `descricaoSegmento` varchar(30) NOT NULL,
  `ativoSegmento` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `segmento`
--

INSERT INTO `segmento` (`idSegmento`, `descricaoSegmento`, `ativoSegmento`) VALUES
(1, 'Educação Infantil', 0),
(2, 'Ensino Fundamental 1', 0),
(3, 'Ensino Fundamental 2', 0),
(4, 'Ensino Médio', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `turma`
--

CREATE TABLE `turma` (
  `idTurma` int(11) NOT NULL,
  `idSegmento` int(11) NOT NULL,
  `descricaoTurma` varchar(15) NOT NULL,
  `numeroAlunos` int(11) NOT NULL,
  `ativoTurma` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `turma`
--

INSERT INTO `turma` (`idTurma`, `idSegmento`, `descricaoTurma`, `numeroAlunos`, `ativoTurma`) VALUES
(1, 2, '1ª ano A', 35, 0),
(2, 1, 'Infantil 2A', 15, 0),
(3, 3, '6º ano A', 34, 0),
(4, 4, '1ª série A', 40, 0);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `disciplina`
--
ALTER TABLE `disciplina`
  ADD PRIMARY KEY (`idDisciplina`);

--
-- Índices para tabela `materiais`
--
ALTER TABLE `materiais`
  ADD PRIMARY KEY (`idMaterial`);

--
-- Índices para tabela `professor`
--
ALTER TABLE `professor`
  ADD PRIMARY KEY (`idProfessor`);

--
-- Índices para tabela `segmento`
--
ALTER TABLE `segmento`
  ADD PRIMARY KEY (`idSegmento`);

--
-- Índices para tabela `turma`
--
ALTER TABLE `turma`
  ADD PRIMARY KEY (`idTurma`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `disciplina`
--
ALTER TABLE `disciplina`
  MODIFY `idDisciplina` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `materiais`
--
ALTER TABLE `materiais`
  MODIFY `idMaterial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `professor`
--
ALTER TABLE `professor`
  MODIFY `idProfessor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `segmento`
--
ALTER TABLE `segmento`
  MODIFY `idSegmento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `turma`
--
ALTER TABLE `turma`
  MODIFY `idTurma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
