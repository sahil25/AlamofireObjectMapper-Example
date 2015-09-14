//
//  ViewController.swift
//  CP4
//
//  Created by Sahil Shah on 12/09/2015.
//  Copyright © 2015 Sahil Shah. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import ObjectMapper
import AlamofireObjectMapper



class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var threeDayForecast: [JSON] = []
    var location: String?
    var weatherArray = [WeatherResponse]()
    var datas: [JSON] = []
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // loadDogs()
       
       loadGit()
       //  loadInstagram()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Mark: TableViewDataSource Protocol
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return threeDayForecast.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! TableViewCell
        let threeDay = threeDayForecast[indexPath.row]
        cell.label?.text = threeDay["day"].string
        cell.tempLabel?.text = threeDay["conditions"].string
        
        
        return cell
    }
    
   func loadGit()
    {
        let url = "https://raw.githubusercontent.com/tristanhimmelman/AlamofireObjectMapper/f583be1121dbc5e9b0381b3017718a70c31054f7/sample_json"
        
        Alamofire.request(.GET, url).response { request, response, result, error in
            let json = JSON(data: result!)
        
            let threeDay = json["three_day_forecast"].arrayValue as [JSON]
            self.threeDayForecast = threeDay
            
            let location = json["location"].string
            self.location = location
            self.tableView.reloadData()
            
          
          //    print(json)
          // let location = json["location"].string
          //  let weather = Mapper<WeatherResponse>().map(json)
            
          // print(location)
          //  print(threeDay)
    
            //ERROR
        
       Alamofire.request(.GET, url).responseObject{(response :WeatherResponse?, error: ErrorType?)in
           print(response?.location)
            }
          }
    }
    
    /*       // Instagram on TableView
    let data = datas[indexPath.row]
    cell.label?.text = data["filter"].string
    cell.tempLabel?.text = data["caption"]["text"].string
    

    
    func loadInstagram()
    {
        let url4 = "https://api.instagram.com/v1/tags/dogs/media/recent?client_id=b796b1c4faef458497bb95991c2b9b16"
        Alamofire.request(.GET, url4).response{ request, response, result, error in
            
            let json = JSON(data: result!)
            
            let data = json["data"].arrayValue as [JSON]
            self.datas = data
            self.tableView.reloadData()
            let dummy = data[0]["id"].string
            
            //self.results = data as? [AnyObject]
             print(data)
           // print(jsonObj)
           
            print(dummy)
            
        }
    }

    
    
    func loadDogs()
    {
        let url2 = "https://httpbin.org/get"
        Alamofire.request(.GET, url2).response{ request, response, result, error  in
            
            let swiftyJSON = JSON(data: result!)
            if let origin = swiftyJSON["origin"].string {
                print(origin)
            }
            // print(swiftyJSON)
            
        }
    } */
   
    
 
} //end of class

