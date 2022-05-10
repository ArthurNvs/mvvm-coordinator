import Foundation

class ScreenBViewModel {
    var coordinator: MainCoordinator
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    func goToScreenC() {
        coordinator.goToC()
    }
}
