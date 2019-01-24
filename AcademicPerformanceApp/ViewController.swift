//
//  ViewController.swift
//  AcademicPerformanceApp
//
//  Created by kirill on 1/17/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import UIKit

class LoginRegisterSwitcherViewController: UIPageViewController, UIScrollViewDelegate {
    //MARK: - Variables and objects
    weak var switcherDelegate: SwitcherPageViewControllerDelegate?
    var mainImageView = UIImageView(image: UIImage(named: "LoginImage")!)
    var visibleView:Int = 0
    
    var signInLabel: UILabel?
    var registrationLabel: UILabel?
    var headerView: UIView?
    
    //MARK: - Constants
    let maxRectForRegisterLabel: CGFloat = 195.0
    let heightOfRegistrationLabel: CGFloat = 60.0
    let widthOfRegistrationLabel: CGFloat = 145.0
    let namewidthOfRegistrationLabelWithPadding: CGFloat = 155.0
    
    
    private(set) lazy var orderedViewControllers: [UIViewController] = {
        // The view controllers will be shown in this order
        return [self.newChildViewController("loginViewController"),
                self.newChildViewController("registrationViewController")]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        delegate = self
        
        mainImageView.frame = UIScreen.main.bounds
        mainImageView.contentMode = .scaleAspectFill
        view.insertSubview(mainImageView, at: 0)
        
        //Constants for headerView
        let precentageOfView: CGFloat = 0.31
        let heightSignInLabel: CGFloat = 70.0
        let xPositionOfSignInLabel: CGFloat = 20.0
        let widthForSignInLabel: CGFloat = 150.0
        
        headerView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: view.frame.width, height: view.frame.height * precentageOfView))
        headerView?.backgroundColor = UIColor.clear
        
        signInLabel = UILabel(frame: CGRect(x: xPositionOfSignInLabel, y: headerView!.frame.height - heightSignInLabel, width: widthForSignInLabel, height: heightSignInLabel))
        signInLabel?.textColor = COLORS_PALETTE.last
        signInLabel?.text = "Sign In"
        signInLabel?.font = UIFont(name: "noteworthy-bold", size: MAX_FONT_SIZE)
        
        registrationLabel = UILabel(frame: CGRect(x: headerView!.frame.width - namewidthOfRegistrationLabelWithPadding, y: headerView!.frame.height - heightOfRegistrationLabel - 2, width: widthOfRegistrationLabel, height: heightOfRegistrationLabel))
        registrationLabel?.textColor = COLORS_PALETTE.first
        registrationLabel?.text = "Registration"
        registrationLabel?.font = UIFont(name: "noteworthy-bold", size: MIN_FONT_SIZE)
        
        headerView?.insertSubview(signInLabel!, at: 0)
        headerView?.insertSubview(registrationLabel!, at: 0)
        
        view.insertSubview(headerView!, at: 1)
        
        if let initialViewController = orderedViewControllers.first {
            scrollToViewController(viewController: initialViewController)
        }
        
        for v in view.subviews{
            if let scrollView = v as? UIScrollView {
                    scrollView.delegate = self
            }
        }
        
        switcherDelegate?.switcherPageViewController(swithcerPageViewController: self, didUpdatePageCount: orderedViewControllers.count)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        var xPositionOfScroll = scrollView.contentOffset.x
        let sceneWidth = view.frame.width
        if (xPositionOfScroll>sceneWidth) {
            xPositionOfScroll -= sceneWidth
        } else{
            xPositionOfScroll = sceneWidth - xPositionOfScroll
        }
        guard xPositionOfScroll > 0, xPositionOfScroll != sceneWidth else { return }
        
        let k = sceneWidth / CGFloat(COLORS_PALETTE.count)
        let index = Int(xPositionOfScroll / k)
        
        let val = (xPositionOfScroll / sceneWidth) * (MAX_FONT_SIZE - MIN_FONT_SIZE)
        //(orderedViewControllers[0] as! LoginViewController).animateView(type: visibleView, value: val, index: index)
        //(orderedViewControllers[1] as! RegistrationViewController).animateView(type: visibleView, value: val, index: index)
        animateView(type: visibleView, value: val, index: index)
    }
    
    func animateView(type: Int,value: CGFloat, index: Int) {
        guard signInLabel != nil else { return }
        guard index > 0 && index < COLORS_PALETTE.count else { return }
        
        let coefficient: CGFloat = 5.0
        
        switch type
        {
        case 0:
            if (MAX_FONT_SIZE>signInLabel!.font.pointSize) {
                signInLabel?.font = signInLabel!.font.withSize(MIN_FONT_SIZE + value)
                signInLabel!.textColor = COLORS_PALETTE[index]
            }
            if (MIN_FONT_SIZE<registrationLabel!.font.pointSize) {
                registrationLabel!.font = registrationLabel!.font.withSize(MAX_FONT_SIZE - value)
                registrationLabel!.textColor = COLORS_PALETTE[COLORS_PALETTE.count - index - 1]
                registrationLabel!.frame = CGRect(x: headerView!.frame.width - maxRectForRegisterLabel - 10 + value * coefficient, y: headerView!.frame.height - heightOfRegistrationLabel - 2, width: maxRectForRegisterLabel - value * coefficient, height: heightOfRegistrationLabel)
            }
            break;
        case 1:
            if (MAX_FONT_SIZE>registrationLabel!.font.pointSize) {
                registrationLabel!.font = registrationLabel!.font.withSize(MIN_FONT_SIZE + value)
                registrationLabel!.textColor = COLORS_PALETTE[index]
                registrationLabel!.frame = CGRect(x: headerView!.frame.width - namewidthOfRegistrationLabelWithPadding - value * coefficient, y: headerView!.frame.height - heightOfRegistrationLabel - 2, width: widthOfRegistrationLabel + value * coefficient, height: heightOfRegistrationLabel)
            }
            if (MIN_FONT_SIZE<signInLabel!.font.pointSize) {
                signInLabel!.font = signInLabel!.font.withSize(MAX_FONT_SIZE - value)
                signInLabel!.textColor = COLORS_PALETTE[COLORS_PALETTE.count - index - 1]
            }
            break;
        default:
            break;
        }
    }
    
    /**
     Scrolls to the next view controller.
     */
    func scrollToNextViewController() {
        if let visibleViewController = viewControllers?.first,
            let nextViewController = pageViewController(self, viewControllerAfter: visibleViewController) {
            scrollToViewController(viewController: nextViewController)
        }
    }
    
    /**
     Scrolls to the view controller at the given index. Automatically calculates
     the direction.
     
     - parameter newIndex: the new index to scroll to
     */
    func scrollToViewController(index newIndex: Int) {
        if let firstViewController = viewControllers?.first,
            let currentIndex = orderedViewControllers.firstIndex(of: firstViewController) {
            let direction: UIPageViewController.NavigationDirection = newIndex >= currentIndex ? .forward : .reverse
            let nextViewController = orderedViewControllers[newIndex]
            scrollToViewController(viewController: nextViewController, direction: direction)
        }
    }
    
    func newChildViewController(_ color: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil) .
            instantiateViewController(withIdentifier: color)
    }
    
    /**
     Scrolls to the given 'viewController' page.
     
     - parameter viewController: the view controller to show.
     */
    private func scrollToViewController(viewController: UIViewController,
                                        direction: UIPageViewController.NavigationDirection = .forward) {
        setViewControllers([viewController],
                           direction: direction,
                           animated: true,
                           completion: { (finished) -> Void in
                            // Setting the view controller programmatically does not fire
                            // any delegate methods, so we have to manually notify the
                            // 'Delegate' of the new index.
                            self.notifySwitcherDelegateOfNewIndex()
        })
    }
    
    private func notifySwitcherDelegateOfNewIndex() {
        if let firstViewController = viewControllers?.first,
            let index = orderedViewControllers.firstIndex(of: firstViewController) {
            switcherDelegate?.switcherPageViewController(switcherPageViewController: self, didUpdatePageIndex: index)
        }
    }
    
}

