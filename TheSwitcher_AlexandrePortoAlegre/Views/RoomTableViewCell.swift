//
//  RoomTableCellTableViewCell.swift
//  TheSwitcher_AlexandrePortoAlegre
//
//  Created by Alexandre Porto Alegre Fernandes on 30/01/23.
//

import UIKit

class RoomTableViewCell: UITableViewCell {
    
    static let identifider = "RoomCell"
    
    private let roomTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    private let lightSwitch: UISwitch = {
        let uiSwitch = UISwitch()
        uiSwitch.setOn(false, animated: true)
        uiSwitch.onTintColor = .yellow
        uiSwitch.translatesAutoresizingMaskIntoConstraints = false

        return uiSwitch
    }()
    
    var lightState: Bool {
        get {
            lightSwitch.isOn
        }
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        
        addSubview(roomTitle)
        addSubview(lightSwitch)
        

        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func setData(label: String, state: Bool){
        roomTitle.text = label
        lightSwitch.isOn = state
    }
    
    func setupConstraints(){
        let margin = contentView.layoutMarginsGuide
        
        roomTitle.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        roomTitle.leadingAnchor.constraint(equalTo: margin.leadingAnchor).isActive = true
        lightSwitch.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        lightSwitch.trailingAnchor.constraint(equalTo: margin.trailingAnchor).isActive = true

    }
}
