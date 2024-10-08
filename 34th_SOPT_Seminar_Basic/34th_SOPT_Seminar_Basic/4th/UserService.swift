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
            // MARK: Data의 전달은 제네릭 타입으로 추상화시켜 DIP 원칙을 지키고 있다.
            // MARK: 하지만 결국 사용하는 입장에서는 judgeStatus라는 함수 이름으로 Network 결과값까지 받게 되는 것인데
            // MARK: 이는 SIP에 어긋난다고 보인다.
            // MARK: + isValidData()는 코드를 잘라 함수로 만든 것에 해당되므로,OCP를 완벽히 따라간다고 보기는 어렵다.
            return isValidData(data: data, T.self)
        case 400..<500:
            return .requestErr
        case 500:
            return .serverErr 
        default:
            return .networkFail
        }
    }


    // MARK: SIP 원칙에 맞지 않아보인다 + ISP
    // MARK: Success만 반환하고, 데이터는 따로 반환하는 함수로 분리해야할 것 같다.
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
