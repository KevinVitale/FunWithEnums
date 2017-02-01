import UIKit

/**
 */
final class ModalController: ContextNavigationController {
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
extension ModalController {
    /**
     */
    @IBAction func showTabs(_ sender: Any?) {
        context.proceed(to: .tabs(context))
    }
    
    /**
     */
    @IBAction func modifyContext(_ sender: Any?) {
        let context = self.context!
        context.date = Date()
        context.proceed(to: .alert(context
          , title: "Context Modified"
          , message: "\(context.date)"
          , actions: [
              UIAlertAction(title: "Got it!", style: .default, handler: { _ in
                context.revert()
              })
          ])
        )
    }
}

/**
 */
extension ModalController {
    /**
     */
    @objc(ModalControllerContent) final class Content: UIViewController {
        ///
        override var title: String? {
            get { return "Modal Context" }
            set { /* leave blank */ }
        }

        override func loadView() {
            loadView(inNib: "ModalControllerContent")
        }

        /**
         */
        override var preferredStatusBarStyle: UIStatusBarStyle {
            return .lightContent
        }
    }
}
