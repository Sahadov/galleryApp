//
//  ArtistCell.swift
//  galleryApp
//
//  Created by Дмитрий Волков on 19.09.2024.
//

import UIKit

class ArtistCell: UITableViewCell {
    
    let artistImage = UIImageView()
    let artistName = UILabel()
    let artistInfo = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    func setupView(){
        self.backgroundColor = .systemGray
        setupImageView()
        setupArtistName()
        setupArtistInfo()
    }
    
    func setupImageView() {
        addSubview(artistImage)
        artistImage.translatesAutoresizingMaskIntoConstraints = false
        artistImage.backgroundColor = .red
        NSLayoutConstraint.activate([
            artistImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            //artistImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            artistImage.topAnchor.constraint(equalTo: self.topAnchor),
            artistImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            artistImage.widthAnchor.constraint(equalToConstant: 100),
            artistImage.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    func setupArtistName() {
        addSubview(artistName)
        artistName.translatesAutoresizingMaskIntoConstraints = false
        artistName.font = UIFont(name: "Verdana-Bold", size: 18)
        artistName.textColor = .black
        NSLayoutConstraint.activate([
            artistName.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            artistName.leadingAnchor.constraint(equalTo: artistImage.trailingAnchor, constant: 20)
        ])
    }
    
    func setupArtistInfo() {
        addSubview(artistInfo)
        artistInfo.translatesAutoresizingMaskIntoConstraints = false
        artistInfo.font = UIFont(name: "Verdana", size: 16)
        artistInfo.textColor = .black
        artistInfo.numberOfLines = 0
        NSLayoutConstraint.activate([
            artistInfo.topAnchor.constraint(equalTo: artistName.bottomAnchor, constant: 10),
            artistInfo.leadingAnchor.constraint(equalTo: artistImage.trailingAnchor, constant: 20),
            artistInfo.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
    }
}
