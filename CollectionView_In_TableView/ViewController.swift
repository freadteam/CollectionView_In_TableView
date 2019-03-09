//
//  ViewController.swift
//  CollectionView_In_TableView
//
//  Created by Ryo Endo on 2019/03/09.
//  Copyright © 2019年 Anna Yuki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tableCellArray = ["ios", "swift", "xcode"]
    
    @IBOutlet weak var baseTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
    }
    
    func configureTableView() {
        baseTableView.dataSource = self
        baseTableView.delegate = self
        
        let cell = UINib(nibName: "BaseTableViewCell", bundle: Bundle.main)
        baseTableView.register(cell, forCellReuseIdentifier: "BaseTableViewCell")
        //レイアウト調整
        baseTableView.separatorStyle = .none
        baseTableView.tableFooterView = UIView()
        baseTableView.rowHeight = 400.0
    }

}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BaseTableViewCell") as! BaseTableViewCell
        cell.setCollectionViewDelegate(dataSource: self, delegate: self, forRow: indexPath.row)
        return cell
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.tag {
        case 0:
            return 5
        case 1 :
            return 3
        case 2:
            return 2
        default:
            return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ScrollCollectionViewCell", for: indexPath) as! ScrollCollectionViewCell
        cell.scrollImageView.image = UIImage(named: "iosLogo.png")
        
        return cell
    }
    
    
}

