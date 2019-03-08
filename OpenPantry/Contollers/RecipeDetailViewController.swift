//
//  RecipeDetailViewController.swift
//  OpenPantry
//
//  Created by Diego Estrella III on 3/5/19.
//  Copyright © 2019 Diego Estrella III. All rights reserved.
//

import UIKit

class RecipeDetailViewController: UIViewController {
    
    private var recipe: RecipeInfo!
    
    @IBOutlet weak var recipeDetailImage: UIImageView!
    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var recipeIngredients: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uploadData()
    }
    
    private func uploadData() {
        recipeDetailImage.kf.indicatorType = .activity
        recipeDetailImage.kf.setImage(with: URL(string: recipe.image),placeholder: UIImage(named: "plImage"))
        recipeName.text = recipe.label
        recipeIngredients.text = recipe.ingredientLines.first
    }
    
}
   
