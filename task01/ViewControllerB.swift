//
//  ViewControllerB.swift
//  task01
//
//  Created by Andrey Kotlyarov on 31.08.17.
//  Copyright © 2017 APKotl. All rights reserved.
//

import UIKit

class ViewControllerB: UIViewController
{
    public var dataString: String?
    @IBOutlet var lblData: UILabel!
    @IBOutlet var btnBack: UIButton!
    
    
    @IBAction func btnBack_OnTouchUp(_ sender: UIButton)
    {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        lblData.text = dataString

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
