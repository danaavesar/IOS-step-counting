//
//  grid_view.swift
//  test_drawingCG
//
//  Created by Dana Avesar on 3/16/15.
//  Copyright (c) 2015 Dana Avesar. All rights reserved.
//

import UIKit

class grid_view: UIView {

    //
    //  gridView.swift
    //  stepCounter02
    //
    //  Created by Nithya Asokan on 16/03/15.
    //  Copyright (c) 2015 Nithya Asokan. All rights reserved.
    //
    
    
    
    @IBDesignable class gridView: UIView {
        
        let noofDivs = 8
        @IBInspectable var gridColor: UIColor = UIColor.grayColor()
        @IBInspectable var segcolor: UIColor = UIColor.grayColor()
        
        override func drawRect(rect: CGRect) {
            //define the center point of the view where you will rotate the arc around
            let center = CGPoint(x:bounds.width/2, y:bounds.height/2)
            //calculate the radius based on the max dimensions of the view
            let radius: CGFloat = max(bounds.width, bounds.height)
            //define thickness of the arc
            let arcWidth: CGFloat = 1
            let arcWidth2: CGFloat = 70
            //define the start angle for the arc
            let startAngle: CGFloat = 0
            //define the end angle of the arc
            let endAngle: CGFloat = π
            let angleHour: CGFloat = π/12 //= 2 * π - startAngle + endAngle
            
            //1 - first calculate the difference between the two angles
            //ensuring it is positive
            
            //then calculate the arc for each single glass
            let arcLengthPerhour = 2 * π  / CGFloat(noofDivs)
            
            
            var gridPath = UIBezierPath(arcCenter: center,
                radius: bounds.width/2,
                startAngle: 0,
                endAngle: 360,
                clockwise: true)
            
            gridColor.setFill()
            gridPath.fill()
            
            let context = UIGraphicsGetCurrentContext()
            
            //1 - save original state
            CGContextSaveGState(context)
            segcolor.setFill()
            
            let markerWidth:CGFloat = 5.0
            let markerSize:CGFloat = 10.0
            
            //2 - the marker rectangle positioned at the top left
            var markerPath = UIBezierPath(rect:
                CGRect(x: -markerWidth/2,
                    y: 0,
                    width: markerWidth,
                    height: markerSize))
            
            //3 - move top left of context to the previous center position
            CGContextTranslateCTM(context,
                rect.width/2,
                rect.height/2)
            
            for i in 1...noofDivs {
                //4 - save the centred context
                CGContextSaveGState(context)
                
                //5 - calculate the rotation angle
                var angle = arcLengthPerhour * CGFloat(i) + startAngle - π/4
                
                //rotate and translate
                CGContextRotateCTM(context, angle)
                CGContextTranslateCTM(context, 0, rect.height/2 - markerSize)
                
                //6 - fill the marker rectangle
                markerPath.fill()
                
                //7 - restore the centred context for the next rotate
                CGContextRestoreGState(context)
            }
            
            //8 - restore the original state in case of more painting
            CGContextRestoreGState(context)
            
        }
        
        
    }


}
