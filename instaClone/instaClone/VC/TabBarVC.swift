//
//  TabBarVC.swift
//  instaClone
//
//  Created by Marina Beatriz Santana de Aguiar on 06.10.20.
//

import UIKit

class TabBarVC: UITabBarController {
    
    override func viewDidLoad() {
        let homeVC = UINavigationController(rootViewController: HomeVC())
        homeVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "house"), tag: 0)
        
        let newPostVC = UINavigationController(rootViewController: NewPostVC())
        newPostVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "plus.square"), tag: 1)
        
        let activityVC = UINavigationController(rootViewController: ActivityVC())
        activityVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "heart"), tag: 2)
        
        let profileVC = UINavigationController(rootViewController: ProfileVC())
        profileVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "person"), tag: 3)
        
        viewControllers = [homeVC, newPostVC, activityVC, profileVC]
    }
    
}
