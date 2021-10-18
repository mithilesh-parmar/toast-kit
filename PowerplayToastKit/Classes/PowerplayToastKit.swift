//
//  PowerplayToastKit.swift
//  PowerplayToastKit
//
//  Created by Mithilesh Parmar on 18/10/21.
//

import UIKit
import SnapKit

public final class PowerplayToastKit {
    
    public static var shared: PowerplayToastKit = {
        let shared = PowerplayToastKit()
        return shared
    }()
    
    private let defaultTimeInterval: TimeInterval = 2
    
    private init(){}
    
    internal func showToastWithCustomView(_ view: UIView, at position: ToastPosition, for timeInterval: TimeInterval){
        view.translatesAutoresizingMaskIntoConstraints = false
        addToWindow(view, at: position, for: timeInterval)
    }
    
    internal func showToastView(for builder: ToastBuildable){
        let toast = DefaultToastView()
        
        toast.translatesAutoresizingMaskIntoConstraints = false
        
        toast.build(with: builder)
        
        addToWindow(toast, at: builder.toastPosition, for: builder.timeInterval)
        
    }
    
    private func setupTimeToRemove(_ toast: UIView, timeInterval: TimeInterval = 2){
        DispatchQueue.main.asyncAfter(deadline: .now() + timeInterval) {
            self.removeFromWindow(toast)
        }
    }
    
    private func addToWindow(_ toast: UIView, at position: ToastPosition?, for interval: TimeInterval? = nil){
        
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            
            self.removeCurrentlyShownToastFromWindow()
            
            self.setupTimeToRemove(toast, timeInterval: interval ?? self.defaultTimeInterval)
            
            guard let window = self.getWindow() else { return }
            
            window.addSubview(toast)
            
            switch position ?? ToastPosition.defaultPosition {
            case .top:
                toast.snp.makeConstraints { make in
                    make.leading.trailing.equalToSuperview().inset(18)
                    make.top.equalToSuperview()
                }
                break
            case .bottom:
                toast.snp.makeConstraints { make in
                    make.leading.trailing.equalToSuperview().inset(18)
                    make.bottom.equalToSuperview()
                }
                break
            case .center:
                toast.snp.makeConstraints { make in
                    make.leading.trailing.equalToSuperview().inset(18)
                    make.center.equalToSuperview()
                }
                break
            case let .custom(callback):
                callback(toast)
                break
            }
            self.animateShowingOf(toast)
        }
        
    }
    
    private func animateShowingOf(_ toast: UIView){
        toast.alpha = 0.0
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.1, options: .curveEaseIn) {
            toast.alpha = 1
        } completion: { _ in
        }
        
    }
    
    private func animateRemovingOf(_ toast: UIView){
        toast.alpha = 1.0
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.1, options: .curveEaseIn) {
            toast.alpha = 0.0
        } completion: { _ in
            toast.removeFromSuperview()
        }
        
    }
    
    private func removeFromWindow(_ toast: UIView?){
        guard let toast = toast else { return }
        self.animateRemovingOf(toast)
    }
    
    private func removeCurrentlyShownToastFromWindow(){
        // remove all views which are of type ToastView
        let shownToasts = getWindow()?.subviews.filter{ $0.isKind(of: ToastView.self) }.compactMap{ $0 }
        shownToasts?.forEach{ self.removeFromWindow($0) }
    }
    
    private func getWindow() -> UIWindow? {
        guard let appdelegate = UIApplication.shared.delegate,
              let window = appdelegate.window else { return nil }
        return window
    }
    
    internal func hideCurrentlyShownToast(){
        removeCurrentlyShownToastFromWindow()
    }
    
}

extension PowerplayToastKit: ToastEngine {
    
    public func showToast(withCustomView view: ToastView, at position: ToastPosition, for interval: TimeInterval) {
        self.showToastWithCustomView(view, at: position, for: interval)
    }
    
    public func showToast(withCustomView view: ToastView, at position: ToastPosition) {
        self.showToast(withCustomView: view, at: position, for: defaultTimeInterval)
    }
    
    public func showToast(of type: ToastType, at position: ToastPosition?, for interval: TimeInterval?) {
        let builder = ToastBuilder()
            .set(type: type)
            .set(position: position)
            .set(timeInterval: interval)
            .build()
        
        self.showToast(withBuilder: builder)
    }
    
    public func showToast(of type: ToastType, at position: ToastPosition?) {
        self.showToast(of: type, at: position, for: defaultTimeInterval)
    }
    
    public func showToast(withBuilder builder: ToastBuildable) {
        self.showToastView(for: builder)
    }
    
    public func hideToast() {
        self.hideCurrentlyShownToast()
    }
}
