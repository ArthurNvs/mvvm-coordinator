import Foundation

protocol ViewModel {
    var coordinator: MainCoordinator { get set }
    
    func didButtonTapAction(firstName: String, lastName: String)
}
