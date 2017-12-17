//
//  DAHomeViewModel.swift
//  DemoAPI
//
//  Created by Amit on 17/12/2015 SAKA.
//  Copyright © 2017 saffron. All rights reserved.
//

import UIKit

protocol homeViewModelDelegate {
    func reponseReceived(data: Any?, error: NSError?)
}

class DAHomeViewModel {
    var delegate: homeViewModelDelegate?
    func homeAPI() {
        DANetworkManger.shared.delegate = self
        DANetworkManger.shared.postMethod()
    }
}
extension DAHomeViewModel:DANetworkManagerDelegate {
    func dataReceived(data: Any?, error: NSError?) {
        
        self.delegate?.reponseReceived(data: data, error: nil)
    }
    
    
}
