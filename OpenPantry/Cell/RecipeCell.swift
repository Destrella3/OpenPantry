//
//  CollectionViewCell.swift
//  OpenPantry
//
//  Created by Diego Estrella III on 3/4/19.
//  Copyright © 2019 Diego Estrella III. All rights reserved.
//

import UIKit

class RecipeCell: UICollectionViewCell {
    
    lazy var recipeImage: UIImageView = {
       let image = UIImageView()
       image.image = UIImage(named: "plImage")
       image.contentMode = .scaleAspectFill
       return image
    }()
    
    lazy var recipeLabel: UILabel = {
        let label = UILabel()
        label.text = "Recipe Label"
        label.alpha = 0.95
        label.backgroundColor = .white
        return label
    }()
    
    lazy var favoriteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "emptyHeart"), for: .normal)
        button.imageView!.contentMode = UIView.ContentMode.scaleAspectFit
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        setConstraints()
    }
    
    private func setConstraints() {
        addSubview(recipeImage)
        addSubview(recipeLabel)
        addSubview(favoriteButton)
        recipeImage.translatesAutoresizingMaskIntoConstraints = false
        recipeLabel.translatesAutoresizingMaskIntoConstraints = false
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            recipeImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            recipeImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),
            recipeImage.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),
            recipeImage.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0),
            
            recipeLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),
            recipeLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),
            recipeLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0),
            recipeLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2),
            
            favoriteButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8),
            favoriteButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -8),
            favoriteButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1),
            favoriteButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.1)
            ])
    }
}
