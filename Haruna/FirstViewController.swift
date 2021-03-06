//
//  FirstViewController.swift
//  Haruna
//
//  Created by keigo on 2017/05/03.
//  Copyright © 2017年 tan5. All rights reserved.
//

import UIKit
import RealmSwift

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, OnSaveEventDelegate {

    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var newButton: UIBarButtonItem!

    var items:Results<Event>!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self

        let realm = try! Realm()
        items = realm.objects(Event.self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        print(items[indexPath.row].name)
        cell.textLabel?.text = items[indexPath.row].name
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {        
        performSegue(withIdentifier: "toNewEventViewController", sender: items[indexPath.row].id)
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == UITableViewCell.EditingStyle.delete){
            do{
                let realm = try! Realm()
                try! realm.write {
                    realm.delete(items[indexPath.row])
                    tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.left)
                }
            }
            tableView.reloadData();
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "toNewEventViewController"){
            print("Preparing segue (delegate reference)")
            let navigationController : UINavigationController = segue.destination as! UINavigationController
            let newEventView : NewEventViewController = navigationController.topViewController as! NewEventViewController
            newEventView.savedDelegate = self
            if(sender is String){
                newEventView.id = sender as! String
            }
        }
    }

    func saved() {
        print("calling callback")
        tableView.reloadData()
    }
}
