//
//  ViewController.swift
//  1-StopWatch
//
//  Created by weirenxin on 2016/12/22.
//  Copyright © 2016年 广西家饰宝科技有限公司. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var pauseBtn: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    
    private var counter = 0.0
    private var Timer = Foundation.Timer()
    private var isPlaying = false
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        timeLabel.text = String(counter)
        super.viewDidLoad()
    }
    
    /// 开始
    @IBAction func playButtonDidTouch(_ sender: Any) {
        
        if isPlaying {
            return
        }
        playBtn.isEnabled = false
        pauseBtn.isEnabled = true
        
        Timer = Foundation.Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.updateTimer), userInfo: nil, repeats: true)
        isPlaying = true
    }
    /// 暂停
    @IBAction func pasueButtonDidTouch(_ sender: Any) {
        
        playBtn.isEnabled = true
        pauseBtn.isEnabled = false
        Timer.invalidate()
        isPlaying = false
    }
    /// 重置
    @IBAction func resetButtonDidTouch(_ sender: Any) {
        
        Timer.invalidate()
        isPlaying = false
        counter = 0
        timeLabel.text = String(counter)
        playBtn.isEnabled = true
        pauseBtn.isEnabled = true
    }
    
    @objc private func updateTimer() {
        
        counter = counter + 0.1;
        timeLabel.text = String(format: "%0.1f",counter)
    }
}

