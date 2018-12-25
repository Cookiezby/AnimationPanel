//
//  Panel.swift
//  AnimationPanel
//
//  Created by 朱冰一 on 2018/12/25.
//

import Foundation
import UIKit

public class Panel {
    public static let shared = Panel()

    //basic property
    var timeInterval: TimeInterval = 0
    var animationOptions: UIView.AnimationOptions = .curveLinear
    var delay: TimeInterval = 0
    
    //sping property
    var dampingRatio: CGFloat = 1
    var velocity: CGFloat = 1
    
    @available(iOS 7.0, *)
    public func animate(animations: @escaping () -> Void, completion: ((Bool) -> Void)? = nil) {
        
        animationOptions = [.curveLinear, .curveEaseOut]
        
        UIView.animate(withDuration: timeInterval, delay: delay, options: animationOptions, animations: animations, completion: completion)
    }
    
    public func animateSpring(animations: @escaping () -> Void, completion: ((Bool) -> Void)? = nil) {
         UIView.animate(withDuration: timeInterval, delay: delay, usingSpringWithDamping: dampingRatio, initialSpringVelocity: velocity, options: animationOptions, animations: animations, completion: completion)
    }
}

