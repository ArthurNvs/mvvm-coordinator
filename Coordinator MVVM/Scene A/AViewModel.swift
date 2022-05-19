import Foundation

class AViewModel {
    var coordinator: MainCoordinator
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    func didButtonTapAction(firstName: String, lastName: String) {
        coordinator.goToB(AModel(firstName: firstName, lastName: lastName))
    }
}
