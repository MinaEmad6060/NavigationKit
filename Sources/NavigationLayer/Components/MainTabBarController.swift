//
//  MainTabBarController.swift
//  iOSApp
//
//  Created by Mina Emad on 25/06/2025.
//

import UIKit
import SwiftUI

public class MainTabBarController<Content: View>: UIViewController {
    // MARK: - Properties
    private let mainTabsView: Content

    // MARK: - Initializer
    public init(mainTabsView: Content) {
        self.mainTabsView = mainTabsView
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - LifeCycle
    public override func viewDidLoad() {
        super.viewDidLoad()
        let hostingController = UIHostingController(rootView: mainTabsView)
        addChild(hostingController)
        hostingController.view.frame = view.bounds
        hostingController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
    }
    
}
