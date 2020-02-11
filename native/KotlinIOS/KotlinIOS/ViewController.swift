//
//  ViewController.swift
//  KotlinIOS
//
//  Created by asmz on 2020/02/08.
//  Copyright © 2020 asmz. All rights reserved.
//

import UIKit
import SharedCode

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 21))
        label.center = CGPoint(x: 160, y: 285)
        label.textAlignment = .center
        label.font = label.font.withSize(25)
        label.text = CommonKt.createApplicationScreenMessage()
        view.addSubview(label)

        // fetch
        let client = ApiClient()
        indicator.startAnimating()
        client.about { [weak self] text in
            self?.indicator.stopAnimating()
            self?.textView.text = text
        }
    }


}

