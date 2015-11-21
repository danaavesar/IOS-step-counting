//
//  ViewController.swift
//  test_drawingCG
//
//  Created by Dana Avesar on 3/13/15.
//  Copyright (c) 2015 Dana Avesar. All rights reserved.
//

import UIKit
import CoreGraphics
import CoreMotion



class ViewController: UIViewController {
    
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label1: UILabel!
    var totalWalked = ""
    @IBOutlet var counterView: CounterView!
    let myPedometer = CMPedometer()
    var distanceLastHr : NSNumber = 0
    var distanceLastHrDouble : Double = 0.000
    var distanceLastTwoHr : NSNumber = 0
    var distanceLastTwoHrDouble : Double = 0.000
    var distanceLastThreeHr : NSNumber = 0
    var distanceLastThreeHrDouble : Double = 0.000
    var distanceLastFourHr : NSNumber = 0
    var distanceLastFourHrDouble : Double = 0.000
    var distanceLast5Hr : NSNumber = 0
    var distanceLast5HrDouble : Double = 0.000
    var distanceLast6Hr : NSNumber = 0
    var distanceLast6HrDouble : Double = 0.000
    var distanceLast7Hr : NSNumber = 0
    var distanceLast7HrDouble : Double = 0.000
    var distanceLast8Hr : NSNumber = 0
    var distanceLast8HrDouble : Double = 0.000
    var everyHour : [NSDate] = []
    var distanceEveryHour : [CGFloat] = []
    
   /* @IBAction func switch1Toggled(sender: UISwitch) {
       
        if sender.on{
            getHistoricalData()
            getLiveStepData()
         
        } else{
            myPedometer.stopPedometerUpdates()
            getHistoricalData()
        }
        
    }*/
    

