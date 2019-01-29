//
//  ViewController.swift
//  GuideApp
//
//  Created by Theodore Carrel on 1/27/19.
//  Copyright © 2019 Theodore Carrel. All rights reserved.
//

import UIKit
import SnapKit

class GuideViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tableView: UITableView!
    var Guides: [DateSection] = []
    let cellHeight: CGFloat = 70
    
    //Set up view's background color and call functions to set up tableview
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = .white
        getGuides()
        setupTableView()
        
    }
    
    //Instantiate tableview and set view constraints
    func setupTableView() {
        
        tableView = UITableView(frame: .zero)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(GuideTableViewCell.self, forCellReuseIdentifier: "GuideCell")
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
    
    //Function to fetch data from endpoint, group guides, then refresh tableview
    func getGuides() {
        
        NetworkManager.getGuides { guide in
            self.Guides = DateSection.group(guides: guide.data)
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.title = "Guides: \(guide.total) Total"
            }
        }
        
    }
    
    
    //Tableview Functions
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Guides.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = self.Guides[section]
        let startDate = section.startDate
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy"
        return "Starts: \(dateFormatter.string(from: startDate))"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let dateSection = self.Guides[section]
        return dateSection.guides.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "GuideCell", for: indexPath) as! GuideTableViewCell
        let dateSection = self.Guides[indexPath.section]
        let guide = dateSection.guides[indexPath.row]
        cell.configure(for: guide)
        cell.setNeedsUpdateConstraints()
        cell.selectionStyle = .none
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
}

