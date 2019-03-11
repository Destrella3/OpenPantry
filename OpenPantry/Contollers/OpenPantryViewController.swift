//
//  RecipeViewController.swift
//  OpenPantry
//
//  Created by Diego Estrella III on 2/8/19.
//  Copyright © 2019 Diego Estrella III. All rights reserved.
//

import UIKit

class OpenPantryViewController: UIViewController {

    private var recipes = [RecipeInfo]()
    private var ingredients = [String]() {
        didSet {
            DispatchQueue.main.async {
                self.pantryTableView.reloadData()
            }
        }
    }
    
    @IBOutlet weak var pantryTextField: UITextField!
    @IBOutlet weak var pantryTableView: UITableView!
    @IBOutlet weak var searchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        updateData()
        
    }
    
    private func updateData() {
        pantryTableView.dataSource = self
        pantryTableView.delegate = self
        pantryTextField.delegate = self
        
    }
    
    private func updateUI() {
        searchButton.layer.cornerRadius = 15
        pantryTableView.layer.cornerRadius = 10
    }
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        let vc = OpenPantryCollectionViewController.fromStoryBoard(ingredients: ingredients)
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension OpenPantryViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = pantryTableView.dequeueReusableCell(withIdentifier: "PantryCell", for: indexPath)
        cell.textLabel?.text = ingredients[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { [weak self] (action, indexPath) in
            self?.ingredients.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        return [delete]
    }
}

extension OpenPantryViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        let ingredient = pantryTextField.text
        ingredients.append(ingredient ?? "Not Found")
        pantryTextField.text = ""
        return true
    }
}
