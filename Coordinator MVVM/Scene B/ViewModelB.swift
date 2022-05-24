import Foundation

protocol ViewModelB {
    var coordinator: MainCoordinator { get set }
    
    func didButtonTapAction(fullName: String, birthDay: String)
}
