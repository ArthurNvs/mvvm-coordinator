import Foundation

class ScreenAViewModel {
    weak var coordinator: MainCoordinator!
    
    func goToScreenB() {
        coordinator.goToB()
    }
}
