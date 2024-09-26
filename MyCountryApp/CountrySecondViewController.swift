//
//  CountrySecondViewController.swift
//  MyCountryApp
//
//  Created by Nurluay Sharifova on 20.09.24.
//

import UIKit

class CountrySecondViewController: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let countries: [Country] = [
         Country(name: "Azerbaijan", image: "Azerbaijan", city: CityData(name: "Baku", image: UIImage(named: "Azerbaijan")!, description: "Description of Baku")),
         Country(name: "Turkey", image: "Turkey", city: CityData(name: "Istanbul", image: UIImage(named: "Turkey")!, description: "Istanbul")),
         Country(name: "France", image: "France", city: CityData(name: "Paris", image: UIImage(named: "France")!, description: "Paris")),
         Country(name: "Germany", image: "Germany", city: CityData(name: "Berlin", image: UIImage(named: "Germany")!, description: "Berlin")),
         Country(name: "England", image: "England", city: CityData(name: "London", image: UIImage(named: "England")!, description: "London"))
     ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "List of Conutries"
        navigationItem.largeTitleDisplayMode = .automatic
        navigationController?.navigationBar.prefersLargeTitles = true
        collectionView.delegate = self
           collectionView.dataSource = self
       
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

          let columns: CGFloat = 4
          let collectionViewWidth = collectionView.bounds.width
          let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
          let spaceBetweenCells = flowLayout.minimumInteritemSpacing * (columns - 1)
          let adjustedWidth = collectionViewWidth - spaceBetweenCells
          let width: CGFloat = adjustedWidth / columns
          let height: CGFloat = 100
          return CGSize(width: width, height: height)
      }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        countries.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
              let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "countrySecondVC", for: indexPath as IndexPath) as! CountryCollectionCellView
              
        cell.configure(data: countries[indexPath.row])

              
              return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           print("You selected cell #\(indexPath.item)!")
       }
    
    

    
    
    
    
}
