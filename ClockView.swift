//
//  ClockView.swift
//  Quiz_test
//
//  Created by Md Asifur Rahman on 6/18/16.
//  Copyright © 2016 Md Asifur Rahman. All rights reserved.
//

import UIKit

class ClockView: UIView {
    
    private var shapeLayer = CAShapeLayer()
    private var countDownTimer = NSTimer()
    var timerValue:Int?
    private var label = UILabel()
    
    
    
    override init (frame : CGRect) {
        super.init(frame : frame)
        
        self.createLabel()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    private func addCircle() {
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: 195,y: 50), radius: CGFloat(36), startAngle: CGFloat(-M_PI_2), endAngle:CGFloat(2*M_PI-M_PI_2), clockwise: true)
        
        self.shapeLayer.path = circlePath.CGPath
        self.shapeLayer.fillColor = UIColor.clearColor().CGColor
        if (self.timerValue < 60){
            
            self.shapeLayer.strokeColor = UIColor.redColor().CGColor
            self.shapeLayer.lineWidth = 2.0
            self.layer.addSublayer(self.shapeLayer)
            
        }
        else{
            self.shapeLayer.strokeColor = Colors.clockCircleColor.CGColor//UIColor.whiteColor().CGColor    //#####circle color
            self.shapeLayer.lineWidth = 2.0
            self.layer.addSublayer(self.shapeLayer)
        }
        
    }
    
    private func createLabel() {
        self.label = UILabel(frame: CGRect(x: 165, y: 35, width: 100, height: 30))
        
        self.label.font = UIFont(name: self.label.font.fontName, size: 14)
        self.label.textColor = Colors.clockTextColor  //UIColor.whiteColor()//#####TEXT color
        
        self.addSubview(self.label)
    }
    
    private func startAnimation() {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = Double(self.timerValue!)
        animation.fillMode = kCAFillModeForwards
        animation.removedOnCompletion = false
        
        self.shapeLayer.addAnimation(animation, forKey: "ani")
    }
    
    private func updateLabel(value: Int) {
        self.setLabelText(self.timeFormatted(value))
        self.addCircle()
    }
    
    private func setLabelText(value: String) {
        self.label.text = value
    }
    
    private func timeFormatted(totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        let hours: Int = totalSeconds / 3600
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
    
    // Needs @objc to be able to call private function in NSTimer.
    @objc private func countdown(dt: NSTimer) {
        self.timerValue!--
        if self.timerValue < 0 {
            self.countDownTimer.invalidate()
        }
        else {
            self.setLabelText(self.timeFormatted(self.timerValue!))
        }
        // print(self.timerValue!)
    }
    
    
    
    func setTimer(value: Int) {
        self.timerValue = value
        self.updateLabel(value)
    }
    
    
    
    func startClockTimer() {
        //self.countDownTimer.invalidate()
        self.countDownTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("countdown:"), userInfo: nil, repeats: true)
        self.startAnimation()
    }
    
    
}
