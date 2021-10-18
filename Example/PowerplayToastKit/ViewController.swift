//
//  ViewController.swift
//  PowerplayToastKit
//
//  Created by Mithilesh Parmar on 10/18/2021.
//  Copyright (c) 2021 Mithilesh Parmar. All rights reserved.
//

import UIKit
import SnapKit
import PowerplayToastKit

class ViewController: UIViewController {
    
    internal enum Position: CaseIterable {
        case top
        case bottom
        case center
        case custom
        
    }
    
    internal lazy var postions: [Position] = Position.allCases
    
    private var selectedPosition: Position?
    
    private lazy var positionLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .black
        lbl.text = "Select Toast Position"
        lbl.numberOfLines = 1
        return lbl
    }()
    
    private lazy var successButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Success", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        return btn
    }()
    
    private lazy var warningButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Warning", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        return btn
    }()
    
    
    private lazy var errorButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Error", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        return btn
    }()
    
    
    private lazy var infoButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Info", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        return btn
    }()
    
    private lazy var dialogButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Custom Dialog", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        return btn
    }()
    
    private lazy var builderButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Custom Toast Builder", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        return btn
    }()
    
    private lazy var stackView: UIStackView = {
        let stck = UIStackView()
        stck.translatesAutoresizingMaskIntoConstraints = false
        stck.axis = .vertical
        stck.distribution = .equalSpacing
        stck.spacing = 8
        return stck
    }()
    
    private lazy var positionPickerView: UIPickerView = {
        let v = UIPickerView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        constraintLayout()
        addTargets()
    }
    
    private func addViews(){
        view.addSubview(stackView)
        stackView.addArrangedSubviews(views: [positionPickerView, successButton, warningButton, errorButton, infoButton, dialogButton, builderButton])
    }
    
    private func constraintLayout(){
        stackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(18)
            make.top.equalToSuperview().offset(200)
        }
    }
    
    private func addTargets(){
        successButton.addTarget(self, action: #selector(didTapSuccess(_:)), for: .touchUpInside)
        warningButton.addTarget(self, action: #selector(didTapWarning(_:)), for: .touchUpInside)
        errorButton.addTarget(self, action: #selector(didTapError(_:)), for: .touchUpInside)
        infoButton.addTarget(self, action: #selector(didTapInfo(_:)), for: .touchUpInside)
        dialogButton.addTarget(self, action: #selector(didTapDialog(_:)), for: .touchUpInside)
        builderButton.addTarget(self, action: #selector(didTapBuilder(_:)), for: .touchUpInside)
        positionPickerView.delegate = self
        positionPickerView.dataSource = self
    }
    
    @objc private func didTapSuccess(_ sender: UIButton){
        let heading = "Success"
        let message = "This method was a success"
        PowerplayToastKit
            .shared
            .showToast(of: .success(title: heading, message: message), at: getToastPosition())
    }
    
    @objc private func didTapWarning(_ sender: UIButton){
        let heading = "Warning"
        let message = "Dont do that again or you're done !!"
        PowerplayToastKit
            .shared
            .showToast(of: .warning(title: heading, message: message), at: getToastPosition())
    }
    
    @objc private func didTapError(_ sender: UIButton){
        let heading = "Error"
        let message = "This method could not be completed, unknown error occured !!"
        PowerplayToastKit
            .shared
            .showToast(of: .error(title: heading, message: message), at: getToastPosition())
    }
    
    @objc private func didTapInfo(_ sender: UIButton){
        let heading = "Info"
        let message = "🕺🕺We are hiring at Powerplay🕺🕺 Check our carrer page!"
        PowerplayToastKit
            .shared
            .showToast(of: .info(title: heading, message: message), at: getToastPosition())
        
    }
    
    @objc private func didTapDialog(_ sender: UIButton) {
        let dialogView = DialogView()
        dialogView.translatesAutoresizingMaskIntoConstraints = false
        dialogView.isUserInteractionEnabled = true
        PowerplayToastKit
            .shared
            .showToast(withCustomView: dialogView, at: .bottom, for: .greatestFiniteMagnitude)
    }
    
    @objc private func didTapBuilder(_ sender: UIButton){
        let themeBuilder = ToastThemeBuilder()
            .set(backgroundColor: UIColor.systemRed.withAlphaComponent(0.78))
            .set(titleTextColor: .black)
            .set(messageTextColor: .black)
            .set(toastCornerRadius: 6)
        
        let toastBuilder = ToastBuilder()
            .set(theme: themeBuilder)
            .set(type: ToastType.info(title: "Info", message: "Here's a Toast with a custom builder"))
            .set(position: .top)
        
        PowerplayToastKit.shared.showToast(withBuilder: toastBuilder)
    }
    
    internal func setSelectedPosition(_ position: Position){
        self.selectedPosition = position
    }
    
    private func getToastPosition() -> ToastPosition {
        guard let position = selectedPosition else { return .top }
        
        switch position {
        case .top:
            return ToastPosition.top
        case .bottom:
            return ToastPosition.bottom
        case .center:
            return ToastPosition.center
        case .custom:
            return ToastPosition.custom { toasView in
                toasView.snp.makeConstraints { make in
                    make.leading.trailing.equalToSuperview().inset(16)
                    make.bottom.equalToSuperview().offset(-300)
                }
            }
        }
    }
}


extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.postions.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch postions[row] {
        case .top:
            return "Top"
        case .bottom:
            return "Bottom"
        case .center:
            return "Center"
        case .custom:
            return "Custom"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.setSelectedPosition(postions[row])
    }
}


