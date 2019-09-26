//
//  PhotosModel.swift
//  Flickr-Gallery
//
//  Created by Milan Shah on 9/25/19.
//

import Foundation

struct Photos: Codable {
    let photos: Model
}

struct Model: Codable {
    let page: Int
    let pages: Int
    let perpage: Int
    let total: String
    let photo: [Photo]
}

struct Photo: Codable {
    let height_s: Int?
    let width_s: Int?
    let url_s: String?
    let title: String?
}
