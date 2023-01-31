//
//  RoomInfoViewController.swift
//  TheSwitcher_AlexandrePortoAlegre
//
//  Created by Alexandre Porto Alegre Fernandes on 30/01/23.
//

import UIKit

class RoomInfoViewController: UIViewController {
    
    var selectedRoom: Room
    
    let roomInfoView: RoomInfoStackView = {
        let stackView = RoomInfoStackView()
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = selectedRoom.name

        view.backgroundColor = .white
        view.addSubview(roomInfoView)
        roomInfoView.setupStackView()
        roomInfoView.setupImageView()
        roomInfoView.setupInformationView()
    }
    
    init(room: Room) {
        self.selectedRoom = room
        roomInfoView.setupData(room: room.name ?? "", state: room.light)
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
