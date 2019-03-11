//
//  RecipeView.swift
//  OpenPantry
//
//  Created by Diego Estrella III on 3/4/19.
//  Copyright © 2019 Diego Estrella III. All rights reserved.
//

import UIKit

class RecipeView: UIView {

    lazy var recipeCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 365, height: 200)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 20, left: 5, bottom: 20, right: 5)
        let ct = UICollectionView(frame: .zero, collectionViewLayout: layout)
        ct.backgroundColor = #colorLiteral(red: 0.9506962895, green: 0.9450445771, blue: 0.9550405145, alpha: 1)
        return ct
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
        addSubview(recipeCollectionView)
        recipeCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            recipeCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            recipeCollectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),
            recipeCollectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),
            recipeCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0)
            ])
    }
}
