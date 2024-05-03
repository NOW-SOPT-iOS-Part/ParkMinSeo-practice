//
//  ChatViewController.swift
//  34th_SOPT_Seminar_Basic
//
//  Created by 박민서 on 4/20/24.
//

import UIKit
import SnapKit

final class ChatViewController: UIViewController {
    
    private let dummyData = ChatModel.dummy()
    
    private let tableView = UITableView(frame: .zero, style: .plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
        setDelegate()
        register()
    }
    
    private func setLayout() {
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    private func setDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    private func register() {
        tableView.register(ChatTablelViewCell.self, forCellReuseIdentifier: ChatTablelViewCell.identifier)
    }
}

extension ChatViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChatTablelViewCell.identifier, for: indexPath) as? ChatTablelViewCell else { return UITableViewCell() }
        cell.dataBind(dummyData[indexPath.row])
        return cell
    }
}

#Preview {
    ChatViewController()
}
