//
//  ViewController.swift
//  CurrencyApp
//
//  Created by betul on 27.10.2020.
//  Copyright © 2020 betul. All rights reserved.
//

import UIKit
import Foundation
import FirebaseAnalytics

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var lastUpdateLabel: UILabel!
    
    @IBOutlet weak var currencyTableView: UITableView!
    
    private var arrayOfCurrency: [Currency] = []
    
    var timer : Timer!
    
    var count: Int = -1
    
    var lastUpdated = "Updating..."
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        ///Firebase Analytics
        Analytics.logEvent(AnalyticsEventSelectContent, parameters: [
            AnalyticsParameterItemID: "my_item_id"
        ])
        
        self.lastUpdated = NSLocalizedString("waiting", comment: "")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getCurrency()
        
        cTimer()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayOfCurrency.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return currencyTableView.rowHeight + 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CurrencyTableViewCell
        
        let row = self.arrayOfCurrency[indexPath.row]
        
        cell.currencyNameLabel.text = row.code
        
        cell.currencyRateLabel.text = String(String(format: "%.2f", row.rate) )
        
        switch String(row.code) {
        case "USD":
            cell.currencyImageView.image = UIImage(named: "usd")
            break
        case "EUR":
            cell.currencyImageView.image = UIImage(named: "eur")
            break
        case "GBP":
            cell.currencyImageView.image = UIImage(named: "gbp")
            break
        case "INR":
            cell.currencyImageView.image = UIImage(named: "inr")
            break
        case "AUD":
            cell.currencyImageView.image = UIImage(named: "aud")
            break
        case "CAD":
            cell.currencyImageView.image = UIImage(named: "cad")
            break
        case "SGD":
            cell.currencyImageView.image = UIImage(named: "sgd")
            break
        case "CHF":
            cell.currencyImageView.image = UIImage(named: "chf")
            break
        case "MYR":
            cell.currencyImageView.image = UIImage(named: "myr")
            break
        case "JPY":
            cell.currencyImageView.image = UIImage(named: "jpy")
            break
        default:
            cell.currencyImageView.image = UIImage(named: "none")
            break
        }
        
        return cell
    }
    
    var PING_TIMER_INTERVAL =  0.1   // 0.1 seconds
    
    func cTimer(){
        print("timer")
        self.timer = Timer.scheduledTimer(timeInterval: PING_TIMER_INTERVAL, target: self, selector: #selector(loadData), userInfo: nil, repeats: true)
    }
    
    func stopcTimer(){
        if(self.timer != nil){
            self.timer.invalidate();
            self.timer = nil;
        }
    }
    
    @objc func loadData(){
        if self.arrayOfCurrency.count == self.count-1{
            stopcTimer()
            DispatchQueue.main.async {
                self.currencyTableView.reloadData()
                self.lastUpdateLabel.text = self.lastUpdated
            }
        }
    }
    
    func getCurrency(){
        let headers = [
                 "content-type": "application/json",
                 "authorization": "apikey 4TeJkEGkNXsU4AoOwFWdGN:6aWkKqGwx8rjv7n1AkngA0"
               ]

               let request = NSMutableURLRequest(url: NSURL(string: "https://api.collectapi.com/economy/currencyToAll?int=10&base=USD")! as URL,
                                                       cachePolicy: .useProtocolCachePolicy,
                                                   timeoutInterval: 10.0)
               request.httpMethod = "GET"
               request.allHTTPHeaderFields = headers

               let session = URLSession.shared
               let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
                   
                   if let data = data {
                       /*let json = try? JSONSerialization.jsonObject(with: data, options: [])
                       print(json as Any)*/

                    
                    do {
                        let decoder = JSONDecoder()
                        let response = try decoder.decode(Root.self, from: data)
                        
                        self.lastUpdated = response.result.lastupdate
                        
                        self.count = response.result.data.count
                        
                        for i in 0..<(response.result.data.count-1){
                             self.arrayOfCurrency.append(Currency.init(code: response.result.data[i].code, name: "", rate: response.result.data[i].rate, calculatedstr: "", calculated: 0.0)!)
                            print(self.arrayOfCurrency[i].code)
                        }
                        
                        } catch let err {
                          print("Err", err)
                            DispatchQueue.main.async {
                                self.alertMessage(title: "Service not running!")
                            }
                    }
                    
                   }
                 if (error != nil) {
                   //print(error as Any)
                 } else {
                   let httpResponse = response as? HTTPURLResponse
                   //print(httpResponse as Any)
                 }
                   
               })

               dataTask.resume()
    }
    
    func alertMessage(title: String){
        let alert = UIAlertController(title: title, message: "", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

