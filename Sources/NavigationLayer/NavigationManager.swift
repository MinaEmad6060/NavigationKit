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

    func push(with navigationController: UINavigationController?, animated: Bool = true) {
        guard let navigationController else {
            return
        }
        let hostingController = UIHostingController(rootView: self)
        navigationController.pushViewController(hostingController, animated: animated)
    }
     
    func present(with navigationController: UINavigationController?, modalPresentationStyle: UIModalPresentationStyle = .fullScreen, animated: Bool = true) {
        guard let navigationController else {
            return
        }
        let hostingController = UIHostingController(rootView: self)
        hostingController.modalPresentationStyle = modalPresentationStyle
        navigationController.present(hostingController, animated: animated)
    }
     
    func popToRoot(with navigationController: UINavigationController?, animated: Bool = true) {
        guard let navigationController else {
            return
        }
        navigationController.popToRootViewController(animated: true)
    }
    
}
