//
//  APIResponse.swift
//  Flickr-Gallery
//
//  Created by Milan Shah on 9/25/19.
//

import Foundation

enum ResponseError: Error {
    case errorInfo(httpStatusCode: Int, description: String)
}
