//
//  RoomTableView.swift
//  TheSwitcher_AlexandrePortoAlegre
//
//  Created by Alexandre Porto Alegre Fernandes on 30/01/23.
//

import UIKit

class RoomTableView: UITableView {

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        rowHeight = 60
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints(){
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: self.superview!.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: self.superview!.bottomAnchor).isActive = true
        leadingAnchor.constraint(equalTo: self.superview!.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: self.superview!.trailingAnchor).isActive = true
    }

}
