//
//  LoginPageViewController.swift
//  MyApp
//
//  Created by Bansi Mamtora on 02/03/22.
//

import UIKit

class TaskPageViewController: UIPageViewController {
    
    //MARK: - Variables
    lazy var orderedViewControllers: [UIViewController] = [viewControllerWith(name: Constants.signUpViewController), viewControllerWith(name: Constants.loginViewController)]
    var isLoading: Bool = false
    var currentIndex: Int = .zero
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
            setUpControllers()
    }
    
    func viewControllerWith(name: String) -> UIViewController{
        return UIStoryboard(name: Constants.practical1, bundle: nil).instantiateViewController(withIdentifier: name)
    }
    
    func setUpControllers(){
        currentIndex = .zero
        let firstVC = orderedViewControllers[currentIndex]
        setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
    }
}

//MARK: - PageControl Delegate
extension TaskPageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= .zero else {
            return nil
        }
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {
            return nil
        }
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllerCount = orderedViewControllers.count
        guard orderedViewControllerCount != nextIndex else {
            return nil
        }
        guard orderedViewControllerCount > nextIndex else {
            return nil
        }
        return orderedViewControllers[nextIndex]
    }
}

