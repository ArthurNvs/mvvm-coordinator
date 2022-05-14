import Foundation
import UIKit

class BViewController: UIViewController {
    var viewModelFactory: BViewModel
    var aModel: AModel
    
    private lazy var label: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textColor = UIColor.systemBlue
        text.text = "select your birth day: "
        return text
    }()
    
    private lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.datePickerMode = UIDatePicker.Mode.date
        datePicker.timeZone = NSTimeZone.local
        datePicker.backgroundColor = UIColor.white
        return datePicker
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.center = view.center
        button.backgroundColor = .systemBlue
        button.setTitle("Submit", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font =  UIFont.boldSystemFont(ofSize: 25)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }()
    
    init(viewModel: BViewModel, aModel: AModel){
        self.viewModelFactory = viewModel
        self.aModel = aModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Screen B"
        
        view.addSubview(button)
        view.addSubview(datePicker)
        view.addSubview(label)
        configureSubviewsConstraints()
        
    }
    
    @objc func didTapButton() {
        let fullName = aModel.firstName + " " + aModel.lastName
        let dateFormatter = DateFormatter()

        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.none
        let birthDay = dateFormatter.string(from: datePicker.date)
        
        viewModelFactory.bModel = BModel(fullName: fullName, birthDate: birthDay)
        viewModelFactory.goToScreenC()
    }
}

private extension BViewController {
    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            self.label.leadingAnchor.constraint(equalTo: button.leadingAnchor),
            self.label.bottomAnchor.constraint(equalTo: datePicker.topAnchor, constant: -10),
            
            self.datePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.datePicker.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -80),
            
            self.button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            self.button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            self.button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            self.button.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
