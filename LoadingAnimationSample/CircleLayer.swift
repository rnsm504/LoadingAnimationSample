//
//  CircleLayer.swift
//  LoadingAnimationSample
//
//  Created by Masanori Kuze on 2016/11/09.
//  Copyright © 2016年 Masanori Kuze. All rights reserved.
//

import UIKit

class Circlelayer : CAShapeLayer {
    
    var onLight : Bool = true
    fileprivate var count : Int = 1
    
    override init() {
        super.init()
    }
    
    override init(layer: Any) {
        super.init(layer: layer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(in ctx: CGContext) {
        //背景
        let c = UIColor.clear
        ctx.setFillColor(c.cgColor)
        ctx.addRect(self.bounds)
        ctx.drawPath(using: .fill)
        
        //center circle
        ctx.addArc(center: CGPoint(x:self.bounds.midX, y:self.bounds.midY), radius: 8, startAngle: 0, endAngle: CGFloat(M_PI*2), clockwise: false)
        ctx.closePath()
        ctx.setFillColor(UIColor.white.cgColor)
        ctx.drawPath(using: .fill)
    }
    
}

