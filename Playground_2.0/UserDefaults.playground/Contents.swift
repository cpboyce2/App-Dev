import UIKit

let defaults = UserDefaults.standard

defaults.set(0.24, forKey: "Volume")
defaults.set(true, forKey: "MusicOn")
defaults.set("Connor", forKey: "PlayerName")
defaults.set(Date(), forKey: "AppLastOpened")

let volume = defaults.float(forKey: "Volume")
print(volume)
let appLastOpen = defaults.object(forKey: "AppLastOpened")
print(appLastOpen!)
