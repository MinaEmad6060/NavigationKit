//
//  NavigationManager.swift
//  iOSApp
//
//  Created by Mina Emad on 25/06/2025.
//

import UIKit
import SwiftUI

// MARK: - Navigation-Using-UIkit
extension View {

    public func push(with navigationController: UINavigationController?, animated: Bool = true) {
        guard let navigationController else {
            return
        }
        let hostingController = UIHostingController(rootView: self)
        navigationController.pushViewController(hostingController, animated: animated)
    }
     
    public func present(with navigationController: UINavigationController?, modalPresentationStyle: UIModalPresentationStyle = .fullScreen, animated: Bool = true) {
        guard let navigationController else {
            return
        }
        let hostingController = UIHostingController(rootView: self)
        hostingController.modalPresentationStyle = modalPresentationStyle
        navigationController.present(hostingController, animated: animated)
    }
     
    public func popToRoot(with navigationController: UINavigationController?, animated: Bool = true) {
        guard let navigationController else {
            return
        }
        navigationController.popToRootViewController(animated: true)
    }
    
    public func popToSpecificScreen<Content: View>(with navigationController: UINavigationController?, ofType type: Content.Type, animated: Bool = true) {
        guard let navigationController = navigationController else {
            return
        }
        for viewController in navigationController.viewControllers {
            if let hosting = viewController as? UIHostingController<Content> {
                navigationController.popToViewController(hosting, animated: animated)
                return
            }
        }
    }
    
}
