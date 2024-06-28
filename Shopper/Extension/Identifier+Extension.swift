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

extension UIViewController: ReuseIdentifying {
    static var identifier: String {
        return String(describing: self)
    }
}
extension UICollectionViewCell: ReuseIdentifying {
    static var identifier: String {
        return String(describing: self)
    }
}
extension UITableViewCell: ReuseIdentifying {
    static var identifier: String {
        return String(describing: self)
    }
}
extension UITableViewHeaderFooterView: ReuseIdentifying {
    static var identifier: String {
        return String(describing: self)
    }
}
