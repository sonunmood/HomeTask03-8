//
//  ViewController.swift
//  HomeTask03-8
//
//  Created by Sonun on 30/3/23.
//

import UIKit
import SnapKit

class ContactViewController: UIViewController {
    
    private var contactList: [Profile] = []
    private var filteredContactList: [Profile] = []
    var isFiltering = false
    
    private let contactLabel: UILabel = {
        let label = UILabel()
        label.text = "Contacts"
        label.font = .systemFont(ofSize: 40)
        return label
    }()
    
    private let searchBar = UISearchBar()
    
    private let profileImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "tom")
        image.contentMode = .scaleToFill
        image.layer.cornerRadius = 24.0
        image.clipsToBounds = true
        return image
    }()
    
    private let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "Tom Holland"
        return nameLabel
    }()
    
    private let numberLabel: UILabel = {
        let numberLabel = UILabel()
        numberLabel.font = .systemFont(ofSize: 12)
        numberLabel.textColor = .gray
        numberLabel.text = "+996700200255"
        return numberLabel
    }()
    
    private let tableView: UITableView = {
        let contactTV = UITableView()
        contactTV.backgroundColor = .white
        return contactTV
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUi()
        initData()
        tap()
    }
    
    func initData() {
        contactList = [Profile(image: "azat", name: "Azat", number: "+996500312312"),
                       Profile(image: "sanjar", name: "Sanjar", number: "+996700412412"),
                       Profile(image: "ermek", name: "Ermek", number: "+996777000999")]
    }
    
    private func initUi() {
        
        view.backgroundColor = .white
        searchBar.placeholder = "Search"
        searchBar.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        
        view.addSubview(contactLabel)
        view.addSubview(profileImage)
        view.addSubview(searchBar)
        view.addSubview(nameLabel)
        view.addSubview(numberLabel)
        view.addSubview(tableView)
        
        contactLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(120)
            make.leading.equalToSuperview().offset(20)
        }
        
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(contactLabel.snp.bottom).offset(24)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(80)
        }
        
        profileImage.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(searchBar.snp.bottom).offset(48)
            make.height.width.equalTo(60)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImage.snp.top)
            make.leading.equalTo(profileImage.snp.trailing).offset(16)
        }
        
        numberLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
            make.leading.equalTo(nameLabel.snp.leading)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(numberLabel.snp.bottom).offset(40)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().offset(-16)
        }
    }
    
    func tap() {
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapImage(_:)))
        
        profileImage.addGestureRecognizer(gestureRecognizer)
        profileImage.isUserInteractionEnabled = true
        
        gestureRecognizer.numberOfTapsRequired = 1
        gestureRecognizer.numberOfTouchesRequired = 1
    }
    
    
    @objc func tapImage(_ gesture: UITapGestureRecognizer) {
        let vc = DetailInfoViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension ContactViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        isFiltering ? filteredContactList.count : contactList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = contactList[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailInfoViewController()
        title = "Contacts"
        navigationController?.pushViewController(vc, animated: true)
        vc.image = UIImage(named:contactList[indexPath.row].image)
        vc.name = contactList[indexPath.row].name
        vc.number = contactList[indexPath.row].number
    }
    
}

extension ContactViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty{
            isFiltering = false
        } else {
            isFiltering = true
            filteredContactList = contactList.filter({ $0.name.contains(searchText)})
        }
        
        tableView.reloadData()
    }
    
}
