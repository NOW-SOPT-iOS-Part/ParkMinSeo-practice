//
//  ScrollviewController.swift
//  34th_SOPT_Seminar_Basic
//
//  Created by 박민서 on 4/6/24.
//

import Foundation
import UIKit
import SnapKit

final class ScrollviewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private var contentView = UIView()
    
    private let redView = UIView()
    private let orangeView = UIView()
    private let yellowView = UIView()
    private let greenView = UIView()
    private let blueView = UIView()
    private let purpleView = UIView()
    
    private lazy var viewList: [(UIView, UIColor)] = [
        (redView, .red),
        (orangeView, .orange), 
        (yellowView, .yellow),
        (greenView, .green),
        (blueView, .blue),
        (purpleView, .purple)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setColor()
        self.setLayout()
    }
    
    private func setColor() {
        viewList.forEach { $0.backgroundColor = $1 }
    }
    
    private func setLayout() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        viewList.forEach {
            contentView.addSubview($0.0)
        }

        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.width.equalTo(scrollView)
            make.height.greaterThanOrEqualToSuperview().priority(.low) // contentView의 height가 scrollView의 height보다 크거나 같도록 설정합니다. 우선순위는 낮습니다.
        }
        
        redView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalTo(self.view.snp.centerX)
            $0.height.equalTo(337)
        }
        
        yellowView.snp.makeConstraints {
            $0.top.equalTo(self.redView.snp.bottom)
            $0.left.equalToSuperview()
            $0.right.equalTo(self.view.snp.centerX)
            $0.height.equalTo(337)
        }
        
        blueView.snp.makeConstraints {
            $0.top.equalTo(self.yellowView.snp.bottom)
            $0.left.equalToSuperview()
            $0.right.equalTo(self.view.snp.centerX)
            $0.height.equalTo(337)
            $0.bottom.equalToSuperview()
        }
        
        orangeView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.right.equalToSuperview()
            $0.left.equalTo(self.view.snp.centerX)
            $0.height.equalTo(337)
        }
        
        greenView.snp.makeConstraints {
            $0.top.equalTo(self.orangeView.snp.bottom)
            $0.right.equalToSuperview()
            $0.left.equalTo(self.view.snp.centerX)
            $0.height.equalTo(337)
        }
        
        purpleView.snp.makeConstraints {
            $0.top.equalTo(self.greenView.snp.bottom)
            $0.right.equalToSuperview()
            $0.left.equalTo(self.view.snp.centerX)
            $0.height.equalTo(337)
            $0.bottom.equalToSuperview()
        }
    }
}

#Preview {
    ScrollviewController()
}
