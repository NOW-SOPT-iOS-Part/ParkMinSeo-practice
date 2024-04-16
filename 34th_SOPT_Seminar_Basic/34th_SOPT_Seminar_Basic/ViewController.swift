//
//  ViewController.swift
//  34th_SOPT_Seminar_Basic
//
//  Created by 박민서 on 3/30/24.
//

import UIKit
import SnapKit
import Then

class ViewController: UIViewController {
    
    let exampleButton = UIButton()
    let exampleButton2 = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
        setUpStyle()
        setUpLayout()
        setUpConstraint()
        
    }
    
    private func setUpView() {
        self.view.backgroundColor = .systemGray4

        exampleButton.addTarget(self, action: #selector(tapBtn), for: .touchUpInside)
        exampleButton.addAction(tapBtnAction, for: .touchUpInside)
        
        exampleButton.addAction(extraAction, for: .touchUpInside)
        exampleButton2.addAction(extraAction, for: .touchUpInside)
    }
    
    private func setUpStyle() {
        exampleButton.do {
            $0.setTitle("Hello", for: .normal)
            $0.backgroundColor = .systemOrange
            $0.layer.cornerRadius = 10
            $0.clipsToBounds = true
        }
        
        exampleButton2.do {
            $0.setTitle("World", for: .normal)
            $0.backgroundColor = .systemOrange
            $0.layer.cornerRadius = 10
            $0.clipsToBounds = true
        }
    }
    
    private func setUpLayout() {
        [
            exampleButton,
            exampleButton2
        ].forEach { self.view.addSubview($0) }
    }
    
    private func setUpConstraint() {
        exampleButton.snp.makeConstraints {
            $0.size.equalTo(100)
            $0.center.equalToSuperview().offset(-100)
        }
        
        exampleButton2.snp.makeConstraints {
            $0.size.equalTo(100)
            $0.top.equalTo(exampleButton.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
        }
    }
    
    @objc func tapBtn() {
        print("세상아1")
    }
    
    let tapBtnAction = UIAction { _ in
        print("세상아2")
    }
    
    lazy var extraAction = UIAction { [weak self] action in
        // sender를 UIButton으로 타입캐스팅 -> exampleButton이 맞는지 확인!
        print(action.sender as? UIButton == self?.exampleButton)
        
        // sender를 UIButton으로 타입캐스팅 -> 종류에 따라 Switch 처리!
        switch action.sender as? UIButton {
            
        case self?.exampleButton:
            print("세상아1")
        case self?.exampleButton2:
            print("안녕")
        default:
            print("어라라?")
        }
    }
}

