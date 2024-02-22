//
//  CommentCountView.swift
//  Treehouse
//
//  Created by 이전희 on 2/23/24.
//

import UIKit

class CommentCountView: UIView {
    
    var count: Int {
        didSet {
            updateLayout()
        }
    }
    
    private var mainContainerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = .trButtonBackground
        view.layer.borderColor = UIColor.trButtonBorder.cgColor
        view.layer.borderWidth = 0.5
        view.setCornerMask(masks: [.layerMinXMaxYCorner,
                                   .layerMaxXMaxYCorner,
                                   .layerMaxXMinYCorner])
        return view
    }()
    
    private var commentCountLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendard(size: 14)
        label.textColor = .trButtonSelectedBorder
        return label
    }()

    init(count: Int) {
        self.count = count
        super.init(frame: .zero)
        configure()
        addSubviews()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        
    }
    
    private func addSubviews() {
        self.addSubviews(mainContainerView)
        mainContainerView.addSubviews(commentCountLabel)
    }
    
    private func makeConstraints() {
        self.snp.makeConstraints { make in
            make.height.equalTo(mainContainerView)
        }
        
        self.mainContainerView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(40)
        }
        
        self.commentCountLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(14)
            make.centerY.equalToSuperview()
        }
    }
    
    private func updateLayout() {
        self.commentCountLabel.text = "\(count) Comments"
    }
    
    func setCommentCount(_ count: Int) {
        self.count = count
    }
}
