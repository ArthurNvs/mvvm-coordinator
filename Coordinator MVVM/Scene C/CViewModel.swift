import Foundation

class CViewModel: ViewModelC {
    var coordinator: MainCoordinator
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    func didButtonTapAction() {
        coordinator.dismissModal()
    }
}
