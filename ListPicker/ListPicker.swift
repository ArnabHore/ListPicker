//
//  ListPicker.swift
//  ListPicker
//
//  Created by Arnab Hore on 28/03/18.
//  Copyright © 2018 Arnab Hore. All rights reserved.
//

import UIKit

class ListPicker: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var tableView: UITableView!
    
    let selectedIndex = 0
    let arr = ["India", "China", "USA", "UK", "India", "China", "USA", "UK", "India", "China", "USA", "UK", "India", "China", "USA", "UK"]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView = UITableView(frame: self.view.frame, style: .plain)
        self.tableView.register(ListPickerCell.self, forCellReuseIdentifier: "cell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.view.addSubview(self.tableView)
        self.tableView.contentInset = UIEdgeInsetsMake(self.view.convert(self.view.center, to: self.tableView).y - 40, 0, self.view.convert(self.view.center, to: self.tableView).y - 20, 0)
        self.tableView.separatorStyle = .none
        
        let upperView = UIView(frame: CGRect(x: 30.0, y: self.view.center.y - 25.0, width: UIScreen.main.bounds.width - 60.0, height: 1.0))
        upperView.backgroundColor = UIColor.gray
        self.view.addSubview(upperView)
        
        let lowerView = UIView(frame: CGRect(x: 30.0, y: self.view.center.y + 25.0, width: UIScreen.main.bounds.width - 60.0, height: 1.0))
        lowerView.backgroundColor = UIColor.gray
        self.view.addSubview(lowerView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ListPickerCell

        cell.textLabel?.text = arr[indexPath.row]
        cell.textLabel?.textColor = UIColor.lightGray
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.font = UIFont.systemFont(ofSize: 16.0, weight: .medium)
        
        if indexPath.row == selectedIndex {
            cell.textLabel?.textColor = .black
            cell.textLabel?.transform = CGAffineTransform.init(scaleX: 1.2, y: 1.2)
        }

        return cell
    }
    
    // MARK: - Table view delegate
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        UIView.animate(withDuration: 0.5) {
            if let visibleRows = self.tableView.indexPathsForVisibleRows {
                for indexPath in visibleRows {
                    let cell = self.tableView.cellForRow(at: indexPath)
                    cell?.textLabel?.textColor = .lightGray
                    UIView.animate(withDuration: 0.5, animations: {
                        cell?.textLabel?.transform = CGAffineTransform.init(scaleX: 1.0, y: 1.0)
                    })
                }
            }
            if let middleIp = self.tableView.indexPathForRow(at: self.view.convert(self.view.center, to: self.tableView)) {
                let middleCell = self.tableView.cellForRow(at: middleIp)
                middleCell?.textLabel?.textColor = .black
                UIView.animate(withDuration: 0.5, animations: {
                    middleCell?.textLabel?.transform = CGAffineTransform.init(scaleX: 1.2, y: 1.2)
                })
            }
        }
    }
}
