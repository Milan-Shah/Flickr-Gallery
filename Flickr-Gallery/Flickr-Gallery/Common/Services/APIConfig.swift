//
//  APIConfig.swift
//  Flickr-Gallery
//
//  Created by Milan Shah on 9/25/19.
//

import Foundation

import Foundation

enum APIConfigKeys: String {
    
    case API_Protocol
    case API_Host
    case API_KEY
}

class InfoPlist {
    
    static func infoForKey(_ key: String, withDefault: String) -> String {
        return Bundle.main.infoDictionary?[key] as? String ?? withDefault
    }
}

class APIConfig {
    
    func getAPIHost() -> String {
        return InfoPlist.infoForKey(APIConfigKeys.API_Host.rawValue, withDefault: "NO_API_HOST")
    }
    
    func getAPIProtocol() -> String {
        let rawValue = InfoPlist.infoForKey(APIConfigKeys.API_Protocol.rawValue, withDefault: "NO_API_PROTOCOL")
        return rawValue.replacingOccurrences(of: "\\", with: "")
    }
    
    func getEndPoint() -> String {
        return getAPIProtocol() + getAPIHost()
    }
    
    func getAPIKey() -> String {
        return InfoPlist.infoForKey(APIConfigKeys.API_KEY.rawValue, withDefault: "NO_API_KEY")
    }
    
    
    
}
