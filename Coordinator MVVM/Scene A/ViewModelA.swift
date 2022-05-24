import Foundation

protocol ViewModelA {
    var coordinator: MainCoordinator { get set }
    
    func didButtonTapAction(firstName: String, lastName: String)
}
