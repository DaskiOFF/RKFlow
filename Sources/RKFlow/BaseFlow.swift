open class BaseFlow<RootViewControllerType> : BaseCoordinator {
    public var rootViewController: RootViewControllerType
    
    // MARK: - Init
    public init(rootViewController: RootViewControllerType) {
        self.rootViewController = rootViewController
    }
}

#if canImport(UIKit)
import UIKit

public typealias BaseNavigationFlow = BaseFlow<UINavigationController>
#endif
