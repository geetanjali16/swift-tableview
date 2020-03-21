//
//  ViewController.swift
//  todolistapp
//
//  Created by Ashok Mishra on 19/05/19.
//  Copyright © 2019 Ashok Mishra. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController, AddItemViewControllerDelegate {
    func addItemViewControllerDidCancel(_ controller: AddItemTableViewController) {
        navigationController?.popViewController(animated: true)
    }
    
    func addItemViewController(_ controller: AddItemTableViewController, didFinishAdding item: CheckListItem) {
        
        let newRowIndex = items.count
        items.append(item)
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
        navigationController?.popViewController(animated: true)
    }
    
    
    var items: [CheckListItem]
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        
        items = [CheckListItem]()
        
        let row0Item = CheckListItem()
        row0Item.text = "walk the dog"
        row0Item.checkMark = false
        items.append(row0Item)
        
        let row1Item  = CheckListItem()
        row1Item.text = "iOS development"
        row1Item.checkMark = false
        items.append(row1Item)
        
        let row2Item = CheckListItem()
        row2Item.text = "Brush my teeth"
        row2Item.checkMark = false
        items.append(row2Item)
        
        let row3Item = CheckListItem()
        row3Item.text = "Eat ice-cream"
        row3Item.checkMark = false
        items.append(row3Item)
        
        let row4Item = CheckListItem()
        row4Item.text = "MacBook Pro"
        row4Item.checkMark = false
        items.append(row4Item)
        
        let row5Item = CheckListItem()
        row5Item.text = "lets make todo list app"
        row5Item.checkMark = false
        items.append(row5Item)
        
        let row6Item = CheckListItem()
        row6Item.text = "complete the todo app as soon as possible"
        row6Item.checkMark = false
        items.append(row6Item)
        
        super.init(coder: aDecoder)
        
        
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
//        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddItem" {
            let controller = segue.destination as! AddItemTableViewController
            controller.delegate = self
        }
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        items.remove(at: indexPath.row)
//        let indexPaths = [indexPath]
//        tableView.deleteRows(at: indexPaths, with: .automatic)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath){
            
            let item = items[indexPath.row]
            item.toggleCheckMark()
            
            
            configureCheckMark(for: cell, with: item)
            tableView.deselectRow(at: indexPath, animated: true)

        }
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        
        let item = items[indexPath.row]
        
        configureText(for: cell, with: item)
        configureCheckMark(for: cell, with: item)
        return cell 
    }
    
    func configureText(for cell: UITableViewCell, with item:CheckListItem){
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text

    }
    
    func configureCheckMark(for cell:UITableViewCell, with item: CheckListItem){
        
        
        if item.checkMark{
            cell.accessoryType = .checkmark
        }else {
            cell.accessoryType = .none
        }
    }
    
    @IBAction func addItem(_ sender: Any) {
        
        let newRowIndex = items.count
        let item = CheckListItem()
        
        var titles = ["empty to do item", "Generic todo", "first todo: fill me out", "I need something to do", "much to do about nothing"]
        let randomNumber = arc4random_uniform(UInt32(titles.count))
        let title = titles[Int(randomNumber)]
        item.text = title
        
        
        
//        item.text = "It's a new row"
        item.checkMark = false
        items.append(item)
        
        let indexPath = IndexPath(row: newRowIndex, section:0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
    }
    


}

