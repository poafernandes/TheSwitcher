//
//  RoomTableViewController.swift
//  TheSwitcher_AlexandrePortoAlegre
//
//  Created by Alexandre Porto Alegre Fernandes on 30/01/23.
//

import UIKit
import CoreData


class RoomTableViewController: UIViewController {
    
    private var roomsData = [Room]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let tableView: RoomTableView = {
        let table = RoomTableView()
        table.register(RoomTableViewCell.self, forCellReuseIdentifier: RoomTableViewCell.identifider)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constants.AppInfo.Title
        
        view.addSubview(tableView)
        tableView.setupConstraints()
        
        tableView.delegate = self
        tableView.dataSource  = self
        
        #if DEBUG
        if let data = fetchRooms() {
            if data.count == 0 {
                setExampleData()
            }
            self.roomsData = fetchRooms() ?? []
        }
        #endif
        
    }

    fileprivate func fetchRooms() -> [Room]? {
        let coreDataManager = CoreDataManager(context: self.context)
        
        guard let fetchedData = coreDataManager.fetchData() else {
            return nil
        }
        
        return fetchedData
    }
    
    func pushInfoViewController(room: Room){
        let infoVC = RoomInfoViewController(room: room)
        infoVC.selectedRoom = room
        navigationController?.pushViewController(infoVC, animated: true)
    }
}

extension RoomTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedRoom = roomsData[indexPath.row]
        pushInfoViewController(room: selectedRoom)
    }
}

extension RoomTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return roomsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let room = roomsData[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: RoomTableViewCell.identifider, for: indexPath) as! RoomTableViewCell
        cell.setData(label: room.name ?? "", state: room.light)
        cell.lightSwitch.tag = indexPath.row
        cell.lightSwitch.addTarget(self, action: #selector(switchChanged), for: .valueChanged)
        return cell
    }
    
    @objc func switchChanged(_ sender:UISwitch){
        let coreDataManager = CoreDataManager(context: self.context)
        let item = roomsData[sender.tag]
        coreDataManager.updateData(item: item, lightState: sender.isOn)
    }
}

extension RoomTableViewController {
    fileprivate func setExampleData() {
        let coreDataManager = CoreDataManager(context: self.context)

        for room in Constants.Storage.ExampleData {
            coreDataManager.createData(name: room)
        }
    }
}
