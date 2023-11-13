//
//  MainTabBarController.swift
//  RM
//
//  Created by Дмитрий Яковлев on 12.11.2023.
//


import UIKit

final class MainTabBarController: UITabBarController {
    
    private let favouritesViewController = UINavigationController(rootViewController: FavouritesViewController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
        setupItems()
    }
    
    private func setupTabBar() {
        tabBar.backgroundColor = .white
        
        tabBar.tintColor = UIColor(red: 0.05, green: 0.1, blue: 0.49, alpha: 1)
        tabBar.unselectedItemTintColor = UIColor(red: 0.557, green: 0.557, blue: 0.576, alpha: 1)
        tabBar.addShadow()
    }
    
    private func setupItems() {
        
        let episodesViewController =  UINavigationController(rootViewController: EpisodesViewController())
        let episodesVC = episodesViewController.viewControllers.first as? EpisodesViewController
        episodesVC?.episodesDelegate = self

        setViewControllers([episodesViewController, favouritesViewController], animated: true)
        
        
        guard let items = tabBar.items else { return }
        
        items[0].image = UIImage(systemName: "house")
        items[1].image = UIImage(systemName: "heart")
        
    }
}
//MARK: - EpisodesViewControllerProtocol

extension MainTabBarController: EpisodesViewControllerProtocol {
    func passData(favourites: [EpisodeInfoModel]) {
        let favouritesVC = favouritesViewController.viewControllers.first as? FavouritesViewController
        favouritesVC?.setEpisodesInfo(favourites)
    }
}
