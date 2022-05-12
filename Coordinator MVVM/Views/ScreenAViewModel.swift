import Foundation

class ScreenAViewModel {
    var coordinator: MainCoordinator
    public var completionHandler: String?
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    func goToScreenB() {
        coordinator.goToB(completionHandler!)
    }
}
