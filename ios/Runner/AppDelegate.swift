import UIKit
import Flutter
import GoogleMaps
import Firebase
import ScanditCaptureCore
import ScanditBarcodeCapture

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // Use Firebase library to configure APIs
    FirebaseApp.configure()
    GeneratedPluginRegistrant.register(with: self)
    GMSServices.provideAPIKey("AIzaSyAwHFV7LL99A-PXa7J1k7H1MhT4_RUgZtk")
    if #available(iOS 10.0, *) {
      // For iOS 10 display notification (sent via APNS)
      UNUserNotificationCenter.current().delegate = self

      let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
      UNUserNotificationCenter.current().requestAuthorization(
        options: authOptions,
        completionHandler: {_, _ in })
    } else {
      let settings: UIUserNotificationSettings =
      UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
      application.registerUserNotificationSettings(settings)
    }

    application.registerForRemoteNotifications()
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
