//
//  HolderView.swift
//  SBLoader
//
//  Created by Satraj Bambra on 2015-03-17.
//  Copyright (c) 2015 Satraj Bambra. All rights reserved.
//

import UIKit

protocol HolderViewDelegate:class {
    func animateLabel()
}



class HolderView: UIView {
    let ovalLayer = OvalLayer()
    
    var parentFrame :CGRect = CGRectZero
    weak var delegate:HolderViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Colors.clear
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    
    
    func addOval() {
        //insert logo
        //ovalLayer.contents =
        var DynamicView=UIView(frame: CGRectMake(10, 27, 80, 80))
        var layer1 = DynamicView.layer
        layer1.contents = UIImage(named: "logo")?.CGImage
        ovalLayer.addSublayer(layer1)
        layer.addSublayer(ovalLayer)
        ovalLayer.expand()
        NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "wobbleOval",userInfo: nil, repeats: false)
    }
    
    
    
    
    func wobbleOval() {
        ovalLayer.wobble()
        NSTimer.scheduledTimerWithTimeInterval(5.5, target: self, selector: "expandView",userInfo: nil, repeats: false)
    }
    
    
    func expandView() {
        // 1
        
        layer.sublayers = nil
        NSTimer.scheduledTimerWithTimeInterval(1.5, target: self, selector: "addLabel",userInfo: nil, repeats: false)
        // 4
        
    }
    
    func addLabel() {
        delegate?.animateLabel()
    }
    
}
