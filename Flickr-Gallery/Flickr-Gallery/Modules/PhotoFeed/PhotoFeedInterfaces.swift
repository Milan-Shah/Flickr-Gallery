//
//  PhotoFeedInterfaces.swift
//  Flickr-Gallery
//
//  Created by Milan Shah on 9/25/19.
//

import UIKit

enum PhotoFeedNavigationOption {
}

protocol PhotoFeedWireframeInterface: WireframeInterface {
    func navigate(to option: PhotoFeedNavigationOption)
}

protocol PhotoFeedViewInterface: ViewInterface {
    func fetchedPhotosSuccessfully(_ result: Photos)
    func showFailureError()
}

protocol PhotoFeedPresenterInterface: PresenterInterface {
    func fetchPhotos(for query: String, pageNumber: Int)
    func retreivedPhotos(_ photos: Photos)
    func fetchingPhotosFailed()
    
    func fetchImage(_ url: String, for imageView: UIImageView)
}

protocol PhotoFeedInteractorInterface: InteractorInterface {
    func fetch(_ query: String, for page: Int)
    func fetchImageFromURL(url: String, imageView: UIImageView)
}
