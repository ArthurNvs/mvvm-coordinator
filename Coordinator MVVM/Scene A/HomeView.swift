import Foundation

protocol HomeView {
    var coordinator: MainCoordinator { get set }
    
    func didButtonTapAction(firstName: String, lastName: String)
}
