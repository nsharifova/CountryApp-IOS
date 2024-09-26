//
//  CityCollectionViewController.swift
//  MyCountryApp
//
//  Created by Nurluay Sharifova on 21.09.24.
//

import UIKit

class CityCollectionViewController: UIViewController, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout  {
    
    
    var city : [CityData] = []
    var countryTitle: String?
    @IBOutlet weak var cityCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityCollectionView.delegate = self
        cityCollectionView.dataSource = self
       
  
        if let countryTitle = countryTitle {
            title = countryTitle
        }
        navigationItem.largeTitleDisplayMode = .automatic
        navigationController?.navigationBar.prefersLargeTitles = true
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        city.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
        cell.configureCity(data: city[indexPath.row])
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
    
    
}
