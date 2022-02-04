//
//  Extension.swift
//  NASA
//
//  Created by Ульяна Гритчина on 31.01.2022.
//

import UIKit

extension UIView {
    func show(shown: Bool = true, start: Float, end: Float) {
        
        let animation = CABasicAnimation(keyPath: "opacity")

        if shown {
            animation.fromValue = start
            animation.toValue = end
            animation.duration = 0.3
        } else {
            animation.fromValue = end
            animation.toValue = start
            animation.duration = 0.3
        }
        
        layer.add(animation, forKey: nil)
    }
}
