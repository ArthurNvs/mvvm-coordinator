import Foundation

protocol ViewModelC {
    var coordinator: MainCoordinator { get set }
    
    func didButtonTapAction()
}
