//
//  BaseTableViewCell.swift
//  CollectionView_In_TableView
//
//  Created by Ryo Endo on 2019/03/09.
//  Copyright © 2019年 Anna Yuki. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellTitleLabel: UILabel!
    @IBOutlet weak var scrollCollectionView: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //delegateとdatasourceを使えるようにする。
    func setCollectionViewDelegate<Datasource: UICollectionViewDataSource, Delegate: UICollectionViewDelegate>(dataSource: Datasource, delegate: Delegate, forRow row: Int) {
        let nib = UINib(nibName: "ScrollCollectionViewCell", bundle: Bundle.main)
        scrollCollectionView.register(nib, forCellWithReuseIdentifier: "ScrollCollectionViewCell")
        scrollCollectionView.delegate = delegate
        scrollCollectionView.dataSource = dataSource
        scrollCollectionView.tag = row
        scrollCollectionView.reloadData()
    }
    
}
