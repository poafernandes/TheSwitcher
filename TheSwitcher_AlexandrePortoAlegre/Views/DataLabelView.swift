//
//  DataLabelView.swift
//  TheSwitcher_AlexandrePortoAlegre
//
//  Created by Alexandre Porto Alegre Fernandes on 30/01/23.
//

import UIKit

class DataLabelView: UILabel {
    
    func setupLabel() {
        self.text = "You have no rooms stored"
        self.textAlignment = .center
        self.font = UIFont.preferredFont(forTextStyle: .headline)
        self.numberOfLines = 0

    }

    func setupConstraints(){
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: self.superview!.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: self.superview!.bottomAnchor).isActive = true
        leadingAnchor.constraint(equalTo: self.superview!.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: self.superview!.trailingAnchor).isActive = true
    }
}
