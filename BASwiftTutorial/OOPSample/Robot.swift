//
//  Robot.swift
//  BASwiftTutorial
//
//  Created by Çağatay Yıldız on 6.11.2021.
//

import Foundation

class Robot : Samuray{

    var metalTur : String = ""
    
    init(ad:String) {
        super.init(yildizTur: "robotik yıldızlar", ad: ad)
    }
    
    
    override func cikis() -> String {
        return "Robot oyundan çıktı!..."
    }
    
    
    func ozelRobot(){
        super.cikis()
    }
    
}


func deneme2(){
    
    //BASE
//    var robot = Robot(ad: "Mert")
//
//
//   //Class ın herhangi bir değişkenin değer atarsan o property e bir SET işlemi gerçekleştirmiş olursun
//
//    robot.metalTur = "Çelik"
//
//    //Get işlemi ise set edilen bir değerin okunması anlamına gelir
//
//    var metal = robot.metalTur
    
    var robot = Robot(ad: "Mert")
    
    robot.cikis()
    
}
