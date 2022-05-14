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
        
        view.addSubview(button)
        view.addSubview(label)
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
            self.label.leadingAnchor.constraint(equalTo: button.leadingAnchor),
            self.label.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -10),
            
            self.button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            self.button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            self.button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            self.button.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}

extension Date {
    var age: Int { Calendar.current.dateComponents([.year], from: self, to: Date()).year! }
}
