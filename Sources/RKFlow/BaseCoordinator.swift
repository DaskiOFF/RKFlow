open class BaseCoordinator: Coordinator {
    final weak var presentingCoordinator: BaseCoordinator? = nil
    final private(set) var childCoordinators: [Coordinator] = []
    
    // MARK: - Manage
    /// Add new child coordinator
    ///
    /// - Parameter coordinator: Child coordinator
    final func add(_ coordinator: Coordinator) {
        assert(!childCoordinators.contains(where: { $0 === coordinator }))
        childCoordinators.append(coordinator)
    }
    
    /// Remove child coordinator from storage
    ///
    /// - Parameter coordinator: Deleted coordinator
    final public func remove(_ coordinator: Coordinator) {
        guard let index = childCoordinators.firstIndex(where: { $0 === coordinator}) else { return }
        childCoordinators.remove(at: index)
        if let baseCoordinator = coordinator as? BaseCoordinator {
            baseCoordinator.presentingCoordinator = nil
        }
    }
    
    // MARK: - Coordinator
    
    public func start(on coordinator: BaseCoordinator?) {
        assert(self !== coordinator)
        presentingCoordinator = coordinator
        if let presentingCoordinator = coordinator {
            self.presentingCoordinator = presentingCoordinator
            presentingCoordinator.add(self)
        }
        start()
    }
    
    open func start() {
        fatalError("Override this method")
    }
}
