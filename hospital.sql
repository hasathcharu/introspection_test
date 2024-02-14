CREATE TABLE `doctors` (
  `id` int NOT NULL,
  `name` varchar(191) NOT NULL,
  `specialty` varchar(191) NOT NULL,
  `phone_number` varchar(191) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `patients` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `age` int NOT NULL,
  `ADDRESS` varchar(191) NOT NULL,
  `phoneNumber` char(10) NOT NULL,
  `gender` enum('MALE','FEMALE') NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `appointment` (
  `id` int NOT NULL,
  `reason` varchar(191) NOT NULL,
  `appointmentTime` datetime NOT NULL,
  `status` enum('SCHEDULED','STARTED','ENDED') NOT NULL,
  `patientId` int NOT NULL,
  `doctorId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `patientId` (`patientId`),
  KEY `doctorId` (`doctorId`),
  CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`patientId`) REFERENCES `patients` (`id`),
  CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`doctorId`) REFERENCES `doctors` (`id`)
);

CREATE INDEX `specialty_index` ON `doctors` (`specialty`);
CREATE UNIQUE INDEX `reason_index` ON `appointment` (`reason`);