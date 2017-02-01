import UIKit

/**
 */
extension NSObjectProtocol where Self: UIViewController {
    /**
     */
    @discardableResult
    public final func loadView(inNib nibName: String, bundle: Bundle? = nil, options optionsOrNil: [AnyHashable : Any]? = nil) -> [Any] {
        // Unpack the nib
        let nib: UINib? = UINib(nibName: nibName, bundle: bundle)
        let objects: [Any] = nib?.instantiate(withOwner: self, options: optionsOrNil) ?? [UIView()]

        // Set the 'view'
        self.view = objects.first as? UIView

        // Return the objects
        return objects
    }
}
