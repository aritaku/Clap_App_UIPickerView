//
//  ViewController.swift
//  UIPickerView_practice
//
//  Created by 有村 琢磨 on 2015/04/06.
//  Copyright (c) 2015年 有村 琢磨. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource, AVAudioPlayerDelegate{
    
    var audioPlayer: AVAudioPlayer!
    
    @IBOutlet var pickerView : UIPickerView!
    var soundCount:Int = 0
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
    
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, fotComponent component: Int) -> String {
        return "\(row + 1)回"
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        soundCount = row
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        //再生する音源のURLを生成
        
        pickerView.dataSource = self
        pickerView.delegate = self
     
        let soundFilePath : NSString = NSBundle.mainBundle().pathForResource("clap", ofType: "wav")!
        let fileURL : NSURL = NSURL(fileURLWithPath: soundFilePath)!
        
        //AVAudionPlayerのインスタンス化
        audioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func plyaButton(){
        
        audioPlayer.numberOfLoops = soundCount
        audioPlayer.play()
    }
    
    
    

}

