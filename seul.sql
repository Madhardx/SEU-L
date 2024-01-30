-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sty 30, 2024 at 09:34 PM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `seul`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klienci`
--

CREATE TABLE `klienci` (
  `id` int(11) NOT NULL,
  `imieNazwisko` varchar(120) NOT NULL,
  `dokument` varchar(30) NOT NULL,
  `adres` varchar(260) NOT NULL,
  `userID` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `klienci`
--

INSERT INTO `klienci` (`id`, `imieNazwisko`, `dokument`, `adres`, `userID`) VALUES
(1, 'Jacek Rybak', 'AYJ802201', '11-100 Lidzbark Warmiński ul. Mazurska 4/3', 'Dawid Rybak - Admin'),
(2, 'Sylwia Kuczko', 'AYJ802202', '11-100 Lidzbark Warmiński ul. Astronomów 26/27', 'Dawid Rybak - Admin'),
(3, 'Dariusz Rybak', 'AYJ802203', '11-100 Lidzbark Warmiński Medyny 10', 'Dawid Rybak - Admin');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `umowy`
--

CREATE TABLE `umowy` (
  `id` int(11) NOT NULL,
  `Nr` varchar(12) NOT NULL,
  `DataZ` date NOT NULL,
  `Okres` date NOT NULL,
  `Przedmiot` varchar(120) NOT NULL,
  `wartosc` varchar(30) NOT NULL,
  `userID` varchar(120) NOT NULL,
  `klientID` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `umowy`
--

INSERT INTO `umowy` (`id`, `Nr`, `DataZ`, `Okres`, `Przedmiot`, `wartosc`, `userID`, `klientID`) VALUES
(1, '1/01/2024', '2024-01-05', '2024-02-05', 'Iphone 14 MAX Pro', '4500', 'Dawid Rybak - Admin', 'AYJ802201'),
(2, '2/01/2024', '2024-01-12', '2024-02-12', 'TV LG C11', '5000', 'Dawid Rybak - Admin', 'AYJ802202'),
(3, '3/01/2024', '2024-01-19', '2024-02-19', 'Radio JVC BT', '400', 'Dawid Rybak - Admin', 'AYJ802203'),
(4, '4/01/2024', '2024-01-10', '2024-02-10', 'Radio JVC', '350', 'Dawid Rybak - Admin', 'AYJ802201');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `login` varchar(264) NOT NULL,
  `password` varchar(264) NOT NULL,
  `nick` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `login`, `password`, `nick`) VALUES
(1, 'admin', '$2y$10$L55StSe2GzJh7AUcOZuMROcVETbLjbOOSbTHRDGREQLtr49kqWSoe', 'Dawid Rybak - Admin');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `klienci`
--
ALTER TABLE `klienci`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userID` (`userID`);

--
-- Indeksy dla tabeli `umowy`
--
ALTER TABLE `umowy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userID` (`userID`),
  ADD KEY `klientID` (`klientID`);

--
-- Indeksy dla tabeli `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `klienci`
--
ALTER TABLE `klienci`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `umowy`
--
ALTER TABLE `umowy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
