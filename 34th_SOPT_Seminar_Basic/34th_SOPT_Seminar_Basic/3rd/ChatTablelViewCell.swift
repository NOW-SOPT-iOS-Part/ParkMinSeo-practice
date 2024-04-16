//
//  ChatTablelViewCell.swift
//  34th_SOPT_Seminar_Basic
//
//  Created by 박민서 on 4/20/24.
//

import UIKit

final class ChatTablelViewCell: UITableViewCell {
    
    static let identifier = "ChatTablelViewCell"
    
    private let profileImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: "Pretendard-Bold", size: 15)
        return label
    }()
    
    private let placeLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 156, green: 156, blue: 156, alpha: 1)
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Bold", size: 12)
        return label
    }()
    
    private let chatLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Bold", size: 14)
        return label
    }()
       
    private let itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.cornerRounding()
        return imageView
    }()
    
    override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
    ) {
        super.init(
            style: style,
            reuseIdentifier: reuseIdentifier
        )
        profileImageView.backgroundColor = .red
        nameLabel.text = "test"
        chatLabel.text = "test"
        placeLabel.text = "test"
        itemImageView.backgroundColor = .blue
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        [profileImageView, nameLabel, placeLabel, chatLabel, itemImageView].forEach {
            contentView.addSubview($0)
        }
        
        profileImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(40)
        }
        
        nameLabel.snp.makeConstraints {
            $0.leading.equalTo(profileImageView.snp.trailing).offset(16)
            $0.top.equalToSuperview().offset(16.5)
        }
        
        placeLabel.snp.makeConstraints {
            $0.leading.equalTo(nameLabel.snp.trailing).offset(4)
            $0.centerY.equalTo(nameLabel)
        }
        chatLabel.snp.makeConstraints {
            $0.top.equalTo(placeLabel.snp.bottom).offset(4)
            $0.leading.equalTo(nameLabel)
        }
        itemImageView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(40)
        }
    }
}

extension ChatTablelViewCell {
    func dataBind(_ model: ChatModel) {
        self.profileImageView.image = model.profileImg
        self.nameLabel.text = model.name
        self.placeLabel.text = model.place
        self.chatLabel.text = model.message
        self.itemImageView.image = model.itemImg
    }
}

#Preview {
    ChatTablelViewCell()
}
