//
//  MyTableViewCell.swift
//  testArchive
//
//  Created by 하연주 on 2023/11/23.
//

import UIKit

final class MyTableViewCell: UITableViewCell {
    //✅ 1) UI정의 ✅
//    let mainImageView : UIImageView = {
//        let imageView = UIImageView()
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        return imageView
//    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
//        label.backgroundColor = .blue
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.numberOfLines = 0
//        label.backgroundColor = .gray
        return label
    }()
    
    let stackView : UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical //가로로 배치하는가 세로로 배치하는가
        sv.distribution  = .fill
//        sv.spacing = 30
        sv.backgroundColor = .orange
        
        return sv
    }()
    
//    private let stackViewHeight : CGFloat = 120
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupStackView()
    }
    
    //⭐️⭐️⭐️⭐️ 오토레이아웃 정하는 정확한 시점
    override func updateConstraints() {
//        self.contentView.backgroundColor = .brown
        self.backgroundColor = .purple
        
        
        print("🌸🌸🌸🌸", #function)
        print("🌸🌸🌸🌸",self.contentView.heightAnchor)
        print("🌸🌸🌸🌸",self.heightAnchor)
        print("🌸🌸🌸🌸",type(of: self)) //MyTableViewCell
        
        setConstraints()
        super.updateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    //✅ 3) stackView 지정 ✅
    func setupStackView() {
        
        // 뷰컨트롤러의 기본뷰 위에 스택뷰 올리기
        self.addSubview(stackView)
        
        // 스택뷰 위에 뷰들 올리기
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(descriptionLabel)
    }
    
    func setConstraints() {
        setNameLabelConstraints()
        setStackViewConstraints()
    }

    //✅ 2) Constraints 지정해주기 ✅
    
    func setNameLabelConstraints() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.heightAnchor.constraint(equalToConstant: 22)
        ])
    }
    
    func setStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
//            stackView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
//            stackView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),  //self.contentView.centerYAnchor 랑 self.centerYAnchor랑 왜 다른거야..
            stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor), //⭐️⭐️⭐️⭐️ UITableViewCell 에서 요소들 중간에 놓으려면
            
            stackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),

            
        ])
    }

}

//UITableViewCell each cell height
