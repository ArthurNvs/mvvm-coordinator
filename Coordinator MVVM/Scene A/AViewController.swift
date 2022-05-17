import Foundation
import UIKit

class AViewController: UIViewController {
    var viewModelFactory: AViewModel
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.setTitle("send full name", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font =  UIFont.boldSystemFont(ofSize: 25)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .line
        textField.textAlignment = .left
        textField.attributedPlaceholder = NSAttributedString(string: "Name", attributes: [
            .foregroundColor: UIColor.systemBlue,
            .font: UIFont.boldSystemFont(ofSize: 17),
        ])
        return textField
    }()
    
    private lazy var lastNameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .line
        textField.textAlignment = .left
        textField.attributedPlaceholder = NSAttributedString(string: "Last Name", attributes: [
            .foregroundColor: UIColor.systemBlue,
            .font: UIFont.boldSystemFont(ofSize: 17)
        ])
        return textField
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = NSLayoutConstraint.Axis.vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 10
        
        stackView.addArrangedSubview(nameTextField)
        stackView.addArrangedSubview(lastNameTextField)
        stackView.addArrangedSubview(button)
        return stackView
    }()
    
    init(viewModel: AViewModel){
        self.viewModelFactory = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Screen A"
        
        view.addSubview(stackView)
        configureSubviewsConstraints()
    }
    
    @objc func didTapButton() {
        guard let name = nameTextField.text, !name.isEmpty, let lastName = lastNameTextField.text, !lastName.isEmpty else {
            return showAlertMessage(title: "Ooops!", message: "Please insert name and last name", action: "Ok!")
        }
            viewModelFactory.aModel = AModel(firstName: name, lastName: lastName)
            viewModelFactory.goToScreenB()
    }
}

private extension AViewController {
    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            
            self.stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
            self.stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            self.stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            //self.stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            //self.stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            //self.stackView.heightAnchor.constraint(equalToConstant: 50),
            
            self.lastNameTextField.heightAnchor.constraint(equalToConstant: 40),
            self.lastNameTextField.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            
            self.nameTextField.heightAnchor.constraint(equalToConstant: 40),
            self.nameTextField.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            
            self.button.heightAnchor.constraint(equalToConstant: 40),
            self.button.widthAnchor.constraint(equalTo: stackView.widthAnchor)
        ])
    }
}
