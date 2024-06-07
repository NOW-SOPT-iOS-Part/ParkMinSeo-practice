//
//  LoginView_4th.swift
//  34th_SOPT_Seminar_Basic
//
//  Created by 박민서 on 4/27/24.
//

import Foundation
import UIKit

final class LoginView_4th: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 69, y: 161, width: 236, height: 44))
        
        label.text = "동네라서 가능한 모든것\n당근에서 가까운 이웃과 함께해요"
        label.textColor = .mainText
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = UIFont.pretendard(.bold, size: 18)
        
        return label
    }()
    
    let idTextField: UITextField = {
       let textField = UITextField(frame: CGRect(x: 20, y: 276, width: 335, height: 52))
        
        let placeholder = NSAttributedString(
            string: "아이디",
            attributes: [
                .font : UIFont.pretendard(.semibold, size: 14),
                .foregroundColor : UIColor.subText
              ])
        
        textField.backgroundColor = .subColor1
        textField.attributedPlaceholder = placeholder
        textField.cornerRounding()
        textField.setLeftPadding(23)
        textField.setRightPadding(23)
        
        return textField
    }()
    
    let pwTextField: UITextField = {
       let textField = UITextField(frame: CGRect(x: 20, y: 335, width: 335, height: 52))
        
        let placeholder = NSAttributedString(
            string: "비밀번호",
            attributes: [
                .font : UIFont.pretendard(.semibold, size: 14),
                .foregroundColor : UIColor.subText
              ])
        
        textField.backgroundColor = .subColor1
        textField.attributedPlaceholder = placeholder
        textField.cornerRounding()
        textField.setLeftPadding(23)
        textField.setRightPadding(23)
        
        return textField
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 422, width: 335, height: 58))
                
        let attrTitle = NSAttributedString(
            string: "로그인하기",
            attributes: [
                .font : UIFont.pretendard(.bold, size: 18),
                .foregroundColor : UIColor.white
              ])
        
        button.setAttributedTitle(attrTitle, for: .normal)
        button.backgroundColor = .primary
        button.cornerRounding()
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        [
            titleLabel,
            idTextField,
            pwTextField,
            loginButton
        ].forEach { [weak self] view in
            guard let self else {return}
            self.addSubview(view)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(114)
            $0.centerX.equalToSuperview()
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(self.titleLabel.snp.bottom).offset(71)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(335)
            $0.height.equalTo(52)
        }
        
        pwTextField.snp.makeConstraints {
            $0.top.equalTo(self.idTextField.snp.bottom).offset(7)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(335)
            $0.height.equalTo(52)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(self.pwTextField.snp.bottom).offset(35)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(335)
            $0.height.equalTo(58)
        }
    }
}
