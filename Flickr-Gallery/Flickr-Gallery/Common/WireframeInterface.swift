//
//  WireframeInterface.swift
//  Flickr-Gallery
//
//  Created by Milan Shah on 9/25/19.
//

import UIKit

/* Viper Template Helper File */
protocol WireframeInterface {
    
    func popFromNavigationController(animated: Bool)
    func dismiss(animated: Bool)
}

class BaseWireframe {
    
    var viewController = UIViewController()
    
    init(view: UIViewController) {
        viewController = view
    }
    
    var navigationController: UINavigationController? {
        return viewController.navigationController
    }
}

extension BaseWireframe: WireframeInterface {
    
    func popFromNavigationController(animated: Bool) {
        let _ = navigationController?.popViewController(animated: animated)
    }
    
    func dismiss(animated: Bool) {
        navigationController?.dismiss(animated: animated)
    }
}

extension UINavigationController {
    
    func pushWireframe(_ wireframe: BaseWireframe, animated: Bool = true) {
        self.pushViewController(wireframe.viewController, animated: animated)
    }
    
    func presentWireframe(_ wireframe: BaseWireframe, animated: Bool = true) {
        let presentingViewController = UINavigationController(rootViewController: wireframe.viewController)
        self.present(presentingViewController, animated: animated)
    }
    
    func setRootWireframe(_ wireframe: BaseWireframe, animated: Bool = true) {
        self.setViewControllers([wireframe.viewController], animated: animated)
    }
}
