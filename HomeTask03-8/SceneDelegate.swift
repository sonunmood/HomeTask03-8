//
//  SceneDelegate.swift
//  HomeTask03-8
//
//  Created by Sonun on 30/3/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
       
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        
        let favoriteVC = FavoriteViewController()
        let favTabBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "star"), selectedImage: UIImage(systemName: "star"))
        favoriteVC.tabBarItem = favTabBarItem
        
        let recentVC = ResentViewController()
        let recentTabBarItem = UITabBarItem(title: "Resents", image: UIImage(systemName: "clock.fill"), selectedImage: UIImage(systemName: "clock.fill"))
        recentVC.tabBarItem = recentTabBarItem
        
        let dialpadVC = DialpadViewController()
        let dialpadTabBarItem = UITabBarItem(title: "Dialpad", image: UIImage(systemName: "circle.grid.3x3.fill"), selectedImage: UIImage(systemName: "circle.grid.3x3.fill"))
        dialpadVC.tabBarItem = dialpadTabBarItem
        
        let contactVC = ContactViewController()
        let navController = UINavigationController(rootViewController: contactVC)
        let contactTabBarItem = UITabBarItem(title: "Contacts", image: UIImage(systemName: "person.fill"), selectedImage: UIImage(systemName: "person.fill"))
        contactVC.tabBarItem = contactTabBarItem
        
        
        
        let voicemailVC = VoicemailViewController()
        let voicemailTabBarItem = UITabBarItem(title: "Voicemail", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house"))
        voicemailVC.tabBarItem = voicemailTabBarItem
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [favoriteVC, recentVC, navController, dialpadVC, voicemailVC]
        tabBarController.tabBar.backgroundColor = .white
        window.rootViewController = tabBarController
        self.window = window
        self.window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

