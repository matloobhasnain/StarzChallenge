//
//  NetworkLayer.swift
//  
//
//  Created by Matloob on 7/20/20.
//  Copyright © 2020 Matloob. All rights reserved.
//

import UIKit

import Foundation
import Moya


// used as global "needs to be enhaced"
let appNetworkProvider = MoyaProvider<AppNetwork>()
let apikey = "3d0cda4466f269e793e9283f6ce0b75e"

enum AppNetwork {
    case tvshow(tv_id: String, apiKey: String)
    case season(tv_id: String, season_id: String)
    case episode
}

extension AppNetwork: TargetType {
    
    
    public var headers: [String : String]? {
        return nil
    }
    
    

    var baseURL: URL {
        switch APIConstants.applicationMode {
        case .production:
            return URL(string: "https://api.themoviedb.org/3/")!
        case .qa:
            return URL(string: "https://api.themoviedb.org/3/")!
        case .development:
            return URL(string: "https://api.themoviedb.org/3/")!
        }
    }
    
    // dermine resource path for each end point in 'AppNetwork' enum with Base Url
    var path: String {
        switch self {
        case let .tvshow(tv_id , _):
            return "tv/\(tv_id)"
        case  let.season(tv_id , season_id):
            return "tv/\(tv_id)/season/\(season_id)"
        case .episode:
            return ""
        }
    }
    
    // detrmine HTTP method "GET, POST, PUT .. etc"
    var method: Moya.Method {
        switch self {
            case .tvshow:
            return .get
            case .season:
            return .get
            case .episode:
            return .get
        }
    }
    
    

    var parameters: [String: Any]? {
        switch self {
        case .tvshow, .season, .episode:
            return nil
        }
    }
    
   
    var parameterEncoding: ParameterEncoding {
        switch self {
        case .tvshow:
            return JSONEncoding.default
        case .season:
            return JSONEncoding.default
        case .episode:
            return JSONEncoding.default
        }
    }

    var task: Task {
        switch self {
        case .tvshow(_ , _),.season(_ , _):
            return .requestParameters(parameters: ["api_key":apikey], encoding: URLEncoding.default)
        case .episode:
            return .requestPlain
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    
    
}

class APIConstants: NSObject {

enum type {
    case development
    case qa
    case production
    }
    
    /// Change application running mode type here
    static let applicationMode: APIConstants.type = .development

}

extension String {
    var urlEscaped: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
}
