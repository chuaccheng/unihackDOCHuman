//
//  MainTableViewController.swift
//  unihack.estimote
//
//  Created by Terra on 30/07/2016.
//  Copyright © 2016 self. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController, ESTBeaconManagerDelegate {
    
    var images = ["YauImage", "ChengImage", "TherrenseImage"]

    var names = ["Ms. Yau Hui Min", "Ms. Cheng Chua", "Mr. Therrense Lua"]
    var genderDOB = ["Female, 26/08/1994", "Female, 21/06/1995", "Male, 08/02/1995"]
    var medicare = ["Medicare #12793876512", "Medicare #12233876512", "Medicare #13033876512"]
    var UR = ["UR: 1859384", "UR: 18323384", "UR: 123323384"]

    
    // Add the property holding the data.
    // TODO: replace "<major>:<minor>" strings to match your own beacons
    let placesByBeacons = [
        "58359:34066": [
            "Heavenly Sandwiches": 50, // read as: it's 50 meters from
            // "Heavenly Sandwiches" to the beacon with
            // major 6574 and minor 54631
            "Green & Green Salads": 150,
            "Mini Panini": 325
        ]
    ]
    
    
    // 2. Add the beacon manager and the beacon region
    let beaconManager = ESTBeaconManager()
    let beaconRegion = CLBeaconRegion(
        proximityUUID: NSUUID(UUIDString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D")!,
        identifier: "ranged region")
    
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //tableView.backgroundColor = UIColor.


        
        // 3. Set the beacon manager's delegate
        self.beaconManager.delegate = self
        // 4. We need to request this authorization for every beacon manager
        self.beaconManager.requestAlwaysAuthorization()
        
    }

    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.beaconManager.startRangingBeaconsInRegion(self.beaconRegion)
    }
    
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        self.beaconManager.stopRangingBeaconsInRegion(self.beaconRegion)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return names.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("customCell", forIndexPath: indexPath) as! CustomTableViewCell
        
        cell.patientName.text = names[indexPath.row]
        cell.patientGenderDOB.text = genderDOB[indexPath.row]
            
        cell.medicare.text = medicare[indexPath.row]
        cell.UR.text = UR[indexPath.row]
        cell.language.text = "English"
        cell.ethnicity.text = "Chinese"
        
        let imageName = UIImage(named: images[indexPath.row])
        
        
        cell.patientImage.image = imageName


        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
    func placesNearBeacon(beacon: CLBeacon) -> [String]? {
        let beaconKey = "\(beacon.major):\(beacon.minor)"
        if let places = self.placesByBeacons[beaconKey] {
            let sortedPlaces = Array(places).sort() { $0.1 < $1.1 }.map { $0.0 }
            return sortedPlaces
        }
        return nil
    }
    
    func beaconManager(manager: AnyObject, didRangeBeacons beacons: [CLBeacon],
                       inRegion region: CLBeaconRegion) {
        if let nearestBeacon = beacons.first, places = placesNearBeacon(nearestBeacon) {
            // TODO: update the UI here
            
            
            print(places) // TODO: remove after implementing the UI
        }
    }

}
