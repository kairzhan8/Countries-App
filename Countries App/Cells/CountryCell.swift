//
//  CountryCell.swift
//  Countries App
//
//  Created by Kairzhan Kural on 8/19/20.
//  Copyright © 2020 Kairzhan Kural. All rights reserved.
//

import UIKit

class CountryCell: UICollectionViewCell {
    
    
    @IBOutlet var countryFlag: UIWebView!
    @IBOutlet var countyName: UILabel!
    
    func configure(with country: Country) {
        countyName.text = country.name
        guard let imageUrl = URL(string: country.flag) else { return }

        //Creating a page request which will load our URL (Which points to our path)
        DispatchQueue.main.async {
            let request: NSURLRequest = NSURLRequest(url: imageUrl)
            self.countryFlag.loadRequest(request as URLRequest)  //Telling our webView to load our above request
        }
//        guard let imageUrl = URL(string: country.flag) else { return }
//        DispatchQueue.global().async {
//            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
//            DispatchQueue.main.async {
//                self.countryFlag.image = UIImage(data: imageData)
//            }
//        }
    }
    
}
