import UIKit

class ProfileModalViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let button = UIButton(type: .system)
        button.setTitle("Show Profile", for: .normal)
        button.addTarget(self, action: #selector(showProfile), for: .touchUpInside)
        
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func showProfile() {
        let profileVC = ProfileViewController()
        profileVC.modalPresentationStyle = .custom
        profileVC.transitioningDelegate = profileVC
        self.present(profileVC, animated: true)
    }
}