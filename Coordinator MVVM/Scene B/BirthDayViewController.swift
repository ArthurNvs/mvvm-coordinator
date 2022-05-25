import Foundation
import UIKit

class BirthDayViewController: UIViewController {
    var viewModelFactory: BirthDayViewModel
    var homeModel: HomeModel
    
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
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = NSLayoutConstraint.Axis.vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 20
        
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(datePicker)
        stackView.addArrangedSubview(button)
        return stackView
    }()
    
    init(viewModel: BirthDayViewModel, aModel: HomeModel){
        self.viewModelFactory = viewModel
        self.homeModel = aModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Screen B"
        
        view.addSubview(stackView)
        configureSubviewsConstraints()
        
    }
    
    @objc func didTapButton() {
        let fullName = homeModel.firstName + " " + homeModel.lastName
        let dateFormatter = DateFormatter()
        
        guard datePicker.date <= Date.now else {
            return showAlertMessage(title: "Ooops!", message: "You can't be born tomorrow", action: "Sorry!")
        }
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.none
        let birthDay = dateFormatter.string(from: datePicker.date)
        
        viewModelFactory.didButtonTapAction(fullName: fullName, birthDay: birthDay)
    }
}

private extension BirthDayViewController {
    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            self.stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
            self.stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            self.stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            self.label.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            
            self.datePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            self.button.heightAnchor.constraint(equalToConstant: 40),
            self.button.widthAnchor.constraint(equalTo: stackView.widthAnchor)
        ])
    }
}
