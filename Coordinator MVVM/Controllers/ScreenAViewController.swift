import Foundation
import UIKit

class ScreenAViewController: UIViewController {
    var viewModelFactory: ScreenAViewModel
    
    private lazy var button: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 220, height: 30))
        button.center = view.center
        button.backgroundColor = .systemBlue
        button.setTitle("Enviar nome completo", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .line
        textField.textAlignment = .left
        textField.center = view.center
        textField.placeholder = "Name"
        return textField
    }()
    
    private lazy var lastNameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .line
        textField.textAlignment = .left
        textField.center = view.center
        textField.placeholder = "Last name"
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
        viewModelFactory.goToScreenB()
        }
    }
}

private extension ScreenAViewController {
    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            self.lastNameTextField.leadingAnchor.constraint(equalTo: button.leadingAnchor),
            self.lastNameTextField.trailingAnchor.constraint(equalTo: button.trailingAnchor),
            self.lastNameTextField.bottomAnchor.constraint(equalTo: button.topAnchor),
            
            self.nameTextField.leadingAnchor.constraint(equalTo: lastNameTextField.leadingAnchor),
            self.nameTextField.trailingAnchor.constraint(equalTo: lastNameTextField.trailingAnchor),
            self.nameTextField.bottomAnchor.constraint(equalTo: lastNameTextField.topAnchor),
        ])
    }
}
