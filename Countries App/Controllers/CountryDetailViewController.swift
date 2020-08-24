//
//  DetailTableViewController.swift
//  Countries App
//
//  Created by Kairzhan Kural on 8/25/20.
//  Copyright © 2020 Kairzhan Kural. All rights reserved.
//

import UIKit

class CountryDetailViewController: UIViewController {
    
    var country: Country!

    @IBOutlet var countryFlag: UIWebView!
    @IBOutlet var countryName: UILabel!
    @IBOutlet var countryCapital: UILabel!
    @IBOutlet var countryPopulation: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countryName.text = country.name
        countryCapital.text = country.capital
        countryPopulation.text = String(country.population)
        guard let imageUrl = URL(string: country.flag) else { return }

        //Creating a page request which will load our URL (Which points to our path)
        DispatchQueue.main.async {
            let request: NSURLRequest = NSURLRequest(url: imageUrl)
            self.countryFlag.loadRequest(request as URLRequest)  //Telling our webView to load our above request
        }
    }

}
