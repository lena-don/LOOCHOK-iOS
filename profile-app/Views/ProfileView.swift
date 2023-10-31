//
//  ProfileView.swift
//  profile-app
//
//  Created by Донских Елена on 04.10.2023.
//
import UIKit

class ProfileView: UIView
{
    private struct Constants {
        static let defaultAvatar: String = "avatar"
        static let saveTitle: String = "Save"
        static let cancelTitle: String = "Cancel"
        static let avatarRadius: CGFloat = 120
        static let offset: CGFloat = 10
        static let horizontalOffset: CGFloat = 20
        static let topOffset: CGFloat = 20
        static let fieldHeight: CGFloat = 40
    }
    
    let avatarImage = UIImageView()
    let firstNameField = UITextField()
    let secondNameField = UITextField()
    let middleNameField = UITextField()
    let aliasField = UITextField()
    let mailField = UITextField()
    let phoneField = UITextField()
    let telegramField = UITextField()
    
    let saveButton = UIButton()
    let cancelButton = UIButton()
    
    public var saveAction: (() -> Void)?
    public var cancelAction: (() -> Void)?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setAvatar(_ avatar: String) {
        avatarImage.image = avatar.toImage()
    }
    
    public func setAvatar(_ avatar: UIImage) {
        //avatarImage.image = avatar
    }
    
    
    private func configureUI() {
        self.backgroundColor = .white
        configureAvatar()
        configureFields()
        configureButtons()
    }
    
    
    public func configure(profile: ProfileModel) {
//        avatarImage.image = UIImage(named: profile.avatar ?? Constants.defaultAvatar)
        
        avatarImage.image = profile.avatar?.toImage() ?? UIImage(named: Constants.defaultAvatar)
        
        firstNameField.text = profile.firstName
        secondNameField.text = profile.secondName
        middleNameField.text = profile.middleName
        
        aliasField.text = profile.alias
        mailField.text = profile.mail
        phoneField.text = profile.phone
        telegramField.text = profile.telegram
    }
    
    
    private func configureAvatar() {
        self.addSubview(avatarImage)
        avatarImage.layer.cornerRadius = Constants.avatarRadius
        avatarImage.layer.masksToBounds = true
//        avatarImage.frame.size = CGSize(width: 240.0, height: 240.0)
        avatarImage.backgroundColor = .white
        avatarImage.image = UIImage(named: Constants.defaultAvatar)
        
        avatarImage.setWidth(Constants.avatarRadius * 2)
        avatarImage.setHeight(Constants.avatarRadius * 2)
        avatarImage.pinCenterX(to: self)
        avatarImage.pinTop(to: self, Constants.topOffset)
        
    }
    
    
    private func configureFields() {
        cofigureField(firstNameField)
        firstNameField.placeholder = "First name"
        firstNameField.pinTop(to: avatarImage.bottomAnchor, Constants.offset)
        
        
        cofigureField(secondNameField)
        secondNameField.placeholder = "Second name"
        secondNameField.pinTop(to: firstNameField.bottomAnchor, Constants.offset)
        
        cofigureField(middleNameField)
        middleNameField.placeholder = "Middle name"
        middleNameField.pinTop(to: secondNameField.bottomAnchor, Constants.offset)
        
        cofigureField(aliasField)
        aliasField.placeholder = "Nick name"
        aliasField.pinTop(to: middleNameField.bottomAnchor, Constants.offset)
        
        cofigureField(mailField)
        mailField.placeholder = "Mail"
        mailField.pinTop(to: aliasField.bottomAnchor, Constants.offset)
        
        cofigureField(phoneField)
        phoneField.placeholder = "Phone"
        phoneField.pinTop(to: mailField.bottomAnchor, Constants.offset)
        
        cofigureField(telegramField)
        telegramField.placeholder = "Telegram"
        telegramField.pinTop(to: phoneField.bottomAnchor, Constants.offset)
    }
    
    
    private func cofigureField(_ field: UITextField) {
        self.addSubview(field)
        field.pinHorizontal(to: self, Constants.horizontalOffset)
        field.setHeight(Constants.fieldHeight)
        field.resignFirstResponder()
        field.selectedTextRange = nil
        field.textColor = .black
    }
    
    
    private func configureButtons() {
        let view = UIView()
        self.addSubview(view)
        view.pinBottom(to: self, Constants.offset)
        view.pinHorizontal(to: self, Constants.horizontalOffset)
        
        view.addSubview(saveButton)
        saveButton.setTitle(Constants.saveTitle, for: .normal)
        saveButton.setTitleColor(.black, for: .normal)
        saveButton.addTarget(self, action: #selector(save), for: .touchUpInside)
        saveButton.pinRight(to: view)
        saveButton.pinBottom(to: view, Constants.offset)
        
        view.addSubview(cancelButton)
        cancelButton.setTitle(Constants.cancelTitle, for: .normal)
        cancelButton.setTitleColor(.black, for: .normal)
        cancelButton.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        cancelButton.pinBottom(to: view, Constants.offset)
        cancelButton.pinLeft(to: view)
        
        view.pinHeight(to: saveButton.heightAnchor)
    }
    
    
    @objc
    private func save() {
        saveAction?()
    }
    
    @objc
    private func cancel() {
        cancelAction?()
    }
}
