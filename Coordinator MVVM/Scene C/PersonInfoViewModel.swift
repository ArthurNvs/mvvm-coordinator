import Foundation

class PersonInfoViewModel: PersonInfo {
    var coordinator: MainCoordinator
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    func didButtonTapAction() {
        coordinator.dismissModal()
    }
}
