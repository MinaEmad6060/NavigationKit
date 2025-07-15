//
//  NavigationController+Environment.swift
//  NavigationKit
//
//  Created by Mina Emad on 25/06/2025.
//

import UIKit
import SwiftUI

// MARK: - EnvironmentValue
public extension EnvironmentValues {
    @Entry var navigationController: UINavigationController = UINavigationController()
}

// MARK: - Extensions
public extension View {
    func navigationController(_ navigationController: UINavigationController) -> some View {
        environment(\.navigationController, navigationController)
    }
}
