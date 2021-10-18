//
//  ToastBuilder.swift
//  PowerplayToastKit
//
//  Created by Mithilesh Parmar on 18/10/21.
//

import UIKit

public class ToastBuilder: ToastBuildable {
    
    public var leadingIcon: UIImage?
    
    // timeinterval for toast to be shown on screen
    public var timeInterval: TimeInterval?
    
    // position of toast on screen
    public var toastPosition: ToastPosition?
    
    // theme of toast
    public var theme: ToastThemeBuildable?
    
    // type of toast (success,error, warning, info)
    public var type: ToastType?
    
    private let defaultTimeInterval: TimeInterval = 2
    
    public init() {}
    
    public func set(leadingIcon: UIImage?) -> ToastBuildable {
        self.leadingIcon = leadingIcon
        return self
    }
    
    public func set(type: ToastType?) -> ToastBuildable {
        self.type = type
        return self
    }
    
    public func set(theme: ToastThemeBuildable?) -> ToastBuildable {
        self.theme = theme
        return self
    }
    
    public func set(timeInterval: TimeInterval?) -> ToastBuildable {
        self.timeInterval = timeInterval
        return self
    }
    
    public func set(position: ToastPosition?) -> ToastBuildable {
        self.toastPosition = position
        return self
    }
    
    public func build() -> ToastBuildable {
        let toastBuilder = ToastBuilder()
            .set(position: self.toastPosition ?? .bottom)
            .set(timeInterval: self.timeInterval ?? defaultTimeInterval)
            .set(type: self.type)
            .set(leadingIcon: self.leadingIcon)
        
        if theme == nil {
            // if no theme is provided then get a default theme for specified type
            toastBuilder.set(theme: self.getToastTheme(for: type))
        }
        
        return toastBuilder
    }
    
    /*
     returns a theme for a specified Type
     */
    private func getToastTheme(for type: ToastType?) -> ToastThemeBuildable {
        
        guard let type = type else {
            // return a success toast theme if no type is provided
            return ToastThemeBuilder()
                .set(backgroundColor: .successToastSecondaryColor)
                .build()
        }
        
        switch type {
        case .success:
            return ToastThemeBuilder()
                .set(backgroundColor: .successToastSecondaryColor)
                .build()
        case .warning:
            return ToastThemeBuilder()
                .set(backgroundColor: .warningToastSecondaryColor)
                .build()
        case .error:
            return ToastThemeBuilder()
                .set(backgroundColor: .errorToastSecondaryColor)
                .build()
        case .info:
            return ToastThemeBuilder()
                .set(backgroundColor: .infoToastSecondaryColor)
                .build()
        }
    }
}
