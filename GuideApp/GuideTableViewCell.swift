//
//  GuideTableViewCell.swift
//  GuideApp
//
//  Created by Theodore Carrel on 1/27/19.
//  Copyright © 2019 Theodore Carrel. All rights reserved.
//

import UIKit
import SnapKit

class GuideTableViewCell: UITableViewCell {
    
    var nameLabel: UILabel!
    var locationLabel: UILabel!
    var endDateLabel: UILabel!
    var iconImage: UIImage!
    var iconView: UIImageView!
//    let labelHeight: CGFloat = 25
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        nameLabel = UILabel()
        nameLabel.textAlignment = .left
        nameLabel.numberOfLines = 0
        nameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        locationLabel = UILabel()
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        
        endDateLabel = UILabel()
        endDateLabel.translatesAutoresizingMaskIntoConstraints = false
        endDateLabel.textAlignment = .left
        
        iconView = UIImageView();
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(locationLabel)
        contentView.addSubview(endDateLabel)
        contentView.addSubview(iconView)
        
    }
    
    //Set constraints of the labels
    override func updateConstraints() {
        
        nameLabel.snp.makeConstraints { (make) in
            make.width.equalToSuperview().dividedBy(2)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.top.equalToSuperview().offset(10)
        }
        
        locationLabel.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview().offset(-16)
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
//            make.height.equalTo(labelHeight)
            make.width.equalToSuperview().dividedBy(2).offset(-5)
        }
        
        endDateLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(16)
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
//            make.height.equalTo(labelHeight)
            make.width.equalToSuperview().dividedBy(2).offset(-5)
            make.bottom.equalToSuperview().offset(-5)
        }
        
        iconView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(5)
            make.bottom.equalToSuperview().offset(-5)
            make.trailing.equalToSuperview().offset(-5)
        }
        
        super.updateConstraints()
    }
    
    //Configure the texts of the cell's labels using the specified Guide struct
    func configure(for guide: Guide) {
        
        nameLabel.text = guide.name
        endDateLabel.text = "Ends - \(guide.endDate)"
        
        
        loadImageData(url: guide.icon)
        
        if(guide.venue.city == nil && guide.venue.city == nil) {
            locationLabel.text = ""
        } else {
            locationLabel.text = "\(String(describing: guide.venue.city)), \(String(describing: guide.venue.state))"
        }
    }
    
    func loadImageData(url: String) {
        
        DispatchQueue.global(qos: DispatchQoS.QoSClass.background).async {
            guard let imageUrl = URL(string: url) else { return }
            
            
            URLSession.shared.dataTask(with: imageUrl) { (data, response, err) in
                
                guard let data = data else {return}
                
                let fetchedIconImage = UIImage(data: data)
                
                
                DispatchQueue.main.async {
                    self.iconView.image = fetchedIconImage
                }
            }.resume()
        }
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
