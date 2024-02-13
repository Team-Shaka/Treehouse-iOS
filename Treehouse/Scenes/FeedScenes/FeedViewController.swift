//
//  FeedViewController.swift
//  Tree
//
//  Created by BoMin Lee on 1/10/24.
//

import UIKit

class FeedViewController: UIViewController {
    private var topView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    private var treeHouseNameLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private lazy var changeTreeHouseButton: UIButton = {
        let button = UIButton()
        
        return button
    }()
    
    private var feedTableView: UITableView = {
        let tableView = UITableView()
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        addSubviews()
        makeConstraint()
    }
    
    private func configure() {
        
    }
    
    private func addSubviews() {
        
    }
    
    private func makeConstraint() {
        
    }
}
