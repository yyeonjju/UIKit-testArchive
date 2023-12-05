//
//  WithoutDeviceTestViewController.swift
//  testArchive
//
//  Created by 하연주 on 2023/11/29.
//

import UIKit
import AVFoundation
import Photos
import PhotosUI

class WithoutDeviceTestViewController: UIViewController {
    private let photoBtn : UIButton = {
       var btn = UIButton()
        btn.backgroundColor = .black
        btn.setTitle("사진 선택하기", for: .normal)
        btn.addTarget(self, action: #selector(photoBtnTapped), for: .touchUpInside)
        return btn
    }()
    
//    private let btn1 : UIButton = {
//        var btn = UIButton()
//        btn.backgroundColor = .blue
//        btn.setTitle("1", for: .normal)
//        btn.addTarget(self, action: #selector(numberBtnTapped(_:)), for: .touchUpInside)
//        return btn
//    }()
//
//    private let btn2 : UIButton = {
//        var btn = UIButton()
//        btn.backgroundColor = .brown
//        btn.setTitle("2", for: .normal)
//        btn.addTarget(self, action: #selector(numberBtnTapped(_:)), for: .touchUpInside)
//        return btn
//    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureButtonUI()
//        configureNumberButtonUI()
        
        
        checkCameraPermission()
        checkAlbumPermission()
        
        
    }
    

    
//    @objc func numberBtnTapped (_ sender : UIButton) {
//        if sender.titleLabel?.text == "1" {
//            print("1번 버튼 클릭")
//        } else if sender.titleLabel?.text == "2" {
//            print("2번 버튼 클릭")
//        }
//    }
//
//    func configureNumberButtonUI () {
//        view.addSubview(btn1)
//        view.addSubview(btn2)
//
//        btn1.translatesAutoresizingMaskIntoConstraints = false
//        btn2.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            btn1.widthAnchor.constraint(equalToConstant: 150),
//            btn1.heightAnchor.constraint(equalToConstant: 80),
//            btn1.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
//            btn1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//
//            btn2.widthAnchor.constraint(equalToConstant: 150),
//            btn2.heightAnchor.constraint(equalToConstant: 80),
//            btn2.topAnchor.constraint(equalTo: btn1.topAnchor, constant: 150),
//            btn2.centerXAnchor.constraint(equalTo: view.centerXAnchor)
//        ])
//    }
    
    
    func configureButtonUI () {
        view.addSubview(photoBtn)

        photoBtn.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            photoBtn.widthAnchor.constraint(equalToConstant: 150),
            photoBtn.heightAnchor.constraint(equalToConstant: 80),
            photoBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            photoBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

    }
    
    @objc func photoBtnTapped() {
        print("버튼 눌렸다")

//        let picker = UIImagePickerController()
//        picker.sourceType = .
//        picker.allowsEditing = true
//        self.present(picker, animated: true)

         //import PhotosUI 해주어야한다.
        var pickerConfiguration = PHPickerConfiguration()
        pickerConfiguration.selectionLimit = 3
        pickerConfiguration.filter = .any(of: [.images,.videos])
        let picker = PHPickerViewController(configuration: pickerConfiguration)
        picker.delegate = self
        self.present(picker, animated: true)



    }
    
    func checkCameraPermission(){
        AVCaptureDevice.requestAccess(for: .video, completionHandler: { (granted: Bool) in
            if granted {
                print("Camera: 권한 허용")
            } else {
                print("Camera: 권한 거부")
            }
        })
    }
    
    func checkAlbumPermission(){
            PHPhotoLibrary.requestAuthorization( { status in
                switch status{
                case .authorized:
                    print("Album: 권한 허용")
                case .denied:
                    print("Album: 권한 거부")
                case .restricted, .notDetermined:
                    print("Album: 선택하지 않음")
                default:
                    break
                }
            })
        }
    
}

extension WithoutDeviceTestViewController : PHPickerViewControllerDelegate {
    
    //이미지 피커를 닫을 때
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        
        picker.dismiss(animated: true) // 1
        let itemProvider = results.first?.itemProvider // 2
        
        if let itemProvider = itemProvider,
           itemProvider.canLoadObject(ofClass: UIImage.self) { // 3
            itemProvider.loadObject(ofClass: UIImage.self) { (image, error) in // 4
                DispatchQueue.main.async {
//                    self.myImageView.image = image as? UIImage // 5
                    
                }
            }
        } else {
            // TODO: Handle empty results or item provider not being able load UIImage
            
        }
        
    }

}


