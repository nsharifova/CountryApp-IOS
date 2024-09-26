//
//  CountyViewController.swift
//  MyCountryApp
//
//  Created by Nurluay Sharifova on 15.09.24.
//

import UIKit

class CountyViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let countries: [Country] = [
        Country(name: "Azerbaijan", image: "Azerbaijan", city: [
            CityData(name: "Baku", image:  "Azerbaijan", description: "Baku is the capital and largest city of Azerbaijan")
        ]),
        Country(name: "Turkey", image: "Turkey", city: [
            CityData(name: "Istanbul", image:  "Turkey", description: "Istanbul"),
            CityData(name: "Ankara", image:  "Ankara", description: "Ankara is the capital city of Turkey")
        ]),
        Country(name: "France", image: "France", city: [
            CityData(name: "Paris", image:  "France", description: "Paris")
        ]),
        Country(name: "Germany", image: "Germany", city: [
            CityData(name: "Berlin", image:  "Germany", description: "Berlin is the capital and largest city of Germany")
        ]),
        Country(name: "England", image: "England", city: [
            CityData(name: "London", image: "England", description: "London is the capital and largest city of England")
        ])
    ]
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        title = "List of Countries"
        navigationItem.largeTitleDisplayMode = .automatic
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as! CountryTableCellView
        cell.configure(data: countries[indexPath.row])
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "CityViewController") as! CityViewController
        controller.city = countries[indexPath.row].city[0]
        navigationController?.show(controller,sender: nil)
        
    }
    
    
}
