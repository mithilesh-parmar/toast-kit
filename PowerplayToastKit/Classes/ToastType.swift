//
//  ToastType.swift
//  PowerplayToastKit
//
//  Created by Mithilesh Parmar on 18/10/21.
//

public enum ToastType {
    case success(title: String, message: String?)
    case warning(title: String, message: String?)
    case error(title: String, message: String?)
    case info(title: String, message: String?)
}
