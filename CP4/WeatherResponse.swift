//
//  WeatherResponse.swift
//  CP4
//
//  Created by Sahil Shah on 12/09/2015.
//  Copyright © 2015 Sahil Shah. All rights reserved.
//

import Foundation
import ObjectMapper
import AlamofireObjectMapper

public protocol Mappable {
    init?(_ map: Map)
    mutating func mapping(map: Map)
}


class WeatherResponse: Mappable {
    var location: String?
    var threeDayForecast: [Forecast]?
    
    
    required init?(_ map: Map){
        
    }
    
   /* class func newInstance() -> Mappable {
        return WeatherResponse()
    }*/
    
    func mapping(map: Map) {
        location <- map["location"]
        threeDayForecast <- map["three_day_forecast"]
    }
}

class Forecast: Mappable {
    var day: String?
    var temperature: Int?
    var conditions: String?
    
    required init?(_ map: Map){
        
    }
    
    /*class func newInstance() -> Mappable {
        return Forecast()
    }*/
    
    func mapping(map: Map) {
        day <- map["day"]
        temperature <- map["temperature"]
        conditions <- map["conditions"]
}
}