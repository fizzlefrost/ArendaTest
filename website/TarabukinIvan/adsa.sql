-- MySQL Script generated by MySQL Workbench
-- Wed Dec  5 15:02:28 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Policlinica
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Policlinica
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Policlinica` DEFAULT CHARACTER SET utf8 ;
USE `Policlinica` ;

-- -----------------------------------------------------
-- Table `Policlinica`.`Workers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Policlinica`.`Workers` (
  `Passport` INT NOT NULL,
  `First Name` VARCHAR(45) NULL,
  `Last Name` VARCHAR(45) NULL,
  `Fathers Name` VARCHAR(45) NULL,
  `Science degree` VARCHAR(45) NULL,
  PRIMARY KEY (`Passport`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Policlinica`.`Patients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Policlinica`.`Patients` (
  `idPatients` INT NOT NULL,
  `First Name` VARCHAR(45) NULL,
  `Last Name` VARCHAR(45) NULL,
  `Fathers Name` VARCHAR(45) NULL,
  `Passport Series` INT NULL,
  `Passport Number` INT NULL,
  `Adress` VARCHAR(45) NULL,
  PRIMARY KEY (`idPatients`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Policlinica`.`Specialisations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Policlinica`.`Specialisations` (
  `idSpecializations` INT NOT NULL,
  `SpName` VARCHAR(45) NULL,
  PRIMARY KEY (`idSpecializations`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Policlinica`.`ConsultingRooms`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Policlinica`.`ConsultingRooms` (
  `idCab` INT NOT NULL,
  `NUMcab` INT NULL,
  `StartWork` TIME NULL,
  `EndWork` TIME NULL,
  PRIMARY KEY (`idCab`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Policlinica`.`Specialists`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Policlinica`.`Specialists` (
  `idSpecialists` INT NOT NULL,
  `PassportSP` INT NOT NULL,
  `idSpecializationsSP` INT NOT NULL,
  `idCabSP` INT NOT NULL,
  INDEX `fk_Specialists_Workers_idx` (`PassportSP` ASC) VISIBLE,
  INDEX `fk_Specialists_Specialisations1_idx` (`idSpecializationsSP` ASC) VISIBLE,
  INDEX `fk_Specialists_ConsultingRooms1_idx` (`idCabSP` ASC) VISIBLE,
  PRIMARY KEY (`idSpecialists`),
  CONSTRAINT `fk_Specialists_Workers`
    FOREIGN KEY (`PassportSP`)
    REFERENCES `Policlinica`.`Workers` (`Passport`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Specialists_Specialisations1`
    FOREIGN KEY (`idSpecializationsSP`)
    REFERENCES `Policlinica`.`Specialisations` (`idSpecializations`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Specialists_ConsultingRooms1`
    FOREIGN KEY (`idCabSP`)
    REFERENCES `Policlinica`.`ConsultingRooms` (`idCab`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Policlinica`.`diagnosis`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Policlinica`.`diagnosis` (
  `iddiagnosis` INT NOT NULL,
  `nameDia` VARCHAR(45) NULL,
  PRIMARY KEY (`iddiagnosis`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Policlinica`.`sessions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Policlinica`.`sessions` (
  `idsessions` INT NOT NULL,
  `Specialists_idSpecialists` INT NOT NULL,
  `Patients_idPatients` INT NOT NULL,
  `timeStart` TIME NULL,
  `timeFinish` TIME NULL,
  `diagnosis_iddiagnosis` INT NOT NULL,
  `lechenie` VARCHAR(45) NULL,
  PRIMARY KEY (`idsessions`),
  INDEX `fk_sessions_Specialists1_idx` (`Specialists_idSpecialists` ASC) VISIBLE,
  INDEX `fk_sessions_Patients1_idx` (`Patients_idPatients` ASC) VISIBLE,
  INDEX `fk_sessions_diagnosis1_idx` (`diagnosis_iddiagnosis` ASC) VISIBLE,
  CONSTRAINT `fk_sessions_Specialists1`
    FOREIGN KEY (`Specialists_idSpecialists`)
    REFERENCES `Policlinica`.`Specialists` (`idSpecialists`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sessions_Patients1`
    FOREIGN KEY (`Patients_idPatients`)
    REFERENCES `Policlinica`.`Patients` (`idPatients`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sessions_diagnosis1`
    FOREIGN KEY (`diagnosis_iddiagnosis`)
    REFERENCES `Policlinica`.`diagnosis` (`iddiagnosis`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Policlinica`.`PatientsCard`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Policlinica`.`PatientsCard` (
  `idPatientsPC` INT NOT NULL,
  `sessions_idsessions` INT NOT NULL,
  INDEX `fk_PatientsCard_Patients1_idx` (`idPatientsPC` ASC) VISIBLE,
  INDEX `fk_PatientsCard_sessions1_idx` (`sessions_idsessions` ASC) VISIBLE,
  CONSTRAINT `fk_PatientsCard_Patients1`
    FOREIGN KEY (`idPatientsPC`)
    REFERENCES `Policlinica`.`Patients` (`idPatients`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PatientsCard_sessions1`
    FOREIGN KEY (`sessions_idsessions`)
    REFERENCES `Policlinica`.`sessions` (`idsessions`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Policlinica`.`PatientsDiagnosis`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Policlinica`.`PatientsDiagnosis` (
  `Patients_idPatients` INT NOT NULL,
  `diagnosis_iddiagnosis` INT NOT NULL,
  INDEX `fk_PatientsDiagnosis_Patients1_idx` (`Patients_idPatients` ASC) VISIBLE,
  INDEX `fk_PatientsDiagnosis_diagnosis1_idx` (`diagnosis_iddiagnosis` ASC) VISIBLE,
  CONSTRAINT `fk_PatientsDiagnosis_Patients1`
    FOREIGN KEY (`Patients_idPatients`)
    REFERENCES `Policlinica`.`Patients` (`idPatients`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PatientsDiagnosis_diagnosis1`
    FOREIGN KEY (`diagnosis_iddiagnosis`)
    REFERENCES `Policlinica`.`diagnosis` (`iddiagnosis`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
