//
//  CharacterDetailsViewController.swift
//  RM
//
//  Created by Дмитрий Яковлев on 12.11.2023.
//


import UIKit
import PhotosUI

class CharacterDetailsViewController: UIViewController {
    
    private lazy var characterDetailsTableView = CharacterDetailsTableView(character: characterModel)
    private var characterModel: EpisodeInfoModel
    
    init(characterModel: EpisodeInfoModel) {
        self.characterModel = characterModel
        super.init(nibName: nil, bundle: nil)
    }

    
    private let characterPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.borderWidth = 5
        imageView.image = UIImage(named: "image")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.borderColor = UIColor.gray.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var addPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "camera"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(changePhoto), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.031, green: 0.122, blue: 0.196, alpha: 1)
        label.font = .robotoRegular32()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let informationLabel: UILabel = {
        let label = UILabel()
        label.text = "Informations"
        label.textColor = UIColor(red: 0.557, green: 0.557, blue: 0.576, alpha: 1)
        label.font = .robotoMedium20()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        characterPhotoImageView.layer.cornerRadius = characterPhotoImageView.frame.height / 2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setConstraints()
        setCharacterInfo()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(characterPhotoImageView)
        view.addSubview(characterDetailsTableView)
        view.addSubview(addPhotoButton)
        view.addSubview(nameLabel)
        view.addSubview(informationLabel)
        
        setupNavigationController()
    }
    
    private func setupNavigationController() {
        navigationController?.setNavigationBarHidden(false, animated: false)
        let buttonItem = UIBarButtonItem(image: UIImage(named: "rickMorty"), style: .plain, target: nil, action: nil)
        navigationItem.rightBarButtonItem = buttonItem
       navigationController?.navigationBar.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        navigationController?.navigationBar.tintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)

    }
    
    private func setCharacterInfo() {
        characterPhotoImageView.image = characterModel.characterImage
        nameLabel.text = characterModel.characterName
    }
    
    
    @objc private func changePhoto() {
            
        
        alertPhotoOrCamera{ [weak self] source in
            guard let self else { return }
            
            if #available(iOS 14.0, *) {
                self.presentPHPicker()
            } else {
                self.choseImagePickeer(source: source)
            }
        }
    }
    
}

//MARK: - UIImagePickerControllerDelegate, UINavigationControllerDelegate
extension CharacterDetailsViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    private func choseImagePickeer(source: UIImagePickerController.SourceType) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = source
        present(imagePicker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as? UIImage
        characterPhotoImageView.image = image
        characterPhotoImageView.contentMode = .scaleAspectFit
        dismiss(animated: true)
    }
}


//MARK: - PHPickerViewControllerDelegate
@available(iOS 14.0, *)
extension CharacterDetailsViewController: PHPickerViewControllerDelegate {
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)
        results.forEach { result in
            result.itemProvider.loadObject(ofClass: UIImage.self) { reading, error in
                guard let image = reading as? UIImage, error == nil else { return }
                DispatchQueue.main.async {
                    self.characterPhotoImageView.image = image
                    self.characterPhotoImageView.contentMode = .scaleAspectFill
                }
            }
        }
    }
    
    private func presentPHPicker() {
        var phPickerConfig = PHPickerConfiguration(photoLibrary: .shared())
        phPickerConfig.selectionLimit = 1
        phPickerConfig.filter = PHPickerFilter.any(of: [.images])
        
        let phPickerVC = PHPickerViewController(configuration: phPickerConfig)
        phPickerVC.delegate = self
        present(phPickerVC, animated: true)
    }
    
}

//MARK: - Set Constraints
extension CharacterDetailsViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            characterPhotoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            characterPhotoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            characterPhotoImageView.heightAnchor.constraint(equalToConstant: 150),
            characterPhotoImageView.widthAnchor.constraint(equalToConstant: 150),
            
            addPhotoButton.centerYAnchor.constraint(equalTo: characterPhotoImageView.centerYAnchor),
            addPhotoButton.leadingAnchor.constraint(equalTo: characterPhotoImageView.trailingAnchor, constant: 10),
            addPhotoButton.heightAnchor.constraint(equalToConstant: 32),
            addPhotoButton.widthAnchor.constraint(equalToConstant: 32),
            
            nameLabel.topAnchor.constraint(equalTo: characterPhotoImageView.bottomAnchor, constant: 40),
            nameLabel.heightAnchor.constraint(equalToConstant: 32),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            informationLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            informationLabel.heightAnchor.constraint(equalToConstant: 24),
            informationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            
            characterDetailsTableView.topAnchor.constraint(equalTo: informationLabel.bottomAnchor, constant: 30),
            characterDetailsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 25),
            characterDetailsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            characterDetailsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            characterDetailsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
    }
}

