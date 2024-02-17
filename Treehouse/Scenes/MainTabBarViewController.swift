//
//  MainTabBarViewController.swift
//  Treehouse
//
//  Created by BoMin Lee on 2/13/24.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .trBackgroundWhite
        
        let feedViewController = FeedViewController()
        let branchViewController = BranchViewController()
        let notificationViewController = NotificationViewController()
        let settingViewController = SettingViewController()
        
        feedViewController.tabBarItem.image = TreehouseImageCollection.tabBarIconFeedNormal.withRenderingMode(.alwaysOriginal)
        feedViewController.tabBarItem.selectedImage = TreehouseImageCollection.tabBarIconFeedSelected.withRenderingMode(.alwaysOriginal)
        branchViewController.tabBarItem.image = TreehouseImageCollection.tabBarIconBranchNormal.withRenderingMode(.alwaysOriginal)
        branchViewController.tabBarItem.selectedImage = TreehouseImageCollection.tabBarIconBranchSelected.withRenderingMode(.alwaysOriginal)
        notificationViewController.tabBarItem.image = TreehouseImageCollection.tabBarIconNotificationNormal.withRenderingMode(.alwaysOriginal)
        notificationViewController.tabBarItem.selectedImage = TreehouseImageCollection.tabBarIconNotificationSelected.withRenderingMode(.alwaysOriginal)
        settingViewController.tabBarItem.image = TreehouseImageCollection.tabBarIconSettingNormal.withRenderingMode(.alwaysOriginal)
        settingViewController.tabBarItem.selectedImage = TreehouseImageCollection.tabBarIconSettingSelected.withRenderingMode(.alwaysOriginal)
        
//        feedViewController.navigationItem.largeTitleDisplayMode = .never
        
        let navigationFeed = UINavigationController(rootViewController: feedViewController)
        let navigationBranch = UINavigationController(rootViewController: branchViewController)
        let navigationNotification = UINavigationController(rootViewController: notificationViewController)
        let navigationSetting = UINavigationController(rootViewController: settingViewController)
        
//        navigationFeed.navigationBar.prefersLargeTitles = false
//        navigationBranch.navigationBar.prefersLargeTitles = false
        
        setViewControllers([navigationFeed, navigationBranch, navigationNotification, navigationSetting], animated: false)
    }
}
