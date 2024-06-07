//
//  SignUpRequestModel.swift
//  34th_SOPT_Seminar_Basic
//
//  Created by 박민서 on 4/27/24.
//

import Foundation

struct SignUpRequestModel: Encodable {
    let authenticationId: String
    let password: String
    let nickname: String
    let phone: String
}
