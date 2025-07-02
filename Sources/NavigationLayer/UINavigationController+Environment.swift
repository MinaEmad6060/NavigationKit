import SwiftUI
import UIKit

// MARK: - EnvironmentValue
public extension EnvironmentValues {
    @Entry var navigationController: UINavigationController = UINavigationController()
}

// MARK: - Extensions
public extension View {
    func navigationController(_ status: UINavigationController) -> some View {
        environment(\.navigationController, status)
    }
}
