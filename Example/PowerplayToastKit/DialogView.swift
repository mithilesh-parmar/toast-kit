//
//  DialogView.swift
//  PowerplayToastKit_Example
//
//  Created by Mithilesh Parmar on 18/10/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit
import PowerplayToastKit

class DialogView : ToastView {
    
    private lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    
    private lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .black
        lbl.font = .systemFont(ofSize: 23, weight: .bold)
        lbl.numberOfLines = 0
        lbl.textAlignment = .center
        lbl.text = "Did you like the article?"
        return lbl
    }()
    
    private lazy var messageLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .black
        lbl.numberOfLines = 0
        lbl.textAlignment = .center
        lbl.text = "Hit the clap button!!"
        return lbl
    }()
    
    private lazy var primaryButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 8
        btn.layer.masksToBounds = false
        btn.setTitle("Okay Got it", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .systemBlue
        btn.dropShadow(of: .black)
        return btn
    }()
    
    private lazy var bottomStackView: UIStackView = {
        let stck = UIStackView()
        stck.translatesAutoresizingMaskIntoConstraints = false
        stck.axis = .vertical
        stck.alignment = .fill
        stck.distribution = .fillEqually
        stck.isUserInteractionEnabled = true
        stck.spacing = 8
        return stck
    }()
    
    private lazy var containerView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .infoToastSecondaryColor
        v.isUserInteractionEnabled = true
        return v
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        constraintLayout()
        addTargets()
        
        imageView.image = UIImage(named: "claps.png")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews(){
        self.containerView.layer.cornerRadius = 6
        
        self.containerView.dropShadow(of: .black)
        
        addSubview(containerView)
        
        containerView.addSubview(imageView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(messageLabel)
        containerView.addSubview(bottomStackView)
        
        bottomStackView.addArrangedSubview(primaryButton)
    }
    
    private func constraintLayout(){
        
        containerView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview().inset(2)
            make.bottom.equalTo(self.snp.bottomMargin).offset(-16)
        }
        
        imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(24)
            
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(imageView.snp.bottom).offset(24)
        }
        
        messageLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.greaterThanOrEqualTo(titleLabel.snp.bottom).offset(16)
            make.bottom.equalTo(bottomStackView.snp.top).offset(-16)
        }
        
        primaryButton.snp.makeConstraints { make in
            make.height.greaterThanOrEqualTo(45)
        }
        
        bottomStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().offset(-16)
        }
    }
    
    private func addTargets(){
        primaryButton.addTarget(self, action: #selector(didTapPrimaryButton(_:)), for: .touchUpInside)
    }
    
    @objc private func didTapPrimaryButton(_ sender: UIButton){
        PowerplayToastKit.shared.hideToast()
    }
    
}



extension UIView {
    public func dropShadow(of color: UIColor){
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = .zero
        layer.shadowRadius = 1
    }
}
