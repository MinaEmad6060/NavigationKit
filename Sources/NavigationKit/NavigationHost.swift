//
//  NavigationHost.swift
//  NavigationKit
//
//  Created by Shady Ahmed on 15/07/2025.
//


import UIKit
import SwiftUI

public struct NavigationHost<Content: View>: UIViewControllerRepresentable {
    //MARK: - Properties
    private let content: Content
//    private let configureNavigationController: ((UINavigationController) -> Void)?
    
    //MARK: - init
    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    //MARK: - LifeCycle
    public func makeUIViewController(context: Context) -> UINavigationController {
        let navigationController = UINavigationController()
        
        // Apply custom configuration if provided
//        configureNavigationController?(navigationController)
        navigationController.navigationBar.isHidden = true
        
        let rootViewController = UIHostingController(rootView: content.navigationController(navigationController))
        navigationController.viewControllers = [rootViewController]

        
        return navigationController
    }
    
    public func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        // NavigationHost doesn't need updates - it's a stable container
        // Individual view controllers handle their own SwiftUI updates
    }
}
