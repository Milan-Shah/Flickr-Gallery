//
//  APIManager.swift
//  Flickr-Gallery
//
//  Created by Milan Shah on 9/25/19.
//

import Foundation
import Alamofire

class APIManager {
    
    static fileprivate func buildRequest(urlString: String, method: HTTPMethod) -> URLRequest {
        
        guard let url = URL(string: urlString),
            var request = try? URLRequest(url: url, method: method) else {
                fatalError("Invalid URL")
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-type")
        request.timeoutInterval = 10
        return request
        
    }
    
    /* Generic AF request with my own Response Error Handler.*/
    @discardableResult
    static func request<T: Decodable>(path: String, requestType: HTTPMethod, requiredRequestHeaders: [String: String], parameters: [String: Any]?, completion:@escaping (Result<T, ResponseError>) -> Void) -> DataRequest {
        
        let urlString = String(format: "%@%@", APIConfig().getEndPoint(), path)
        var request = buildRequest(urlString: urlString, method: requestType)
        let jsonData: Data?
        
        for (key, value) in requiredRequestHeaders {
            request.addValue(value, forHTTPHeaderField: key)
        }
        
        if let json = parameters, requestType != .get {
            jsonData = try? JSONSerialization.data(withJSONObject: json)
            request.httpBody = jsonData
        }
        
        let decoder: JSONDecoder = JSONDecoder().self
        return AF.request(request).responseDecodable (decoder: decoder) { (response: DataResponse<T>) in
            
            switch response.result {
            case .success(let result):
                completion(.success(result))
            case .failure:
                print("Error: %@", response.error ?? "Unknown Error")
                let httpStatusCode = response.error?.asAFError?.responseCode ?? 500 //Default
                let description = response.error?.localizedDescription ?? "Unknown Error"
                completion(.failure(.errorInfo(httpStatusCode: httpStatusCode, description: description)))
            }
            
            }.validate()
    }
    
    @discardableResult
    /* AF request to fetch images from url.*/
    static func imageRequest(imageUrl: String, completion:@escaping (DataResponse<Data?>) -> Void) -> DataRequest {
        return AF.request(imageUrl).response(completionHandler: completion)
    }
}

