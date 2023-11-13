//
//  FavouritesCollectionView.swift
//  RM
//
//  Created by Дмитрий Яковлев on 12.11.2023.
//

import UIKit

final class FavouritesCollectionView: UICollectionView {

    private var episodesInfo = [EpisodeInfoModel]()
    
    private let collectionLayout = UICollectionViewFlowLayout()

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: collectionLayout)
        
        setupLayout()
        configure()
        setDelegates()
        register(FavouritesCollectionViewCell.self, forCellWithReuseIdentifier: FavouritesCollectionViewCell.cellID)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        collectionLayout.minimumLineSpacing = 15
        collectionLayout.sectionInset = UIEdgeInsets(top: 7, left: 0, bottom: 0, right: 0)
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

extension FavouritesCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        episodesInfo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavouritesCollectionViewCell.cellID,
                                                            for: indexPath) as? FavouritesCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(model: episodesInfo[indexPath.row])
        return cell
    }
}
//MARK: - UICollectionViewDelegateFlowLayout

extension FavouritesCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width - 20,
               height: collectionView.frame.width * 1.1)
    }
}



