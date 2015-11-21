//
//  PushButtonView.swift
//  test_drawingCG
//
//  Created by Dana Avesar on 3/13/15.
//  Copyright (c) 2015 Dana Avesar. All rights reserved.
//

import UIKit
import CoreGraphics
class PushButtonView: UIButton {
    @IBInspectable var isAddButton: Bool = true

    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        var path = UIBezierPath(ovalInRect: rect)
        UIColor.greenColor().setFill()
        path.fill()
    }
    

}
