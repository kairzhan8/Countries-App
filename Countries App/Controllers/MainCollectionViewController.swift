//
//  MainCollectionViewController.swift
//  Countries App
//
//  Created by Kairzhan Kural on 8/19/20.
//  Copyright © 2020 Kairzhan Kural. All rights reserved.
//

import UIKit

class MainCollectionViewController: UICollectionViewController {
    
    @IBOutlet var countryCV: UICollectionView!
    
    private let jsonUrl = "https://restcountries.eu/rest/v2/all"
    private var countries: [Country] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        print(countries)
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return countries.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "country", for: indexPath) as! CountryCell
        
        let country = countries[indexPath.item]
        cell.configure(with: country)
    
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let countryDetailVC = segue.destination as! CountryDetailViewController
        let cell = sender as! UICollectionViewCell
        let indexPath = collectionView.indexPath(for: cell)
        countryDetailVC.country = countries[indexPath!.row]
    }
    
    
    
    func fetchData() {
        guard let url = URL(string: jsonUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            
            guard let data = data else { return }
            
                do {
                    self.countries = try JSONDecoder().decode([Country].self, from: data)
                    DispatchQueue.main.async {
                        self.countryCV.reloadData()
                    }
                } catch let error {
                    print(error)
                }
        }.resume()
        print(countries)
    }

}

