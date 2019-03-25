//
//  PanelAnimation.swift
//  AnimationPanel
//
//  Created by 朱冰一 on 2018/12/27.
//

import Foundation
import UIKit

struct Animation {
    var name: String
    var timeInterval: TimeInterval
    var delay: TimeInterval
    var animationOptions: [UIView.AnimationOptions]
    var dampingRation: CGFloat
    var velocity: CGFloat
}
