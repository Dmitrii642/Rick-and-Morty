//
//  FavouritesCollectionViewCell.swift
//  RM
//
//  Created by Дмитрий Яковлев on 12.11.2023.
//

import UIKit

protocol FavouritesCellProtocol: AnyObject {
    func likeButtonTapped(id: Int)
}

final class FavouritesCollectionViewCell: UICollectionViewCell {
    
    static let cellID = "FavouritesCollectionViewCell"
    
    private let mainEpisodeView: UIView = {
        let view = UIView()
        view.addShadowOnView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .darkGray
        imageView.layer.cornerRadius = 8
        imageView.contentMode = .scaleAspectFill
        imageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let dataView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let descriptionView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.975, green: 0.975, blue: 0.975, alpha: 1)
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Rick Sanchez"
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let imageTvView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "play.tv")
        imageView.tintColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let nameOfEpisodeLabel: UILabel = {
        let label = UILabel()
        label.text = "Pilot"
        label.textColor = .black
        label.font = .systemFont(ofSize: 13)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let separateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "|"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let numberOfEpisodeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.text = "S01E01"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var favouritesButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "like"), for: .normal)
        button.addTarget(self, action: #selector(favouritesTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        
        contentView.addSubview(mainEpisodeView)
        contentView.addSubview(imageView)
        contentView.addSubview(dataView)
        contentView.addSubview(descriptionView)
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(imageTvView)
        contentView.addSubview(nameOfEpisodeLabel)
        contentView.addSubview(separateLabel)
        contentView.addSubview(numberOfEpisodeLabel)
        contentView.addSubview(favouritesButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func favouritesTapped() {

        print("LikeF")
    }
    
        func configure(model: EpisodeInfoModel) {
           nameLabel.text = model.characterName
           nameOfEpisodeLabel.text = model.episodeName
           numberOfEpisodeLabel.text = model.episodeCode
            imageView.image = model.characterImage
       }
}

//MARK: - Set Constraints

extension FavouritesCollectionViewCell {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            mainEpisodeView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            mainEpisodeView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            mainEpisodeView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            mainEpisodeView.heightAnchor.constraint(equalToConstant: 290),
            
            imageView.topAnchor.constraint(equalTo: mainEpisodeView.topAnchor, constant: 0),
            imageView.leadingAnchor.constraint(equalTo: mainEpisodeView.leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: mainEpisodeView.trailingAnchor, constant: 0),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            
            dataView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 0),
            dataView.leadingAnchor.constraint(equalTo: mainEpisodeView.leadingAnchor, constant: 0),
            dataView.trailingAnchor.constraint(equalTo: mainEpisodeView.trailingAnchor, constant: 0),
            dataView.heightAnchor.constraint(equalToConstant: 40),
            
            descriptionView.topAnchor.constraint(equalTo: dataView.bottomAnchor, constant: 0),
            descriptionView.leadingAnchor.constraint(equalTo: mainEpisodeView.leadingAnchor, constant: 0),
            descriptionView.trailingAnchor.constraint(equalTo: mainEpisodeView.trailingAnchor, constant: 0),
            descriptionView.heightAnchor.constraint(equalToConstant: 50),
            
            nameLabel.centerYAnchor.constraint(equalTo: dataView.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: dataView.leadingAnchor, constant: 15),
            
            imageTvView.leadingAnchor.constraint(equalTo: descriptionView.leadingAnchor, constant: 15),
            imageTvView.centerYAnchor.constraint(equalTo: descriptionView.centerYAnchor),

            nameOfEpisodeLabel.leadingAnchor.constraint(equalTo: imageTvView.trailingAnchor, constant: 10),
            nameOfEpisodeLabel.centerYAnchor.constraint(equalTo: descriptionView.centerYAnchor),

            separateLabel.leadingAnchor.constraint(equalTo: nameOfEpisodeLabel.trailingAnchor, constant: 5),
            separateLabel.centerYAnchor.constraint(equalTo: descriptionView.centerYAnchor),

            numberOfEpisodeLabel.leadingAnchor.constraint(equalTo: separateLabel.trailingAnchor, constant: 5),
            numberOfEpisodeLabel.centerYAnchor.constraint(equalTo: descriptionView.centerYAnchor),

            favouritesButton.trailingAnchor.constraint(equalTo: descriptionView.trailingAnchor, constant: -25),
            favouritesButton.centerYAnchor.constraint(equalTo: descriptionView.centerYAnchor),
            favouritesButton.heightAnchor.constraint(equalToConstant: 30),
            favouritesButton.widthAnchor.constraint(equalToConstant: 30)
        ])
    }
}
 
