//import UIKit
//import MapKit
//
//class ViewController: UIViewController, MKMapViewDelegate {
//    var mapView: MKMapView!
//    var locationManager: CLLocationManager!
//    let screenWidth = UIScreen.main.bounds.width
//    let screenHeight = UIScreen.main.bounds.height
//   // let centerY =  screenHeight
//    
//    private(set) lazy var contextView: UIView = {
//        let view = UIView()
//        view.frame = CGRect.init(x: 0, y: 6000, width: UIScreen.main.bounds.width, height: 900)
//        view.backgroundColor = UIColor.red
//        return view
//    }()
//    
//    private(set) lazy var containerView: UIView = {
//        let view = UIView()
//        view.frame = CGRect.init(x: 0, y: screenHeight - 300, width: screenWidth, height: 600)
//        view.backgroundColor = UIColor.red
//        return view
//    }()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // 初始化并设置地图视图
//        mapView = MKMapView(frame: view.bounds)
//        mapView.delegate = self
//        let configuration = MKStandardMapConfiguration(emphasisStyle: .muted)
//        mapView.preferredConfiguration = configuration
//        mapView.showsCompass = true
////        mapView.isZoomEnabled = false
//        mapView.showsTraffic = true
//        if #available(iOS 17.0, *) {
//            mapView.showsUserTrackingButton = true
//        } else {
//            // Fallback on earlier versions
//        }
//        let currentCoordinate = CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194)
//        mapView.centerCoordinate = currentCoordinate
//        view.addSubview(mapView)
//        locationManager = CLLocationManager()
//        locationManager.delegate = self
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        
//        // 检查并请求位置服务
//        checkLocationServices()
//        
//        
//        let gesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
//        containerView.addGestureRecognizer(gesture)
//        self.view.addSubview(containerView)
//    }
//    
//    @objc func handlePan(_ gesture: UIPanGestureRecognizer) {
//        let translation = gesture.translation(in: self.view)
//        
//        guard let gestureView = gesture.view else {
//            return
//        }
//
//        switch gesture.state {
//        case .began:
//            // 手势开始
//            break
//        case .changed:
//            gestureView.center = CGPoint(
//                        x: gestureView.center.x,
//                        y: max(min(gestureView.center.y + translation.y,screenHeight),
//                               screenHeight - 200)
//                    )
//            mapView.center = CGPoint(
//                x: gestureView.center.x,
//                y: max(min(gestureView.center.y + translation.y,screenHeight),
//                       screenHeight - 200)
//            )
//                
//            gesture.setTranslation(.zero, in: self.view)
//        case .ended, .cancelled:
//            print("dssdsd")
////            let velocity = gesture.velocity(in: self.view)
////            animateViewWithInertia(view: gestureView, velocity: velocity)
////            snapToNearestEdge(view: gestureView)
//        default:
//            break
//        }
//    }
//    
//    private func snapToNearestEdge(view: UIView) {
//        // 获取屏幕边缘
//        let screenBounds = self.view.bounds
//        
//        // 计算视图的水平中心位置
//        let midX = view.frame.midX
//        
//        // 计算视图离各边的距离
//        let leftDistance = midX
//        let rightDistance = screenBounds.width - midX
//        
//        // 动画贴紧最近的边缘
//        UIView.animate(withDuration: 0.3) {
//            if leftDistance < rightDistance {
//                view.frame.origin.x = 0 // 贴紧左边
//            } else {
//                view.frame.origin.x = screenBounds.width - view.frame.width // 贴紧右边
//            }
//        }
//    }
//    
//    func checkLocationServices() {
//        if CLLocationManager.locationServicesEnabled() {
//            checkLocationAuthorization()
//        } else {
//            // 位置服务不可用，处理相应情况
//            print("Location services are not enabled.")
//        }
//    }
//    
//    func checkLocationAuthorization() {
//        switch CLLocationManager.authorizationStatus() {
//        case .authorizedWhenInUse, .authorizedAlways:
//            mapView.showsUserLocation = true
//            locationManager.startUpdatingLocation()
//        case .denied, .restricted:
//            // 处理用户拒绝或限制访问位置信息
//            print("User has denied or restricted location access.")
//        case .notDetermined:
//            // 用户尚未决定授权状态，请求授权
//            locationManager.requestWhenInUseAuthorization()
//        @unknown default:
//            // 处理未知情况
//            break
//        }
//    }
//    
//    // MKMapViewDelegate 方法，用于在地图上展示用户位置更新
//    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
//        let region = MKCoordinateRegion(
//            center: userLocation.coordinate,
//            latitudinalMeters: 500,
//            longitudinalMeters: 500)
//        mapView.setRegion(region, animated: true)
//    }
//}
//
//// CLLocationManagerDelegate 方法处理授权状态变化和位置更新
//extension ViewController: CLLocationManagerDelegate {
//    
//    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
//        checkLocationAuthorization()
//    }
//    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        guard let location = locations.last else { return }
//        
//        let region = MKCoordinateRegion(
//            center: location.coordinate,
//            latitudinalMeters: 500,
//            longitudinalMeters: 500)
//        mapView.setRegion(region, animated: true)
//    }
//}
