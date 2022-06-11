import Foundation

class PersonInfoViewModel: PersonInfo {
    var coordinator: Coordinator
    
    init(coordinator: Coordinator) {
        self.coordinator = coordinator
    }
    
    func didButtonTapAction() {
        coordinator.dismissModal()
    }
}
