//
//  CharacterDetailsCell.swift
//  RM
//
//  Created by Дмитрий Яковлев on 12.11.2023.
//


import UIKit
class CharacterDetailsCell: UITableViewCell {
   
    static let id = "idTableViewCell"
    
    var titleLabel: UILabel = {
       let label = UILabel()
        label.text = "Title"
        label.textColor = UIColor(red: 0.031, green: 0.122, blue: 0.196, alpha: 1)
        label.font = .robotoBold16()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var valueLabel: UILabel = {
        let label = UILabel()
        label.text = "Value"
        label.textColor = UIColor(red: 0.431, green: 0.475, blue: 0.549, alpha: 1)
        label.font = .robotoRegular14()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var stackView = UIStackView(arrangedSubviews: [titleLabel, valueLabel],
                                             axis: .vertical,
                                             spacing: 0)
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        
        setupViews()
        setConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        selectionStyle = .none
//        isUserInteractionEnabled = false
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
    }
    
    func configure(title: String, value: String) {
        titleLabel.text = title
        valueLabel.text = value
    }
}
    

//MARK: - Set Constraints
extension CharacterDetailsCell {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            stackView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.7)
        ])
    }
}

