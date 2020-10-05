//
//  ViewController.swift
//  ExemploTableView
//
//  Created by Romulo Oliveira Viganico on 24/09/20.
//  Copyright © 2020 Romulo Oliveira Viganico. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let tableView: UITableView = {
        let table = UITableView (frame: .zero, style: .grouped)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        view.backgroundColor = .lightGray
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "tableview"
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
//        let detailVC = UINavigationController(rootViewController: DetailViewController())
//        detailVC.modalPresentationStyle = .fullScreen
//        present(detailVC, animated: true)
        let detailVC = DetailViewController()
        navigationController?.pushViewController(detailVC, animated: true)

    }
}
