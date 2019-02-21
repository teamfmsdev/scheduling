-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 04, 2019 at 02:09 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ms`
--

-- --------------------------------------------------------

--
-- Table structure for table `main`
--

CREATE TABLE `main` (
  `row` int(11) NOT NULL,
  `Work Title` text NOT NULL,
  `Priority` text NOT NULL,
  `Type 1` text NOT NULL,
  `Type 2` text NOT NULL,
  `Description` text NOT NULL,
  `Location` text NOT NULL,
  `Status` text NOT NULL,
  `Company` text NOT NULL,
  `SAP#` text NOT NULL,
  `Request By` text NOT NULL,
  `Request Date` text NOT NULL,
  `Closed By` text NOT NULL,
  `Completion Date` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `main`
--

INSERT INTO `main` (`row`, `Work Title`, `Priority`, `Type 1`, `Type 2`, `Description`, `Location`, `Status`, `Company`, `SAP#`, `Request By`, `Request Date`, `Closed By`, `Completion Date`) VALUES
(1, 'Olefin Substation Repainting', 'P4', 'PM', 'PT', '15/11-final touch up and house keeping.\n17/12- amended PO, signed JCT.', 'Olefins Sub Station', 'Closed', 'Enproserve', '-', 'Aqil', '2018-11-15', 'Aqil', '2018-12-18'),
(2, 'Roof, Gutter, and downpipe replacement', 'P2', 'PM', 'RP', '15/11 - 12 pieces of metal deck left. next week will be gutter and downpipe\n3/1/19: Conducted PASR with Olefins. PASR leader anuar amaji.\n11/1/2019: alfa tech completed PASR finding closure. Olefin operation reported some leakage\n13/1/2019: Nadiah Shared Inspection report sample\n14/1/2019: site visit with contractor to check the reported leak.\n15/1/2019: communicated to Nadiah about site visit finding. the leak was coming from ole metal deck. however contractor offered to patch the hole but with no warranty (since its not in the scope), if lifeline is extended, \n20/1/2019: Nadiah request to patch the hole through lync\n20/1/2019: inform PRA to extend life line and informed alfa tech on the request\n21/1/2019: PRA extend the life line at compressor house\n21/1/2019: ATE team came in the afternoon to patch the holes\n21/1/2019: communicated to Nadiah about the work completion and was given green light to dismantle the scaffolding\n22/1/2019: scaffolding dismantling in progress', 'Olefins Compressor house', 'In Progress', 'Alfa Tech', '-', 'Aqil', '2018-11-15', '', ''),
(3, 'Gutter replacement at HSE', '', 'PM', 'RP', '9/1/2019: PRA erect scaffolding\n14/1/2019 -  ATE start replacement work\n20/1/2019: ATE paint gutter', 'HSE Building', 'In Progress', 'Alfa Tech', '-', 'Aqil', '2018-11-15', '', ''),
(4, 'coway #2 air sumbak', '', 'RM', 'RS', 'Air sumbak. dok tubik. \n15/11 - pok cik g check, filter rosak, please call coway \n16/11 - called coway, will come on monday next week \n18/11 - filter change. completed', 'pantry cca', 'Closed', '', '-', 'Malina', '2018-11-15', 'Malina', '2018-11-18'),
(5, 'To rectify and repair smoke', '', 'PM', 'RS', 'To rectify and repair smoke detector L03D017', 'Cafeteria', 'New', 'Safety system team', '23814132', 'Zamri', '2018-11-18', '', ''),
(6, 'Repair smoke detector', '', 'PM', 'RS', 'To check and repair smoke detector Z021 at Cafeteria at Cafeteria Z021 at Cafeteria Admin', 'Cafeteria', 'New', 'Safety system team', '23821628', 'Zamri', '2018-12-09', '', ''),
(7, 'Replace compressor aircond', '', 'PM', 'RS', 'To replace compressor aircond unit kat Admin', 'Admin', 'New', 'DBS', '23822946', 'Zamri', '2018-12-12', '', ''),
(8, 'Repair Smoke Detector', '', 'PM', 'RS', 'To check and repair Smoke Detector No L 02D015 Problem', 'Admin', 'New', 'Safety System team', '23824209', 'Zamri', '2018-12-16', '', ''),
(9, 'Repair aircond unit', '', 'RM', 'RS', 'To check and repair aircond unit at Server room (IT) at Admin Building', 'Admin Server Room', 'New', 'DBS Team', '23825073', 'Zamri', '2018-12-18', '', ''),
(10, 'Troubleshoot Streetlight', '', 'PM', 'RS', 'To troubleshoot Streetlight at Area Admin', 'Admin', 'New', 'Electrical Team', '23825634', 'Zamri', '2018-12-19', '', ''),
(11, 'TO REMOVE & TO INSTALL THE PORTABLE RADIO', '', 'PM', 'RS', '- TO REMOVE PORTABLE RADIO FOR TOYOTA HILUX TBA 5652.AND TO INSTALL THE PORTABLE RADIO FOR TRITON PREMIUM VCK 8095.\n\n26 Dec 2018 - Siti Nurwaty Endah informed kamal that she already communicated with Axis.\n30/12 â€“ 3/1/19 - Job schedule\n07 Jan 2019 - Axis will perform the job\n15 Jan 2019 - Follow Up with Siti Nurwaty', 'ADMIN BUILDING', 'In Progress', '', '23825762', 'Malina', '2018-12-19', '', ''),
(13, 'FY2018 EOU MSR PATH FORWARD', 'P1', 'PM', 'RS', 'to arrange round tables and chairs and can accommodate 25-30 people. Please set up mobilized projector EPSON as well.\n(Sunday, 6 January)', 'Salahuddin Al-Ayyubi', 'Closed', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2018-12-31', 'Kamarulzaman', '2019-01-06'),
(14, 'Remove chairs', 'P2', 'PM', 'HK', 'to request Pakcik untuk tolong hantarkan kerusi yg nk dispose drpd CCB ke Admin building.I will arrange helper to help pakcik3.\n(Norazreen Binti Zahari)', 'Ccb to Admin', 'Closed', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-01', 'Kamarulzaman', '2019-01-08'),
(15, 'Cubicle replacement completion inspection at CCB', '', 'PM', 'RP', 'Some ceiling panel have hole, need to replace\nB&I team (En Aqil)', 'EOU Office', 'In Progress', 'Pcogd', '-', 'Kamarulzaman', '2018-12-31', '', ''),
(16, 'Housekeeping', 'P2', 'RM', 'HK', 'Housekeeping part of workstation eou & olefins dprt at admin building\n(En Amin)', 'Admin building', 'Closed', 'Alfatech', '-', 'Kamarulzaman', '2019-01-01', 'Kamarulzaman', '2019-01-02'),
(17, 'Replaces CPCS Board', '', 'PM', 'RS', 'To request replaces CPCS Board for chiller unit at Admin', 'Admin', 'New', 'DBS team', '23829595', 'Zamri', '2019-01-01', '', ''),
(18, 'Repair smoke detector', '', 'PM', 'RS', 'To request check and repair smoke detector at 1st north corridor at Admin ( N005L04D043 )', 'Admin', 'New', 'Safety System Team', '23829596', 'Zamri', '2019-01-01', '', ''),
(19, 'Repair smoke detector', '', 'PM', 'RS', 'To request check and repair smoke detector at Canteen ( N005L03D017 )', 'Admin', 'New', 'Safety System Team', '23829597', 'Zamri', '2019-01-01', '', ''),
(20, 'Olefins MI Session', 'P1', 'SM', 'HK', 'Nak mintak tulon arrange round table sebanyak 6 meja & kerusi.\nKat belakang hall, mintak tulon letak meja utk diletakkan makanan.\n(Monday, 7 January, 2019 8:00 AM-5:00 PM)\n(En Nazri)', 'Minihall 1&2', 'Closed', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-02', 'Kamarulzaman', '2019-01-06'),
(21, 'Remove & Install key box', 'P3', 'RM', 'HK', 'to remove & install key box at eou office.\n(Norazreen Zahari)', 'Eou', 'Closed', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-02', 'Kamarulzaman', '2019-01-02'),
(22, 'Replace bunting', '', 'PM', 'RP', 'Replace 4 pcs bunting at gate 1', 'Gate 1', 'Closed', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2018-12-31', 'Kamarulzaman', '2018-12-31'),
(23, 'Tiang terbalik', '', 'PM', 'RS', 'baiki tiang rantai terbalik di parking admin (2 batang)', 'Parking Admin', 'New', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-02', '', ''),
(24, 'Install hazard sticker', '', 'PM', 'HK', 'Continues install hazard sticker at parking area.', 'Parking Admin', 'New', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-02', '', ''),
(25, 'Repair door', '', 'PM', 'RS', 'Pintu meeting room Ibnu Al-Baitar bergesel dengan lantai.', 'Admin 1st floor', 'New', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-02', '', ''),
(26, 'Repair Door', '', 'PM', 'RS', 'Repair door @ frame at uniform room', 'Lobby', 'New', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-02', '', ''),
(27, 'Repair Door', '', 'PM', 'RS', 'Baiki pintu tengah2 antara boardroom1-boardroom2-plt room\n(ketat)', 'Admin', 'New', 'Nekad (b&I team)', '-', 'Kamarulzaman', '2019-01-02', '', ''),
(28, 'Repair Door', '', 'PM', 'RS', 'Baiki door closer @ engsel pintu.', 'Admin', 'Closed', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-02', 'Kamarulzaman', '2019-01-02'),
(29, 'Repair Door', '', 'PM', 'RS', 'Repair @ replace door closer.', 'Gym', 'New', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-02', '', ''),
(30, 'Visitor Parking', 'P3', 'PM', 'PT', 'Repainting visitor parking area', 'Admin', 'New', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-02', '', ''),
(31, 'Painting', '', 'PM', 'PT', 'Repainting door at admin.', 'Admin', 'New', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-02', '', ''),
(32, 'Painting', '', 'PM', 'PT', 'Repainting wall at toilet tsd wing A & wing b.\n(watercooler)', 'Admin', 'New', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-02', '', ''),
(33, 'To add addional cubicle at HSE Building', '', 'PM', 'RP', '4 temporary unit of cubicle is required for additional staff and practical student.\nneed to confirm the location and space available.\n- first meeting will be on 6/1/2019\n6/1/2019 \nDecision from meeting. \n1. HR to place temporary cubicle at HSE. \n2. Rosnan will make eMOC and SAP to add power point.\n3. HR to include in cubicle replacement project with Chemical dept after TA\n18/1/2019: Support Team installed cubicle at HSE Office', 'HSE building', 'Closed', 'PCDSB', '-', 'Aqil', '2019-01-03', 'Aqil', '2019-01-21'),
(34, 'TO REPAIR WATER HEATER', '', 'RM', 'RS', '- REPORT TO ACW ON 26 NOV 2018\n- 1st TIME REPAIR - STILL LEAKING\n- 2nd FOLLOW UP WITH ACW\n\n- ACW SENT THE WATER HITTER FOR REPAIRING IN KUANTAN ( SENT TO KUATAN DUE TO NO SHOP IN PAKA, DUNGUN, KERTIH CAN REPAIR )\n- FOLLOW UP AGAIN ON 02.01.2019\n- STILL IN PROGRESS - REPAIR\n08.01.2019 - 4th FOLLOW UP\n10.01.2019 - ACW RETURNED THE WATER HEATER TO CAFE OGD', 'Cafeteria', 'Closed', 'ACW', '-', 'Malina', '2019-01-03', 'Malina', '2019-01-10'),
(35, 'TO REPAIR 1 UNIT AUTO TAB', '', 'RM', 'RS', '- TO REPAIR 1 UNIT AUTO TAB WHICH NON STOP WATER FLOW\n- REPORT TO ACW ON 31 DECEMBER 2018\n- AUTO TAB TERSUMBAT - ACW PLANNED TO SERVICE ON 04.01.2019', 'CAFETERIA', 'In Progress', 'ACW', '-', 'Malina', '2019-01-03', '', ''),
(36, 'Renovation Work At gate House gate 2', '', 'PM', 'RP', 'Scope: Tukar Gutter, Painting, tukar tiles luar, renovate tandas\n15/1/2019: communicated to SnD, HSE, AP, and MTNC about the work\n20/1/2019: contractor masuk for hacking work', 'Gate House 2', 'In Progress', 'Alfa Tech', '-', 'Aqil', '2019-01-03', '', ''),
(37, 'Roof Installation at Surau', '', 'PM', 'RP', 'New pergola roof installation at Surau complete with hardwood structure.\nto cover ablution area.', 'Surau Al- Hidayah', 'New', 'Alfa tech', '-', 'Aqil', '2019-01-03', '', ''),
(38, 'to replace gate1F', '', 'RM', 'RP', 'To replace damage gate 1F.\n10/1/19: JHA in progress, to be reviewed', 'gate 1F. admin complex', 'In Progress', 'alfa tech', '-', 'Aqil', '2019-01-03', '', ''),
(39, 'Renovation Foyer & Surau CCB', '', 'PM', 'RP', 'renovation works at foyer & surau ccb\n20/1/2019: design approved by saiful amel that it will not effect structural integrity of the building\n21/1/19: emoc created in system and sign off by Aziem Sulaiman', 'CCB', 'In Progress', 'alfa tech', '-', 'Aqil', '2019-01-03', '', ''),
(40, 'Replace GI gutter', '', 'RM', 'RP', 'Replace GI gutter at HSE building\n9/1/2019: erect scaffolding \n13/1/2019: Gutter replacement start\n20/1/2019: painting gutter', 'HSE Building', 'In Progress', 'alfa tech', '-', 'Aqil', '2019-01-03', '', ''),
(41, 'Modify rain water down pipe', '', 'PM', 'RS', 'modify rain water down pipe at CCB. when heavy rain, rain water from upper level downpipe flows very fast over the hitting the gutter wall and overflow. because of this, the rain water tend to spill into the building through underneath roof.', 'CCB', 'New', 'alfa tech', '-', 'Aqil', '2019-01-03', '', ''),
(42, 'Install Insulated Metal Deck roof', 'P3', 'PM', 'RP', 'Install Insulated Metal Deck Roof at cafeteria gazebo.', 'Canteen', 'New', 'alfa tech', '-', 'Aqil', '2019-01-03', '', ''),
(43, 'Change Key', '', 'RM', 'RP', 'Kak Ta have requested the 3 Pak Cikâ€™s to change the room key at HSE Building', 'HSE building', 'Closed', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-02', 'Kamarulzaman', '2019-01-02'),
(44, 'Change Door knob', '', 'RM', 'RP', 'Kak Ta have requested the 3 Pak Cikâ€™s to change door knob at hse building\n(emergency exit door)', 'HSE Building', 'Closed', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-06', 'Kamarulzaman', '2019-01-13'),
(45, 'Install Door Handle', '', 'PM', 'RS', 'Install handle door at ccb building.', 'Ccb', 'New', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-06', '', ''),
(46, 'Cleaning Cover Air cond', '', 'PM', 'HK', 'Cleaning all cover air cond at ccb building.', 'Ccb', 'In Progress', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-06', '', ''),
(47, 'Repair Ceiling', '', 'PM', 'RS', 'Repair ceiling at emergency exit door ground floor surau\n(outdoor)', 'Ccb', 'Closed', 'Nekad (b&I team)', '-', 'Kamarulzaman', '2019-01-06', 'Kamarulzaman', '2019-01-07'),
(48, 'Replace Ceiling', '', 'PM', 'RP', 'replace ceiling at ccb building,emergency exit from hse to ccb.\n(outdoor)', 'Ccb', 'New', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-06', '', ''),
(49, 'Ceiling Structure', '', 'PM', 'RS', 'replace ceiling structure at ccb building(ground floor)', 'Ccb', 'New', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-06', '', ''),
(50, 'Anti slip sticker', '', 'PM', 'RP', 'Check & replace anti slip sticker at ccb', 'Ccb', 'New', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-06', '', ''),
(51, 'Floor trap', '', 'PM', 'SL', 'silicone floor trap at ccb smoking area.', 'Ccb', 'New', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-06', '', ''),
(52, 'Polycarbonate', '', 'PM', 'HK', 'remove polycarbonate wall at ccb smoking area\n(damage)', 'Ccb', 'New', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-06', '', ''),
(53, 'Install new workstation', '', 'RM', 'RS', 'installation of temporary workstation at HSE Office\nby this week.(11/1/2019)', 'Hse', 'Closed', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-07', 'Kamarulzaman', '2019-01-11'),
(54, 'Ceiling Lobby', '', 'PM', 'SL', 'Plaster ceiling at main entrance lobby.', 'Lobby', 'New', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-07', '', ''),
(55, 'Cleaning Cover Air Cond', '', 'PM', 'HK', 'Cleaning all cover aircond at hse & erb building', 'Hse', 'New', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-07', '', ''),
(56, 'Cleaning Cover aircond', '', 'PM', 'HK', 'cleaning all cover aircond at mntnce building.', 'Mntce', 'New', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-07', '', ''),
(57, 'Cleaning Cover aircond', '', 'PM', 'HK', 'cleaning all cover aircond at warehouse building.', 'Warehouse', 'New', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-07', '', ''),
(58, 'Cleaning Cover Aircond', '', 'PM', 'HK', 'cleaning all cover aircond at admin building,cafeteria,surau,gym,\ngate 1,2 & 3', 'Admin', 'New', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-07', '', ''),
(59, 'Floor Trap clogged', '', 'RM', 'UC', 'floor trap at mntce ground floor clogged.', 'Mntce', 'Closed', 'Nekad (b&I team)', '-', 'Kamarulzaman', '2019-01-07', 'Kamarulzaman', '2019-01-07'),
(60, 'Remove Cabinet', 'P4', 'RM', 'HK', 'remove cabinet at kak wan.\n(will be inform by k.wan)', 'Admin', 'New', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-07', '', ''),
(61, 'Remove Cabinet', 'P2', 'RM', 'HK', 'remove cabinet from olefins office to hrca office.', 'Ccb', 'Closed', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-07', 'Kamarulzaman', '2019-01-31'),
(62, 'Install Cubicle', '', 'RM', 'RS', 'request general worker to install cubicle at TACS office.\n(Ruhani Bt A Aziz)', 'Warehouse', 'Closed', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-07', 'Kamarulzaman', '2019-01-19'),
(63, 'Bottle trap', '', 'PM', 'UC', 'check bottle trap under sink at lobby male toilet \n(air turun slow)', 'Lobby', 'New', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-08', '', ''),
(64, 'Arrangement Minihall', '', 'RM', 'HK', 'to arrange minihall 1 request by En rosnan hse(classroom style)', 'Ibnu Al-Nafis', 'Closed', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-08', 'Kamarulzaman', '2019-01-09'),
(65, 'Drain pipe leak & clogging', '', 'RM', 'RP', 'Pipe leaking at its weak point due to clogging of drain pipe near manhole. \n5/1/19 : Support team already attend to this issue on the requested date but only reseal the pipe leak. \nHowever, the real problem is clogging which was found later. \n6/1/19: Support team attempted to unclog but not successful.\n6/1/19: Admin has invited Casa Armada and Enproserve to a site visit for Unclogging Drain pipe and Repair pipe leak respectively.\n7/1/19: Casa Armada has given quotation for the said work.\n8/1/19: Casa Armada attended PSI training while Kama manage the equipment inspection. Enproserve submit quotation for PO creation.\n8/1/19: Work started at 10pm by Casa Armada and ended at 11.30pm when unclogging cannot resolves. it was found that the pipe clogged with construction waste (mozek + cement) together with other indissolvable waste. Casa Armada Proposed to cut the pipe where it clogged and channel the waste water directly to manhole using 4 inch PVC. \n9/1/19: verbally get approval from azmi (ccb building owner) to proceed with proposed wayforward.\n9/1/19: contractor come at night to perform the job as proposed. it was found that the underground joint (3 meter underground) is a T joint and not elbow. it was also found that mineral bottle (500ml) was stuck in the pipe together with sanitary pad and hard tissue that clogged the pipe. the mineral bottle was stuck because of the T joint. \n11/1/19: Enproserve team repair the pipe joint Chemicals entrance.\n15/1/2019: team PRA dismentled scaffolding at chemicals office', 'CCB', 'Closed', 'Casa Armada, Emproserve', '-', 'Aqil', '2019-01-05', 'Aqil', '2019-01-21'),
(66, 'Install Padlock', '', 'RM', 'HK', 'EOU ingin memohon kerjasama dari pihak HRCA untuk mengalihkan cabinet \ndari Utilities office ke Incinerator shelter dan menukar kuncinya', 'Eou', 'New', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-13', '', ''),
(67, 'Floor Trap Clogged', '', 'RM', 'UC', 'toilet clogged at mntc ground floor (male).', 'Mntce', 'Closed', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-13', 'Kamarulzaman', '2019-01-13'),
(68, 'Flexible Hose Reel', '', 'PM', 'RS', 'Need to check/replace flexible hose reel at admin toilet.\n( air masuk slow ke tank)', 'Admin', 'New', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-13', '', ''),
(69, 'Downlight', '', 'PM', 'RS', 'Check & repair downlight at ceo parking.\n(pin)', 'Lobby', 'New', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-14', '', ''),
(70, 'Leaking', '', 'PM', 'VI', 'Check piping at admin  foyer area.\n(ada bekas kat ceiling)', 'Admin', 'New', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-14', '', ''),
(71, 'Cover downpipe', '', 'PM', 'RP', 'check & replace cover downpipe at admin area (cafe,surau,admin,gym)', 'Admin', 'Reviewed', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-14', '', ''),
(72, 'Cover downpipe', '', 'PM', 'RP', 'check & replace cover downpipe at Hse Building', 'Hse', 'Reviewed', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-14', '', ''),
(73, 'O\'Ring', '', 'PM', 'RP', 'replace water filter o\'ring  at olefins shelter', 'Olefins Shelter', 'Closed', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-15', 'Kamarulzaman', '2019-01-15'),
(74, 'Ceiling', '', 'PM', 'RP', 'Install new ceiling at chemical office.', 'Ccb', 'Closed', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-15', 'Kamarulzaman', '2019-01-16'),
(75, 'Water filter', '', 'PM', 'RP', 'Change water filter at all building.', 'Pcogd', 'Closed', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-15', 'Kamarulzaman', '2019-01-27'),
(76, 'Arrangement of table', '', 'RM', 'HK', 'arrange utk susun meja kat mini hall 1 on 17th Jan. Buat round table dalam 5 meja which is consist 50 participant. Projector pon nak guna.', 'Salahuddin Al - Ayubi', 'Closed', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-15', 'Kamarulzaman', '2019-01-16'),
(77, 'Flexible hose', '', 'RM', 'RP', 'replace flexible hose at female toilet.(leaking)', 'Lobby', 'Closed', 'Nekad(b&i team)', '-', 'Kamarulzaman', '2019-01-15', 'Kamarulzaman', '2019-01-16'),
(78, 'Downpipe', '', 'PM', 'SL', 'sealing downpipe elbow at lobby.\n(need scafolding)', 'Lobby', 'New', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-15', '', ''),
(79, 'Pipe Leak', '', 'PM', 'SL', 'Pipe leaking at pantry lab.', 'Lab', 'Closed', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-15', 'Kamarulzaman', '2019-01-16'),
(80, 'Housekeeping at Warehouse', '', 'RM', 'HK', 'Request for Janitor to conduct cleaning at Warehouse.\n18/1/2019: 2 janitor conduct housekeeping tat warehouse', 'Warehouse', 'Closed', 'RNTSB', '-', 'Aqil', '2019-01-15', 'Aqil', '2019-01-18'),
(83, 'Workstation', '', 'RM', 'HK', 'arrangement workstation at chemicals office.', 'Ccb', 'Closed', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-16', 'Kamarulzaman', '2019-01-25'),
(84, 'Housekeeping', '', 'RM', 'HK', 'housekeeping at it room 1st floor for transformation office (remove drawer & chair)', 'Admin', 'Closed', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-16', 'Kamarulzaman', '2019-01-25'),
(85, 'Door', '', 'PM', 'RS', 'repair door frame at it room office.', 'Admin', 'New', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-16', '', ''),
(86, 'Door knob', '', 'RM', 'RP', 'change door knob at en schazil room.', 'Admin', 'Closed', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-16', 'Kamarulzaman', '2019-01-17'),
(88, 'Arrangement minihall 1', '', 'RM', 'HK', 'Request for table arrangement at Salahuddin Al-Ayyubi (23&24/1/2019)', 'Salahuddin Al-Ayyubi', 'Closed', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-20', 'Kamarulzaman', '2019-01-22'),
(89, 'Arrangement training room', '', 'RM', 'HK', 'Tolong adjust training room 1 & 2 setup. Bukak pintu tengah combined 2 bilik. Classroom setup. 35 org. Belakang ada meja untuk refreshment.(24/1/2019)', 'Training Room', 'Closed', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-20', 'Kamarulzaman', '2019-01-23'),
(90, 'Repair Pipe', '', 'RM', 'RS', 'request for general worker to repair pipe at pantry TACS Office Warehouse Building PCOGD.', 'Warehouse', 'Closed', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-20', 'Kamarulzaman', '2019-01-25'),
(91, 'Clogged', '', 'RM', 'HK', 'sink clogged.', 'Warehouse', 'Closed', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-20', 'Kamarulzaman', '2019-01-20'),
(92, 'Toilet', '', 'RM', 'UC', 'Male and Female toilet not suctioning well.', 'Lab', 'New', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-20', '', ''),
(93, 'Fire extinguishers', '', 'RM', 'RS', 'Adjust the height of fire extinguishers in the Lab.', 'Lab', 'New', 'Nekad (b&i team', '-', 'Kamarulzaman', '2019-01-20', '', ''),
(94, 'Ceiling', '', 'RM', 'RP', 'Replace ceiling at olefins office.', 'Ccb', 'New', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-20', '', ''),
(95, 'Clogged', '', 'RM', 'UC', 'Toilet/floor trap mntce ground floor clogging.', 'Maintenance', 'Closed', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-20', 'Kamarulzaman', '2019-01-20'),
(96, 'Arrangement Minihall 2', '', 'RM', 'HK', 'arrangement table at mini hall 2 for 15 pax.(round table,21/1/2019)', 'Amru Bin Asr', 'Closed', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-20', 'Kamarulzaman', '2019-01-21'),
(97, 'request for 3T lorry for waste disposal', '', 'RM', 'HK', '3T lorry for waste disposal at VCM, pallet & ply wood waste. \nrequest for weekend.\nrequested by Zamri Mat Zin\n21/1/2019: Zamri Mohamad contacted IMM to provide lorry as requested', 'VCM', 'In Progress', 'IMM', '-', 'Aqil', '2019-01-20', '', ''),
(98, 'Pipe leaking', '', 'RM', 'RS', 'request for general worker, because pipe at pantry still leaking', 'Warehouse', 'Closed', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-22', 'Kamarulzaman', '2019-01-25'),
(99, 'Arrangement Mnihall 1', '', 'RM', 'HK', 'Managing round table and chairs set up that can accommodate 35-45 people on 10 Feb 2019 at minihall 1. We also require portable projector and 3 set of screen projector ( if available). Thanks.', 'Salahuddin Al - Ayyubi', 'New', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-22', '', ''),
(100, 'Door Knob', '', 'PM', 'RP', 'repair or replace door knob at ccb (pintu masuk dr modular tent)', 'Ccb', 'Closed', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-22', 'Kamarulzaman', '2019-01-24'),
(101, 'Door & pam tandas', '', 'RM', 'RP', 'nak minta tolong repair pintu dan pam tandas FRB rosak.', 'Frb', 'New', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-22', '', ''),
(102, 'Leaking', 'P2', 'RM', 'RP', 'pipe leaking at surau (female)', 'Surau Al-Hidayah', 'Closed', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-23', 'Kamarulzaman', '2019-01-27'),
(103, 'Clogged', '', 'RM', 'UC', 'floor trap clogged at toilet mntc ground floor (morning)', 'Mntce', 'Closed', 'Nekad (b&i team', '-', 'Kamarulzaman', '2019-01-23', 'Kamarulzaman', '2019-01-23'),
(104, 'Majlis Kesyukuran 2019', '', 'PM', 'HK', 'site preparation & housekeeping for Majlis Kesyukuran 2019\n(22/1/2019)', 'Admin', 'Closed', 'Nekad & Rntsb', '-', 'Kamarulzaman', '2019-01-21', 'Kamarulzaman', '2019-01-22'),
(105, 'Clogged', '', 'PM', 'UC', 'floor trap Mntce ground floor(afternoon)', 'Mntce', 'Closed', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-23', 'Kamarulzaman', '2019-01-23'),
(106, 'Door closer', '', 'PM', 'RP', 'replace door closer at lab.', 'Lab', 'New', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-23', '', ''),
(107, 'Housekeeping server room', 'P4', 'RM', 'HK', 'Izdi requested support team to help remove empty boxes from server room', 'Server room', 'Closed', 'Nekad', '-', 'Aqil', '2019-01-23', 'Aqil', '2019-01-23'),
(108, 'Frame', '', 'RM', 'HK', 'Pok to hang alquran frame at shelter. \nThe frame in the olefins office', 'Olefins Shelter', 'New', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-24', '', ''),
(109, 'Arrangement Minihall 1', '', 'RM', 'HK', 'arrangement at minihall 1 (theatre style)', 'Salahuddin Al-Ayyubi', 'Closed', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-24', 'Kamarulzaman', '2019-01-25'),
(110, 'Fire Extinguisher', '', 'PM', 'HK', 'install wall plug for fire extinguisher at guard house 2 (CO2)', 'Guard House 2', 'New', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-25', '', ''),
(111, 'Door Closer', 'P3', 'PM', 'RP', 'Replace door closer at ccb building.(pintu tengah dr ccb ke hse)', 'Ccb', 'New', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-25', '', ''),
(112, 'Door', 'P4', 'PM', 'RS', 'repair/replace ensel switch room at cafeteria.(ketat)', 'Cafeteria', 'New', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-27', '', ''),
(113, 'flexible hose', 'P1', 'PM', 'RP', 'replace 3pcs flexible hose at toilet warehouse.', 'Warehouse', 'Closed', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-27', 'Kamarulzaman', '2019-01-27'),
(114, 'Clogged', 'P2', 'PM', 'UC', 'Toilet/ablution area clogged at warehouse.', 'Warehouse', 'Reviewed', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-27', '', ''),
(115, 'Walkway', 'P2', 'RM', 'HK', 'Repair walkway in front ccb building to hse building.', 'Ccb', 'Reviewed', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-27', '', ''),
(116, 'Arrangement Minihall 1&2', 'P1', 'RM', 'HK', 'arrangement chair & table at mini hall for kepko on 29/1/2019. (200 pax)', 'Mini Hall 1&2', 'Reviewed', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-27', '', ''),
(117, 'Ceiling', '', 'RM', 'HK', 'open & close ceiling at cafeteria for safety sytem repair smoke detector.', 'Cafeteria', 'Closed', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-23', 'Kamarulzaman', '2019-01-25'),
(118, 'Clogged', 'P1', 'RM', 'UC', 'floor trap / toilet at mntce ground floor clogged.', 'Mntce', 'Closed', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-27', 'Kamarulzaman', '2019-01-27'),
(119, 'Toilet', 'P3', 'PM', 'UC', 'repair@service flexible hose at male toilet cafeteria.(hujung sekali,air x masuk ke pam)', 'Cafeteria', 'New', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-27', '', ''),
(120, 'Housekeeping', 'P4', 'PM', 'HK', 'remove silikon at gazebo roof.', 'Cafeteria', 'New', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-27', '', ''),
(121, 'Proton', 'P1', 'PM', 'RS', 'Jumper proton perdana at parking lot.', 'Parking Admin', 'Closed', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-27', 'Kamarulzaman', '2019-01-27'),
(122, 'Housekeeping', 'P1', 'PM', 'HK', 'remove awdc item from storeroom,receptionist & finance store room to it server room.', 'Admin', 'Closed', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-28', 'Kamarulzaman', '2019-01-28'),
(123, 'Van seat', 'P1', 'SM', 'HK', 'Install vat seat for puspakom inspection (WA 8065 N)', 'Cabin (lot n)', 'Closed', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-28', 'Kamarulzaman', '2019-01-28'),
(124, 'Door (hose rack HR12)', 'P4', 'PM', 'RS', 'door lock not function properly.', 'Admin', 'New', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-28', '', ''),
(125, 'Pipe Leaking', 'P2', 'RM', 'UC', 'request for general worker, because sink pipe at toilet (women) is leaking.', 'Warehouse', 'Closed', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-28', 'Kamarulzaman', '2019-01-28'),
(126, 'clogged', 'P1', 'RM', 'UC', 'floor trap / toilet mntce ground floor clogged', 'Mntce', 'Closed', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-28', 'Kamarulzaman', '2019-01-28'),
(127, 'Door Knob', 'P2', 'PM', 'RP', 'repair or replace door knob at vip toilet.\nnot function properly(locked itself)', 'Admin', 'Closed', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-28', 'Kamarulzaman', '2019-01-29'),
(128, 'Arrangement training room', 'P1', 'SM', 'HK', 'arrangement chair/table at training room 1 & 2 classroom style for 40 pax. (29/1/2018)', 'Training room 1 & 2', 'Closed', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-28', 'Kamarulzaman', '2019-01-28'),
(129, 'TO CHECK & REPLACE NEW LAMP AT ADMIN COMPLEX.', 'P3', 'SM', 'RP', 'TO CHECK & REPLACE NEW FLUORESCENT LAMP AT ADMIN COMPLEX. TOO MANY LAMP BULB BLACKOUT.\n1.	HCA.\n2.	Finance.\n3.	S&d.\n4.	Tranformation (it room).\n5.	Tsd wing A &B.\n6.	Toilet tsd wing B.\n7.	Walkway dr admin ke ccb.\n8.	Walkway dr admin ke parking lot.\n9.	walkway admin ke cafÃ©.\n10.	It server room.\n11.	Ahu room (tsd B).\n12.	Cafeteria.\n13.	Foyer area.\n14.	Boardroom area.\n15.	CEO area.\n16.	Meeting room IBNU ZUHR\n17.    MAIN Guard House\n18.    Guard House, Gate 2', 'ADMIN COMPLEX', 'New', '', '23841749', 'Malina', '2019-01-28', '', ''),
(130, 'Housekeeping', 'P1', 'SM', 'HK', 'housekeeping at it server room.', 'Admin', 'Closed', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-29', 'Kamarulzaman', '2019-01-29'),
(131, 'Ceiling/pipeping', 'P3', 'PM', 'VI', 'check cold water piping in front vip toilet.', 'Admin', 'New', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-29', '', ''),
(132, 'Clogged', 'P1', 'PM', 'UC', 'floor trap clogged at toilet gym (male)', 'Gym', 'New', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-29', '', ''),
(133, 'Housekeeping', 'P2', 'SM', 'HK', 'remove photocopy machine from transformation room to it server room.', 'Admin', 'In Progress', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-29', '', ''),
(134, 'Install lcd', 'P2', 'SM', 'HK', 'Mintak geng pok psg lcd baru kat olefins Control Room hari ni\n(norma)', 'Olefins Control Room', 'Closed', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-30', 'Kamarulzaman', '2019-01-30'),
(135, 'HSE AHU Room Stair Wall collapse.', 'P2', 'RM', 'RP', 'HSE AHU Room Stair Wall collapse. \nreported by Rosnan.', 'HSE Building', 'New', '', '-', 'Aqil', '2019-01-30', '', ''),
(136, 'Chair - at TA team', 'P2', 'SM', 'HK', 'arrange b&i team to deliver the chairs to TA office.', 'Admin - Tacs', 'New', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-30', '', ''),
(137, 'Housekeeping', 'P3', 'SM', 'HK', 'Clearkan all balance w/station at tacs office.', 'Tacs', 'New', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-30', '', ''),
(138, 'Ceiling', 'P1', 'RM', 'HK', 'Unsafe condition at pigeon hole at mntce ground floor.', 'Mntce', 'Closed', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-02-03', 'Kamarulzaman', '2019-02-03'),
(139, 'Arrangement Mini Hall 2', 'P1', 'SM', 'HK', 'arrangement at mini hall 2 request by Izzah hse.', 'Amru Bin Asr', 'Closed', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-02-03', 'Kamarulzaman', '2019-02-03'),
(140, 'Clogged', 'P1', 'SM', 'UC', 'floor trap/toiled clogged at mntc ground floor.', 'Mntce', 'Closed', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-02-03', 'Kamarulzaman', '2019-02-03'),
(141, 'Clogged', 'P1', 'RM', 'UC', 'baiki sink tersumbat dekat bangunan ERB Hse.(Hamizan Osc On Duty)', 'Erb Building', 'Closed', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-02-03', 'Kamarulzaman', '2019-02-03'),
(142, 'OER2 Bunting', 'P2', 'SM', 'HK', 'Pasang bunting di lobby dan foyer admin building.(Pn Azilawati Oe)', 'Admin', 'Closed', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-31', 'Kamarulzaman', '2019-01-31'),
(143, 'Housekeeping', 'P3', 'SM', 'HK', 'housekeeping dalam bilik lama en shazril.(transformation)', 'Admin', 'Closed', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-01-31', 'Kamarulzaman', '2019-01-31'),
(144, 'Cleaning Cover Aircond', 'P3', 'PM', 'HK', 'Cleaning cover aircond at cafeteria,gym & studio.', 'Cafeteria,Gym & studio.', 'New', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-02-03', '', ''),
(145, 'Cleaning Cover Aircond', 'P3', 'PM', 'HK', 'cleaning cover aircond at main guard,guard house 2 & 3.', 'Main Guard House,Guard House 2 & 3', 'New', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-02-03', '', ''),
(146, 'Door knob', 'P3', 'PM', 'RP', 'Baiki @pun tukar tombol pintu guard house 3.', 'Guard House 3', 'New', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-02-03', '', ''),
(147, 'Ngeteh Nge Ayoh Long', 'P3', 'PM', 'HK', 'preparation for program ngeteh nge ayoh long with admin building + hse. ( Khamis 7/3/2019,,9:00am)', 'Cafe/Gazebo', 'New', 'Nekad (b&i team)', '-', 'Kamarulzaman', '2019-02-03', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `main`
--
ALTER TABLE `main`
  ADD PRIMARY KEY (`row`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `main`
--
ALTER TABLE `main`
  MODIFY `row` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
