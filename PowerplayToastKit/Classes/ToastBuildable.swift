//
//  ToastBuildable.swift
//  PowerplayToastKit
//
//  Created by Mithilesh Parmar on 18/10/21.
//

import UIKit

public protocol ToastBuildable {
    
    var leadingIcon: UIImage? { get }
    var theme: ToastThemeBuildable? { get }
    var type: ToastType? { get }
    var timeInterval: TimeInterval? { get }
    var toastPosition: ToastPosition? { get }
    
    
    @discardableResult func set(leadingIcon: UIImage?) -> ToastBuildable
    @discardableResult func set(type: ToastType?) -> ToastBuildable
    @discardableResult func set(theme: ToastThemeBuildable?) -> ToastBuildable
    @discardableResult func set(timeInterval: TimeInterval?) -> ToastBuildable
    @discardableResult func set(position: ToastPosition?) -> ToastBuildable
    @discardableResult func build() -> ToastBuildable
}

