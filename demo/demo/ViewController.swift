//
//  ViewController.swift
//  demo
//
//  Created by lhs7248 on 16/12/30.
//  Copyright © 2016年 lhs7248. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        

        let image = UIImage.imageWithColor(color: UIColor.blue, size: CGSize(width: 10, height: 10))
        
        
        imageView.image = image;
        
//        imageView.image = UIImage.imageWithColor(color: UIColor.red, size: imageView.bounds.size)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

