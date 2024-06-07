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

// MARK: OCP를 지켜야한다고 생각하여 path, task, method 등을 분리할 수 있겠지만
// MARK: 이건 DIP를 동시에 만족시키기 위해 TargetType을 Protocol로 만든 것 같다.
// MARK: struct로 분리하는게 아닌 Protocol로 묶어 나누기.
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
