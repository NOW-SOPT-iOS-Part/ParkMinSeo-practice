//
//  LoginViewController_DelegatePattern.swift
//  34th_SOPT_Seminar_Basic
//
//  Created by 박민서 on 4/6/24.
//

import Foundation
import UIKit
import SnapKit

class LoginViewController_Delegate_Pattern: UIViewController {
    
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
        self.setLayout()
        
        loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        
        
        
    }
    
    private func setLayout() {
        [
            titleLabel,
            idTextField,
            pwTextField,
            loginButton
        ].forEach { [weak self] view in
            guard let self else {return}
            view.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(view)
        }
        
//        NSLayoutConstraint.activate([
//            titleLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 114),
//            titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
////            titleLabel.widthAnchor.constraint(equalToConstant: 20),
////            titleLabel.heightAnchor.constraint(equalToConstant: 20)
//            
//        ])
        
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
        
        
//        NSLayoutConstraint.activate([
//            idTextField.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 71),
//            idTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//            idTextField.widthAnchor.constraint(equalToConstant: 335),
//            idTextField.heightAnchor.constraint(equalToConstant: 52)
//        ])
//        
//        NSLayoutConstraint.activate([
//            pwTextField.topAnchor.constraint(equalTo: self.idTextField.bottomAnchor, constant: 7),
//            pwTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//            pwTextField.widthAnchor.constraint(equalToConstant: 335),
//            pwTextField.heightAnchor.constraint(equalToConstant: 52)
//        ])
//        
//        NSLayoutConstraint.activate([
//            loginButton.topAnchor.constraint(equalTo: self.pwTextField.bottomAnchor, constant: 35),
//            loginButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//            loginButton.widthAnchor.constraint(equalToConstant: 335),
//            loginButton.heightAnchor.constraint(equalToConstant: 58)
//        ])
                
    }
    
    @objc func loginButtonDidTap() {
        presentWelcomeVC()
//        pushWelcomeVC()
    }
    
    
    private func presentWelcomeVC() {
        let nextVC = WelcomeViewController_Delegate_Pattern()
        nextVC.modalPresentationStyle = .formSheet
//        nextVC.modalTransitionStyle = .partialCurl
//        nextVC.delegate = self
        nextVC.id = self.idTextField.text
        self.present(nextVC, animated: true)
    }
    
    private func pushWelcomeVC() {
        let nextVC = WelcomeViewController_Delegate_Pattern()
        nextVC.completionHandler = { [weak self] id in
            guard let self else { return }
            self.idTextField.text = "\(id)에서 어떤걸로 할꺼얌?"
        }
        self.navigationController?.pushViewController(nextVC, animated: false)
    }
    
}

//extension LoginViewController_Delegate_Pattern: DataBindingProtocol {
//    func dataBind(id: String?) {
//        self.idTextField.text = "\(id)"
//    }
//}


#Preview {
    LoginViewController_Delegate_Pattern()
}
