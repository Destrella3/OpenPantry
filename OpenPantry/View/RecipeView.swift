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
        layout.itemSize = CGSize(width: 375, height: 200)
        layout.sectionInset = UIEdgeInsets(top: 16, left: 5, bottom: 16, right: 5)
        let ct = UICollectionView.init(frame: self.bounds, collectionViewLayout: layout)
        ct.backgroundColor = #colorLiteral(red: 0.9593138099, green: 0.9536108375, blue: 0.9636976123, alpha: 1)
        return ct
    }()
    
    lazy var searchBar: UISearchBar = {
        let sb = UISearchBar()
        sb.placeholder = "Salmon"
        return sb
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
        addSubview(searchBar)
        addSubview(recipeCollectionView)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        recipeCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            searchBar.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),
            searchBar.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),
            
            recipeCollectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 0),
            recipeCollectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),
            recipeCollectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),
            recipeCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0)
            ])
    }
    
}
