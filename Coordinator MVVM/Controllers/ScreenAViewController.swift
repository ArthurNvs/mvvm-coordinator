import Foundation
import UIKit

class ScreenAViewController: UIViewController {
    var viewModelFactory: ScreenAViewModel
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.center = view.center
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
        textField.center = view.center
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
        textField.center = view.center
        textField.attributedPlaceholder = NSAttributedString(string: "Last Name", attributes: [
            .foregroundColor: UIColor.systemBlue,
            .font: UIFont.boldSystemFont(ofSize: 17)
        ])
        return textField
    }()
    
    init(viewModel: ScreenAViewModel){
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
        
        view.addSubview(button)
        view.addSubview(nameTextField)
        view.addSubview(lastNameTextField)
        configureSubviewsConstraints()
    }
    
    @objc func didTapButton() {
        if (nameTextField.text != "" && lastNameTextField.text != "") {
            viewModelFactory.completionHandler = nameTextField.text! + " " + lastNameTextField.text!
            viewModelFactory.goToScreenB()
        } else {
            showAlertMessage(title: "Ooops!", message: "Please insert name and last name")
        }
    }
    
    private func showAlertMessage(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "I'll do it!", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
}

private extension ScreenAViewController {
    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            self.lastNameTextField.leadingAnchor.constraint(equalTo: button.leadingAnchor),
            self.lastNameTextField.trailingAnchor.constraint(equalTo: button.trailingAnchor),
            self.lastNameTextField.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -10),
            
            self.nameTextField.leadingAnchor.constraint(equalTo: lastNameTextField.leadingAnchor),
            self.nameTextField.trailingAnchor.constraint(equalTo: lastNameTextField.trailingAnchor),
            self.nameTextField.bottomAnchor.constraint(equalTo: lastNameTextField.topAnchor, constant: -10),
            
            self.button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            self.button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            self.button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            self.button.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
