import Foundation

class AViewModel {
    var coordinator: MainCoordinator
    var aModel: AModel?
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    func goToScreenB() {
        guard let aModel = self.aModel else { return }
        coordinator.goToB(aModel)
    }
}
