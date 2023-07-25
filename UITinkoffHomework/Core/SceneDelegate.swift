//
//  SceneDelegate.swift
//  UITinkoffHomework
//
//  Created by Tamirlan Aubakirov on 07.06.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let initialViewController = ConversationViewController()
        
     
        let navController = UINavigationController(rootViewController: initialViewController)
//        navController.toolbarItems = [settingsItem, profileItem]
        window.rootViewController = navController 
        window.makeKeyAndVisible()
        self.window = window
    }
}

