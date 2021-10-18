//
//  Resources+UIImage.swift
//  PowerplayToastKit
//
//  Created by Mithilesh Parmar on 18/10/21.
//

import UIKit

public extension UIImage {
    convenience init?(nameInToastKitResourceBundle: String) {
        let toastKitBundle = Bundle(for: DefaultToastView.self)
        let path = toastKitBundle.path(forResource: "Resources", ofType: "bundle")
        let resourceBundle = Bundle(url: URL(fileURLWithPath: path!))
        self.init(named: nameInToastKitResourceBundle, in: resourceBundle, compatibleWith: nil)
    }
    
    convenience init?(defaultImageOfType: ToastType) {
        var name: String?
        
        switch defaultImageOfType {
        case .success:
            name = "success.png"
            break
        case .warning:
            name = "warning.png"
            break
        case .error:
            name = "error.png"
            break
        case .info:
            name = "info.png"
            break
        }
        
        guard let name = name else { return nil}
        self.init(nameInToastKitResourceBundle: name)
    }
}
