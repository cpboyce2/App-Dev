//
//  ViewController.swift
//  Flowers
//
//  Created by Connor Boyce on 9/13/19.
//  Copyright © 2019 Connor Boyce. All rights reserved.
//

import UIKit
import CoreML
import Vision
import Alamofire
import SwiftyJSON
import SDWebImage


class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    let imageSelector = UIImagePickerController()
    @IBOutlet weak var mainImageView: UIImageView!

    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageSelector.delegate = self
        imageSelector.allowsEditing = false
        imageSelector.sourceType = .camera
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let userPickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {

            guard let coreImage = CIImage(image: userPickedImage) else {
                fatalError("Could not convert image")
            }

            detect(image: coreImage)
        }
        imageSelector.dismiss(animated: true, completion: nil)
    }

        func detect(image: CIImage){
            guard let flowerModel = try? VNCoreMLModel(for: FlowerClassifier().model) else {
                fatalError("Could not load the COREML model")
            }

            let request = VNCoreMLRequest(model: flowerModel) { (request, error) in
                guard let results = request.results as? [VNClassificationObservation] else {
                    fatalError("Could not make the request")
                }
                print(results)
                let classification = request.results?.first as? VNClassificationObservation
                self.navigationItem.title = classification?.identifier.capitalized
                

            }

            let handler = VNImageRequestHandler(ciImage: image)
            do{
                try handler.perform([request])

            } catch {

                print(error)
            }

            getWikiData(flowerName: navigationItem.title!)

        }


    @IBAction func cameraButtonPressed(_ sender: UIBarButtonItem) {
        present(imageSelector, animated: true, completion: nil)
        
    }

    func getWikiData(flowerName: String){
        let wikiURL = "https://en.wikipedia.org/w/api.php"
        let parameters : [String:String] = [
            "format" : "json",
            "action" : "query",
            "prop" : "extracts|pageimages",
            "exintro" : "",
            "explaintext" : "",
            "titles" : flowerName,
            "indexpageids" : "",
            "redirects" : "1",
            "pithumbsize" : "500"]

        Alamofire.request(wikiURL, method: .get, parameters: parameters).responseJSON { (response) in
            if response.result.isSuccess{
                let wikiJSON: JSON = JSON(response.result.value!)
                let pageID = wikiJSON["query"]["pageids"][0].stringValue
                let flowerDescription = wikiJSON["query"]["pages"][pageID]["extract"].stringValue
                let flowerImageURL = wikiJSON["query"]["pages"][pageID]["thumbnail"]["source"].stringValue
                self.mainImageView.sd_setImage(with: URL(string: flowerImageURL))
                self.textLabel.text = flowerDescription
            }


        }
    }

}



