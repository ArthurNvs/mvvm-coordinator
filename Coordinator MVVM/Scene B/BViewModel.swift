import Foundation

class BViewModel {
    var coordinator: MainCoordinator
    var bModel: BModel?
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    func goToScreenC() {
        guard let bModel = self.bModel else { return }
        coordinator.goToC(bModel)
    }
}
