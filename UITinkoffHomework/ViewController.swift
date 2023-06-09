//
//  ViewController.swift
//  UITinkoffHomework
//
//  Created by Tamirlan Aubakirov on 07.06.2023.
//

import UIKit


final class ViewController: UIViewController {
    
    private let secondVC = SecondViewController()
    private var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 75
        imageView.backgroundColor = .systemGray
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.darkGray.cgColor
        imageView.image = UIImage(systemName: "custom.multiply.circle")
        imageView.tintColor = .black
        return imageView
    }()
    private let addPhotoButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.setTitle("Add Photo", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
    }()
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Tamirlan Aubakirov"
        label.font = .boldSystemFont(ofSize: 20)
        label.tintColor = .black
        label.textAlignment = .center
        return label
    }()
    private let subLabel: UILabel = {
        let label = UILabel()
        label.text = "iOS Developer, Almaty, Kazakhstan"
        label.textColor = .systemGray
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupNavBar()
    }
    
    @objc func didTapButton() {
        createActionSheet()
    }
    
    @objc func didTapEdit() {
        navigationController?.pushViewController(secondVC, animated: true)
    }
    
    private func setupNavBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(didTapEdit))
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        
        [profileImageView, addPhotoButton, nameLabel, subLabel].forEach { $0.translatesAutoresizingMaskIntoConstraints = false
        }
        [profileImageView, addPhotoButton, nameLabel, subLabel].forEach { view.addSubview($0)
        }
        
        profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        addPhotoButton.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 12).isActive = true
        addPhotoButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        addPhotoButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        addPhotoButton.centerXAnchor.constraint(equalTo: profileImageView.centerXAnchor).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: addPhotoButton.bottomAnchor, constant: 12).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        subLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 12).isActive = true
        subLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        subLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        subLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    

    private func createActionSheet() {
        let actionSheet = UIAlertController(title: "Please", message: "Choose action", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { action in
            self.navigationController?.popViewController(animated: true)
        }))
        actionSheet.addAction(UIAlertAction(title: "Take photo", style: .default, handler: { action in
            self.openCamera()
        }))
        actionSheet.addAction(UIAlertAction(title: "Choose from gallery", style: .default, handler: { action in
            self.openGallery()
        }))
        present(actionSheet, animated: true)
    }
}


extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    fileprivate func openCamera() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = false
        imagePickerController.sourceType = .camera
        self.present(imagePickerController, animated: true, completion: nil)
        
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            imagePickerController.dismiss(animated: true, completion: nil)
            guard let image = info[.originalImage] else { return }
            profileImageView.image = image as? UIImage
        }
    }
       
    fileprivate func openGallery() {
        let imagePicker = UIImagePickerController()
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            print("Button capture")
            
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!){
        self.dismiss(animated: true, completion: { () -> Void in
            
        })
        profileImageView.image = image
    }
}
