//
//  ViewController.swift
//  OpenPantry
//
//  Created by Diego Estrella III on 2/7/19.
//  Copyright © 2019 Diego Estrella III. All rights reserved.
//

import UIKit
import Kingfisher

class OpenPantryController: UIViewController {

    let recipeView = RecipeView()
    
    private var recipes = [RecipeInfo]() {
        didSet {
            DispatchQueue.main.async {
                self.recipeView.recipeCollectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(recipeView)
        recipeView.searchBar.delegate = self
        recipeView.recipeCollectionView.dataSource = self
        recipeView.recipeCollectionView.delegate = self
        recipeView.recipeCollectionView.register(RecipeCell.self, forCellWithReuseIdentifier: "RecipeCell")
        getRecipes(keyword: "Salmon")
    }

    private func getRecipes(keyword: String) {
        EdamamAPIClient.searchRecipes(keyword: keyword) { [weak self] (appError, recipes) in
            if let appError = appError {
                print(appError.errorMessage())
            } else if let recipes = recipes {
                self?.recipes = recipes
            }
        }
    }

}

extension OpenPantryController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = recipeView.recipeCollectionView.dequeueReusableCell(withReuseIdentifier: "RecipeCell", for: indexPath) as? RecipeCell else {return UICollectionViewCell()}
        let recipe = recipes[indexPath.row]
        cell.recipeLabel.text = recipe.label
        cell.recipeImage.kf.setImage(with: URL(string: recipe.image),
                                    placeholder: UIImage(named: "plImage"))
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 6
        return cell
        
    }
    
}

extension OpenPantryController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        guard let text = searchBar.text,
            !text.isEmpty,
            let searchText = text.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {
                print("Not a Valid Search!")
                return
        }
        getRecipes(keyword: searchText)
    }
}