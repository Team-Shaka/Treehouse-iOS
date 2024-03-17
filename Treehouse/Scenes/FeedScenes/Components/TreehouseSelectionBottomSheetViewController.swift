//
//  TreehouseSelectionBottomSheetViewController.swift
//  Treehouse
//
//  Created by BoMin Lee on 2/23/24.
//

import UIKit
import FittedSheets

class TreehouseSelectionBottomSheetViewController: UIViewController {
    var treehouses: [TreehouseData] = []
    
    private var treehouseSelectionTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        addSubviews()
        makeConstraint()
    }
    
    private func configure() {
        treehouseSelectionTableView.delegate = self
        treehouseSelectionTableView.dataSource = self
        
        treehouseSelectionTableView.register(TreehouseSelectionTableViewCell.self, forCellReuseIdentifier: TreehouseSelectionTableViewCell.identifier)
        treehouseSelectionTableView.register(TreehouseCreateTableViewCell.self, forCellReuseIdentifier: TreehouseCreateTableViewCell.identifier)
    }
    
    
    
    private func addSubviews() {
        self.view.addSubview(treehouseSelectionTableView)
    }
    
    private func makeConstraint() {
        treehouseSelectionTableView.snp.makeConstraints{ make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(10)
        }
    }
}

extension TreehouseSelectionBottomSheetViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return treehouses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case treehouses.count-1: return TreehouseCreateTableViewCell.makeCell(tableView)
        default: return TreehouseSelectionTableViewCell.makeCell(tableView, treehouse: treehouses[indexPath.row])
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
}
