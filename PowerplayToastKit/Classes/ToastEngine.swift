//
//  ToastEngine.swift
//  PowerplayToastKit
//
//  Created by Mithilesh Parmar on 18/10/21.
//

// Public API's for other modules to use

public protocol ToastEngine {
    
    func showToast(of type: ToastType, at position: ToastPosition?, for interval: TimeInterval?)
    
    func showToast(of type: ToastType, at position: ToastPosition?)
    
    func showToast(withBuilder builder: ToastBuildable)
    
    func showToast(withCustomView view: ToastView, at position: ToastPosition, for interval: TimeInterval)
    
    func showToast(withCustomView view: ToastView, at position: ToastPosition)
    
    func hideToast()
}
