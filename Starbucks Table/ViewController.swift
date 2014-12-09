//
//  ViewController.swift
//  Starbucks Table
//
//  Created by Patrick Landin on 12/8/14.
//  Copyright (c) 2014 Patrick Landin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    var coffeeDrink = [Coffee]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var chestnut = Coffee()
        chestnut.faveCoffee = "Chestnut Praline Latte"
        
        var caramel = Coffee()
        caramel.faveCoffee = "Caramel Brulee Latte"
        
        var peppermint = Coffee()
        peppermint.faveCoffee = "Peppermint Mocha"
        
        coffeeDrink = [chestnut, caramel, peppermint]
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.coffeeDrink.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("COFFEE_CELL", forIndexPath: indexPath) as UITableViewCell
        
        var coffeeToDisplay = coffeeDrink[indexPath.row]
        cell.textLabel.text = coffeeToDisplay.faveCoffee
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SHOW_COFFEE"    {
            let detailViewController = segue.destinationViewController as DetailViewController
            let selectedIndexPath = self.tableView.indexPathForSelectedRow()
            var coffeeToPass = self.coffeeDrink[selectedIndexPath!.row]
            detailViewController.selectedCoffeeDrink = coffeeToPass
        }
        
    }


}

