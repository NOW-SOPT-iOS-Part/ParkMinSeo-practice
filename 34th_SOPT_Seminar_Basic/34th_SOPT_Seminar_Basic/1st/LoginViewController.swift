//
//  LoginViewController.swift
//  34th_SOPT_Seminar_Basic
//
//  Created by 박민서 on 3/30/24.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 69, y: 161, width: 236, height: 44))
        
        label.text = "동네라서 가능한 모든것\n당근에서 가까운 이웃과 함께해요"
        label.textColor = .mainText
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = UIFont.pretendard(.bold, size: 18)
        
        return label
    }()
    
    private let idTextField: UITextField = {
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
    
    private let pwTextField: UITextField = {
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
    
    private let loginButton: UIButton = {
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        
        [
            titleLabel,
            idTextField,
            pwTextField,
            loginButton
        ].forEach { self.view.addSubview($0) }
        
    }
    
    @objc func loginButtonDidTap() {
        presentWelcomeVC()
//        pushWelcomeVC()
    }
    
    
    private func presentWelcomeVC() {
        let nextVC = WelcomeViewController()
        nextVC.modalPresentationStyle = .formSheet
//        nextVC.modalTransitionStyle = .partialCurl
        nextVC.id = self.idTextField.text
        self.present(nextVC, animated: true)
    }
    
    private func pushWelcomeVC() {
        let nextVC = WelcomeViewController()
        self.navigationController?.pushViewController(nextVC, animated: false)
    }
    
}

#Preview {
    LoginViewController()
}
