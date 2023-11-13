//
//  FavouritesButton.swift
//  RM
//
//  Created by Дмитрий Яковлев on 12.11.2023.
//

import UIKit

final class FavouritesButton: UIButton {

    var isActive: Bool = false {
        didSet {
            if self.isActive {
                setBackgroundImage(UIImage(systemName: "heart.fill")?.withRenderingMode(.alwaysTemplate), for: .normal)
                tintColor = UIColor.red
            } else {
                setBackgroundImage(UIImage(systemName: "heart"), for: .normal)
                tintColor = UIColor(red: 0.06, green: 0.69, blue: 0.78, alpha: 1)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        touchDownAction()
        touchUpInsideAction()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        setBackgroundImage(UIImage(systemName: "heart"), for: .normal)
        tintColor = UIColor(red: 0.06, green: 0.69, blue: 0.78, alpha: 1)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func touchDownAction() {
        let touchDownAction = UIAction { [weak self] _ in
            guard let self else { return }
            self.layoutIfNeeded()
            UIView.animate(withDuration: 0.1) {
                self.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            }
        }
        addAction(touchDownAction, for: .touchDown)
    }
    
    private func touchUpInsideAction() {
        let touchUpInsideAction = UIAction { [weak self] _ in
            guard let self else { return }
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0) {
                self.transform = .identity
            }
        }
        addAction(touchUpInsideAction, for: .touchUpInside)
    }
}

