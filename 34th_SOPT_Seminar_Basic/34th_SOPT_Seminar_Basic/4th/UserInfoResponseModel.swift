//
//  UserInfoResponseModel.swift
//  34th_SOPT_Seminar_Basic
//
//  Created by 박민서 on 4/27/24.
//

import Foundation

struct UserInfoResponseModel: Codable {
    let authenticationId: String
    let nickname: String
    let phone: String
}
