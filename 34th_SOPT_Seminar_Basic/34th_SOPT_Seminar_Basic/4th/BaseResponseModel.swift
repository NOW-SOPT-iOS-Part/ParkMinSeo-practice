//
//  BaseResponseModel.swift
//  34th_SOPT_Seminar_Basic
//
//  Created by 박민서 on 4/27/24.
//

import Foundation

struct BaseResponseModel<T: Codable>: Codable {
    let code: Int
    let message: String
    let data: T?
}
