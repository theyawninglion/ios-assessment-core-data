//
//  ShoppingListTableViewController.swift
//  ShoppingList
//
//  Created by Taylor Phillips on 2/10/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

import UIKit

class ShoppingListTableViewController: UITableViewController, GotItButtonShoppingCellTableViewCellDelegate {
    
    @IBOutlet var dueDatePicker: UIDatePicker!
 
    @IBOutlet weak var dueDateTextField: UITextField!
    
    var dueDateValue: Date?
    var shopping: Shopping?
    
    private func updateValue(){
        guard let shopping = shopping, isViewLoaded else { return }
        dueDateTextField.text = (shopping.due as Date?)?.stringValue()
        
    }
    
    @IBAction func dueDateTapped(_ sender: Any) {
        dueDateTextField.text = sender.date.stringValue()
        dueDateValue = sender.date
        
    }
    
    
    
    @IBAction func addButtonTapped(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Add item to shopping List", message: "Enter an item you would like to get", preferredStyle: .alert)
        let cancelAlert = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        var shoppingItemTextField: UITextField?
        alertController.addTextField{ (textField) in
            
            shoppingItemTextField = textField
            
        }
        let addItemAction = UIAlertAction(title: "Add item", style: .default) { (_) in
            
            guard let item = shoppingItemTextField?.text else {return}
            ShoppingController.sharedController.addItem(item: item)
            
            self.tableView.reloadData()
            
        }
        
        alertController.addAction(cancelAlert)
        alertController.addAction(addItemAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Shopping List"
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ShoppingController.sharedController.shoppingArray.count
    }
    
    func gotItButtonTapped(sender: ShoppingCellTableViewCell) {
        guard let shopping = sender.shopping, let indexPath = tableView.indexPath(for: sender) else {return}
        ShoppingController.sharedController.updateItemIn(shoppingList: shopping)
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingListCell", for: indexPath) as? ShoppingCellTableViewCell else {return UITableViewCell()}
        let shopping = ShoppingController.sharedController.shoppingArray[indexPath.row]
        
        cell.shopping = shopping
        cell.delegate = self
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let shopping = ShoppingController.sharedController.shoppingArray[indexPath.row]
            ShoppingController.sharedController.delete(shopping: shopping)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
}
