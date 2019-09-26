//
//  PhotoFeedWireframe.swift
//  Flickr-Gallery
//
//  Created by Milan Shah on 9/25/19.
//

import UIKit

final class PhotoFeedWireframe: BaseWireframe {
    
    // MARK: - Module setup -
    
    init() {
        let moduleViewController = PhotoFeedViewController()
        super.init(view: moduleViewController)
        
        let interactor = PhotoFeedInteractor()
        let presenter = PhotoFeedPresenter(wireframe: self, view: moduleViewController, interactor: interactor)
        moduleViewController.presenter = presenter
        interactor.presenter = presenter
    }
    
}

// MARK: - Extensions -

extension PhotoFeedWireframe: PhotoFeedWireframeInterface {
    
    func navigate(to option: PhotoFeedNavigationOption) {
    }
}
