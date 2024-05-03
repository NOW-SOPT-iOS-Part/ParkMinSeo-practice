//
//  UserService.swift
//  34th_SOPT_Seminar_Basic
//
//  Created by 박민서 on 4/27/24.
//

import Foundation
import Moya

final class UserService {
    static let shared = UserService()
    private init() {}
    private var userProvider = MoyaProvider<UserTargetType>(plugins: [MoyaLoggingPlugin()])
    
}

extension UserService {
    public func judgeStatus<T: Codable> (by statusCode: Int, _ data: Data,
                                         _ object: T.Type) -> NetworkResult<Any> {
        switch statusCode {
        case 200..<205:
            return isValidData(data: data, T.self)
        case 400..<500:
            return .requestErr
        case 500:
            return .serverErr 
        default:
            return .networkFail
        }
    }


    private func isValidData<T: Codable>(data: Data, _ object: T.Type) ->
    NetworkResult<Any> {
        let decoder = JSONDecoder ()
        guard let decodedData = try? decoder.decode (T.self, from: data)
        else {
            print("\(self)에서 디코딩 오류가 발생했습니다")
            return .pathErr }
        return .success (decodedData as Any)
    }
}

extension UserService {
    func getUserInfo(memberId: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        userProvider.request(.getUserInfo(memberId: memberId)) { result in
            switch result {
                
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data
                
                let networkResult = self.judgeStatus(by: statusCode, data, BaseResponseModel<UserInfoResponseModel>.self)
                completion(networkResult)
            case .failure(_):
                completion(.networkFail)
            }
        }
    }
    
    func signUp(signUpModel: SignUpRequestModel, completion: @escaping (NetworkResult<Any>) -> Void) {
        userProvider.request(.signUp(request: signUpModel)) { result in
            print("응답 결과 : \(result)")
        }
    }
    
}
