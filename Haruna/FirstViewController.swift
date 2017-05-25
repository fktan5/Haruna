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
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        print(items[indexPath.row].name)
        cell.textLabel?.text = items[indexPath.row].name
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toNewEventViewController", sender: items[indexPath.row])
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == UITableViewCellEditingStyle.delete){
            do{
                let realm = try! Realm()
                try! realm.write {
                    realm.delete(items[indexPath.row])
                    tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.left)
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
            if(sender is Event){
                newEventView.event = sender as! Event
            }
        }
    }

    func saved() {
        print("calling callback")
        tableView.reloadData()
    }
}
