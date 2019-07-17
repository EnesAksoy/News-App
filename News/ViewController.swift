//
//  ViewController.swift
//  News
//
//  Created by ENES AKSOY on 8.07.2019.
//  Copyright © 2019 ENES AKSOY. All rights reserved.
//

import UIKit
import AEXML
import Alamofire
import SDWebImage

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    var titles = [String]()
    var descriptions = [String]()
    var urls = [String]()
    var newsImageUrls = [String]()
    
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.myTableView.rowHeight = 145.0
        Alamofire.request("http://www.trt.net.tr/rss/cevre.rss").response { (response) in
            
            guard let xmlData = response.data else {return}
            
            let options = AEXMLOptions()
            
            do{
               let xmlDoc = try AEXMLDocument(xml: xmlData, options: options)
              //  print(xmlDoc.root["channel"]["item"]["title"].value!)
                if let items = xmlDoc.root["channel"]["item"].all{
                   
                    for item in items {
//                        if let title = item["title"].value{
//                            print(title)
//                        }
//                        if let description = item["description"].value{
//                            print(description)
//                        }
//                        if let link = item["link"].value{
//                            print(link)
//                        }
                        
                        self.titles.append(item["title"].string)
                        self.descriptions.append(item["description"].string)
                        self.urls.append(item["link"].string)
                        let enclosure = item["enclosure"]
                        if let newsImageUrl = enclosure.attributes["url"]{
                           // print(newsImageUrl)
                            self.newsImageUrls.append(newsImageUrl)
                        }
                    }
                }
                
                self.myTableView.reloadData()
               
            }catch{
                
            }
        }
    }
    // Tableview İşlemleri
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! NewTableViewCell
        
        let imageView = cell.viewWithTag(1) as! UIImageView
        imageView.sd_setImage(with: URL(string: newsImageUrls[indexPath.row]))
        
        cell.title.text = titles[indexPath.row]
        cell.url.text = urls[indexPath.row]
        
        
        
        return cell
    }
    // Herhangi bir satıra tılamanın algılanması
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        
        let newsDetailVC = storyboard?.instantiateViewController(withIdentifier: "NewsDetailsVC") as! NewsDetailViewController
        newsDetailVC.newsDetail = descriptions[indexPath.row]
       
        self.present(newsDetailVC, animated: true, completion: nil)
        
    }
}

