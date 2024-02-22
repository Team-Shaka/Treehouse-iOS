//
//  TreehousePopUpViewController.swift
//  Treehouse
//
//  Created by BoMin Lee on 2/23/24.
//

import UIKit

class TreehousePopUpViewController: UIViewController {
    
    var popUpType: PopUpType
    weak var delegate: TreehousePopUpDelegate?
    
    private var mainContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        return view
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.font = .pretendard(size: 22, weight: .bold)
        return label
    }()
    
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .pretendard(size: 16)
        label.lineBreakMode = .byCharWrapping
        return label
    }()
    
    private var labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 9
        return stackView
    }()
    
    private var leftButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = .pretendard(size: 18)
        button.clipsToBounds = true
        button.layer.cornerRadius = 17.5
        return button
    }()
    
    private var rightButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .trPrimaryGray
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = .pretendard(size: 18)
        button.clipsToBounds = true
        button.layer.cornerRadius = 17.5
        // MARK: Change to StringCollection
        button.setTitle("취소", for: .normal)
        return button
    }()
    
    private var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 5
        return stackView
    }()
    
    init(type: PopUpType) {
        self.popUpType = type
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        addSubviews()
        makeConstraint()
    }
    
    private func configure() {
        self.view.backgroundColor = .trDimGray
        
        switch popUpType {
        //MARK: Change to StringCollections
        case .treehouseChange:
            self.titleLabel.text = "트리하우스 변경"
            self.descriptionLabel.text = "다른 트리하우스의 알림입니다. 해당 트리하우스로 변경하시겠습니까?"
            self.leftButton.setTitle("변경", for: .normal)
        case .reportPost:
            self.titleLabel.text = "포스트 신고"
            self.descriptionLabel.text = "해당 포스트를 신고하시겠습니까?"
            self.leftButton.setTitle("신고", for: .normal)
        case .deletePost:
            self.titleLabel.text = "포스트 삭제"
            self.descriptionLabel.text = "정말 해당 포스트를 삭제하시겠습니까?"
            self.leftButton.setTitle("삭제", for: .normal)
        case .deleteComment:
            self.titleLabel.text = "댓글 삭제"
            self.descriptionLabel.text = "정말 해당 포스트를 삭제하시겠습니까?"
            self.leftButton.setTitle("삭제", for: .normal)
        }
        
        self.leftButton.addTarget(self, action: #selector(leftButtonAction), for: .touchUpInside)
        self.rightButton.addTarget(self, action: #selector(rightButtonAction), for: .touchUpInside)
    }
    
    private func addSubviews() {
        self.view.addSubviews(mainContainerView)
        self.mainContainerView.addSubviews(labelStackView)
        self.mainContainerView.addSubviews(buttonStackView)
        
        [ self.titleLabel, self.descriptionLabel ].forEach { labelStackView.addArrangedSubview($0) }
        [ self.leftButton, self.rightButton ].forEach { buttonStackView.addArrangedSubview($0) }
    }
    
    private func makeConstraint() {
        mainContainerView.snp.makeConstraints{ make in
            make.center.equalToSuperview()
            make.width.equalTo(309)
        }
        
        labelStackView.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(28)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().inset(24)
        }
        
        buttonStackView.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.descriptionLabel.snp.bottom).offset(18)
            make.bottom.lessThanOrEqualToSuperview().inset(20)
        }
        
        leftButton.snp.makeConstraints{ make in
            make.width.equalTo(132)
            make.height.equalTo(35)
        }
        
        rightButton.snp.makeConstraints{ make in
            make.width.equalTo(132)
            make.height.equalTo(35)
        }
        
        mainContainerView.snp.remakeConstraints{ make in
            make.center.equalToSuperview()
            make.width.equalTo(309)
            make.bottom.equalTo(self.buttonStackView.snp.bottom).offset(20)
        }
    }
    
    @objc func leftButtonAction() {
        self.delegate?.leftButtonTapped(self)
        self.dismiss(animated: false)
    }
    
    @objc func rightButtonAction() {
        self.delegate?.rightButtonTapped(self)
        self.dismiss(animated: false)
    }
}

enum PopUpType {
    case treehouseChange
    case reportPost
    case deletePost
    case deleteComment
}

protocol TreehousePopUpDelegate: AnyObject {
    func leftButtonTapped(_ popupViewController: TreehousePopUpViewController)
    func rightButtonTapped(_ popupViewController: TreehousePopUpViewController)
}
