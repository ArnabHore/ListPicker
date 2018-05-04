//
//  ViewController.swift
//  ListPicker
//
//  Created by Arnab Hore on 10/03/18.
//  Copyright © 2018 Arnab Hore. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
//    @IBOutlet weak var table: UITableView!
//    @IBOutlet weak var bgView: UIView!
    
    let selectedIndex = 0
    
    let arr = ["India", "China", "USA", "UK", "India", "China", "USA", "UK", "India", "China", "USA", "UK", "India", "China", "USA", "UK"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let controller = ListPicker()
        controller.view.frame = self.view.bounds;
        self.view.addSubview(controller.view)
        self.addChildViewController(controller)
        controller.didMove(toParentViewController: self)

        
//        table.contentInset = UIEdgeInsetsMake(self.view.convert(self.view.center, to: table).y - 20, 0, self.view.convert(self.view.center, to: table).y, 0)
//        table.separatorStyle = .none
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//extension ViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return arr.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "pickerCell", for: indexPath)
//
//        cell.textLabel?.text = arr[indexPath.row]
//        cell.textLabel?.textColor = UIColor.lightGray
//        cell.textLabel?.textAlignment = .center
//        cell.textLabel?.font = UIFont.systemFont(ofSize: 16.0, weight: .medium)
//
//        if indexPath.row == selectedIndex {
//            cell.textLabel?.textColor = .black
//            cell.textLabel?.transform = CGAffineTransform.init(scaleX: 1.2, y: 1.2)
//        }
//
//        return cell
//    }
//}

//extension ViewController: UITableViewDelegate {
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        UIView.animate(withDuration: 0.5) {
//            if let visibleRows = self.table.indexPathsForVisibleRows {
//                for indexPath in visibleRows {
//                    let cell = self.table.cellForRow(at: indexPath)
//                    cell?.textLabel?.textColor = .lightGray
////                    cell?.textLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
//                    UIView.animate(withDuration: 0.5, animations: {
//                        cell?.textLabel?.transform = CGAffineTransform.init(scaleX: 1.0, y: 1.0)
//                    })
//                }
//            }
//            if let middleIp = self.table.indexPathForRow(at: self.view.convert(self.view.center, to: self.table)) {
//                let middleCell = self.table.cellForRow(at: middleIp)
//                middleCell?.textLabel?.textColor = .black
////                middleCell?.textLabel?.font = UIFont.systemFont(ofSize: 16.0, weight: .bold)
//                UIView.animate(withDuration: 0.5, animations: {
//                    middleCell?.textLabel?.transform = CGAffineTransform.init(scaleX: 1.2, y: 1.2)
//                })
//            }
//        }
//    }
//}

