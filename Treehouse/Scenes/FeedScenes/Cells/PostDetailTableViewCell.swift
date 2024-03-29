//
//  PostDetailTableViewCell.swift
//  Treehouse
//
//  Created by BoMin Lee on 3/2/24.
//

import UIKit
import Kingfisher

class PostDetailTableViewCell: UITableViewCell {
    static let identifier: String = String(describing: PostDetailTableViewCell.self)
    
    var postDetail: PostDetailData! {
        didSet {
            update()
        }
    }
    
    private enum Const {
        static let itemSize = CGSize(width: 280, height: 280)
        static let itemSpacing = 12.0
        
        static var insetX: CGFloat {
            (UIScreen.main.bounds.width - Self.itemSize.width) / 2.0
        }
        
        static var collectionViewContentInset: UIEdgeInsets {
            UIEdgeInsets(top: 0, left: Self.insetX, bottom: 0, right: Self.insetX)
        }
    }
    
    private let collectionViewFlowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = Const.itemSize
        layout.minimumLineSpacing = Const.itemSpacing
        layout.minimumInteritemSpacing = 0
        return layout
    }()
    
    private var mainContainerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private var userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 18
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private var userNameLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendard(size: 16, weight: .semiBold)
        label.textColor = .black
        return label
    }()
    
    private var branchLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendard(size: 12)
        label.textColor = .trSubTextGray
        label.text = "Branch 2"
        return label
    }()
    
    private var branchAndDateSeparatorLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendard(size: 12)
        label.textColor = .trSubTextGray
        label.text = "·"
        return label
    }()
    
    private var dateLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendard(size: 12)
        label.textColor = .trSubTextGray
        label.text = "하루 전"
        return label
    }()
    
    private var postSettingButton: UIButton = {
        var buttonConfiguration = UIButton.Configuration.plain()
        buttonConfiguration.image = UIImage(systemName: "ellipsis")
        buttonConfiguration.baseForegroundColor = .trSubTextGray
        buttonConfiguration.setDefaultContentInsets()
        let button = UIButton(configuration: buttonConfiguration)
        return button
    }()
    
    private var contentContainerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private var contentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    private var contentImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private lazy var contentImageCollectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: self.collectionViewFlowLayout)
        view.isScrollEnabled = true
        view.showsHorizontalScrollIndicator = false
        view.showsVerticalScrollIndicator = false
        view.backgroundColor = .clear
        view.clipsToBounds = true
        view.isPagingEnabled = false
        view.contentInsetAdjustmentBehavior = .never
        view.contentInset = Const.collectionViewContentInset
        view.decelerationRate = .fast
