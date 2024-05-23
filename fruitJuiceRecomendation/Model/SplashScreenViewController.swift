//
//  SplashScreenViewController.swift
//  fruitJuiceRecomendation
//
//  Created by Henrian Pranata on 22/05/24.
//

import Foundation
import UIKit

class SplashScreenViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Tambahkan ImageView
        let splashImageView = UIImageView(frame: self.view.bounds)
        splashImageView.image = UIImage(named: "juicejoy logo") // Ganti dengan nama gambar splash Anda
        splashImageView.contentMode = .scaleAspectFill
        self.view.addSubview(splashImageView)
        
        // Tambahkan animasi rotasi
        UIView.animate(withDuration: 5.0, delay: 0, options: [.curveLinear], animations: {
            splashImageView.transform = CGAffineTransform(rotationAngle: .pi)
        }) { _ in
            // Pindah ke View Controller utama setelah 5 detik
            self.showMainViewController()
        }
    }
    
    func showMainViewController() {
        let mainVC = SplashScreenViewController() // Ganti dengan nama ViewController utama Anda
        mainVC.modalPresentationStyle = .fullScreen
        self.present(mainVC, animated: true, completion: nil)
    }
}

