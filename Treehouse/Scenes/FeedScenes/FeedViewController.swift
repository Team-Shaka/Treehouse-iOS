//
//  FeedViewController.swift
//  Treehouse
//
//  Created by BoMin Lee on 1/10/24.
//

import UIKit

class FeedViewController: UIViewController {
    private var topView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemPink
        return view
    }()
    
    private var treehouseImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private var treehouseNameLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendard(size: 18, weight: .bold)
        return label
    }()
    
    private lazy var changeTreehouseButton: UIButton = {
        let button = UIButton()
        button.setImage(TreehouseImageCollection.changeTreehouse, for: .normal)
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
        view.addSubviews(topView)
        
        topView.addSubviews(treehouseImageView, treehouseNameLabel, changeTreehouseButton)
    }
    
    private func makeConstraint() {
        topView.snp.makeConstraints{ make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(60)
        }
        
        treehouseImageView.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.height.width.equalTo(36)
        }
        
        changeTreehouseButton.snp.makeConstraints{ make in
            make.centerY.equalTo(treehouseImageView)
            make.trailing.equalToSuperview().inset(16)
            make.width.equalTo(48)
            make.height.equalTo(32)
        }
        
        treehouseNameLabel.snp.makeConstraints{ make in
            make.centerY.equalTo(treehouseImageView)
            make.leading.equalTo(treehouseImageView.snp.trailing).offset(8)
        }
    }
}
