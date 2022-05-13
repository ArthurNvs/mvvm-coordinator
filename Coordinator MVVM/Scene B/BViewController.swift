import Foundation
import UIKit

class BViewController: UIViewController {
    var viewModel: BViewModel
    public var completion: String
    
    private lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.frame = CGRect(x: 10, y: 50, width: self.view.frame.width, height: 200)
        datePicker.timeZone = NSTimeZone.local
        datePicker.backgroundColor = UIColor.white
        return datePicker
    }()
    
    init(viewModel: BViewModel, completion: String){
        self.viewModel = viewModel
        self.completion = completion
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        title = completion
        view.addSubview(datePicker)
        
//        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 220, height: 55))
//        view.addSubview(button)
//        button.center = view.center
//        button.backgroundColor = .systemBlue
//        button.setTitle("Screen C", for: .normal)
//        button.setTitleColor(.white, for: .normal)
//        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc func didTapButton() {
        viewModel.goToScreenC()
    }
}
