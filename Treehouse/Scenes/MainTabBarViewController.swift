//
//  MainTabBarViewController.swift
//  Tree
//
//  Created by BoMin Lee on 2/13/24.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let feedViewController = FeedViewController()
//        let treeViewController =
//        let notificationViewController =
//        let settingViewController =
        
//        feedViewController.tabBarItem.image =
        
        feedViewController.navigationItem.largeTitleDisplayMode = .never
        
        let navigationFeed = UINavigationController(rootViewController: feedViewController)
        
        navigationFeed.navigationBar.prefersLargeTitles = false
        
        setViewControllers([navigationFeed], animated: false)
    }
}
