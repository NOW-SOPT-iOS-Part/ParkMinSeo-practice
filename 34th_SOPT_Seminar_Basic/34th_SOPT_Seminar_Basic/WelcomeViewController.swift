//
//  WelcomViewController.swift
//  34th_SOPT_Seminar_Basic
//
//  Created by 박민서 on 3/30/24.
//

import Foundation
import UIKit

class WelcomeViewController: UIViewController {
    
    public var id: String?
    
    private let welcomeImageView: UIImageView = {
        let imageView = UIImageView(frame: .init(x: 112, y: 87, width: 150, height: 150))
        
        imageView.image = UIImage(named: "ic_carroty")
        imageView.tintColor = .orange
        
        return imageView
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel(frame: .init(x: 140, y: 295, width: 95, height: 60))
        
        label.text = "???님\n반가워요!"
        label.numberOfLines = 2
        label.textAlignment = .center
        label.textColor = .mainText
        label.font = .pretendard(.extrabold, size: 25)
        
        return label
    }()
    
    private let goMainButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 426, width: 335, height: 58))
        
        let attrTitle = NSAttributedString(
            string: "메인으로",
            attributes: [
                .font : UIFont.pretendard(.bold, size: 18),
                .foregroundColor : UIColor.white
              ])
        
        button.setAttributedTitle(attrTitle, for: .normal)
        button.backgroundColor = .primary
        button.cornerRounding()
        
        return button
    }()
    
    private let retryLoginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 498, width: 335, height: 58))
        
        let attrTitle = NSAttributedString(
            string: "다시 로그인",
            attributes: [
                .font : UIFont.pretendard(.bold, size: 18),
                .foregroundColor : UIColor.subText
              ])
        
        button.setAttributedTitle(attrTitle, for: .normal)
        button.backgroundColor = .systemGray5
        button.cornerRounding()
        
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
//        self.navigationController?.navigationBar.isHidden = true
        
        retryLoginButton.addTarget(self, action: #selector(retryLoginButtonDidTap), for: .touchUpInside)
        bindID()
        
        [
            welcomeImageView,
            welcomeLabel,
            goMainButton,
            retryLoginButton
        ].forEach{ self.view.addSubview($0) }
    }
    
    @objc
    func retryLoginButtonDidTap() {
        if self.navigationController == nil {
            self.dismiss(animated: true)
        }
        else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func bindID() {
//        guard let idText = id else { return }
        if let idText = id {
            self.welcomeLabel.text = "\(idText)님\n반가워요!"
        }
        else {
            self.welcomeLabel.text = "???님\n반가워요!"
        }
    }
}

#Preview {
    WelcomeViewController()
}
