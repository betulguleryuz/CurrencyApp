//
//  LanguageViewController.swift
//  CurrencyApp
//
//  Created by betul on 28.10.2020.
//  Copyright © 2020 betul. All rights reserved.
//

import UIKit

class LanguageViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var languageTab: UITabBarItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        label.text = NSLocalizedString("language_support", comment: "")
        
    }
    
    @IBAction func turkish(_ sender: Any) {
        UserDefaults.standard.set("tr", forKey: "language_support")
        UserDefaults.standard.synchronize()

        // Update the language by swaping bundle
        Bundle.setLanguage("tr")
        
        label.text = NSLocalizedString("language_support", comment: "")
        
        languageTab.title = NSLocalizedString("settings", comment: "")
    }
    
    @IBAction func english(_ sender: Any) {
        UserDefaults.standard.set("en", forKey: "language_support")
        UserDefaults.standard.synchronize()
        
        // Update the language by swaping bundle
        Bundle.setLanguage("en")
        
        label.text = NSLocalizedString("language_support", comment: "")
        
        languageTab.title = NSLocalizedString("settings", comment: "")
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
