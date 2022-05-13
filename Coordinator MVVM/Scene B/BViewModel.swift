import Foundation

class BViewModel {
    var coordinator: MainCoordinator
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    func goToScreenC() {
        coordinator.goToC()
    }
}
