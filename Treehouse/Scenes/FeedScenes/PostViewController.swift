//
//  PostViewController.swift
//  Treehouse
//
//  Created by BoMin Lee on 3/2/24.
//

import UIKit

class PostViewController: UIViewController {
    var postId: Int = 0
    
    private var postDetail: PostDetailData! {
        didSet {
            update()
        }
    }
    private var comments: [CommentData] = []
    
    private var topView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(TreehouseImageCollection.arrowLeft, for: .normal)
        button.addTarget(self, action: #selector(goBackToFeedViewController), for: .touchUpInside)
        return button
    }()
    
    private var treehouseTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "트리하우스이름"
        label.font = .pretendard(size: 18, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    private var postView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    
    
    init(postId: Int) {
        super.init(nibName: nil, bundle: nil)
        self.postId = postId
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        addSubviews()
        makeConstraint()
        fetchPost()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.hidesBottomBarWhenPushed = true
    }
    
    private func configure() {
        
    }
    
    private func addSubviews() {
        self.view.addSubviews(topView, postView)
        
        topView.addSubviews(backButton, treehouseTitleLabel)
//        postView.addSubviews(<#T##views: UIView...##UIView#>)
    }
    
    private func makeConstraint() {
        topView.snp.makeConstraints{ make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(60)
        }
        
        backButton.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(30)
        }
        
        treehouseTitleLabel.snp.makeConstraints{ make in
            make.leading.equalTo(backButton.snp.trailing).offset(4)
            make.centerY.equalToSuperview()
        }
        
        postView.snp.makeConstraints{ make in
            make.top.equalTo(topView.snp.bottom)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func fetchPost() {
        TreehouseNetworkManager.shared.fetchPost(treeId: 1, postId: 1) { [weak self] value, error in
            guard let self = self else { return }
            print(value, error)
//            self.postDetail = value ?? nil
        }
    }
    
    private func update() {
        
    }
    
    @objc func goBackToFeedViewController() {
        self.navigationController?.popViewController(animated: false)
    }
}

extension PostViewController {
    
}

//extension PostViewController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//    
//    
//}
