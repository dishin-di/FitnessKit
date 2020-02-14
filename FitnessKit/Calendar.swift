//
//  Calendar.swift
//  FitnessKit
//
//  Created by Всеволод Козлов on 13.02.2020.
//  Copyright © 2020 Всеволод Козлов. All rights reserved.
//

import UIKit

class Calendar: UITableViewController, HTTPReadDelegate {
    
    func reloadData() {
        print("Refresh")
        self.tableView.reloadData()
        self.refreshControl?.endRefreshing()
    }
    
    
    let http = HTTPRead()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        http.getURLRequest(urlStr: "https://sample.fitnesskit-admin.ru/schedule/get_group_lessons_v2/1/")
        print("ViewDidLoad complete")
        http.delegate = self
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
    }

    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return http.fitModel.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as! eventCell
        cell.nameLabel.text = http.fitModel[indexPath.row].name
        cell.weekDayStrLabel.text = http.fitModel[indexPath.row].weekDayStr
        cell.startTimeLabel.text = http.fitModel[indexPath.row].startTime
        cell.endTimeLabel.text = http.fitModel[indexPath.row].endTime
        cell.teacherLabel.text = http.fitModel[indexPath.row].teacher
        cell.placeLabel.text = http.fitModel[indexPath.row].place
        cell.descriptionLabel.text = http.fitModel[indexPath.row].description
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
