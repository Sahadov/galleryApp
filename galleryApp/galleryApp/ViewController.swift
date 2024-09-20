//
//  ViewController.swift
//  galleryApp
//
//  Created by Дмитрий Волков on 19.09.2024.
//

import UIKit

class ViewController: UIViewController {

    let tableView = UITableView()
    
    var artistsList = [Artist]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        let anonymousFunction = { (fetchedArtistsList: [Artist]) in
            DispatchQueue.main.async {
                self.artistsList = fetchedArtistsList
                self.tableView.reloadData()
                print(self.artistsList)
            }
        }
        GalleryAPI.shared.fetchGallery(onCompletion: anonymousFunction)
        
    }
    
    func setupView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.backgroundColor = .systemGray
        tableView.dataSource = self
        tableView.register(ArtistCell.self, forCellReuseIdentifier: "cell")
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artistsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ArtistCell
        cell.artistImage.image = UIImage(named: artistsList[indexPath.row].image)
        cell.artistName.text = artistsList[indexPath.row].name
        cell.artistInfo.text = artistsList[indexPath.row].bio.shorted(to: 50)
        return cell
    }
    
    
}
