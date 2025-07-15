//
//  NavigationController+Extensions.swift
//  NavigationKit
//
//  Created by Shady Ahmed on 15/07/2025.
//

import UIKit
import SwiftUI

public extension UINavigationController {
    /// Push a SwiftUI view wrapped in UIHostingController
    func push<Content: View>(_ view: Content, animated: Bool = true) {
        let hostingController = UIHostingController(rootView: view.navigationController(self))
        pushViewController(hostingController, animated: animated)
    }
    
    /// Present a SwiftUI view wrapped in UIHostingController
    func present<Content: View>(_ view: Content, presentationStyle: UIModalPresentationStyle, animated: Bool = true, completion: (() -> Void)? = nil) {
        let hostingController = UIHostingController(rootView: view.navigationController(self))
        hostingController.modalPresentationStyle = presentationStyle
        present(hostingController, animated: animated, completion: completion)
    }
    
    /// Present a SwiftUI view wrapped in UIHostingController with navigation
    func presentWithNavigation<Content: View>(_ view: Content, presentationStyle: UIModalPresentationStyle, animated: Bool = true, completion: (() -> Void)? = nil) {
        let hostingController = UIHostingController(rootView: view.navigationController(self))
        hostingController.modalPresentationStyle = presentationStyle
        let navigationController = UINavigationController(rootViewController: hostingController)
        present(navigationController, animated: animated, completion: completion)
    }
    
    /// Set root view controllers with SwiftUI view
    func setRoot<Content: View>(_ view: Content, animated: Bool = true) {
        let hostingController = UIHostingController(rootView: view.navigationController(self))
        setViewControllers([hostingController], animated: animated)
    }
    
    /// Check if can pop (has more than one view controller)
    var canPop: Bool {
        return viewControllers.count > 1
    }
    
    func popToRoot(animated: Bool = true) {
        self.popToRootViewController(animated: animated)
    }
    
    /// Pop to specific screen of given view type - uses simple type name matching
    func popToSpecificScreen<Content: View>(ofType type: Content.Type, animated: Bool = true) -> Bool {
        let targetTypeName = String(describing: type)
        
        // Search through navigation stack in reverse order (most recent first)
        for viewController in self.viewControllers.reversed() {
            let controllerTypeName = String(describing: Swift.type(of: viewController))
            
            // Simple check: if the controller type name contains our target type name
            if controllerTypeName.contains(targetTypeName) {
                self.popToViewController(viewController, animated: animated)
                return true
            }
        }
        
        return false
    }
}
