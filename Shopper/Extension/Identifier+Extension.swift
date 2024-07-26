//
//  identifier+Extension.swift
//  Shopper
//
//  Created by 쌩 on 6/14/24.
//

import UIKit

protocol ReuseIdentifying {
    static var identifier: String { get }
}

extension UIView {
    static var identifier: String {
          return String(describing: self)
      }
}
