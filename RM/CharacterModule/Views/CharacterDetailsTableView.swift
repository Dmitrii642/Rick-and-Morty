//
//  CharacterDetailsTableView.swift
//  RM
//
//  Created by Дмитрий Яковлев on 12.11.2023.
//

import UIKit

class CharacterDetailsTableView: UITableView {
    
    private let titlesArray = ["Gender", "Status", "Species", "Origin", "Type", "Location"]
    private var character = EpisodeInfoModel()
    
    override init(frame: CGRect, style: UITableView.Style) {
        super .init(frame: frame, style: style)
        
        cofigure()
        setDelegates()
        register(CharacterDetailsCell.self, forCellReuseIdentifier: CharacterDetailsCell.id)
    }
    
    convenience init(character: EpisodeInfoModel) {
        self.init()
        self.character = character
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func cofigure() {
        backgroundColor = .none
        separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        separatorStyle = .singleLine
        bounces = false
        showsVerticalScrollIndicator = false
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setDelegates() {
        dataSource = self
        delegate = self
    }
    
    private func getCharacterInfoArray() -> [String] {
        [character.characterGender,
         character.characterStatus,
         character.characterSpecies,
         character.characterOrigin,
         character.characterType,
         character.characterLocation]
        
    }
}
    //MARK: - UITableViewDataSource
    extension CharacterDetailsTableView: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            titlesArray.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CharacterDetailsCell.id) as? CharacterDetailsCell else {
                return UITableViewCell()
            }
            
            let characterInfoArray = getCharacterInfoArray()
            cell.configure(title: titlesArray[indexPath.row], value: characterInfoArray[indexPath.row])
            
            return cell
        }
        
    }
    
    //MARK: - UITableViewDelegate
    extension CharacterDetailsTableView: UITableViewDelegate{
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            UITableView.automaticDimension
        }
        
    }
    
    



