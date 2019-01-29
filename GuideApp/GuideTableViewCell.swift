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
    let labelHeight: CGFloat = 25
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        nameLabel = UILabel()
        nameLabel.textAlignment = .left
        nameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        locationLabel = UILabel()
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        
        endDateLabel = UILabel()
        endDateLabel.translatesAutoresizingMaskIntoConstraints = false
        endDateLabel.textAlignment = .left
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(locationLabel)
        contentView.addSubview(endDateLabel)
        
    }
    
    //Set constraints of the labels
    override func updateConstraints() {
        
        nameLabel.snp.makeConstraints { (make) in
            make.width.equalToSuperview().offset(-32)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(labelHeight)
            make.top.equalToSuperview().offset(10)
        }
        
        locationLabel.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview().offset(-16)
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
            make.height.equalTo(labelHeight)
            make.width.equalToSuperview().dividedBy(2).offset(-5)
        }
        
        endDateLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(16)
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
            make.height.equalTo(labelHeight)
            make.width.equalToSuperview().dividedBy(2).offset(-5)
        }
        
        super.updateConstraints()
    }
    
    //Configure the texts of the cell's labels using the specified Guide struct
    func configure(for guide: Guide) {
        
        nameLabel.text = guide.name
        endDateLabel.text = "Ends - \(guide.endDate)"
        
        if(guide.venue.city == nil && guide.venue.city == nil) {
            locationLabel.text = ""
        } else {
            locationLabel.text = "\(String(describing: guide.venue.city)), \(String(describing: guide.venue.state))"
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
