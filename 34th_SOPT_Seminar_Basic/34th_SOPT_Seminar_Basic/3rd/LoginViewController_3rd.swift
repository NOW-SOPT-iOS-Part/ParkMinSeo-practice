//
//  LoginViewController.swift
//  34th_SOPT_Seminar_Basic
//
//  Created by 박민서 on 4/20/24.
//

import Foundation
import UIKit
import SnapKit

final class LoginViewController_3rd: UIViewController {
    
    private let rootView = LoginView()
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
    }
    
    @objc func loginButtonDidTap() {
//        presentWelcomeVC()
//        pushWelcomeVC()
    }
    
    
//    private func presentWelcomeVC() {
//        let nextVC = WelcomeViewController_Delegate_Pattern()
//        nextVC.modalPresentationStyle = .formSheet
////        nextVC.modalTransitionStyle = .partialCurl
////        nextVC.delegate = self
//        nextVC.id = self.idTextField.text
//        self.present(nextVC, animated: true)
//    }
//    
//    private func pushWelcomeVC() {
//        let nextVC = WelcomeViewController_Delegate_Pattern()
//        nextVC.completionHandler = { [weak self] id in
//            guard let self else { return }
//            self.idTextField.text = "\(id)에서 어떤걸로 할꺼얌?"
//        }
//        self.navigationController?.pushViewController(nextVC, animated: false)
//    }
    
}

#Preview {
    LoginViewController_Delegate_Pattern()
}

