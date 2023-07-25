//
//  EditProfileViewController.swift
//  UITinkoffHomework
//
//  Created by Tamirlan Aubakirov on 07.06.2023.
//

import UIKit

class EditProfileViewController: UIViewController {
    
    private let backButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(didTapBack), for: .touchUpInside)
        button.setTitle("Back", for: .normal)
        button.frame = CGRect(x: 150, y: 150, width: 100, height: 150)
        button.tintColor = .red
        return button
    }()
    
    @objc func didTapBack() {
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        view.addSubview(backButton)
    }
    
    
}
