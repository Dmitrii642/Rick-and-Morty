//
//  EpisodesViewController.swift
//  RM
//
//  Created by Дмитрий Яковлев on 12.11.2023.
//

import UIKit

protocol EpisodesViewControllerProtocol: AnyObject {
    func passData(favourites: [EpisodeInfoModel])
}

class EpisodesViewController: UIViewController {
    
    weak var episodesDelegate: EpisodesViewControllerProtocol?
    
    private let episodesCollectionView = EpisodeCollectionView()
    private lazy var episodesModel = EpisodesModel(viewController: self)
    
    private let logoImageView: UIImageView = {
        let logoImage = UIImageView()
        logoImage.image = UIImage(named: "Logo")
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        return logoImage
    }()
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setConstraints()
        episodesModel.fetchData()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(logoImageView)
        
        episodesCollectionView.episodeDelegate = self
        view.addSubview(episodesCollectionView)
    }
    
    @objc func filterButtonTapped () {
        print("Tappppp")
    }
    
    func setEpisodesInfo(_ episodesInfo: [EpisodeInfoModel]) {
        episodesCollectionView.setEpisodesInfo(episodesInfo)
        DispatchQueue.main.async {
            self.episodesCollectionView.reloadData()
        }
    }
    
    func updateFavouritesViewController(array: [EpisodeInfoModel]) {
        episodesDelegate?.passData(favourites: array)
    }
    
}
    

//MARK: - EpisodesCellProtocol

extension EpisodesViewController: EpisodesCellProtocol {
    func favouritesButtonTapped(id: Int) {
        episodesModel.selectFavouriteCharacter(id)
    }
}

//MARK: - EpisodeProtocol

extension EpisodesViewController: EpisodeProtocol {
    
    func didSelect(character: EpisodeInfoModel) {
        let detailViewController = CharacterDetailsViewController(characterModel: character)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
}
    
//MARK: - Set Constraints
extension EpisodesViewController {
    private func setConstraints() {
        let topOffset = (navigationController?.navigationBar.frame.size.height ?? 0)
        
        NSLayoutConstraint.activate([
        
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            logoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            logoImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            logoImageView.heightAnchor.constraint(equalToConstant: 104),
            
            episodesCollectionView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 15),
            episodesCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            episodesCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            episodesCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
            
        ])
    }
}
