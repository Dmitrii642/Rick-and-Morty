//
//  EpisodeCollectionView.swift
//  RM
//
//  Created by Дмитрий Яковлев on 12.11.2023.
//


import UIKit

protocol EpisodeProtocol: AnyObject {
    func didSelect(character: EpisodeInfoModel)
}

class EpisodeCollectionView: UICollectionView {
    
    weak var episodeDelegate: EpisodeProtocol?
    
    private var episodesInfo = [EpisodeInfoModel]()
    
   private let collectionLayout = UICollectionViewFlowLayout()
    
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: collectionLayout)
        
        setupLayout()
        configure()
        setDelegates()
        register(EpisodesCollectionViewCell.self, forCellWithReuseIdentifier: EpisodesCollectionViewCell.cellID)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private func setupLayout() {
        collectionLayout.minimumLineSpacing = 15
    }
    
    
    private func configure() {
        backgroundColor = .none
        bounces = false
        showsVerticalScrollIndicator = false
        delaysContentTouches = false
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setDelegates() {
        dataSource = self
        delegate = self
    }
    
    
    func setEpisodesInfo(_ episodesInfo: [EpisodeInfoModel]) {
        self.episodesInfo = episodesInfo
    }
}


//MARK: - UICollectionViewDataSource

extension EpisodeCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        episodesInfo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EpisodesCollectionViewCell.cellID, for: indexPath) as? EpisodesCollectionViewCell else { return UICollectionViewCell()
        }
        
        cell.configure(model: episodesInfo[indexPath.row])
        cell.cellDelegate = episodeDelegate as? EpisodesCellProtocol
        return cell
    }
}

//MARK: - UICollectionViewDelegate

extension EpisodeCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let favouritesViewController = FavouritesViewController()
        episodeDelegate?.didSelect(character: episodesInfo[indexPath.row])
    }
}

//MARK: - UICollectionViewDelegateFlowLayout



extension EpisodeCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 350)
    }
}
