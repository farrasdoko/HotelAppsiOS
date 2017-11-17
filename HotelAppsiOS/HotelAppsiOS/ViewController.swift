//
//  ViewController.swift
//  HotelAppsiOS
//
//  Created by Gw on 17/11/17.
//  Copyright © 2017 Gw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblnh: UILabel!
    @IBOutlet weak var lblala: UILabel!
    @IBOutlet weak var lblrate: UILabel!
    @IBOutlet weak var lblfasi: UILabel!
    @IBOutlet weak var lblloter: UILabel!
    @IBOutlet weak var lblrate2: UILabel!
    
    var passnh:String?
    var passala:String?
    var passrate:String?
    var passfasi:String?
    var passloter:String?
    var passrate2:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblnh.text = passnh!
        lblala.text = passala!
        lblrate.text = passrate!
        lblfasi.text = passfasi!
        lblloter.text = passloter!
        lblrate2.text = passrate2!
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

