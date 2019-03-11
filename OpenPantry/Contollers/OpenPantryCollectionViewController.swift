//
//  OpenPantryCollectionViewController.swift
//  OpenPantry
//
//  Created by Diego Estrella III on 3/10/19.
//  Copyright © 2019 Diego Estrella III. All rights reserved.
//

import UIKit

class OpenPantryCollectionViewController: UIViewController {
    
    static func fromStoryBoard(ingredients: [String]) -> OpenPantryCollectionViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "OpenPantryCollectionViewController") as! OpenPantryCollectionViewController
        
        vc.ingredients =  ingredients
        
        return vc
    }
    
    private var recipeView = RecipeView()
    private var ingredients = [String]()
    private var recipes = [RecipeInfo]() {
        didSet {
            DispatchQueue.main.async {
                self.recipeView.recipeCollectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRecipeView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateData()
    }
    
    private func setupRecipeView() {
        view.addSubview(recipeView)
        recipeView.recipeCollectionView.register(RecipeCell.self, forCellWithReuseIdentifier: "RecipeCell")
        recipeView.recipeCollectionView.dataSource = self
        recipeView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            recipeView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            recipeView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            recipeView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            recipeView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
            ])
    }
    private func updateData() {
        RecipeAPIClient.searchRecipes(keyword: ingredientsQueryString()) { (error, recipe) in
            if let error =  error {
                print(error.errorMessage())
            } else if let recipe = recipe {
                self.recipes = recipe
            }
        }
    }
    
    private func ingredientsQueryString() -> String {
        return ingredients.compactMap({ ingredient in
            ingredient.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)})
            .joined(separator: "+")
    }
}

extension OpenPantryCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell =  recipeView.recipeCollectionView.dequeueReusableCell(withReuseIdentifier: "RecipeCell", for: indexPath) as? RecipeCell else { return UICollectionViewCell() }
        let recipeToSet = recipes[indexPath.row]
        cell.recipeImage.kf.setImage(with: URL(string: recipeToSet.image),placeholder: UIImage(named: "plImage"))
        cell.recipeLabel.text = recipeToSet.label
        return cell
    }
    
}
