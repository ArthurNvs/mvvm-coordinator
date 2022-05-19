import Foundation
import UIKit

class CViewController: UIViewController {
    var viewModel: CViewModel
    var bModel: BModel
    
    private lazy var label: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textColor = UIColor.systemBlue
        text.text = "\(bModel.fullName), \(setAgeWithBirthDay()) years old."
        return text
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.center = view.center
        button.backgroundColor = .systemBlue
        button.setTitle("Ok", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font =  UIFont.boldSystemFont(ofSize: 25)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = NSLayoutConstraint.Axis.vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 20
        
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(button)
        return stackView
    }()
    
    init(viewModel: CViewModel, bModel: BModel){
        self.viewModel = viewModel
        self.bModel = bModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        title = "Screen C"
        
        view.addSubview(stackView)
        configureSubviewsConstraints()
    }
    
    @objc func didTapButton() {
        
        print(setAgeWithBirthDay())
        viewModel.goToScreenA()
    }
    
    func setAgeWithBirthDay() -> Int {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.none
        dateFormatter.dateFormat = "dd/MM/yy"
        
        let birthDay = dateFormatter.date(from: bModel.birthDay)
        let age = birthDay?.age
        
        return age!
    }
    
}

private extension CViewController {
    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            self.stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
            self.stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            self.stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            self.label.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            
            self.button.heightAnchor.constraint(equalToConstant: 40),
            self.button.widthAnchor.constraint(equalTo: stackView.widthAnchor)
        ])
    }
}

extension Date {
    var age: Int { Calendar.current.dateComponents([.year], from: self, to: Date()).year! }
}
