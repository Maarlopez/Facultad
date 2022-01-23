-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema facultad
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `facultad` ;

-- -----------------------------------------------------
-- Schema facultad
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `facultad` DEFAULT CHARACTER SET utf8 ;
USE `facultad` ;

-- -----------------------------------------------------
-- Table `facultad`.`ciudad`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `facultad`.`ciudad` ;

CREATE TABLE IF NOT EXISTS `facultad`.`ciudad` (
  `idCiudadNac` CHAR(100) NOT NULL,
  `idCiudadRes` CHAR(100) NOT NULL,
  PRIMARY KEY (`idCiudadNac`, `idCiudadRes`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `facultad`.`departamento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `facultad`.`departamento` ;

CREATE TABLE IF NOT EXISTS `facultad`.`departamento` (
  `idIniciales` CHAR(25) NOT NULL,
  `NombreDep` CHAR(100) NOT NULL,
  UNIQUE INDEX `idNombreDep_UNIQUE` (`NombreDep` ASC),
  UNIQUE INDEX `idIniciales_UNIQUE` (`idIniciales` ASC),
  PRIMARY KEY (`NombreDep`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `facultad`.`persona`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `facultad`.`persona` ;

CREATE TABLE IF NOT EXISTS `facultad`.`persona` (
  `Nombre` CHAR(100) NOT NULL,
  `Apellido` CHAR(100) NOT NULL,
  `idDni` INT NOT NULL,
  `ciudad_idCiudadNac` CHAR(100) NOT NULL,
  `ciudad_idCiudadRes` CHAR(100) NOT NULL,
  PRIMARY KEY (`idDni`, `ciudad_idCiudadNac`, `ciudad_idCiudadRes`),
  UNIQUE INDEX `idDni_UNIQUE` (`idDni` ASC),
  INDEX `fk_persona_ciudad1_idx` (`ciudad_idCiudadNac` ASC, `ciudad_idCiudadRes` ASC),
  CONSTRAINT `fk_persona_ciudad1`
    FOREIGN KEY (`ciudad_idCiudadNac` , `ciudad_idCiudadRes`)
    REFERENCES `facultad`.`ciudad` (`idCiudadNac` , `idCiudadRes`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `facultad`.`estudiante`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `facultad`.`estudiante` ;

CREATE TABLE IF NOT EXISTS `facultad`.`estudiante` (
  `idLegajo` INT NOT NULL,
  `persona_idDni` INT NOT NULL,
  `persona_ciudad_idCiudadNac` CHAR(100) NOT NULL,
  `persona_ciudad_idCiudadRes` CHAR(100) NOT NULL,
  PRIMARY KEY (`idLegajo`),
  UNIQUE INDEX `idLegajo_UNIQUE` (`idLegajo` ASC) ,
  INDEX `fk_estudiante_persona1_idx` (`persona_idDni` ASC, `persona_ciudad_idCiudadNac` ASC, `persona_ciudad_idCiudadRes` ASC),
  CONSTRAINT `fk_estudiante_persona1`
    FOREIGN KEY (`persona_idDni` , `persona_ciudad_idCiudadNac` , `persona_ciudad_idCiudadRes`)
    REFERENCES `facultad`.`persona` (`idDni` , `ciudad_idCiudadNac` , `ciudad_idCiudadRes`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `facultad`.`materia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `facultad`.`materia` ;

CREATE TABLE IF NOT EXISTS `facultad`.`materia` (
  `id_materia` INT NOT NULL,
  `NomMateria` CHAR(100) NOT NULL,
  `año_en_plan` INT NOT NULL,
  PRIMARY KEY (`id_materia`),
  UNIQUE INDEX `idNomMateria_UNIQUE` (`id_materia` ASC),
  UNIQUE INDEX `NomMateria_UNIQUE` (`NomMateria` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `facultad`.`titulo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `facultad`.`titulo` ;

CREATE TABLE IF NOT EXISTS `facultad`.`titulo` (
  `id_titulo` CHAR(100) NOT NULL,
  PRIMARY KEY (`id_titulo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `facultad`.`profesor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `facultad`.`profesor` ;

CREATE TABLE IF NOT EXISTS `facultad`.`profesor` (
  `idCuil` BIGINT(13) NOT NULL,
  `persona_idDni` INT NOT NULL,
  `titulo_id_titulo` CHAR(100) NOT NULL,
  `departamento_NombreDep` CHAR(100) NOT NULL,
  `persona_ciudad_idCiudadNac` CHAR(100) NOT NULL,
  PRIMARY KEY (`idCuil`),
  INDEX `fk_profesor_persona1_idx` (`persona_idDni` ASC, `persona_ciudad_idCiudadNac` ASC),
  INDEX `fk_profesor_titulo1_idx` (`titulo_id_titulo` ASC) ,
  INDEX `fk_profesor_departamento1_idx` (`departamento_NombreDep` ASC) ,
  CONSTRAINT `fk_profesor_persona1`
    FOREIGN KEY (`persona_idDni` , `persona_ciudad_idCiudadNac`)
    REFERENCES `facultad`.`persona` (`idDni` , `ciudad_idCiudadNac`)
   ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_profesor_titulo1`
    FOREIGN KEY (`titulo_id_titulo`)
    REFERENCES `facultad`.`titulo` (`id_titulo`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_profesor_departamento1`
    FOREIGN KEY (`departamento_NombreDep`)
    REFERENCES `facultad`.`departamento` (`NombreDep`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `facultad`.`Contacto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `facultad`.`Contacto` ;

CREATE TABLE IF NOT EXISTS `facultad`.`Contacto` (
  `Cod_Area` CHAR(10) NOT NULL,
  `Telefono` INT NOT NULL,
  `Tipo` TEXT(100) NOT NULL,
  `persona_idDni` INT NOT NULL,
  PRIMARY KEY (`Telefono`),
  INDEX `fk_Contacto_persona1_idx` (`persona_idDni` ASC),
  CONSTRAINT `fk_Contacto_persona1`
    FOREIGN KEY (`persona_idDni`)
    REFERENCES `facultad`.`persona` (`idDni`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `facultad`.`estudiante_has_materia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `facultad`.`estudiante_has_materia` ;

CREATE TABLE IF NOT EXISTS `facultad`.`estudiante_has_materia` (
  `estudiante_idLegajo` INT NOT NULL,
  `materia_id_materia` INT NOT NULL,
  `nota` INT NULL,
  `año_en_curso` INT NOT NULL,
  PRIMARY KEY (`estudiante_idLegajo`, `materia_id_materia`),
  INDEX `fk_estudiante_has_materia_materia1_idx` (`materia_id_materia` ASC),
  INDEX `fk_estudiante_has_materia_estudiante1_idx` (`estudiante_idLegajo` ASC) ,
  CONSTRAINT `fk_estudiante_has_materia_estudiante1`
    FOREIGN KEY (`estudiante_idLegajo`)
    REFERENCES `facultad`.`estudiante` (`idLegajo`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_estudiante_has_materia_materia1`
    FOREIGN KEY (`materia_id_materia`)
    REFERENCES `facultad`.`materia` (`id_materia`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `facultad`.`profesor_has_materia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `facultad`.`profesor_has_materia` ;

CREATE TABLE IF NOT EXISTS `facultad`.`profesor_has_materia` (
  `profesor_idCuil` BIGINT(13) NOT NULL,
  `materia_id_materia` INT NOT NULL,
  INDEX `fk_profesor_has_materia_materia1_idx` (`materia_id_materia` ASC),
  INDEX `fk_profesor_has_materia_profesor1_idx` (`profesor_idCuil` ASC),
  CONSTRAINT `fk_profesor_has_materia_profesor1`
    FOREIGN KEY (`profesor_idCuil`)
    REFERENCES `facultad`.`profesor` (`idCuil`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_profesor_has_materia_materia1`
    FOREIGN KEY (`materia_id_materia`)
    REFERENCES `facultad`.`materia` (`id_materia`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
