//
//  ToastThemeBuilder.swift
//  PowerplayToastKit
//
//  Created by Mithilesh Parmar on 18/10/21.
//

import UIKit

public class ToastThemeBuilder: ToastThemeBuildable {
    
    public var toastCornerRadius: CGFloat?
    
    public var backgroundColor: UIColor?
    
    public var titleTextColor: UIColor?
    
    public var messageTextColor: UIColor?
    
    public var titleFont: UIFont?
    
    public var messageFont: UIFont?
    
    public init(){}
    
    public func set(toastCornerRadius: CGFloat?) -> ToastThemeBuildable {
        self.toastCornerRadius = toastCornerRadius
        return self
    }
    
    public func set(backgroundColor: UIColor?) -> ToastThemeBuildable {
        self.backgroundColor = backgroundColor
        return self
    }
    
    public func set(titleTextColor: UIColor?) -> ToastThemeBuildable {
        self.titleTextColor = titleTextColor
        return self
    }
    
    public func set(messageTextColor: UIColor?) -> ToastThemeBuildable {
        self.messageTextColor = messageTextColor
        return self
    }
    
    public func set(titleFont: UIFont?) -> ToastThemeBuildable {
        self.titleFont = titleFont
        return self
    }
    
    public func set(messageFont: UIFont?) -> ToastThemeBuildable {
        self.messageFont = messageFont
        return self
    }
    
    public func build() -> ToastThemeBuildable {
        let themeBuilder = ToastThemeBuilder()
            .set(backgroundColor: self.backgroundColor)
            .set(titleFont: self.titleFont ?? UIFont.systemFont(ofSize: 16, weight: .bold))
            .set(messageFont: self.messageFont ?? UIFont.systemFont(ofSize: 14, weight: .medium))
            .set(titleTextColor: self.titleTextColor ?? .black)
            .set(messageTextColor: self.messageTextColor ?? .black)
            .set(toastCornerRadius: self.toastCornerRadius ?? 8)
        return themeBuilder
    }
    
}
