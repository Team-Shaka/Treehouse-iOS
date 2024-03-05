//
//  NotificationViewController.swift
//  Treehouse
//
//  Created by BoMin Lee on 2/13/24.
//

import UIKit

class NotificationViewController: UIViewController {
    private var notifications: [NotificationData] = []
    
    private var topView: UIView = {
        let view = UIView()
        return view
    }()
    
    private var notificationLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendard(size: 30, weight: .bold)
        label.text = "알림"
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    private var notificationTableView: UITableView = {
        let tableView = UITableView()
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        addSubviews()
        makeConstraint()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func configure() {
        notificationTableView.delegate = self
        notificationTableView.dataSource = self
        
        notificationTableView.register(NotificationTableViewCell.self, forCellReuseIdentifier: NotificationTableViewCell.identifier)
    }
    
    private func addSubviews() {
        view.addSubviews(topView, notificationTableView)
        
        topView.addSubview(notificationLabel)
    }
    
    private func makeConstraint() {
        topView.snp.makeConstraints{ make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(60)
        }
        
        notificationLabel.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
        }
        
        notificationTableView.snp.makeConstraints{ make in
            make.top.equalTo(topView.snp.bottom)
            make.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func fetchNotifcation() {
        TreehouseNetworkManager.shared.fetchNotification { [weak self] value, error in
            guard let self = self else { return }
//            print(value, error)
            self.notifications = value ?? []
            self.notificationTableView.reloadData()
        }
    }
}

extension NotificationViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.notifications.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let notification = notifications[safe: indexPath.row] else { return UITableViewCell() }
        let cell = NotificationTableViewCell.makeCell(tableView,
                                                      notification: notification)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
