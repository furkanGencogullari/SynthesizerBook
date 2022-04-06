//
//  DetailsViewController.swift
//  SynthesizersBook
//
//  Created by Furkan Gençoğulları on 6.04.2022.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var selectedSynth : Synthesizer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = selectedSynth?.image
        titleLabel.text = selectedSynth?.name
        descriptionTextView.text = selectedSynth?.description
        
        descriptionTextView.isEditable = false
        descriptionTextView.isSelectable = false
        
    }

}
