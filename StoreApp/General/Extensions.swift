//
//  Extensions.swift
//  StoreApp
//
//  Created by Angel on 29/07/2022.
//

import UIKit

extension UIView {
 func fadeIn(duration: TimeInterval = 1.0) {
     UIView.animate(withDuration: duration, animations: {
        self.alpha = 1.0
     })
 }

func fadeOut(duration: TimeInterval = 1.0) {
    UIView.animate(withDuration: duration, animations: {
        self.alpha = 0.0
    })
  }
}
