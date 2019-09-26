//
//  PhotoFeedInteractor.swift
//  Flickr-Gallery
//
//  Created by Milan Shah on 9/25/19.
//

import Foundation
import UIKit

final class PhotoFeedInteractor {
    var presenter: PhotoFeedPresenter!
}

// MARK: - Extensions -

extension PhotoFeedInteractor: PhotoFeedInteractorInterface {
    
    func fetchImageFromURL(url: String, imageView: UIImageView) {
        APIManager.imageRequest(imageUrl: url) { (result) in
            guard let data = result.data, let imageData = UIImage(data: data) else {
                return
            }
            
            // Adding the returned image asynchronously
            DispatchQueue.main.async {
                imageView.image = imageData
            }
        }
    }
    
    
    func fetch(_ query: String, for page: Int) {
        fetchFlickrPhotosRequest(for: query, pageNumber: page) { (result) in
            switch result {
            case .success(let photos):
                self.presenter.retreivedPhotos(photos)
            case .failure(.errorInfo(let httpStatusCode, let description)):
                print("Something went wrong while fetching the query response: HTTP Status Code: \(httpStatusCode), Description: \(description)")
                self.presenter.fetchingPhotosFailed()
            }
        }
    }
    
}


extension PhotoFeedInteractor {
    
    func fetchFlickrPhotosRequest(for query: String, pageNumber: Int, completion: @escaping (Result<Photos, ResponseError>) -> Void) {
        
        var searchQueryPath = APIPaths.Photos.searchService
        searchQueryPath.append(APIPaths.Photos.searchMethod)
        
        let apiKey = String(format: "&api_key=%@", APIConfig().getAPIKey())
        searchQueryPath.append(apiKey)
        
        let queryText = String(format: "&text=%@", query.replacingOccurrences(of: " ", with: "%20"))
        searchQueryPath.append(queryText)
        
        let pageParameter = String(format: "&page=%i", pageNumber)
        searchQueryPath.append(pageParameter)
        
        searchQueryPath.append(APIPaths.Format.json)
        searchQueryPath.append(APIPaths.Format.nojsonCallBack)
        searchQueryPath.append(APIPaths.Format.extraURLs)
        APIManager.request(path: searchQueryPath, requestType: .get, requiredRequestHeaders: [:], parameters: nil, completion:completion)
        
    }
}

