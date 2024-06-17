//
//  API.swift
//  Project
//
//  Created by won soohyeon on 12/18/23.
//

import Moya
import CombineMoya
import Foundation

enum API {
    case login
}

extension API: TargetType {
    var baseURL: URL {
        return URL(string: Server.real.domain())!
    }
    
    var path: String {
        switch self {
        case .login:
            return "/login"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .login:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .login:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
}
