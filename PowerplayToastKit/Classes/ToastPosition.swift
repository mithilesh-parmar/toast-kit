//
//  ToastPosition.swift
//  PowerplayToastKit
//
//  Created by Mithilesh Parmar on 18/10/21.
//

import Foundation

// callback to configure the position of the toast
public typealias ToastPositionConfigurationCallback = (UIView) -> Void

public enum ToastPosition {
    
    case top
    case bottom
    case center
    case custom(callback: ToastPositionConfigurationCallback)
    
    static let defaultPosition: ToastPosition = .bottom
}
