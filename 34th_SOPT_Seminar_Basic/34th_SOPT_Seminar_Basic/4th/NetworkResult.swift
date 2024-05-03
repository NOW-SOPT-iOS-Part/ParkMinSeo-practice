//
//  NetworkResult.swift
//  34th_SOPT_Seminar_Basic
//
//  Created by 박민서 on 4/27/24.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr
    case decodeErr
    case pathErr
    case serverErr
    case networkFail
}
