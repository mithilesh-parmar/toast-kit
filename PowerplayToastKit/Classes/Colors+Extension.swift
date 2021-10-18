//
//  Colors+Extension.swift
//  PowerplayToastKit
//
//  Created by Mithilesh Parmar on 18/10/21.
//

import UIKit

public extension UIColor {
    static let successToastSecondaryColor = UIColor(233,244,232)
    static let warningToastSecondaryColor = UIColor(253,241,221)
    static let errorToastSecondaryColor = UIColor(247,228,221)
    static let infoToastSecondaryColor = UIColor(227,238,250)
    
    static let successToastPrimaryColor = UIColor(145,197,139)
    static let warningToastPrimaryColor = UIColor(244,186,97)
    static let errorToastPrimaryColor = UIColor(239,143,108)
    static let infoToastPrimaryColor = UIColor(116,170,232)
}

public extension UIColor {
    
    convenience init(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat, _ alpha: CGFloat = 1) {
        self.init(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha * 1.0)
    }
    
}
