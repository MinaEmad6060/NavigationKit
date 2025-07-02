//
//  NavigationHelper.swift
//  iOSApp
//
//  Created by Mina Emad on 25/06/2025.
//

import SwiftUI

//MARK: - Wrapped-MainViews-With-UINavigationController
//MARK: - Wrapped-TabBar
struct MainTabBarView<Content: View>: UIViewControllerRepresentable {
    //MARK: - Properties
    private let mainTabsView: Content
    
    //MARK: - Initializer
    public init(mainTabsView: Content) {
        self.mainTabsView = mainTabsView
    }
    
    //MARK: - Overrided-Functions
    func makeUIViewController(context: Context) -> UINavigationController {
        let navigationController = UINavigationController()
        let tabBarController = MainTabBarController(mainTabsView: mainTabsView.navigationController(navigationController))
        navigationController.viewControllers = [tabBarController]
        navigationController.navigationBar.isHidden = true
        return navigationController
    }
    
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        // No update logic needed for now
    }
}

//MARK: - Wrapped-LoginScreen
struct LoginNavigationView<Content: View>: UIViewControllerRepresentable {
    //MARK: - Properties
    private let loginView: Content
    
    //MARK: - Initializer
    public init(loginView: Content) {
        self.loginView = loginView
    }
    
    //MARK: - Overrided-Functions
    func makeUIViewController(context: Context) -> UINavigationController {
        let navigationController = UINavigationController()
        let loginViewController = UIHostingController(rootView: loginView.navigationController(navigationController))
        navigationController.viewControllers = [loginViewController]
        navigationController.navigationBar.isHidden = true
        return navigationController
    }
    
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        // No update logic needed for now
    }
}

