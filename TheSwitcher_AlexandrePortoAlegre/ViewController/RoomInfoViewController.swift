//
//  RoomInfoViewController.swift
//  TheSwitcher_AlexandrePortoAlegre
//
//  Created by Alexandre Porto Alegre Fernandes on 30/01/23.
//

import UIKit

class RoomInfoViewController: UIViewController {
    
    var selectedRoom: Room?
    
    let roomInfoView: RoomInfoStackView = {
        let stackView = RoomInfoStackView()
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    
        
        view.addSubview(roomInfoView)
        roomInfoView.setupStackView()
        roomInfoView.setupImageView()
        roomInfoView.setupInformationView()
    }
}
