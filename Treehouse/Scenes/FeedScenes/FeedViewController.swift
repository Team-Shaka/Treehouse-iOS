//
//  FeedViewController.swift
//  Treehouse
//
//  Created by BoMin Lee on 1/10/24.
//

import UIKit
import FittedSheets

class FeedViewController: UIViewController {
    
    private var posts: [PostData] = []
    
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
        button.addTarget(self, action: #selector(changeTreehouseButtonTapped), for: .touchUpInside)
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
        tableView.rowHeight = UITableView.automaticDimension
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
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
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
            make.top.equalTo(view.safeAreaLayoutGuide)
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
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(16)
            //            make.leading.greaterThanOrEqualTo(treehouseNameLabel.snp.trailing)
            make.height.equalTo(treehouseImageView)
            make.width.equalTo(changeTreehouseButton.snp.height)
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
//            print(value, error)
//            self.posts = value ?? []
                self.posts = [PostData(postId: 3,
                                       authorId: 1,
                                       profileImageUrl: value?.first?.profileImageUrl ?? "",
                                       memberName: "Member1",
                                       content: "좀 돼라.",
                                       postImageUrls: ["https://gist.github.com/Jeonhui/47927f5a1d7c57dfbf464da9af955230/raw/ae901f897c7edadcdc4d0cb6039995927519a72f/AppIcon.png", "https://gist.github.com/Jeonhui/47927f5a1d7c57dfbf464da9af955230/raw/0a85c4e9743e19bfe4b577e99607d1b7cdf41a93/briefing.png", "https://gist.github.com/Jeonhui/47927f5a1d7c57dfbf464da9af955230/raw/0a85c4e9743e19bfe4b577e99607d1b7cdf41a93/DailyQuest.png"],
                                       createdAt: "2024-02-24",
                                       commentCount: 13,
                                       reactions: []),
                              PostData(postId: 2,
                                       authorId: 1,
                                       profileImageUrl: value?.first?.profileImageUrl ?? "",
                                       memberName: "Member1",
                                       content: "Testing",
                                       postImageUrls: [],
                                       createdAt: "2024-02-24",
                                       commentCount: 13,
                                       reactions: []),
                              PostData(postId: 1,
                                       authorId: 1,
                                       profileImageUrl: value?.first?.profileImageUrl ?? "",
                                       memberName: "Member1",
                                       content: "Treehouse",
                                       postImageUrls: ["https://gist.github.com/Jeonhui/47927f5a1d7c57dfbf464da9af955230/raw/0a85c4e9743e19bfe4b577e99607d1b7cdf41a93/mellaAppIcon.png", "https://gist.github.com/Jeonhui/47927f5a1d7c57dfbf464da9af955230/raw/55aca5bee1f10e17dbc429cb2dff3e7abcb66a50/GUCCI.png"],
                                       createdAt: "2024-02-24",
                                       commentCount: 13,
                                       reactions: [])]
                self.feedTableView.reloadData()
            }
    }
        
    @objc func changeTreehouseButtonTapped() {
        let treehouseSelectionBottomSheetViewController = TreehouseSelectionBottomSheetViewController()
        let sheetController = SheetViewController(controller: treehouseSelectionBottomSheetViewController, sizes: [ .percent(0.5) , .fullscreen ])
        sheetController.dismissOnPull = true
        sheetController.overlayColor = .trDimGray
        sheetController.minimumSpaceAbovePullBar = 50
        sheetController.gripSize = CGSize(width: 89, height: 3)
        sheetController.gripColor = .trPrimaryGray
        sheetController.cornerRadius = 30
        self.present(sheetController, animated: true, completion: nil)
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
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return switch indexPath.row {
        case 0: 112
        case 1: 100
        default: 200
        }
    }
}
