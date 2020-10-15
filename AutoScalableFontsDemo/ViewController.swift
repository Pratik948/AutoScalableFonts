//
//  ViewController.swift
//  AutoScalableFontsDemo
//
//  Created by Pratik Jamariya on 15/10/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var actualSizeLabel: UILabel!
    @IBOutlet weak var scalingDisabledLabelContainerStackView: UIStackView!
    @IBOutlet weak var scalingDisabledLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        actualSizeLabel.text = "\(String(format: "%.2f", actualSizeLabel.font.pointSize))"
        scalingDisabledLabel.text = "\(String(format: "%.2f", scalingDisabledLabel.font.pointSize))"
    }
    
}


class TableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private lazy var searchController:UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search your stuffs here"
        return searchController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.separatorColor = tableView.backgroundColor
        navigationItem.searchController = searchController
        definesPresentationContext = true
        title = "Search bar example"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

extension TableViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Index: \(indexPath.row+1) Section: \(indexPath.section)"
        return cell
    }
}

extension TableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
     //update your results
    }
}
