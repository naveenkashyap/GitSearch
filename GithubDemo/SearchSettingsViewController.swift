//
//  SearchSettingsViewController.swift
//  GithubDemo
//
//  Created by Naveen Kashyap on 2/24/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import UIKit

protocol SettingsPresentingViewControllerDelegate: class {
    func didSaveSettings(settings: GithubRepoSearchSettings)
    func didCancelSettings()
}

class SearchSettingsViewController: UIViewController {

    @IBOutlet weak var starSlider: UISlider!
    @IBOutlet weak var minStars: UILabel!
    weak var delegate: SettingsPresentingViewControllerDelegate?
    var minStarValue: Int!
    var previousSettings: GithubRepoSearchSettings!
    var settings: GithubRepoSearchSettings! {
        didSet {
            minStarValue = settings.minStars
            previousSettings = settings
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        starSlider.minimumValue = 0
        starSlider.maximumValue = 10
        starSlider.value = Float(minStarValue)
        minStars.text = "\(minStarValue!)"
        print("starSlider.value: \(starSlider.value)")
        print(settings)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSlide(_ sender: Any) {
        minStars.text = "\(Int(starSlider.value))"
        minStarValue = Int(starSlider.value)
    }
    @IBAction func onSave(_ sender: Any) {
        settings.minStars = minStarValue
        print(settings)
        self.delegate?.didSaveSettings(settings: self.settings)
        dismiss(animated: true)
    }
    
    @IBAction func onCancel(_ sender: Any) {
        self.delegate?.didCancelSettings()
        dismiss(animated: true)
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
    }
}
