import UIKit

/**
 */
final class InitialController: ContextNavigationController {
    /**
     */
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    /**
     */
    required init(context: AppContext) {
        super.init(context: context)
        viewControllers = [
            Content()
        ]
    }
}

/**
 */
extension InitialController {
    /**
     */
    @IBAction func showModal(_ sender: Any?) {
        context.proceed(to: .modal(context))
    }
}

/**
 */
extension InitialController {
    /**
     */
    @objc(InitialControllerContent) final class Content: UIViewController {
        ///
        override var title: String? {
            get { return "Initial Context" }
            set { /* leave blank */ }
        }

        override func loadView() {
            loadView(inNib: "InitialControllerContent")
        }

        /**
         */
        override var preferredStatusBarStyle: UIStatusBarStyle {
            return .lightContent
        }
    }
}