//        view.contentMode = .scaleAspectFill
        return view
    }()
    
    private var previousIndex: Int? = 0
    
    override init(style: UITableViewCell.CellStyle,
                  reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
        addSubviews()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        
        self.contentImageCollectionView.delegate = self
        self.contentImageCollectionView.dataSource = self
        self.contentImageCollectionView.register(ContentImageCollectionViewCell.self, forCellWithReuseIdentifier: ContentImageCollectionViewCell.identifier)
    }
    
    func addSubviews() {
        self.contentView.addSubview(mainContainerView)
        mainContainerView.addSubviews(userImageView,
                                      contentContainerView)
        contentContainerView.addSubviews(userNameLabel,
                                         branchLabel,
                                         branchAndDateSeparatorLabel,
                                         dateLabel,
                                         postSettingButton,
                                         contentLabel,
                                         contentImageCollectionView)
    }
    
    func makeConstraints() {
        mainContainerView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(16)
            make.bottom.greaterThanOrEqualTo(userImageView).priority(.high)
            make.bottom.equalTo(contentContainerView).offset(16)
            make.bottom.equalTo(self.contentView).offset(10)
        }
        
        userImageView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
            make.width.height.equalTo(36)
        }
        
        contentContainerView.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview()
            make.leading.equalTo(userImageView.snp.trailing).offset(10)
            make.bottom.equalTo(contentImageCollectionView)
        }
        
        userNameLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
            make.height.equalTo(20)
        }
        
        branchLabel.snp.makeConstraints { make in
            make.leading.equalTo(userNameLabel.snp.trailing).offset(4)
            make.trailing.lessThanOrEqualTo(postSettingButton.snp.leading).inset(-8)
            make.centerY.equalTo(userNameLabel)
        }
        
        branchAndDateSeparatorLabel.snp.makeConstraints{ make in
            make.leading.equalTo(branchLabel.snp.trailing).offset(2)
            make.centerY.equalTo(branchLabel)
        }
        
        dateLabel.snp.makeConstraints{ make in
            make.leading.equalTo(branchAndDateSeparatorLabel.snp.trailing).offset(2)
            make.centerY.equalTo(branchAndDateSeparatorLabel)
        }
        
        postSettingButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(10)
            make.height.width.equalTo(18)
            make.centerY.equalTo(userNameLabel)
        }
        
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(userNameLabel.snp.bottom).offset(6)
            make.leading.trailing.equalToSuperview()
        }
        
        contentImageCollectionView.snp.makeConstraints{ make in
            make.top.equalTo(contentLabel.snp.bottom).offset(4)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(0)
        }
    }
    
    func update() {
        guard let url = URL(string: postDetail.profileImageUrl) else { return }
        self.userImageView.kf.setImage(with: url)
        self.userNameLabel.text = postDetail.memberName
        self.contentLabel.text = postDetail.content
        self.branchLabel.text = "Branch \(postDetail.branchDegree)"
        self.dateLabel.text = "\(postDetail.createdAt.substring(from: 0, to: 9))"
        
        if postDetail.postImageUrls.count > 0 {
            self.contentImageCollectionView.snp.removeConstraints()
            self.contentImageCollectionView.snp.makeConstraints{ make in
                make.top.equalTo(contentLabel.snp.bottom).offset(4)
                make.leading.trailing.equalToSuperview()
                make.height.equalTo(self.contentImageCollectionView.snp.width)
            }
        }
    }
}

extension PostDetailTableViewCell {
    static func makeCell(_ tableView: UITableView,
                         postDetail: PostDetailData) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostDetailTableViewCell.identifier) as? PostDetailTableViewCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        cell.postDetail = postDetail
        return cell
    }
}

extension PostDetailTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.postDetail.postImageUrls.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContentImageCollectionViewCell.identifier, for: indexPath) as! ContentImageCollectionViewCell
        cell.prepare(imageUrl: self.postDetail.postImageUrls[indexPath.row],
                     isDimmed: indexPath.item != previousIndex)
        return cell
    }
}

extension PostDetailTableViewCell: UICollectionViewDelegateFlowLayout {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let scrolledOffsetX = targetContentOffset.pointee.x + scrollView.contentInset.left
        let cellWidth = Const.itemSize.width + Const.itemSpacing
        let index = round(scrolledOffsetX / cellWidth)
        targetContentOffset.pointee = CGPoint(x: index * cellWidth - scrollView.contentInset.left, y: scrollView.contentInset.top)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrolledOffset = scrollView.contentOffset.x + scrollView.contentInset.left
        let cellWidth = Const.itemSize.width + Const.itemSpacing
        let index = Int(round(scrolledOffset / cellWidth))
        
        
        
        if let cell = self.contentImageCollectionView
            .cellForItem(at: IndexPath(item: index,
                                       section: 0)) as? ContentImageCollectionViewCell {
            UIView.animate(withDuration: 1) {
                cell.dimmedView.isHidden = true
            }
        }
        
        defer {
            self.previousIndex = index
            self.contentImageCollectionView.reloadData()
        }
        
        guard
            let previousIndex = self.previousIndex,
            previousIndex != index
        else { return }
        
        if let cell = self.contentImageCollectionView
            .cellForItem(at: IndexPath(item: previousIndex,
                                       section: 0)) as? ContentImageCollectionViewCell {
            UIView.animate(withDuration: 1) {
                cell.dimmedView.isHidden = false
            }
        }
    }
}
