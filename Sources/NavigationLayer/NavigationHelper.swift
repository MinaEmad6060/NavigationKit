//
//  NavigationHelper.swift
//  iOSApp
//
//  Created by Mina Emad on 25/06/2025.
//

import SwiftUI

//MARK: - Wrapped-MainViews-With-UINavigationController
//MARK: - Wrapped-TabBar
public struct MainTabBarView<Content: View>: UIViewControllerRepresentable {
    //MARK: - Properties
    private let mainTabsView: Content
    
    //MARK: - Initializer
    public init(mainTabsView: Content) {
        self.mainTabsView = mainTabsView
    }
    
    //MARK: - Overrided-Functions
    public func makeUIViewController(context: Context) -> UINavigationController {
        let navigationController = UINavigationController()
        let mainTabsViewController = UIHostingController(rootView: mainTabsView.navigationController(navigationController))
        navigationController.viewControllers = [mainTabsViewController]
        navigationController.navigationBar.isHidden = true
        return navigationController
    }
    
    public func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        // No update logic needed for now
    }
}

//MARK: - Wrapped-LoginScreen
public struct LoginNavigationView<Content: View>: UIViewControllerRepresentable {
    //MARK: - Properties
    private let loginView: Content
    
    //MARK: - Initializer
    public init(loginView: Content) {
        self.loginView = loginView
    }
    
    //MARK: - Overrided-Functions
    public func makeUIViewController(context: Context) -> UINavigationController {
        let navigationController = UINavigationController()
        let loginViewController = UIHostingController(rootView: loginView.navigationController(navigationController))
        navigationController.viewControllers = [loginViewController]
        navigationController.navigationBar.isHidden = true
        return navigationController
    }
    
    public func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        // No update logic needed for now
    }
}

