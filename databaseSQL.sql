-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`roles` (
  `idRoles` INT NOT NULL AUTO_INCREMENT,
  `nombreRol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idRoles`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`zonas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`zonas` (
  `idZona` INT NOT NULL AUTO_INCREMENT,
  `nameZona` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idZona`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`distritos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`distritos` (
  `idDistrito` INT NOT NULL AUTO_INCREMENT,
  `nameDistrito` VARCHAR(45) NOT NULL,
  `zonas_idZona` INT NOT NULL,
  PRIMARY KEY (`idDistrito`),
  INDEX `fk_distritos_zonas1_idx` (`zonas_idZona` ASC) VISIBLE,
  CONSTRAINT `fk_distritos_zonas1`
    FOREIGN KEY (`zonas_idZona`)
    REFERENCES `mydb`.`zonas` (`idZona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`usuarios` (
  `idUsuarios` INT NOT NULL AUTO_INCREMENT,
  `nombreUsuario` VARCHAR(45) NULL,
  `apellidoUsuario` VARCHAR(45) NULL,
  `dniUsuario` VARCHAR(8) NULL,
  `correoUsuario` VARCHAR(45) NOT NULL,
  `FechaNacimiento` DATE NULL,
  `contraseñaUsuario` VARCHAR(256) NOT NULL,
  `codigoDespachador` VARCHAR(20) NULL,
  `rucUsuario` VARCHAR(11) NULL,
  `razonSocial` VARCHAR(45) NULL,
  `codigoJurisdiccion` VARCHAR(45) NULL,
  `roles_idRoles1` INT NOT NULL,
  `distritos_idDistrito` INT NOT NULL,
  PRIMARY KEY (`idUsuarios`),
  INDEX `fk_usuarios_roles1_idx` (`roles_idRoles1` ASC) VISIBLE,
  INDEX `fk_usuarios_distritos1_idx` (`distritos_idDistrito` ASC) VISIBLE,
  CONSTRAINT `fk_usuarios_roles1`
    FOREIGN KEY (`roles_idRoles1`)
    REFERENCES `mydb`.`roles` (`idRoles`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarios_distritos1`
    FOREIGN KEY (`distritos_idDistrito`)
    REFERENCES `mydb`.`distritos` (`idDistrito`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`proveedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`proveedores` (
  `id_proveedor` INT NOT NULL AUTO_INCREMENT,
  `nombreProveedor` VARCHAR(45) NOT NULL,
  `telefonoProveedor` VARCHAR(9) NOT NULL,
  `rucProveedor` VARCHAR(11) NOT NULL,
  `dniProveedor` VARCHAR(8) NOT NULL,
  `nombreTienda` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_proveedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`token`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`token` (
  `idToken` INT NOT NULL AUTO_INCREMENT,
  `fecha` TIMESTAMP NOT NULL,
  `tiempo` INT NOT NULL,
  `usuarios_idUsuarios` INT NOT NULL,
  PRIMARY KEY (`idToken`),
  INDEX `fk_token_usuarios1_idx` (`usuarios_idUsuarios` ASC) VISIBLE,
  CONSTRAINT `fk_token_usuarios1`
    FOREIGN KEY (`usuarios_idUsuarios`)
    REFERENCES `mydb`.`usuarios` (`idUsuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
