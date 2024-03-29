//
//  DetailViewController.swift
//  3DPCiPAD
//
//  Created by Laurent B on 14/10/2019.
//  Copyright © 2019 Laurent B. All rights reserved.
//

import UIKit
import AVKit

class DetailViewController: UIViewController {

    // This is the variable which gets allocated in the prepare for segue method of the previous viewcontroller
    // Visibility is internal by default but not private!
    var model: Model!
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    @IBOutlet private weak var modelImageView: UIImageView!
    @IBOutlet private weak var textView: UITextView!
    @IBAction private func playVideo(_ sender: UIButton) {
         let urlPath = Bundle.main.path(forResource: model.image, ofType: "mp4")!
         let videoURL = URL(fileURLWithPath: urlPath)
         let player = AVPlayer(url: videoURL)
         let vc = AVPlayerViewController()
         vc.player = player
         present(vc, animated: true) {
             vc.player?.play()
         }
     }
    

    // MARK:- Actions
    @IBAction private func close() {
        // this is the right way to dismiss the view controller. The presenting vc is dismissing it not the presented, as explained by Hegarty of Stanford
            presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    

    
    
    override func viewWillAppear(_ animated: Bool) {

    }
    func updateUI() {
        titleLabel.text = model.title
        subtitleLabel.text = model.subtitle
        textView.text = model.contentText
        modelImageView.image = UIImage(named: "Placeholder")
        // the name of the large images have L appended to the name
        modelImageView.image = UIImage(named: model.image + "L" + ".jpg")
        // Dynamic Type for the content. iOS offers the option to enhance the legibility of text by increasing font weight and setting the preferred font size for apps. The user can open the Settings app and navigate to General ▸ Accessibility ▸ Larger Text to access Dynamic Type text sizes and make te contents bigger
        textView.font = .preferredFont(forTextStyle: .body)
        //when the user returns from changing the text size settings, the app should refresh the screen without needing an app restart. You can do this by reloading the table view when the app receives a UIContentSizeCategoryDidChange notification
        textView.adjustsFontForContentSizeCategory = true
    }
}
