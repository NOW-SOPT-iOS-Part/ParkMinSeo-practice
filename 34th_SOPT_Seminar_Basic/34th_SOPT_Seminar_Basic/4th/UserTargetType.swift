//
//  UserTargetType.swift
//  34th_SOPT_Seminar_Basic
//
//  Created by 박민서 on 4/27/24.
//

import Moya
import Foundation

enum UserTargetType {
    case getUserInfo(memberId: String)
    case signUp(request: SignUpRequestModel)
}

extension UserTargetType: TargetType {
    var baseURL: URL {
        return URL(string: Config.baseURL)!
    }
    
    var path: String {
        switch self {
            
        case .getUserInfo:
            return "/member/info"
        case .signUp:
            return "/member/join"
        }
    }
    
    var method: Moya.Method {
        switch self {
            
        case .getUserInfo(memberId: let memberId):
                .get
        case .signUp(request: let request):
                .post
        }
    }
    
    var task: Moya.Task {
        switch self {
            
        case .getUserInfo:
                .requestPlain
        case .signUp(request: let request):
                .requestJSONEncodable(request)
        }
    }
    
    var headers: [String : String]? {
        switch self {
            
        case .getUserInfo(memberId: let memberId):
            return ["Content-Type": "application/json",
                    "memberId": memberId]
        case .signUp(request: let request):
            return ["Content-Type": "application/json"]
        }
    }
    
    
}
