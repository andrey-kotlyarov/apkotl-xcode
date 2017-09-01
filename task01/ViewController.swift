//
//  ViewController.swift
//  task01
//
//  Created by Andrey Kotlyarov on 31.08.17.
//  Copyright © 2017 APKotl. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation


class ViewController: UIViewController
{
    @IBOutlet var lblMessage: UILabel!
    @IBOutlet var btnA: UIButton!
    @IBOutlet var btnB: UIButton!
    @IBOutlet var btnC: UIButton!
    @IBOutlet var btnD: UIButton!
    
    static var counter: Int = 0
    
    @IBOutlet var txtStreamUrl: UITextField!
    @IBOutlet var btnPlayStream: UIButton!
    
    
    @IBAction func btnPlayStream_OnTouchUp(_ sender: Any)
    {
        let pvc = storyboard?.instantiateViewController(withIdentifier: "sbPlayerViewController") as! AVPlayerViewController
        
        let streamUrl = URL(string: txtStreamUrl.text!)
        pvc.player = AVPlayer(url: streamUrl!);
        
        present(pvc, animated: true, completion: nil)
        
    }
    
    
    @IBAction func btnA_OnTouchUp(_ sender: UIButton)
    {
        performSegue(withIdentifier: "segueToA", sender: self)
        
    }
    
    @IBAction func btnB_OnTouchUp(_ sender: UIButton)
    {
        let vcB = storyboard?.instantiateViewController(withIdentifier: "sbViewControllerB") as! ViewControllerB
        
        vcB.dataString = "Counter (btn touch) = \(ViewController.counter)"
        present(vcB, animated: true, completion: nil)
    }
    
    @IBAction func btnC_OnTouchUp(_ sender: UIButton)
    {
        /*
        let vcC = storyboard?.instantiateViewController(withIdentifier: "sbViewControllerC") as! ViewControllerC
        
        //vcC.dataString = "Counter = \(ViewController.counter)"
        present(vcC, animated: true, completion: nil)
        */
        
        let vcC = storyboard?.instantiateViewController(withIdentifier: "sbNavigationContainerC") as! UINavigationController
        
        //vcC.dataString = "Counter = \(ViewController.counter)"
        present(vcC, animated: true, completion: nil)
        
        
    }
    
    @IBAction func btnD_OnTouchUp(_ sender: UIButton)
    {
        let vcD = storyboard?.instantiateViewController(withIdentifier: "sbViewControllerD") as! ViewControllerD
        
        //vcD.dataString = "Counter = \(ViewController.counter)"
        vcD.showBackButton = true
        
        present(vcD, animated: true, completion: nil)
    }
    
    
    
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        ViewController.counter += 1
        
        txtStreamUrl.text = "http://72.3.166.231:1935/live/apkotlStream/playlist.m3u8";
        lblMessage.text = "Counter = \(ViewController.counter)"
        
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "segueToA"
        {
            let vcA = segue.destination as! ViewControllerA
            vcA.dataString = "Counter (prepare segue) = \(ViewController.counter)"
        }
        
        print("segue = \(segue.identifier ?? "-")")
    }
    
    
    
    

}

