//
//  FeedViewController.swift
//  Treehouse
//
//  Created by BoMin Lee on 1/10/24.
//

import UIKit

class FeedViewController: UIViewController {
    
    private var posts: [PostData] = [
        PostData(profileImageUrl: "",
                 memberName: "memberName",
                 branchDegree: 10,
                 createdAt: Date(),
                 content: "hhihihihihi",
                 postImageUrls: [],
                 reactions: [.init(content: "HIHIHIIHIHIHIHi",
                                   number: 5,
                                   isPushed: true)],
                 commentCount: 10)
    ]
    
    private var topView: UIView = {
        let view = UIView()
        return view
    }()
    
    private var treehouseImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .systemBlue
        return imageView
    }()
    
    private var treehouseNameLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendard(size: 18, weight: .bold)
        label.text = "점심팟"
        return label
    }()
    
    private lazy var changeTreehouseButton: UIButton = {
        let button = UIButton()
        button.setImage(TreehouseImageCollection.changeTreehouse, for: .normal)
        //        button.setTitle("트리하우스 변경", for: .normal)
        //        button.setTitleColor(.black, for: .normal)
        //        button.titleLabel?.font = .pretendard(size: 8)
        return button
    }()
    
    private var feedTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        addSubviews()
        makeConstraint()
        fetchFeeds()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setCornerRadius()
        self.view.setNeedsLayout()
    }
    
    private func configure() {
        self.feedTableView.delegate = self
        self.feedTableView.dataSource = self
        self.feedTableView.register(TreehallTableViewCell.self, forCellReuseIdentifier: TreehallTableViewCell.identifier)
        self.feedTableView.register(WritePostTableViewCell.self, forCellReuseIdentifier: WritePostTableViewCell.identifier)
        self.feedTableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
    }
    
    private func addSubviews() {
        view.addSubviews(topView, feedTableView)
        topView.addSubviews(treehouseImageView,
                            treehouseNameLabel,
                            changeTreehouseButton)
    }
    
    private func makeConstraint() {
        topView.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(56)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(60)
        }
        
        treehouseImageView.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.width.lessThanOrEqualTo(36)
            make.height.equalTo(treehouseImageView.snp.width)
        }
        
        treehouseNameLabel.snp.makeConstraints{ make in
            make.centerY.equalTo(treehouseImageView)
            make.leading.equalTo(treehouseImageView.snp.trailing).offset(8)
            make.trailing.greaterThanOrEqualTo(changeTreehouseButton.snp.leading).offset(-8)
        }
        
        changeTreehouseButton.snp.makeConstraints{ make in
            make.centerY.equalTo(treehouseImageView)
            make.trailing.equalToSuperview().inset(16)
            make.leading.greaterThanOrEqualTo(treehouseNameLabel.snp.trailing)
            make.height.equalTo(changeTreehouseButton.snp.width).multipliedBy(48/32)
        }
        
        feedTableView.snp.makeConstraints{ make in
            make.top.equalTo(topView.snp.bottom)
            make.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
    }
    
    private func setCornerRadius() {
        treehouseImageView.layer.cornerRadius = treehouseImageView.bounds.width/2
    }
    
    private func fetchFeeds() {
        TreehouseNetworkManager.shared.fetchFeed(treeId: 1) { [weak self] value, error in
            guard let self = self else { return }
            self.posts = value?.posts ?? []
            print(value, error)
        }
    }
}

extension FeedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2 + posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0: return TreehallTableViewCell.makeCell(tableView)
        case 1: return WritePostTableViewCell.makeCell(tableView)
        default:
            guard let post = posts[safe: indexPath.row-2] else { return UITableViewCell() }
            return PostTableViewCell.makeCell(tableView,
                                              post: post)
        }
    }
    
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return switch indexPath.row {
        case 0: 112
        case 1: 56
        default: 56
        }
    }
}
