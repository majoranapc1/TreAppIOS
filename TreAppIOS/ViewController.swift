//
//  ViewController.swift
//  Prova2
//
//  Created by Mariarosa Savoldi on 01/03/18.
//  Copyright © 2018 Mariarosa Savoldi. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, EventModelProtocol{
    
    //Properties
    var feedItems: NSArray = NSArray()
    var selectedEvent : Event = Event()
    
    
    @IBOutlet weak var Test_tabella: UITableView!
    @IBOutlet weak var titolo: UILabel!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.Test_tabella.delegate = self;
        self.Test_tabella.dataSource = self;
        
        let EventModel2 = EventModel()
        EventModel2.delegate = self
        EventModel2.downloadItems(link: "http://www.majorapp.it/treapp/eventi.php?biblio=10" , type: "Event")
    
        
    }
    
    
    func itemsDownloaded(items: NSArray) {
        feedItems = items
        self.Test_tabella.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        /*return 7 */ return feedItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier: String = "BasicCell"
        let myCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
        
        let item: Event = feedItems [indexPath.row] as! Event
        print(item.titolo)
        myCell.textLabel?.text = item.descrizione
        return myCell
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

