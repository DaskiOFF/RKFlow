#if canImport(UIKit)
import UIKit

open class BaseAppCoordinator: BaseCoordinator {
    final public var window: UIWindow
    
    // MARK: - Init
    public init(window: UIWindow) {
        self.window = window
    }
}

#endif