    override func viewDidLoad() {
        super.viewDidLoad()
        checkAvailability()
        getHistoricalData()
        getLiveStepData()
      //  printData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    //determine availability
    
    var stepCountingIsAvailable = false
    var distanceIsAvailable = false
    
    func checkAvailability(){
        if (CMPedometer.isStepCountingAvailable()){
            stepCountingIsAvailable = true;
            println(stepCountingIsAvailable);
        } else {
            stepCountingIsAvailable = false;
        }
        
        if(CMPedometer.isDistanceAvailable()){
            distanceIsAvailable = true;
            println(distanceIsAvailable)
        } else {
            distanceIsAvailable = false;
        }
        
    }
    
    

    
    func getHistoricalData(){
        
        let now = NSDate()
        let dateFormatter = NSDateFormatter()
        let timeZone = NSTimeZone(name: "UTC")
        let lasthr = NSDate(timeIntervalSinceNow: -60*60)
        let lastTwoHours = NSDate(timeIntervalSinceNow: -2*60*60)
        let lastThreeHours = NSDate(timeIntervalSinceNow: -3*60*60)
        let lastFourHours = NSDate(timeIntervalSinceNow: -4*60*60)
        let lastFiveHours = NSDate(timeIntervalSinceNow: -5*60*60)
        let lastSixHours = NSDate(timeIntervalSinceNow: -6*60*60)
        let lastSevenHours = NSDate(timeIntervalSinceNow: -7*60*60)
        let lastEightHours = NSDate(timeIntervalSinceNow: -8*60*60)
        
//        var dana = [NSDate]()
//        for (var i = 1; i<25; i++) {
//        dana[i] =  NSDate(timeIntervalSinceNow: Int(-i*60*60))
        
        myPedometer.queryPedometerDataFromDate( lasthr, toDate: now, withHandler: { data, error in
            
            if (error == nil){
                println("get Historical Data")
               // println("step Data: \(data.numberOfSteps) ")
                println("one hour \(data.distance)")
                self.distanceLastHr = data.distance
                self.distanceLastHrDouble = self.distanceLastHr.doubleValue
                println("distanceLastHr \(self.distanceLastHr)")
                self.counterView.counter = self.distanceLastHrDouble

            } else {
                self.distanceLastHr = 0
                println("step error: \(error)")
                
            }
            
        
        })
      //  }
        myPedometer.queryPedometerDataFromDate(lastTwoHours, toDate: lasthr, withHandler: { data, error in
            
            if (error == nil){
                
                println("two hours \(data.distance)")
                self.distanceLastTwoHr = data.distance
                self.distanceLastTwoHrDouble = self.distanceLastTwoHr.doubleValue
                println("distanceTwoHr \(self.distanceLastTwoHr)")
                self.counterView.counter2 = self.distanceLastTwoHrDouble
                if( data.distance == 0 ){
                    self.counterView.counter2 = self.counterView.counter
                }
            } else {
                self.distanceLastTwoHr = 0
                println("step error: \(error)")
                
            }
            
            
        })
        
        myPedometer.queryPedometerDataFromDate(lastThreeHours, toDate: lastTwoHours, withHandler: { data, error in
            
            if (error == nil){
                
                println("three hours \(data.distance)")
                self.distanceLastThreeHr = data.distance
                self.distanceLastThreeHrDouble = self.distanceLastThreeHr.doubleValue
                println("distanceThreeHr \(self.distanceLastThreeHr)")
                self.counterView.counter3 = self.distanceLastThreeHrDouble
                if( data.distance == 0 ){
                    self.counterView.counter3 = self.counterView.counter2
                }
            } else {
                self.distanceLastThreeHr = 0
                println("step error: \(error)")
                
            }
            
            
        })
        
        myPedometer.queryPedometerDataFromDate(lastFourHours, toDate: lastThreeHours, withHandler: { data, error in
            
            if (error == nil){
                println("four hours \(data.distance)")
                self.distanceLastFourHr = data.distance
                self.distanceLastFourHrDouble = self.distanceLastFourHr.doubleValue
                println("distanceFourHr \(self.distanceLastFourHr)")
                self.counterView.counter4 = self.distanceLastFourHrDouble
                if( data.distance == 0 ){
                    self.counterView.counter4 = self.counterView.counter3
                }
            } else {
                self.distanceLastFourHr = 0
                println("step error: \(error)")
                
            }
        })
        
        myPedometer.queryPedometerDataFromDate(lastFiveHours, toDate: lastFourHours, withHandler: { data, error in
            
            if (error == nil){
                self.distanceLast5Hr = data.distance
                self.distanceLast5HrDouble = self.distanceLast5Hr.doubleValue
                println("distance5Hr \(self.distanceLast5Hr)")
                self.counterView.counter5 = self.distanceLast5HrDouble
                if( data.distance == 0 ){
                    self.counterView.counter5 = self.counterView.counter4
                }
            } else {
                self.distanceLast5Hr = 0
                println("step error: \(error)")
                
            }
        })
        
        myPedometer.queryPedometerDataFromDate(lastSixHours, toDate: lastFiveHours, withHandler: { data, error in
            
            if (error == nil){
                self.distanceLast6Hr = data.distance
                self.distanceLast6HrDouble = self.distanceLast6Hr.doubleValue
                println("distance6Hr \(self.distanceLast6Hr)")
                self.counterView.counter6 = self.distanceLast6HrDouble
                if( data.distance == 0 ){
                    self.counterView.counter6 = self.counterView.counter5
                }
            } else {
                self.distanceLast5Hr = 0
                println("step error: \(error)")
                
            }
        })
        
        myPedometer.queryPedometerDataFromDate(lastSevenHours, toDate: lastSixHours, withHandler: { data, error in
            
            if (error == nil){
                self.distanceLast7Hr = data.distance
                self.distanceLast7HrDouble = self.distanceLast7Hr.doubleValue
                println("distance7Hr \(self.distanceLast7Hr)")
                self.counterView.counter7 = self.distanceLast7HrDouble
                if( data.distance == 0 ){
                    self.counterView.counter7 = self.counterView.counter6
                }
            } else {
                self.distanceLast7Hr = 0
                println("step error: \(error)")
                
            }
        })
        
        myPedometer.queryPedometerDataFromDate(lastEightHours, toDate: lastSevenHours, withHandler: { data, error in
            
            if (error == nil){
                self.distanceLast8Hr = data.distance
                self.distanceLast8HrDouble = self.distanceLast8Hr.doubleValue
                println("distance8Hr \(self.distanceLast8Hr)")
                self.counterView.counter8 = self.distanceLast8HrDouble
                if( data.distance == 0 ){
                    self.counterView.counter8 = self.counterView.counter7
                }
            } else {
                self.distanceLast7Hr = 0
                println("step error: \(error)")
                
            }
        })
        
        myPedometer.queryPedometerDataFromDate(lastEightHours, toDate: now, withHandler: { data, error in
            
            if (error == nil){
                self.totalWalked = "\(data.distance)"
                self.label1.text = "In the last 8 hours you walked"
                self.label2.text = "\(self.totalWalked) meters"
            } else {
                
                
            }
        })
        
    }
    

    
    func update(){
        
    }
    //functions
  
    /*func getHourlyData(){
       
        for var i = 1 ; i < 25; i++ {
            myPedometer.queryPedometerDataFromDate( everyHour[i] , toDate: now, withHandler: { data, error in
                if (error == nil){
                 // distanceEveryHour = data.distance
                   // println(distanceEveryHour)
                    
                }   else {
                    println("step error: \(error)")
                    
                }
            
            })

        }
    }*/
    
    //get live step and distance data
    
    //functions
    
    func getLiveStepData(){
        let now = NSDate()
        
        myPedometer.startPedometerUpdatesFromDate(now, withHandler: { data, error in
            
            if (error == nil){
                println("\(data.numberOfSteps) ")
                
            }else {
                println("step error: \(error)")
                
            }
        })
        
        
    }
    
 



}

