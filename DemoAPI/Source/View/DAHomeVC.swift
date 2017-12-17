//
//  DAHomeVC.swift
//  DemoAPI
//
//  Created by Amit on 17/12/2015 SAKA.
//  Copyright © 2017 saffron. All rights reserved.
//

import UIKit

class DAHomeVC: UIViewController {
    let viewModel:DAHomeViewModel = DAHomeViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.homeAPI()
        viewModel.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
extension DAHomeVC:homeViewModelDelegate {
    func reponseReceived(data: Any?, error: NSError?) {
        print(data)
    }
    
    
}
