//
//  LoginVC_4th.swift
//  34th_SOPT_Seminar_Basic
//
//  Created by 박민서 on 4/27/24.
//

import Foundation
import UIKit
import SnapKit

final class LoginViewController_4th: UIViewController {
    
    private let rootView = LoginView_4th()
    
    lazy var action = UIAction() { _ in
        self.requestUserInfo(memberId: "11")
    }
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rootView.loginButton.addAction(action, for: .touchUpInside)
//        loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
    }

}

extension LoginViewController_4th {
    private func requestUserInfo(memberId: String) {
        UserService.shared.getUserInfo(memberId: memberId) { response in
            switch response {
                
            case .success(let data):
                guard let data = data as? BaseResponseModel<UserInfoResponseModel> else {
                    print("데이터 타입 캐스팅 에러")
                    return
                }
                
                print("처리 성공 : \(data.data)")
            default:
                print("오류났습니다")
            }
        }
    }
}

#Preview {
    LoginViewController_Delegate_Pattern()
}

