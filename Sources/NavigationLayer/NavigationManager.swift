//
//  NavigationManager.swift
//  iOSApp
//
//  Created by Mina Emad on 25/06/2025.
//

import UIKit
import SwiftUI

// MARK: - Navigation-Modifiers
public struct PushModifier<Content: View>: ViewModifier {
    @Environment(\.navigationController) private var navigationController
    let view: Content
    let animated: Bool

    public func body(content: Self.Content) -> some View {
        content.onAppear {
            let viewController = UIHostingController(rootView: view)
            navigationController.pushViewController(viewController, animated: animated)
        }
    }
}

public struct PresentModifier<Content: View>: ViewModifier {
    @Environment(\.navigationController) private var navigationController
    let view: Content
    let animated: Bool
    let completion: (() -> Void)?

    public func body(content: Self.Content) -> some View {
        content.onAppear {
            let viewController = UIHostingController(rootView: view)
            navigationController.present(viewController, animated: animated, completion: completion)
        }
    }
}


// MARK: - Extensions-View-Navigation
extension View {

    public func push<Content: View>(_ view: Content, animated: Bool = true) -> some View {
        Color.clear
            .modifier(PushModifier(view: view, animated: animated))
    }

    public func present<Content: View>(_ view: Content, animated: Bool = true, completion: (() -> Void)? = nil) -> some View {
        Color.clear
            .modifier(PresentModifier(view: view, animated: animated, completion: completion))
    }

}
