import UIKit

/**
 */
class ContextNavigationController: UINavigationController {
    ///
    private(set) weak var context: AppContext! = nil

    ///
    override var viewControllers: [UIViewController] {
        didSet {
            title = visibleViewController?.title
        }
    }

    /**
     */
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    /**
     */
    required init(context: AppContext) {
        super.init(nibName: nil, bundle: nil)
        self.context = context
    }
}

/**
 This is entirely optional. You may choose to move this to specific subclasses.
 */
extension ContextNavigationController: UINavigationControllerDelegate {
    ///
    override var delegate: UINavigationControllerDelegate? {
        get { return self }
        set { super.delegate = delegate }
    }

    /**
     */
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        UIView.animate(withDuration: 0.25) {
            viewController.setNeedsStatusBarAppearanceUpdate()
        }
    }
}

