//
//  PhotoFeedPresenter.swift
//  Flickr-Gallery
//
//  Created by Milan Shah on 9/25/19.
//

import UIKit

final class PhotoFeedPresenter {
    
    // MARK: - Private properties -
    
    private let wireframeInterface: PhotoFeedWireframeInterface
    private let viewInterface: PhotoFeedViewInterface
    private let interactorInterface: PhotoFeedInteractorInterface
    
    // MARK: - Lifecycle -
    
    init(wireframe: PhotoFeedWireframeInterface, view: PhotoFeedViewInterface, interactor: PhotoFeedInteractorInterface) {
        wireframeInterface = wireframe
        viewInterface = view
        interactorInterface = interactor
    }
}

// MARK: - Extensions -

extension PhotoFeedPresenter: PhotoFeedPresenterInterface {
    
    func fetchImage(_ url: String, for imageView: UIImageView) {
        interactorInterface.fetchImageFromURL(url: url, imageView: imageView)
    }
    
    func fetchPhotos(for query: String, pageNumber: Int) {
        interactorInterface.fetch(query, for: pageNumber)
    }
    
    func retreivedPhotos(_ photos: Photos) {
        viewInterface.fetchedPhotosSuccessfully(photos)
    }
    
    func fetchingPhotosFailed() {
        viewInterface.showFailureError()
    }
    
}
