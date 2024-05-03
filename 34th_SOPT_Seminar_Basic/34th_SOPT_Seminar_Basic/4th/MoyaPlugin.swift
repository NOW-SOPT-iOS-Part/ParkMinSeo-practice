//
//  MoyaPlugin.swift
//  34th_SOPT_Seminar_Basic
//
//  Created by 박민서 on 4/27/24.
//

import Foundation
import Moya
import os

final class MoyaLoggingPlugin: PluginType {
    
    private static let logger = Logger(
            subsystem: Bundle.main.bundleIdentifier!,
            category: String(describing: MoyaLoggingPlugin.self)
        )
    
    
    func willSend(_ request: any RequestType, target: any TargetType) {
        guard let httpReq = request.request else {
            print("유효하지 않은 요청")
            return
        }
        let url = httpReq.description
        let method = httpReq.httpMethod ?? "메소드 값이 nil"
        var log = "method: \(method)\nurl: \(url)\n"
        log.append("API: \(target)\n")
        
        if let headers = httpReq.allHTTPHeaderFields, !headers.isEmpty {
            log.append("header: \(headers)\n")
        }
        
        if let body = httpReq.httpBody, let bodyString = String(bytes: body, encoding: String.Encoding.utf8) {
            log.append("body: \(bodyString)\n")
        }
        print(log)
    }
    
    


}
