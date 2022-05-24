import Foundation

class AViewModel: ViewModelA {
    var coordinator: MainCoordinator
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    func didButtonTapAction(firstName: String, lastName: String) {
        coordinator.navigateTo(screen: .B, model: AModel(firstName: firstName, lastName: lastName))
    }
}
