//
//  ConversationViewController.swift
//  UITinkoffHomework
//
//  Created by Tamirlan Aubakirov on 24.07.2023.
//

import UIKit


final class ConversationViewController: UIViewController {
    
    private lazy var conversationTableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.register(ConversationCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    private lazy var dataSource = ConversationDataSource(conversationTableView)
    private var data1: [ConversationItem] = []
    private var data2: [ConversationItem] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        view.backgroundColor = .systemBackground
        
        view.backgroundColor = .white
        view.addSubview(conversationTableView)
        conversationTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            conversationTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            conversationTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            conversationTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            conversationTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        generateData()
        setupSnapshot()
        setupNavigation()
    }
    
    private func generateData() {
        for index in 0..<10 {
            data1.append(ConversationItem(nameTitle: "Section 0 Row # \(index)"))
            data2.append(ConversationItem(nameTitle: "Section 1 Row # \(index)"))
        }
    }
    
    private func setupSnapshot() {
        var snapshot = dataSource.snapshot()
        snapshot.deleteAllItems()
        snapshot.appendSections(ConversationSection.allCases)
        snapshot.appendItems(data1, toSection: .onlineSection)
        snapshot.appendItems(data2, toSection: .historySection)
        dataSource.apply(snapshot)
    }
    
    private func setupNavigation() {
        let settingsButton = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .plain, target: self, action: #selector(didTapSettings))
        let profileButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(didTapProfile))
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .automatic
        navigationItem.rightBarButtonItem = profileButton
        navigationItem.leftBarButtonItem = settingsButton
    
        }
    
    @objc
    private func didTapSettings() {
        print("Tapped settings")
    }
    
    @objc
    private func didTapProfile() {
        let view = ProfileViewController()
        navigationController?.pushViewController(view, animated: true)
    }
}

private class ConversationDataSource: UITableViewDiffableDataSource<ConversationSection, ConversationItem> {
    init(_ tableView: UITableView) {
        super.init(tableView: tableView) { tableView, indexPath, itemIdentifier in
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ConversationCell
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let id = sectionIdentifier(for: section)
        switch id {
        case .onlineSection:
            return "Online"
        case .historySection:
            return "History"
        default:
            return nil
        }
    }
}


extension ConversationViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        44
    }
}
