//
//  UIViewUIStackViewPracticeViewController.swift
//  testArchive
//
//  Created by 하연주 on 2023/11/29.
//

import UIKit

class UIViewUIStackViewPracticeViewController: UIViewController {
    private lazy var emailTextFieldView : UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = 5
        view.clipsToBounds = true //radius설정할 떄 이것도 보통 같이 쓴다
        
        return view
    }()
    
    //"이메일 또는 전화번호" 안내문구
    private var emailInfoLabel : UILabel = {
        let label = UILabel()
        label.text = "이메일 주소 또는 전화번호"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .white
        
        return label
    }()
    
    private var emailTextField : UITextField = {
       let textField = UITextField()
        textField.frame.size.height = 48
        textField.backgroundColor = .clear
        textField.textColor = .white
        textField.tintColor = .white
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.spellCheckingType = .no
        textField.keyboardType = .emailAddress
        
//        textField.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        
        
        return textField
    }()
    private lazy var emailInfoLabelCenterYConstraint = emailInfoLabel.centerYAnchor.constraint(equalTo: emailTextFieldView.centerYAnchor)
    
    
    
    
    
    
    
    
    
    let movieNameLabel: UILabel = {
        let label = UILabel()
        label.text = "영화제목입니다"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "영화에 대한 설명입니다"
        label.font = UIFont.systemFont(ofSize: 17)
        label.numberOfLines = 0
        return label
    }()
    
    let stackView : UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution  = .fill
        sv.alignment = .fill
        sv.spacing = 8
        sv.backgroundColor = .brown
        return sv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        //⭐️⭐️⭐️ UIView ⭐️⭐️⭐️
        //이런식으로도 할 수 있나봄
//        let st = UIStackView(arrangedSubviews: [emailTextFieldView, passwordTextFieldView, loginButton])
        view.addSubview(emailTextFieldView)
        
        emailTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        emailInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        
        //그냥 UIView 위에 올렸을 때
        //🍑 addSubview : 위에 안내문구, 텍스트필드 얹혀주기 순서대로 얹힌다
        //🍑 emailTextFieldView가 private lazy 해야 한다!???
        emailTextFieldView.addSubview(emailInfoLabel) //emailTextFieldView를 private lazy var로 정의해줘야 한다
        emailTextFieldView.addSubview(emailTextField)
//        emailTextFieldView.addArrangedSubview(emailInfoLabel) //❌
//        emailTextFieldView.addArrangedSubview(emailTextField) //❌
        
        NSLayoutConstraint.activate([
            //emailTextFieldView를 기준으로 위로 얹혀진 것(emailInfoLabel, emailTextField)위치 지정해주기
            emailInfoLabel.leadingAnchor.constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 8),
            emailInfoLabel.trailingAnchor.constraint(equalTo: emailTextFieldView.trailingAnchor, constant: -8),
            //❌ 나중에 변경되는 레이아웃이기때문에 이렇게 정의해두면 안된다
//            emailInfoLabel.centerYAnchor.constraint(equalTo: emailTextFieldView.centerYAnchor, constant: 0), //label 과 textField를 y축을 동일하게
            //⭕️
            emailInfoLabelCenterYConstraint,
            
            emailTextField.leadingAnchor.constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 8),
            emailTextField.trailingAnchor.constraint(equalTo: emailTextFieldView.trailingAnchor, constant: -8),
            emailTextField.topAnchor.constraint(equalTo: emailTextFieldView.topAnchor, constant: 15),
            emailTextField.bottomAnchor.constraint(equalTo: emailTextFieldView.bottomAnchor, constant: -2),
            emailTextFieldView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            emailTextFieldView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        
        
        
        
        //⭐️⭐️⭐️ UIStackView ⭐️⭐️⭐️
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        movieNameLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false


        
        //UIStackView에다가 올렸을 때
        //⭐️⭐️ addArrangedSubview 로 할 경우에는 vstack으로 쌓이고
        stackView.addArrangedSubview(movieNameLabel)
        stackView.addArrangedSubview(descriptionLabel)
        
        //⭐️⭐️ addSubview로 할 경우에는 겹쳐져서 보인다
//        stackView.addSubview(movieNameLabel)
//        stackView.addSubview(descriptionLabel)
        

        NSLayoutConstraint.activate([
//            movieNameLabel.heightAnchor.constraint(equalToConstant: 22),
            stackView.topAnchor.constraint(equalTo: emailTextFieldView.bottomAnchor, constant: 20)
            
        ])
        

    }
    


}
