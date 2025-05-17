# RKFlow

Simple flow (based on coordinator) library

## Create minimal flow

```swift
class TestFlow: BaseNavigationFlow {
    override func start() {
        let vc = UIViewController()
        if rootViewController.viewControllers.isEmpty {
            rootViewController.setViewControllers([vc], animated: true)
        } else {
            rootViewController.pushViewController(vc, animated: true)
        }
    }
}
```

## Start new flow

```swift
private extension TestFlow {
    func startNextPushFlow() {
        // view controllers from new flow will be pushed on the rootViewController
        let flow = NextFlow(rootViewController: rootViewController)
        flow.start(on: self)
    }

    func startNextPresentedFlow() {
        let newNavigationController = UINavigationController()
        
        let flow = NextFlow(rootViewController: newNavigationController)
        flow.start(on: self)

        rootViewController.present(newNavigationController, animated: true, completion: nil)
    }
}
```

# Public interface

### BaseNavigationFlow

```swift
var rootViewController: UINavigationController

init(rootViewController: UINavigationController)

// use when close presented flow
final public func remove(_ coordinator: Coordinator)

// start created flow
public func start(on coordinator: BaseCoordinator?)
open func start()
```
