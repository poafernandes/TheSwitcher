//
//  RoomInfoStackView.swift
//  TheSwitcher_AlexandrePortoAlegre
//
//  Created by Alexandre Porto Alegre Fernandes on 30/01/23.
//

import UIKit

class RoomInfoStackView: UIView {
    
    private let informationView: UIView = {
        let infoView = UIView()
        return infoView
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "light_image_OFF")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = UIColor(red: 211/255, green: 211/255, blue: 211/255, alpha: 0.9)
        return imageView
    }()
    
    private let roomLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.text = "Your light is"
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let stateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private var state: Bool = false

    var lightState: Bool {
        get {
            return state
        }
        set(newValue) {
            state = newValue
            if newValue {
                imageView.image = UIImage(named: "light_image_ON")
            } else {
                imageView.image = UIImage(named: "light_image_OFF")
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        stateLabel.text = state ? "On".uppercased() : "Off".uppercased()
        addSubview(stackView)
        stackView.addSubview(imageView)
        stackView.addSubview(informationView)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupStackView(){
        stackView.heightAnchor.constraint(equalTo: self.superview!.heightAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: self.superview!.widthAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: self.superview!.centerXAnchor).isActive = true
        backgroundColor = .blue
        
    }
    
    func setupImageView(){
        imageView.topAnchor.constraint(equalTo: self.superview!.safeAreaLayoutGuide.topAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: self.superview!.widthAnchor).isActive = true
    }

    func setupInformationView(){
        
        informationView.topAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
        informationView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        informationView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        informationView.addSubview(roomLabel)
        informationView.addSubview(stateLabel)
        
        roomLabel.topAnchor.constraint(equalTo: informationView.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        roomLabel.centerXAnchor.constraint(equalTo: stackView.centerXAnchor).isActive = true
        stateLabel.topAnchor.constraint(equalTo: roomLabel.bottomAnchor, constant: 25).isActive = true
        stateLabel.centerXAnchor.constraint(equalTo: stackView.centerXAnchor).isActive = true
    }
    
    func setupData(room: String, state: Bool){
        roomLabel.text = "Your \(room)'s light is"
        stateLabel.text = state ? "On".uppercased() : "Off".uppercased()
        lightState = state
    }
}
