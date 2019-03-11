//
//  OpenPantryDetailViewController.swift
//  OpenPantry
//
//  Created by Diego Estrella III on 3/7/19.
//  Copyright © 2019 Diego Estrella III. All rights reserved.
//

import UIKit

class OpenPantryDetailViewController: UIViewController {
    
    public var recipe: RecipeInfo!
    
    @IBOutlet weak var recipeImage: UIImageView!
        @IBOutlet weak var recipeName: UILabel!
        @IBOutlet weak var recipeIngredents: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadData()
        
    }
    
    private func downloadData() {
        recipeImage.kf.indicatorType = .activity
        recipeImage.kf.setImage(with: URL(string: recipe.image),placeholder: UIImage(named: "plImage"))
        recipeName.text = recipe.label
        let sentences = recipe.ingredientLines.map { $0.replacingOccurrences(of: ",", with: "") }
            .map { $0 + "\n" }
        let ingredients = sentences.joined()
        recipeIngredents.text = ingredients
    }
    
}


