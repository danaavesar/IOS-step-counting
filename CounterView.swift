//
//  CounterView.swift
//  test_drawingCG
//
//  Created by Dana Avesar on 3/13/15.
//  Copyright (c) 2015 Dana Avesar. All rights reserved.
//

import UIKit
import CoreGraphics
import CoreMotion

let π:CGFloat = CGFloat(M_PI)

@IBDesignable class CounterView: UIView {

    @IBInspectable var counter: Double = 0 {
        didSet {
                //the view needs to be refreshed
                setNeedsDisplay()
        }
    }
    @IBInspectable var counter2: Double = 0 {
        didSet {
            //the view needs to be refreshed
            setNeedsDisplay()
        }
    }
    @IBInspectable var counter3: Double = 0 {
        didSet {
            //the view needs to be refreshed
            setNeedsDisplay()
        }
    }
    @IBInspectable var counter4: Double = 0 {
        didSet {
            //the view needs to be refreshed
            setNeedsDisplay()
        }
    }
    @IBInspectable var counter5: Double = 0 {
        didSet {
            //the view needs to be refreshed
            setNeedsDisplay()
        }
    }
    @IBInspectable var counter6: Double = 0 {
        didSet {
            //the view needs to be refreshed
            setNeedsDisplay()
        }
    }
    @IBInspectable var counter7: Double = 0 {
        didSet {
            //the view needs to be refreshed
            setNeedsDisplay()
        }
    }
    @IBInspectable var counter8: Double = 0 {
        didSet {
            //the view needs to be refreshed
            setNeedsDisplay()
        }
    }
    @IBInspectable var day1: UIColor = UIColor.blueColor()
    @IBInspectable var day2: UIColor = UIColor.orangeColor()
    @IBInspectable var day3: UIColor = UIColor.orangeColor()
    @IBInspectable var day4: UIColor = UIColor.orangeColor()
    @IBInspectable var day5: UIColor = UIColor.orangeColor()
    @IBInspectable var day6: UIColor = UIColor.orangeColor()
    @IBInspectable var day7: UIColor = UIColor.orangeColor()
    @IBInspectable var day8: UIColor = UIColor.orangeColor()
    override func drawRect(rect: CGRect) {
      
        //define the start angle for the arc
        let angleHour: CGFloat = π/4
        var maxKilometers = 5000
       // var radius1 = distanceLastHr.map(0, maxKilometers,0,bounds.width);
       // println(radius1);
   
    var R1hour: CGFloat = CGFloat(counter)/5000*(bounds.width/2)
    var R2hour: CGFloat = CGFloat(counter2)/5000*(bounds.width/2)
    var R3hour: CGFloat = CGFloat(counter3)/5000*(bounds.width/2)
    var R4hour: CGFloat = CGFloat(counter4)/5000*(bounds.width/2)
    var R5hour: CGFloat = CGFloat(counter5)/5000*(bounds.width/2)
    var R6hour: CGFloat = CGFloat(counter6)/5000*(bounds.width/2)
    var R7hour: CGFloat = CGFloat(counter7)/5000*(bounds.width/2)
    var R8hour: CGFloat = CGFloat(counter8)/5000*(bounds.width/2)
        
    //first hour - draw the outer arc
        var outlinePath = UIBezierPath(arcCenter: center,
            radius: R1hour,
            startAngle: 0,
            endAngle: angleHour,
            clockwise: true)
    //first hour - draw the inner arc
        outlinePath.addArcWithCenter(center,
            radius: 0,
            startAngle: angleHour,
            endAngle: 0,
            clockwise: false)
        outlinePath.closePath()
        day1.setFill()
        outlinePath.fill()
        
    
    
    //second hour - draw the outer arc
    var outlinePath2 = UIBezierPath(arcCenter: center,
        radius: R1hour + R2hour ,
        startAngle: angleHour,
        endAngle: angleHour*2,
        clockwise: true)
    
    //second hour - draw the inner arc
    outlinePath2.addArcWithCenter(center,
    radius: R1hour,
    startAngle: angleHour*2,
    endAngle: angleHour,
    clockwise: false)
    
    //close the path
    outlinePath2.closePath()
    day2.setFill()
    outlinePath2.fill()
    
    //3 hour - draw the outer arc
    var outlinePath3 = UIBezierPath(arcCenter: center,
            radius: R3hour + R2hour + R1hour,
            startAngle: angleHour*2,
            endAngle: angleHour*3,
            clockwise: true)
        
    //3 hour - draw the inner arc
        outlinePath3.addArcWithCenter(center,
            radius: R2hour + R1hour,
            startAngle: angleHour*3,
            endAngle: angleHour*2,
            clockwise: false)
        
    //close the path
        outlinePath3.closePath()
        day3.setFill()
        outlinePath3.fill()
        
    //4 hour - draw the outer arc
        var outlinePath4 = UIBezierPath(arcCenter: center,
            radius: R4hour + R3hour + R2hour + R1hour,
            startAngle: angleHour*3,
            endAngle: angleHour*4,
            clockwise: true)
        
    //4 hour - draw the inner arc
        outlinePath4.addArcWithCenter(center,
            radius: R3hour + R2hour + R1hour,
            startAngle: angleHour*4,
            endAngle: angleHour*3,
            clockwise: false)
        
    //close the path
        outlinePath4.closePath()
        day4.setFill()
        outlinePath4.fill()
        
    //5 hour - draw the outer arc
        var outlinePath5 = UIBezierPath(arcCenter: center,
            radius: R5hour + R4hour + R3hour + R2hour + R1hour,
            startAngle: angleHour*4,
            endAngle: angleHour*5,
            clockwise: true)
        
    //5 hour - draw the inner arc
        outlinePath5.addArcWithCenter(center,
            radius: R4hour + R3hour + R2hour + R1hour,
            startAngle: angleHour*5,
            endAngle: angleHour*4,
            clockwise: false)
        
    //close the path
        outlinePath5.closePath()
        day5.setFill()
        outlinePath5.fill()
        
    //6 hour - draw the outer arc
        var outlinePath6 = UIBezierPath(arcCenter: center,
            radius: R6hour + R5hour + R4hour + R3hour + R2hour + R1hour,
            startAngle: angleHour*5,
            endAngle: angleHour*6,
            clockwise: true)
        
    //6 hour - draw the inner arc
        outlinePath6.addArcWithCenter(center,
            radius: R5hour + R4hour + R3hour + R2hour + R1hour,
            startAngle: angleHour*6,
            endAngle: angleHour*5,
            clockwise: false)
        
    //close the path
        outlinePath6.closePath()
        day6.setFill()
        outlinePath6.fill()

    //7 hour - draw the outer arc
        var outlinePath7 = UIBezierPath(arcCenter: center,
            radius: R7hour + R6hour + R5hour + R4hour + R3hour + R2hour + R1hour,
            startAngle: angleHour*6,
            endAngle: angleHour*7,
            clockwise: true)
        
    //7 hour - draw the inner arc
        outlinePath7.addArcWithCenter(center,
            radius: R6hour + R5hour + R4hour + R3hour + R2hour + R1hour,
            startAngle: angleHour*7,
            endAngle: angleHour*6,
            clockwise: false)
        
    //close the path
        outlinePath7.closePath()
        day7.setFill()
        outlinePath7.fill()
        
    //8 hour - draw the outer arc
        var outlinePath8 = UIBezierPath(arcCenter: center,
            radius: R8hour + R7hour + R6hour + R5hour + R4hour + R3hour + R2hour + R1hour,
            startAngle: angleHour*7,
            endAngle: angleHour*8,
            clockwise: true)
        
    //8 hour - draw the inner arc
        outlinePath8.addArcWithCenter(center,
            radius: R7hour + R6hour + R5hour + R4hour + R3hour + R2hour + R1hour,
            startAngle: angleHour*8,
            endAngle: angleHour*7,
            clockwise: false)
        
    //close the path
        outlinePath8.closePath()
        day8.setFill()
        outlinePath8.fill()
    }
    

    
}



