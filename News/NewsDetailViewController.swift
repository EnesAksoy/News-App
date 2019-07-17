//
//  NewsDetailViewController.swift
//  News
//
//  Created by ENES AKSOY on 10.07.2019.
//  Copyright © 2019 ENES AKSOY. All rights reserved.
//

import UIKit

class NewsDetailViewController: UIViewController {
    
    var newsDetail:String?
    @IBOutlet weak var detailText: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        detailText.text = newsDetail
        
    }
}
