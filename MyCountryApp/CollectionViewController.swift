//
//  CollectionViewController.swift
//  MyCountryApp
//
//  Created by Nurluay Sharifova on 21.09.24.
//

import UIKit

class CollectionViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var collectionView: UICollectionView!
    let countries: [Country] = [
        Country(name: "Azerbaijan", image: "Azerbaijan", city: [
            CityData(name: "Baku", image:  "Baku", description: "Baku is the capital and largest city of Azerbaijan")
        ]),
        Country(name: "Turkey", image: "Turkey", city: [
            CityData(name: "Istanbul", image:  "Istanbul", description: "Istanbul"),
            CityData(name: "Ankara", image:  "Ankara", description: "Ankara is the capital city of Turkey")
        ]),
        Country(name: "France", image: "France", city: [
            CityData(name: "Paris", image:  "Paris", description: "Paris")
        ]),
        Country(name: "Germany", image: "Germany", city: [
            CityData(name: "Berlin", image:  "Berlin", description: "Berlin is the capital and largest city of Germany")
        ]),
        Country(name: "England", image: "England", city: [
            CityData(name: "London", image:  "London", description: "London is the capital and largest city of England")
        ])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        title = "List of Countries"
        navigationItem.largeTitleDisplayMode = .automatic
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        countries.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
        
        cell.configure(data: countries[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let columns: CGFloat = 2
        let collectionViewWidth = collectionView.bounds.width
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let spaceBetweenCells = flowLayout.minimumInteritemSpacing * (columns - 1)
        let adjustedWidth = collectionViewWidth - spaceBetweenCells
        let width: CGFloat = adjustedWidth / columns
        let height: CGFloat = width
        return CGSize(width: width, height: height)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let controller = storyboard?.instantiateViewController(withIdentifier: "CityCollectionViewController") as! CityCollectionViewController
        
        controller.countryTitle = countries[indexPath.row].name
        controller.city = countries[indexPath.row].city
        
        navigationController?.show(controller, sender: nil)
    }
    
}
