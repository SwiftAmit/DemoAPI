//
//  DANetworkManager.swift
//  DemoAPI
//
//  Created by Amit on 17/12/2015 SAKA.
//  Copyright © 2017 saffron. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

protocol DANetworkManagerDelegate {
    func dataReceived(data: Any?, error: NSError?)
}


class DANetworkManger {
    
    
    var delegate: DANetworkManagerDelegate?
    static let shared = DANetworkManger()
    let reachabilityManager = Alamofire.NetworkReachabilityManager(host: "www.google.com")
    
    func startNetworkReachabilityObserver() {
        
        reachabilityManager?.listener = { status in
            switch status {
            case .notReachable:
                print("The network is not reachable")
            case .unknown :
                print("It is unknown whether the network is reachable")
            case .reachable(.ethernetOrWiFi):
                print("The network is reachable over the WiFi connection")
            case .reachable(.wwan):
                print("The network is reachable over the WWAN connection")
                
            }
        }
        
        // start listening
        reachabilityManager?.startListening()
    }
    func isConnectedToInternet() ->Bool {
        return NetworkReachabilityManager()!.isReachable
    }
    func postMethod() {
        let serverURL = "https://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1"
     //   DASwiftLoader.show(animated: true)
        if isConnectedToInternet() {
        Alamofire.request(serverURL, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            print(response)
            switch response.result {
            case .success:
                guard let json = response.result.value else {
                    return
                }
                self.delegate?.dataReceived(data: JSON(json), error: nil)
            case .failure(let error):
                _ = DASwiftAlert().showAlert("API Error:\(error)")
              //  self.delegate?.dataReceived(data: nil, error: error as NSError)
            }
            }
        } else {
             DASwiftLoader.hide()
            _ = DASwiftAlert().showAlert("Network Error")
        }
    }
}
