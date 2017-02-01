import UIKit

/**
 */
final class AlertController: ContextNavigationController {
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
extension AlertController {
    @IBAction func showAlert(_ sender: Any?) {
        context.proceed(to: .alert(context
          , title: "Hey! Listen"
          , message: "It's all about context."
          , actions: [
              UIAlertAction(title: "Got it!", style: .default, handler: { [weak self] _ in
                  self?.context.revert()
              })
          ])
        )
    }
}

/**
 */
extension AlertController {
    /**
     */
    @objc(AlertControllerContent) final class Content: UIViewController {
        ///
        override var title: String? {
            get { return "Alert Context" }
            set { /* leave blank */ }
        }

        override func loadView() {
            loadView(inNib: "AlertControllerContent")
        }

        /**
         */
        override var preferredStatusBarStyle: UIStatusBarStyle {
            return .lightContent
        }
    }
}
