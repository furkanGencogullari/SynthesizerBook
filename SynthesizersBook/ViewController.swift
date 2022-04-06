//
//  ViewController.swift
//  SynthesizersBook
//
//  Created by Furkan Gençoğulları on 6.04.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var myTableList: UITableView!
    
    
    var synthArray = [Synthesizer]()
    var chosenSynth : Synthesizer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableList.delegate = self
        myTableList.dataSource = self
        
        let minimoog = Synthesizer(nameInit: "Minimoog", imageInit: UIImage(named: "minimoog")!, descriptionInit: "The Minimoog is an analog synthesizer first manufactured by Moog Music between 1970 and 1981. Designed as a more affordable, portable version of the modular Moog synthesizer, it was the first synthesizer sold in retail stores. It was first popular with progressive rock and jazz musicians and found wide use in disco, pop, rock and electronic music.")
        
        let juno106 = Synthesizer(nameInit: "Roland Juno-106", imageInit: UIImage(named: "juno-106")!, descriptionInit: "The Juno-106 is a polyphonic synthesizer with six voices. It is an analog synthesizer but with digitally controlled oscillators and chorus effects. Whereas its predecessor, the Juno-60, has 56 patches, the Juno-106 has 128. It introduced Roland's performance lever for pitch bends and modulation, which became a standard feature of Roland instruments. It also adds MIDI and was one of the first analog synthesizers to allow users to sequence parameter changes.")
        
        let ms20 = Synthesizer(nameInit: "Korg MS20", imageInit: UIImage(named: "ms20")!, descriptionInit: "The Korg MS-20 is a patchable semi-modular monophonic analog synthesizer which Korg released in 1978 and which was in production until 1983. Although the MS-20 follows a conventional subtractive synthesis architecture of oscillators/filter/vca, its patch panel allows some rerouting of both audio and modulation, and it includes an external signal processor.")
        
        let arp = Synthesizer(nameInit: "Arp 2500", imageInit: UIImage(named: "arp2500")!, descriptionInit: "The ARP 2500 is a monophonic analog modular synthesizer equipped with a set of sliding matrix switches above each module. These are the primary method of interconnecting modules. It is the first product of ARP Instruments Inc., built from 1970 to 1981. There are rows of 1/8 miniphone jacks at the end of each row of matrix switches, to interconnect rows of switches. The main 2500 cabinet can hold 15 modules, and optional wing cabinets can each hold 8.")
        
        let sh101 = Synthesizer(nameInit: "Roland SH-101", imageInit: UIImage(named: "sh-101")!, descriptionInit: "The Roland SH-101 is an analog synthesizer manufactured by the Roland Corporation between 1982 and 1986. Though it was something of a commercial failure during the time of its manufacture, it later became a staple of electronic music in the 1990s, particularly house music. It has a single oscillator and a sub-oscillator, a low-pass filter, a mixer allowing users to blend different waveforms plus a noise generator, and an arpeggiator and sequencer.")
        
        synthArray = [minimoog, juno106, ms20, arp, sh101]
    
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell ()
        cell.textLabel?.text = synthArray[indexPath.row].name
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return synthArray.count
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenSynth = synthArray[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.selectedSynth = chosenSynth
        }
    }

}

