//
//  APIPaths.swift
//  Flickr-Gallery
//
//  Created by Milan Shah on 9/25/19.
//

import Foundation

enum APIPaths {
    
    struct Photos {
        static let searchService = "/services/rest"
        static let searchMethod = "/?method=flickr.photos.search"
    }
    
    struct Format {
        static let json = "&format=json"
        static let nojsonCallBack = "&nojsoncallback=1"
        static let extraURLs = "&extras=url_s"
    }
}
