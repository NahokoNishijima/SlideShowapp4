//
//  ViewController.swift
//  SlideShowApp
//
//  Created by 西島菜穂子 on 2019/03/05.
//  Copyright © 2019 nahoko.nishijima. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //imageView アウトレット
    @IBOutlet weak var imageView: UIImageView!
    //segue
    @IBAction func onTapimage(_ sender: Any) {
        performSegue(withIdentifier: "result", sender: nil)
    }
    //kakudaiViewControllerへの遷移準備
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let kakudaiViewController:KakudaiViewController = segue.destination as! KakudaiViewController
        kakudaiViewController.image = imageView.image
    }
    
    var imageIndex = 0
    
    var timer: Timer!
    
    //画像の配列
    let images = [UIImage(named: "IMG_001") ,UIImage(named: "IMG_002") ,UIImage(named: "IMG_003")]
   
    //最初の画面どうする？
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstimage = images [0]
        imageView.image = firstimage
    }
    
    //進むボタン
    @IBOutlet weak var susumuTap: UIButton!
    @IBAction func susumuTap(_ sender: Any) {
        //画像を進める
        if imageIndex == 2 {
            imageIndex = 0
        } else {
            imageIndex += 1
        }
        imageView.image = images[imageIndex]
    }
    //戻るボタン
    
    @IBOutlet weak var modoruTap: UIButton!
    @IBAction func modoruTap(_ sender: Any) {
        //画像を戻す
        if imageIndex == 0 {
            imageIndex = 2
        } else {
            imageIndex -= 1
        }
        imageView.image = images[imageIndex]
    }
    
    @objc func imagetimer(_ timer: Timer) {
        if self.imageIndex == 2 {
            self.imageIndex = 0
        } else {
            self.imageIndex += 1
        }
        self.imageView.image = images[imageIndex]
    }
    
    @IBOutlet weak var playpauseTap: UIButton!
    //停止ボタン押す
    @IBAction func playpauseTap(_ sender: Any) {
        if self.timer != nil {
            self.timer.invalidate()
            self.timer = nil
            playpauseTap.setTitle("再生", for: UIControl.State())
            susumuTap.isEnabled = true
            modoruTap.isEnabled = true
    
    //再生ボタン押す
        } else {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(imagetimer(_:)) , userInfo: nil, repeats: true)
            playpauseTap.setTitle("停止", for: UIControl.State())
            susumuTap.isEnabled = false
            modoruTap.isEnabled = false
        
    }
}
    @IBAction func unwind(_ segue:UIStoryboardSegue){
    }
}
