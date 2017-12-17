//
//  DAHomeModel.swift
//  DemoAPI
//
//  Created by Amit on 17/12/2015 SAKA.
//  Copyright © 2017 saffron. All rights reserved.
//

import UIKit
import SwiftyJSON


class DAHomeModel {
    let name:String
    let image:String
    init(name:String,image:String) {
        self.name = name
        self.image = image
    }
    class func parseDataFromJSON(json: JSON) -> [DAHomeModel] {
        var imageDataArray: [DAHomeModel] = []
        
        guard let dataArray = json["daily"]["data"].array else {
            print("No array")
            return []
        }
        
        for data in dataArray {
            guard let name = data["name"].string,
                let image = data["image"].string else {
                    print("Error with data")
                    return []
            }
            let imageData = DAHomeModel(name: name, image: image)
            imageDataArray.append(imageData)
        }
        
        return imageDataArray
    }
    
}
