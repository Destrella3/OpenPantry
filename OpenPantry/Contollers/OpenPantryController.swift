//
//  ViewController.swift
//  OpenPantry
//
//  Created by Diego Estrella III on 2/7/19.
//  Copyright © 2019 Diego Estrella III. All rights reserved.
//

import UIKit

class OpenPantryController: UIViewController {

    let recipeView = RecipeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(recipeView)
        recipeView.recipeCollectionView.dataSource = self
        recipeView.recipeCollectionView.delegate = self
        recipeView.recipeCollectionView.register(RecipeCell.self, forCellWithReuseIdentifier: "RecipeCell")
    }


}

extension OpenPantryController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = recipeView.recipeCollectionView.dequeueReusableCell(withReuseIdentifier: "RecipeCell", for: indexPath) as? RecipeCell else {return UICollectionViewCell()}
        
        return cell
        
    }
    
    
}
