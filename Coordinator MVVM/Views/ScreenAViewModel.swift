import Foundation

class ScreenAViewModel {
    var coordinator: MainCoordinator
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    func goToScreenB() {
        coordinator.goToB()
    }
}
