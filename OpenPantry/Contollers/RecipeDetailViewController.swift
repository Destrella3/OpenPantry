//
//  RecipeDetailViewController.swift
//  OpenPantry
//
//  Created by Diego Estrella III on 3/5/19.
//  Copyright © 2019 Diego Estrella III. All rights reserved.
//

import UIKit

class RecipeDetailViewController: UIViewController {
    
    public var recipe: RecipeInfo!
    
    @IBOutlet weak var recipeDetailImage: UIImageView!
    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var recipeIngredients: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadData()
    }
    
    private func downloadData() {
        recipeDetailImage.kf.indicatorType = .activity
        recipeDetailImage.kf.setImage(with: URL(string: recipe.image),placeholder: UIImage(named: "plImage"))
        recipeName.text = recipe.label
        let sentences = recipe.ingredientLines.map { $0.replacingOccurrences(of: ",", with: "") }
            .map { $0 + "\n" }
        let ingredients = sentences.joined()
        recipeIngredients.text = ingredients
    }
    
}
   
