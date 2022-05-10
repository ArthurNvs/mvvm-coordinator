import Foundation

class ScreenCViewModel {
    var coordinator: MainCoordinator
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    func goToScreenA() {
        coordinator.goToA()
    }
}
