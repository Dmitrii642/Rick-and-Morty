//
//  FavouritesViewController.swift
//  RM
//
//  Created by Дмитрий Яковлев on 12.11.2023.
//



import UIKit

class FavouritesViewController: UIViewController {
    
    private let favouritesCollectionView = FavouritesCollectionView()

    private let logoImageView: UIImageView = {
        let logoImage = UIImageView()
        logoImage.image = UIImage(named: "Logo")
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        return logoImage
    }()
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        favouritesCollectionView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setConstraints()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(logoImageView)
        view.addSubview(favouritesCollectionView)
    }
    
    func setEpisodesInfo(_ array: [EpisodeInfoModel]) {
        favouritesCollectionView.setEpisodesInfo(array)
    }
}

//MARK: - Set Constraints

extension FavouritesViewController {
    
    private func setConstraints() {
        let topOffset = (navigationController?.navigationBar.frame.size.height ?? 0)
        
        NSLayoutConstraint.activate([

            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            logoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            logoImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            logoImageView.heightAnchor.constraint(equalToConstant: 104),
            
            favouritesCollectionView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 15),
            favouritesCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            favouritesCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            favouritesCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
}




