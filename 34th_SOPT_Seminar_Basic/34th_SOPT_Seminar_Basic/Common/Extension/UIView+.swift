//
//  UIView+.swift
//  34th_SOPT_Seminar_Basic
//
//  Created by 박민서 on 4/4/24.
//

import UIKit

extension UIView {
    func cornerRounding() {
        self.layer.cornerRadius = 3
        self.clipsToBounds = true
    }
}
