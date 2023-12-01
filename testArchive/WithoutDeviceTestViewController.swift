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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
        checkCameraPermission()
        checkAlbumPermission()
        
        
    }
    
    func configureUI () {
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


