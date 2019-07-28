// (C) 2019, Ralf Ebert - iOS Example Project: Stopwatch
// License: https://opensource.org/licenses/0BSD

import UIKit

class StopWatchViewController: UIViewController {

    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var timerButton: UIButton!

    var timer: Timer?
    var ms = 0

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func buttonTapped(_: AnyObject) {
        if self.timer != nil {
            // Wenn bereits ein Timer gesetzt ist: Timer stoppen
            self.timer?.invalidate()
            self.timer = nil
            self.timerButton.setTitle("Start", for: .normal)
        } else {
            // Sofern aktuell kein Timer läuft: Timer starten
            self.ms = 0
            self.timerButton.setTitle("Stopp", for: .normal)
            self.timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
        }
        self.update()
    }

    @objc func update() {
        self.ms += 1
        self.timerLabel.text = String(format: "%02d:%02d", self.ms / 100, self.ms % 100)
    }

}
