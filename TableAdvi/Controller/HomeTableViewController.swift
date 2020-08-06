//
//  ViewController.swift
//  TableAdvi
//
//  Created by Mohamed AbouElkhair on 7/9/20.
//  Copyright © 2020 Mohamed AbouElkhair. All rights reserved.
//

import UIKit

class HomeTableViewController :UITableViewController {

    fileprivate let cell_ID = "cellId"
    fileprivate var sections : [SectionData] = [
        SectionData(open: true, data:
            [
            CellData(titel: "Home", feathureImage: UIImage(named: "photo5")!),
            CellData(titel: "Home", feathureImage: UIImage(named: "photo4")!)
            ]
        ),
         SectionData(open: true, data:
            [
            CellData(titel: "Home", feathureImage: UIImage(named: "photo2")!)
            ]
        ),
         
         SectionData(open: true, data:
            [
            CellData(titel: "Home", feathureImage: UIImage(named: "photo3")!),
            CellData(titel: "Home", feathureImage: UIImage(named: "photo4")!),
            CellData(titel: "Home", feathureImage: UIImage(named: "photo1")!)
            ]
        )
    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.init(red: 228/255, green: 230/255, blue: 234/255, alpha: 1)
        
        navigationItem.title = "Sport"
        setupTableview()
        
        
       }
    
    fileprivate func setupTableview(){
        tableView.register(CardCell.self, forCellReuseIdentifier: cell_ID)
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
    }

          // MARK: - Sections and Row
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cell_ID, for: indexPath) as! CardCell
        let section = sections[indexPath.section]
        let cellData = section.data[indexPath.row]
        cell.ainmte()
        cell.cellData = cellData
        
        return cell
    }
       // MARK: - Sections and Row
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !sections[section].open{
            return 0
        }
        
        return sections[section].data.count
    }
    
       override func numberOfSections(in tableView: UITableView) -> Int {
        
        return sections.count
        
       }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 340
    }
       // MARK: - Table view Header
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let button = UIButton()
        button.tag = section
        button.setTitle("closee", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(self.openSection), for: .touchUpInside)
        return button 
    }
    @objc fileprivate func openSection (button: UIButton){
        let section = button.tag
        
        var indexPath = [IndexPath]()
        for row in sections[section].data.indices{
            let indexPathToDelete = IndexPath(row: row, section: section)
            indexPath.append(indexPathToDelete)
        }
        let isOpen = sections[section].open
       sections[section].open = !isOpen
        button.setTitle(isOpen ?  "Open" : "Close", for: .normal)
    //   tableView.reloadData()
        if isOpen{
            tableView.deleteRows(at: indexPath, with: .fade)
        }else{
            tableView.insertRows(at: indexPath, with: .fade)
        }
        
    }
    
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40    }
}

