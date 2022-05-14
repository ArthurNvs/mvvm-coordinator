import Foundation
import UIKit

class BViewController: UIViewController {
    var viewModel: BViewModel
    var aModel: AModel
    
    private lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.frame = CGRect(x: 10, y: 50, width: self.view.frame.width, height: 200)
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
        self.viewModel = viewModel
        self.aModel = aModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = aModel.firstName + " " + aModel.lastName
        
        view.addSubview(datePicker)
        view.addSubview(button)
        configureSubviewsConstraints()
        
    }
    
    @objc func didTapButton() {
        viewModel.goToScreenC()
    }
}

private extension BViewController {
    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            self.datePicker.leadingAnchor.constraint(equalTo: button.leadingAnchor),
            self.datePicker.trailingAnchor.constraint(equalTo: button.trailingAnchor),
            self.datePicker.bottomAnchor.constraint(equalTo: button.topAnchor),
            
            self.button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            self.button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            self.button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            self.button.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
