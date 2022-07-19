//
//  ViewController.swift
//  visionFrameWorkPractice
//
//  Created by 이정민 on 2022/07/18.
//

import UIKit
import Vision

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.image = UIImage(named: "sample")
        //setLayout(imageView)
        
    }

    func setLayout(_ imageView: UIImageView) {
        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        imageView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 80).isActive = true
    }
    
}

class ContourDetector {
    // 싱글톤 패턴 인스턴스를 여러개 만들어도 하나의 요청만 받고 관리하도록
    static let shared = ContourDetector()

    private init() {}
    
    // 앱 수명주기 동안 재사용할 수 있는 단 하나의 요청만 있음을 보장
    // 요청을 받으면 만들어지고 없으면 없어지기 때문?
    private lazy var request: VNDetectContoursRequest = {
        let req = VNDetectContoursRequest()
        return req
    }()
    
    private func perform(request: VNRequest,
                         on image: CGImage) throws -> VNRequest {
      // 1
      let requestHandler = VNImageRequestHandler(cgImage: image, options: [:])
      
      // 2
      try requestHandler.perform([request])
      
      // 3
      return request
    }
}

