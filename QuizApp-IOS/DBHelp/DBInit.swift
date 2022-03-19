//
//  DBInit.swift
//  QuizApp-IOS
//
//  Created by admin on 3/15/22.
//

import Foundation
import SQLite3
var c = DBInit()

class DBInit{
    static var db : OpaquePointer?
     init(){
         print("DBINIT")
         openDb()
         createTable()
        
    }
    func openDb(){
        print("DBOPEN")
        let fileP = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("QuizIos.sqlite")
        print("db path is", fileP)
        if sqlite3_open(fileP.path, &DBInit.db) != SQLITE_OK{
            print("Can't Open Database")
        }
    }
    func createTable(){
        print("DBCREATETABLE")
        var stmt : String
        //default table
        stmt = "create table if not exists stu (id integer primary key autoincrement,name text, course text)"
        //run stmt and report error
        if sqlite3_exec(DBInit.db, stmt, nil, nil, nil) != SQLITE_OK{
            let err = String(cString: sqlite3_errmsg(DBInit.db)!)
            print("there is error", err)
        }
        //Technology table
        stmt="CREATE TABLE IF NOT EXISTS `Technology` (`Title` TEXT NOT NULL, PRIMARY KEY (`Title`))"
        if sqlite3_exec(DBInit.db, stmt, nil, nil, nil) != SQLITE_OK{
            let err = String(cString: sqlite3_errmsg(DBInit.db)!)
            print("there is error", err)
        }
        //Emails
        stmt="CREATE TABLE IF NOT EXISTS `Emails` (`Emails` TEXT NOT NULL, `User_ID` INT NOT NULL, PRIMARY KEY (`Emails`, `User_ID`), CONSTRAINT `fk_Emails_User1` FOREIGN KEY (`User_ID`) REFERENCES User (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION);CREATE INDEX `fk_Emails_User1_idx` ON `Emails` (`User_ID` ASC);"
        if sqlite3_exec(DBInit.db, stmt, nil, nil, nil) != SQLITE_OK{
            let err = String(cString: sqlite3_errmsg(DBInit.db)!)
            print("there is error", err)
        }
        //Question table
        stmt="CREATE TABLE IF NOT EXISTS `Questions` (`Question` TEXT NULL, `Awnser` TEXT NOT NULL,`Quiz_ID` INT NOT NULL, `ID` INT  AUTO_INCREMENT NOT NULL, PRIMARY KEY (`ID`), CONSTRAINT `fk_Questions_Quiz1` FOREIGN KEY (`Quiz_ID`) REFERENCES `Quiz` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION); CREATE INDEX `fk_Questions_Quiz1_idx` ON `Questions` (`Quiz_ID` ASC);"
        if sqlite3_exec(DBInit.db, stmt, nil, nil, nil) != SQLITE_OK{
            let err = String(cString: sqlite3_errmsg(DBInit.db)!)
            print("there is error", err)
        }
        	
        //Choices
        stmt="CREATE TABLE IF NOT EXISTS `choices` (`choice` TEXT NOT NULL, `Questions_ID` INT NOT NULL, PRIMARY KEY (`choice`), CONSTRAINT `fk_choices_Questions1` FOREIGN KEY (`Questions_ID`) REFERENCES `Questions` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION); CREATE INDEX `fk_choices_Questions1_idx` ON `choices` (`Questions_ID` ASC);"
        if sqlite3_exec(DBInit.db, stmt, nil, nil, nil) != SQLITE_OK{
            let err = String(cString: sqlite3_errmsg(DBInit.db)!)
            print("there is error", err)
        }
        //Quiz has dual keys
        stmt="CREATE TABLE IF NOT EXISTS `Quiz` ( `Title` TEXT NULL, `ID` INTEGER Primary KEY AUTOINCREMENT NOT NULL, `Technology_Title` TEXT NOT NULL, CONSTRAINT `fk_Quiz_Technology1` FOREIGN KEY (`Technology_Title`) REFERENCES `Technology` (`Title`) ON DELETE NO ACTION ON UPDATE NO ACTION); CREATE INDEX `fk_Quiz_Technology1_idx` ON `Quiz` (`Technology_Title` ASC);"
        if sqlite3_exec(DBInit.db, stmt, nil, nil, nil) != SQLITE_OK{
            let err = String(cString: sqlite3_errmsg(DBInit.db)!)
            print("there is error", err)
        }
        

        //Prizes has dual keys
        	stmt="CREATE TABLE IF NOT EXISTS `Prizes` (`idPrizes` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `GivenDate` DATE NULL, `StartDate` DATE NULL, `EndDate` DATE NULL, `active` TINYINT NULL, `Type` TEXT NULL, `User_ID` INT NOT NULL, CONSTRAINT `fk_Prizes_User1` FOREIGN KEY (`User_ID`) REFERENCES `User` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION); CREATE INDEX `fk_Prizes_User1_idx` ON `Prizes` (`User_ID` ASC);"
        if sqlite3_exec(DBInit.db, stmt, nil, nil, nil) != SQLITE_OK{
            let err = String(cString: sqlite3_errmsg(DBInit.db)!)
            print("there is error", err)
        }
        
        //Score table
        stmt="CREATE TABLE IF NOT EXISTS `ScoreBoard` (`Score` INT NOT NULL, `Quiz_ID` INT NOT NULL, `User_ID` INT NOT NULL, `Technology_Title` TEXT NOT NULL, PRIMARY KEY (`User_ID`),   CONSTRAINT `fk_ScoreBoard_Quiz1` FOREIGN KEY (`Quiz_ID`) REFERENCES `Quiz` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION, CONSTRAINT `fk_ScoreBoard_User1` FOREIGN KEY (`User_ID`)  REFERENCES `User` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION, CONSTRAINT `fk_ScoreBoard_Technology1` FOREIGN KEY (`Technology_Title`) REFERENCES `Technology` (`Title`) ON DELETE NO ACTION ON UPDATE NO ACTION);  CREATE INDEX `fk_ScoreBoard_Quiz1_idx` ON `ScoreBoard` (`Quiz_ID` ASC);  CREATE INDEX `fk_ScoreBoard_Technology1_idx` ON `ScoreBoard` (`Technology_Title` ASC);"
        if sqlite3_exec(DBInit.db, stmt, nil, nil, nil) != SQLITE_OK{
            let err = String(cString: sqlite3_errmsg(DBInit.db)!)
            print("there is error", err)
        }
        //User table
        stmt="CREATE TABLE `User` (`ID` INTEGER Primary KEY  AUTOINCREMENT NOT NULL, `UserName` TEXT NULL, `Password` TEXT NOT NULL, `Dob` DATE NULL, `admin` TINYINT NULL, `subcription` TEXT NULL, `Status` INT NULL, `First` TEXT NULL, `Last` TEXT NULL)"
        if sqlite3_exec(DBInit.db, stmt, nil, nil, nil) != SQLITE_OK{
            let err = String(cString: sqlite3_errmsg(DBInit.db)!)
            print("there is error", err)
        }
        
        //Reviews has dual keys
        stmt="CREATE TABLE IF NOT EXISTS `Reviews` (`idReviews` INTEGER PRIMARY KEY  AUTOINCREMENT NOT NULL, `rate` INT NULL, `comments` TEXT NULL, `User_ID` INT NOT NULL, CONSTRAINT `fk_Reviews_User1` FOREIGN KEY (`User_ID`) REFERENCES `User` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION); CREATE INDEX `fk_Reviews_User1_idx` ON `Reviews` (`User_ID` ASC);"
        if sqlite3_exec(DBInit.db, stmt, nil, nil, nil) != SQLITE_OK{
            let err = String(cString: sqlite3_errmsg(DBInit.db)!)
            print("there is error", err)
        }
        
    }
    
}
	