-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mangata_jw
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mangata_jw
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mangata_jw` DEFAULT CHARACTER SET utf8 ;
USE `mangata_jw` ;

-- -----------------------------------------------------
-- Table `mangata_jw`.`clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mangata_jw`.`clients` (
  `clientid` INT NOT NULL,
  `fullname` VARCHAR(255) NOT NULL,
  `contactnumber` INT NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`clientid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mangata_jw`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mangata_jw`.`products` (
  `productid` INT NOT NULL,
  `buyprice` DECIMAL NOT NULL,
  `sellprice` DECIMAL NOT NULL,
  `amountstock` INT NOT NULL,
  `productname` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`productid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mangata_jw`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mangata_jw`.`orders` (
  `orderid` INT NOT NULL,
  `quantity` VARCHAR(45) NOT NULL,
  `totalprice` DECIMAL NOT NULL,
  `orderdate` DATETIME NOT NULL,
  `clientid` INT NOT NULL,
  `productid` INT NOT NULL,
  PRIMARY KEY (`orderid`),
  INDEX `client_id_fk_idx` (`clientid` ASC) VISIBLE,
  INDEX `product_id_fk_idx` (`productid` ASC) VISIBLE,
  CONSTRAINT `client_id_fk`
    FOREIGN KEY (`clientid`)
    REFERENCES `mangata_jw`.`clients` (`clientid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `product_id_fk`
    FOREIGN KEY (`productid`)
    REFERENCES `mangata_jw`.`products` (`productid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mangata_jw`.`address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mangata_jw`.`address` (
  `addressid` INT NOT NULL,
  `street` VARCHAR(255) NOT NULL,
  `zipcode` VARCHAR(255) NULL,
  `state` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`addressid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mangata_jw`.`delivery`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mangata_jw`.`delivery` (
  `deliveryid` INT NOT NULL,
  `comment` VARCHAR(255) NOT NULL,
  `deliverydate` DATE NOT NULL,
  `orderid` INT NOT NULL,
  `addressid` INT NOT NULL,
  `deliverystatus` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`deliveryid`),
  INDEX `order_id_fk_idx` (`orderid` ASC) INVISIBLE,
  INDEX `address_id_fk_idx` (`addressid` ASC) VISIBLE,
  CONSTRAINT `order_id_fk`
    FOREIGN KEY (`orderid`)
    REFERENCES `mangata_jw`.`orders` (`orderid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `address_id_fk`
    FOREIGN KEY (`addressid`)
    REFERENCES `mangata_jw`.`address` (`addressid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
