//
//  UIStackView+Extension.swift
//  PowerplayToastKit
//
//  Created by Mithilesh Parmar on 18/10/21.
//

import UIKit

public extension UIStackView {
    
    func addArrangedSubviews(views: [UIView]?) {
        views?.compactMap{$0}.forEach{ self.addArrangedSubview($0) }
    }
    
}
