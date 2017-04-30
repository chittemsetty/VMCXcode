//
//  ViewController.swift
//  maptest
//
//  Created by Venu Chittemsetty on 3/5/16.
//  Copyright © 2016 Vedya Wonders. All rights reserved.
//

import UIKit
import CoreData
import MapKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var mapTableView: UITableView!
    var destinations: [Destination] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mapTableView.dataSource = self
        self.mapTableView.delegate = self
       // createTestDestinations()
    }
    override func viewWillAppear(animated: Bool) {
        let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        let request = NSFetchRequest(entityName: "Destination")
        do {
        try self.destinations = context.executeFetchRequest(request) as! [Destination]
        } catch {}
        self.mapTableView.reloadData()
    }
    func createTestDestinations(){
        let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        
        let destination1 = NSEntityDescription.insertNewObjectForEntityForName("Destination", inManagedObjectContext: context) as! Destination
        destination1.name = "Tokyo"
        destination1.latt = 35.689487
        destination1.longi = 139.691706
        destination1.lattDelta = 5
        destination1.longiDelta = 5

        let destination2 = NSEntityDescription.insertNewObjectForEntityForName("Destination", inManagedObjectContext: context) as! Destination
        destination2.name = "Hyderabad"
        destination2.latt = 17.385044
        destination2.longi = 78.486671
        destination2.lattDelta = 5
        destination2.longiDelta = 5
        do {
        try context.save()
        } catch {}
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.destinations.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let destination = self.destinations[indexPath.row]
        let cell = self.mapTableView.dequeueReusableCellWithIdentifier("mapCell") as! MapCell
        cell.nameLabel.text = destination.name
        
        let coordinates = CLLocationCoordinate2DMake(destination.latt!.doubleValue, destination.longi!.doubleValue)
        let span = MKCoordinateSpanMake(destination.lattDelta!.doubleValue, destination.longiDelta!.doubleValue)
        let region = MKCoordinateRegionMake(coordinates, span)
        cell.mapView.setRegion(region, animated: true)
    
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    

}

