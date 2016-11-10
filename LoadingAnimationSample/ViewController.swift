//
//  ViewController.swift
//  LoadingAnimationSample
//
//  Created by Masanori Kuze on 2016/11/09.
//  Copyright © 2016年 Masanori Kuze. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        
        self.view.backgroundColor = UIColor(red: 0, green: 153/255, blue: 255/255, alpha: 1)
        // CAReplicatorLayerを生成、追加
        let replicatorLayer = CAReplicatorLayer()
        replicatorLayer.frame = view.bounds
        view.layer.addSublayer(replicatorLayer)
        
        let circle = Circlelayer()
        circle.frame = CGRect(x: self.view.frame.midX-40, y: self.view.frame.midY - 80, width: 80, height: 80)
        replicatorLayer.addSublayer(circle)
        circle.setNeedsDisplay()
        
        replicatorLayer.instanceCount = 6
        replicatorLayer.instanceDelay = 0.1
        let angle = (2.0*M_PI)/30
        replicatorLayer.instanceTransform = CATransform3DMakeRotation(-CGFloat(angle), 0.0, 0.0, 1.0);

        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
//        animation.duration = 5
//        animation.repeatCount = .infinity
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        
        
        let x : CGFloat = self.view.frame.size.width/2
        let y : CGFloat = self.view.frame.size.height/2
        let radius : CGFloat = 100.0
        
        let cyclePath : CGMutablePath = CGMutablePath()
        cyclePath.addArc(center: CGPoint(x:x, y:y), radius: radius, startAngle: CGFloat(M_PI*(3/2)), endAngle: CGFloat(-M_PI*(1/2)), clockwise: false)
        
        animation.path = cyclePath
        
        let blinkAnimation = CAKeyframeAnimation(keyPath: "opacity")
        blinkAnimation.fillMode = kCAFillModeForwards
        blinkAnimation.isRemovedOnCompletion = false
//        blinkAnimation.duration = 5
//        blinkAnimation.repeatCount = .infinity
        blinkAnimation.values = [1, 0, 1, 1, 1]
        
        let group = CAAnimationGroup()
        group.animations = [animation, blinkAnimation]
        group.duration = 5
        group.repeatCount = .infinity
        
        circle.add(group, forKey: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

