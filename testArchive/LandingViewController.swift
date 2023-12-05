//
//  LandingViewController.swift
//  testArchive
//
//  Created by 하연주 on 2023/11/23.
//

import UIKit

struct List {
    var id : Int
    var lable : String
    var description : String
}

class LandingViewController: UIViewController {

//    private lazy var uiView : UIView! = .init(frame: CGRect(x: 50, y: 50, width: 200, height: 200))
    private let tableView = UITableView()
    
    var listArray: [List] = [
        List(id : 0, lable: "bouds, frame", description : "bouds, frame 관련해서 테스트 했던 것"),
        List(id : 1, lable: "실제 디바이스가 없을 경우 지원하지 않는 것 검증하기", description : "카메라, 앨범 권한 설정, handoff 기능, messageUI 기능"),
        List(id : 2, lable: "UIView와 UIStackView와의 차이점", description : "UIView와 UIStackView와의 차이점 / addArrangedSubview & addSubview의 차이점에 대해 알아봄"),
//        List(lable: "2", description : "2번째입니다."),
//        List(lable: "3", description : "3번째입니다."),
//        List(lable: "4", description : "4번째입니다."),
//        List(lable: "5", description : "5번째입니다."),
//        List(lable: "6", description : "6번째입니다."),
//        List(lable: "7", description : "7번째입니다.")
    ]
    private let myUserActivity: NSUserActivity = NSUserActivity(activityType: "heid.handoff")
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        uiView.backgroundColor = .black
//        view.addSubview(uiView)
//
//        NSLayoutConstraint.activate([
//            uiView.widthAnchor.constraint(equalToConstant: 180),
//            uiView.heightAnchor.constraint(equalToConstant: 70),
//            uiView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            uiView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
//        ])
//        uiView.translatesAutoresizingMaskIntoConstraints = false
        setupUserActivity()
        
        setupTableView()
        setupTableViewConstraints()
        
    }
    func setupUserActivity() {
        self.myUserActivity.title = "Heidi"
        self.myUserActivity.isEligibleForSearch = true
        self.myUserActivity.isEligibleForHandoff = true
        self.myUserActivity.webpageURL = URL(string: "https://heidi-dev.tistory.com/")
        self.userActivity = self.myUserActivity
        self.userActivity?.becomeCurrent()
    }
    

    func setupTableView() {
        //⭐️테이블뷰⭐️ 델리게이트 패턴의 대리자 설정
        tableView.dataSource = self
        tableView.delegate = self
        //⭐️테이블뷰⭐️ 셀의 높이 설정
        tableView.rowHeight = 120
        
        //⭐️테이블뷰⭐️ 셀의 등록과정⭐️⭐️⭐️ (스토리보드 사용시에는 스토리보드에서 자동등록)
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: "ListCell")
    }
    
    //⭐️테이블뷰⭐️ 테이블뷰의 오토레이아웃 설정
    func setupTableViewConstraints() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }

}

//⭐️테이블뷰⭐️ 필수 프로토콜 채랙
extension LandingViewController: UITableViewDataSource {
    
    //⭐️테이블뷰⭐️ 1) 테이블뷰에 몇개의 데이터를 표시할 것인지(셀이 몇개인지)를 뷰컨트롤러에게 물어봄
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function)
        return listArray.count
    }
    
    //⭐️테이블뷰⭐️ 2) 셀의 구성(셀에 표시하고자 하는 데이터 표시)을 뷰컨트롤러에게 물어봄
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function)
        
        // (힙에 올라간)재사용 가능한 셀을 꺼내서 사용하는 메서드 (애플이 미리 잘 만들어 놓음)
        // (사전에 셀을 등록하는 과정이 내부 메커니즘에 존재)
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as! MyTableViewCell
        
//        cell.mainImageView.image = listArray[indexPath.row].label
//        cell.movieNameLabel.text = listArray[indexPath.row].label
//        cell.descriptionLabel.text = listArray[indexPath.row].label
        cell.nameLabel.text = listArray[indexPath.row].lable
        cell.descriptionLabel.text = listArray[indexPath.row].description
        cell.selectionStyle = .none
        
        return cell
    }
}

//⭐️테이블뷰⭐️ 필수 프로토콜 채랙
extension LandingViewController: UITableViewDelegate {
    
    //⭐️테이블뷰⭐️ 셀이 선택이 되었을때 어떤 동작을 할 것인지 뷰컨트롤러에게 물어봄
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 다음화면으로 이동
        let detailVC = ViewController()
        let withoutDeviceTestVC = WithoutDeviceTestViewController()
        let uiViewAndUIStackViewVC = UIViewUIStackViewPracticeViewController()
        
        print(indexPath.row)
//        if indexPath.row == 0 {
//            navigationController?.pushViewController(detailVC, animated: true)
//        }
        
        switch indexPath.row {
        case 0:
            navigationController?.pushViewController(detailVC, animated: true)
        case 1:
            navigationController?.pushViewController(withoutDeviceTestVC, animated: true)
        case 2 :
            navigationController?.pushViewController(uiViewAndUIStackViewVC, animated: true)
        default :
            break
            
        }
        
//        detailVC.movieData = listArray[indexPath.row]
//        show(detailVC, sender: nil)
        
//        navigationController?.pushViewController(detailVC, animated: true)
    }
}
