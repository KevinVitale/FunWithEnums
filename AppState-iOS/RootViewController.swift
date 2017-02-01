import UIKit

/**
 */
final class RootViewController: UITabBarController {
    ///
    fileprivate(set) var context: AppContext! = nil

    ///
    fileprivate(set) var needsInitialState: Bool = true

    ///
    fileprivate(set) var appViewState: AppViewState = .unknown {
        willSet {
            transition(from: appViewState)
            previousAppViewState = appViewState
        }
        didSet {
            transition(to: appViewState)
            print("Current: \(appViewState)")
        }
    }

    ///
    fileprivate(set) var previousAppViewState: AppViewState = .unknown

    /**
     */
    private func transition(from state: AppViewState) {
        switch state {
        default: presentedViewController?.dismiss(animated: true)
        }
    }

    /**
     */
    private func transition(to state: AppViewState) {
        switch state.transition {
        case .present(let viewController):
            present(viewController, animated: true)
        case .set(let viewControllers):
            setViewControllers(viewControllers, animated: false)
        }
    }

    /**
     */
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    /**
     */
    required init() {
        super.init(nibName: nil, bundle: nil)
        context = AppContext(owner: self)
    }
}

/**
 */
extension RootViewController: UITabBarControllerDelegate {
    ///
    override var delegate: UITabBarControllerDelegate? {
        get { return self }
        set { super.delegate = delegate }
    }
}

extension RootViewController {
    ///
    var initialState: AppViewState {
        return .tabs(context)
    }

    /**
     */
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        guard !needsInitialState else {
            return start()
        }
    }

    /**
     */
    private func start() {
        needsInitialState = false
        context.proceed(to: initialState)
    }
}

/**
 */
extension Context where Owner: RootViewController {
    /**
     */
    func proceed(to state: AppViewState) {
        owner.appViewState = state
    }

    /**
     */
    func revert() {
        proceed(to: owner.previousAppViewState)
    }
}
