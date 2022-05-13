import Foundation

class AViewModel {
    var coordinator: MainCoordinator
    public var fullName: String?
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    func goToScreenB() {
        guard let fullName = fullName else { return }
        coordinator.goToB(fullName)
    }
}
