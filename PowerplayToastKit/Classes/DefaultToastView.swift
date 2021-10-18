//
//  DefaultToastView.swift
//  PowerplayToastKit
//
//  Created by Mithilesh Parmar on 18/10/21.
//

import UIKit
import SnapKit

// A base class for Toast View's.
open class ToastView: UIView { }

class DefaultToastView: ToastView {
    
    internal lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        return lbl
    }()
    
    internal lazy var messageLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        return lbl
    }()
    
    internal lazy var leadingImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .center
        iv.clipsToBounds = true
        iv.backgroundColor = .clear
        return iv
    }()
    
    private lazy var centerStackView: UIStackView = {
        let stck = UIStackView()
        stck.translatesAutoresizingMaskIntoConstraints = false
        stck.axis = .vertical
        stck.distribution = .fill
        stck.alignment = .leading
        stck.spacing = 4
        return stck
    }()
    
    private lazy var containerStackView: UIStackView = {
        let stck = UIStackView()
        stck.translatesAutoresizingMaskIntoConstraints = false
        stck.axis = .horizontal
        stck.distribution = .fill
        stck.spacing = 8
        return stck
    }()
    
    
    internal lazy var containerView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews(){
        addSubview(containerView)
        containerView.addSubview(leadingImageView)
        containerView.addSubview(centerStackView)
        
        centerStackView.addArrangedSubviews(views: [titleLabel, messageLabel])
        
    }
    
    internal func constraintLayout(){
        
        containerView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(self.snp.topMargin).offset(16)
            make.bottom.equalTo(self.snp.bottomMargin).offset(-16)
        }
        
        leadingImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.height.width.equalTo(30)
            make.centerY.equalTo(centerStackView.snp.centerY)
        }
        
        centerStackView.snp.makeConstraints { make in
            make.leading.equalTo(leadingImageView.snp.trailing).offset(16)
            make.top.bottom.equalToSuperview().inset(8)
            make.trailing.equalToSuperview().offset(-16)
        }
        
    }
    
}


// Builder method to build the view
extension DefaultToastView {
    
    public func build(with builder: ToastBuildable){
        
        if let type = builder.type {
            switch type {
            case let .success(title, message):
                titleLabel.text = title
                messageLabel.text = message
                break
            case let .warning(title, message):
                titleLabel.text = title
                messageLabel.text = message
                break
            case let .error(title, message):
                titleLabel.text = title
                messageLabel.text = message
                break
            case let .info(title, message):
                titleLabel.text = title
                messageLabel.text = message
                break
            }
            // set the leading image and if no image is specified than set the default image for that type (success, warning, error, info)
            leadingImageView.image = builder.leadingIcon ?? UIImage.init(defaultImageOfType: type)
        }
        
        titleLabel.textColor = builder.theme?.titleTextColor
        titleLabel.font = builder.theme?.titleFont
        
        messageLabel.textColor = builder.theme?.messageTextColor
        messageLabel.font = builder.theme?.messageFont
        
        leadingImageView.contentMode = .scaleAspectFit
        
        containerView.backgroundColor = builder.theme?.backgroundColor
        
        containerView.layer.cornerRadius = builder.theme?.toastCornerRadius ?? 8
        
        // finally constriant the layout
        constraintLayout()
    }
    
}
