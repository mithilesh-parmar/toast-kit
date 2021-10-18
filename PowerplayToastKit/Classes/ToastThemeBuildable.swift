//
//  ToastThemeBuildable.swift
//  PowerplayToastKit
//
//  Created by Mithilesh Parmar on 18/10/21.
//

import UIKit

public protocol ToastThemeBuildable {
    
    var toastCornerRadius: CGFloat? { get }
    var backgroundColor: UIColor? { get }
    var titleTextColor: UIColor? { get }
    var messageTextColor: UIColor? { get }
    var titleFont: UIFont? { get }
    var messageFont: UIFont? { get }
    
    @discardableResult func set(toastCornerRadius: CGFloat?) -> ToastThemeBuildable
    @discardableResult func set(backgroundColor: UIColor?) -> ToastThemeBuildable
    @discardableResult func set(titleTextColor: UIColor?) -> ToastThemeBuildable
    @discardableResult func set(messageTextColor: UIColor?) -> ToastThemeBuildable
    @discardableResult func set(titleFont: UIFont?) -> ToastThemeBuildable
    @discardableResult func set(messageFont: UIFont?) -> ToastThemeBuildable
    @discardableResult func build() -> ToastThemeBuildable
}
