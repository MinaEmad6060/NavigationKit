//
//  Navigations+View.swift
//  NavigationKit
//
//  Created by Shady Ahmed on 15/07/2025.
//

import UIKit
import SwiftUI

public extension View {
    func push<Destination: View>(isPresented: Binding<Bool>, animated: Bool = true, @ViewBuilder destination: @escaping () -> Destination) -> some View {
        modifier(DirectNavigationPushModifier(isPresented: isPresented, animated: animated, destination: destination))
    }
    
    func present<Destination: View>(isPresented: Binding<Bool>, presentationStyle: UIModalPresentationStyle, animated: Bool = true, @ViewBuilder destination: @escaping () -> Destination) -> some View {
        modifier(DirectNavigationPresentModifier(isPresented: isPresented, presentationStyle: presentationStyle, animated: animated, destination: destination))
    }
    
    func pop(shouldPop: Binding<Bool>, animated: Bool = true) -> some View {
        modifier(DirectNavigationPopModifier(shouldPop: shouldPop, animated: animated))
    }
    
    func popToRoot(shouldPopToRoot: Binding<Bool>, animated: Bool = true) -> some View {
        modifier(DirectNavigationPopToRootModifier(shouldPopToRoot: shouldPopToRoot, animated: animated))
    }
    
    func popToSpecificScreen<Content: View>(ofType type: Content.Type, shouldPop: Binding<Bool>, animated: Bool = true) -> some View {
        modifier(DirectNavigationPopToSpecificScreenModifier(type: type, shouldPop: shouldPop, animated: animated))
    }
}

// MARK: - Direct Navigation Modifiers
public struct DirectNavigationPushModifier<Destination: View>: ViewModifier {
    @Environment(\.navigationController) private var navigationController
    @Binding private var isPresented: Bool
    private let destination: () -> Destination
    private let animated: Bool
    
    public init(isPresented: Binding<Bool>, animated: Bool = true, destination: @escaping () -> Destination) {
        self._isPresented = isPresented
        self.animated = animated
        self.destination = destination
    }
    
    public func body(content: Content) -> some View {
        content
            .onChange(of: isPresented) { presented in
                if presented {
                    navigationController.push(destination(), animated: animated)
                    isPresented = false
                }
            }
    }
}

public struct DirectNavigationPresentModifier<Destination: View>: ViewModifier {
    @Environment(\.navigationController) private var navigationController
    @Binding private var isPresented: Bool
    private let destination: () -> Destination
    private let presentationStyle: UIModalPresentationStyle
    private let animated: Bool
    private let completion: (() -> Void)?
    
    public init(isPresented: Binding<Bool>, presentationStyle: UIModalPresentationStyle, animated: Bool = true, destination: @escaping () -> Destination, completion: (() -> Void)? = nil) {
        self._isPresented = isPresented
        self.presentationStyle = presentationStyle
        self.animated = animated
        self.destination = destination
        self.completion = completion
    }
    
    public func body(content: Content) -> some View {
        content
            .onChange(of: isPresented) { presented in
                if presented {
                    navigationController.present(destination(), presentationStyle: presentationStyle, animated: animated, completion: completion)
                    isPresented = false
                }
            }
    }
}

public struct DirectNavigationPresentWithNavigationModifier<Destination: View>: ViewModifier {
    @Environment(\.navigationController) private var navigationController
    @Binding private var isPresented: Bool
    private let destination: () -> Destination
    private let presentationStyle: UIModalPresentationStyle
    private let animated: Bool
    private let completion: (() -> Void)?
    
    public init(isPresented: Binding<Bool>, presentationStyle: UIModalPresentationStyle, animated: Bool = true, destination: @escaping () -> Destination, completion: (() -> Void)? = nil) {
        self._isPresented = isPresented
        self.presentationStyle = presentationStyle
        self.animated = animated
        self.destination = destination
        self.completion = completion
    }
    
    public func body(content: Content) -> some View {
        content
            .onChange(of: isPresented) { presented in
                if presented {
                    navigationController.presentWithNavigation(destination(), presentationStyle: presentationStyle, animated: animated, completion: completion)
                    isPresented = false
                }
            }
    }
}

public struct DirectNavigationPopModifier: ViewModifier {
    @Environment(\.navigationController) private var navigationController
    @Binding private var shouldPop: Bool
    private let animated: Bool
    
    public init(shouldPop: Binding<Bool>, animated: Bool = true) {
        self._shouldPop = shouldPop
        self.animated = animated
    }
    
    public func body(content: Content) -> some View {
        content
            .onChange(of: shouldPop) { pop in
                if pop {
                    navigationController.popViewController(animated: animated)
                    shouldPop = false
                }
            }
    }
}

public struct DirectNavigationPopToRootModifier: ViewModifier {
    @Environment(\.navigationController) private var navigationController
    @Binding private var shouldPopToRoot: Bool
    private let animated: Bool
    
    public init(shouldPopToRoot: Binding<Bool>, animated: Bool = true) {
        self._shouldPopToRoot = shouldPopToRoot
        self.animated = animated
    }
    
    public func body(content: Content) -> some View {
        content
            .onChange(of: shouldPopToRoot) { popToRoot in
                if popToRoot {
                    navigationController.popToRoot(animated: animated)
                    shouldPopToRoot = false
                }
            }
    }
}

// DirectNavigationDismissModifier removed - use SwiftUI's @Environment(\.dismiss) instead

public struct DirectNavigationPopToSpecificScreenModifier<Destination: View>: ViewModifier {
    @Environment(\.navigationController) private var navigationController
    private let type: Destination.Type
    @Binding private var shouldPop: Bool
    private let animated: Bool
    
    public init(type: Destination.Type, shouldPop: Binding<Bool>, animated: Bool = true) {
        self.type = type
        self._shouldPop = shouldPop
        self.animated = animated
    }
    
    public func body(content: Content) -> some View {
        content
            .onChange(of: shouldPop) { pop in
                if pop {
                    let _ = navigationController.popToSpecificScreen(ofType: type, animated: animated)
                    shouldPop = false
                }
            }
    }
}