// MARK: UIPageViewControllerDataSource
extension LoginRegisterSwitcherViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        // User is on the first view controller and swiped left to loop to
        // the last view controller.
        guard previousIndex >= 0 else {
            self.visibleView = 1
            return orderedViewControllers.last
        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        self.visibleView = 0
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else { return nil }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count
        
        // User is on the last view controller and swiped right to loop to
        // the first view controller.
        guard orderedViewControllersCount != nextIndex else {
            self.visibleView = 0
            return orderedViewControllers.first
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        self.visibleView = 1
        return orderedViewControllers[nextIndex]
    }
    
}

extension LoginRegisterSwitcherViewController: UIPageViewControllerDelegate {
    
    func pageViewController(pageViewController: UIPageViewController,
                            didFinishAnimating finished: Bool,
                            previousViewControllers: [UIViewController],
                            transitionCompleted completed: Bool) {
        notifySwitcherDelegateOfNewIndex()
    }
    
}

protocol SwitcherPageViewControllerDelegate: class {
    
    /**
     Called when the number of pages is updated.
     
     - parameter tutorialPageViewController: the TutorialPageViewController instance
     - parameter count: the total number of pages.
     */
    func switcherPageViewController(swithcerPageViewController: LoginRegisterSwitcherViewController,
                                    didUpdatePageCount count: Int)
    
    /**
     Called when the current index is updated.
     
     - parameter tutorialPageViewController: the TutorialPageViewController instance
     - parameter index: the index of the currently visible page.
     */
    func switcherPageViewController(switcherPageViewController: LoginRegisterSwitcherViewController,
                                    didUpdatePageIndex index: Int)
    
}

