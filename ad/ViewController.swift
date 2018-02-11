//
//  ViewController.swift
//  ad
//
//  Created by 張書涵 on 2018/2/11.
//  Copyright © 2018年 AliceChang. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController, GADInterstitialDelegate {

    var interstitial:GADInterstitial!
    
    @IBOutlet weak var bannerView: GADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interstitial = createInterstitial()
        //讀入時也直接createInterstitial()
    }
    
    
    @IBAction func showBanner(_ sender: Any) {
        let request = GADRequest()
        bannerView.delegate = self
        request.testDevices = [ kGADSimulatorID ]
        bannerView.adUnitID = "ca-app-pub-5095539141044986/5269739217"
        bannerView.rootViewController = self
        bannerView.load(request)
        
    
    }
    
    @IBAction func showInterstial(_ sender: Any) {
        if interstitial.isReady{
            interstitial.present(fromRootViewController: self)
        }else{
            print("Ad wasn't ready")
        }
    }
    
    func createInterstitial() -> GADInterstitial{
        interstitial = GADInterstitial(adUnitID: "ca-app-pub-5095539141044986/9946462778")
        let request = GADRequest()
        //request.testDevices = [ kGADSimulatorID ]
        interstitial.load(request)
        interstitial.delegate = self
        return interstitial
        //將事前建立的code用createInterstitial包起來
    }
    
    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
        interstitial = createInterstitial()
        //關掉廣告的同時就讓 interstitial = createInterstitial()
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController:GADBannerViewDelegate{
    /// Tells the delegate an ad request loaded an ad.
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        print("adViewDidReceiveAd")
    }
    
    /// Tells the delegate an ad request failed.
    func adView(_ bannerView: GADBannerView,
                didFailToReceiveAdWithError error: GADRequestError) {
        print("adView:didFailToReceiveAdWithError: \(error.localizedDescription)")
    }
    
    /// Tells the delegate that a full-screen view will be presented in response
    /// to the user clicking on an ad.
    func adViewWillPresentScreen(_ bannerView: GADBannerView) {
        print("adViewWillPresentScreen")
    }
    
    /// Tells the delegate that the full-screen view will be dismissed.
    func adViewWillDismissScreen(_ bannerView: GADBannerView) {
        print("adViewWillDismissScreen")
    }
    
    /// Tells the delegate that the full-screen view has been dismissed.
    func adViewDidDismissScreen(_ bannerView: GADBannerView) {
        print("adViewDidDismissScreen")
    }
    
    /// Tells the delegate that a user click will open another app (such as
    /// the App Store), backgrounding the current app.
    func adViewWillLeaveApplication(_ bannerView: GADBannerView) {
        print("adViewWillLeaveApplication")
    }
    
}

