//
//  ViewController.swift
//  AlertUIKit
//
//  Created by 이윤지 on 12/14/23.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }

    @IBAction func alertOne(_ sender: Any) {
        let title = "다운로드를 완료했습니다"
        let message = "비디오 다운로드가 완료되면, 메뉴에서 확인할 수 있습니다"
        let buttonTitle = "ok"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: buttonTitle, style: UIAlertAction.Style.default){ _ in
            print("ok 버튼이 눌러졌습니다")
        }
        
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func alertTwo(_ sender: Any) {
        let title = "비디오를 로딩 실패"
        let message = "비디오를 로딩하는데 실패했습니다. 다시 시도해주세요"
        let okButton = "ok"
        let retryButton = "재다운로드"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: okButton, style: .default, handler: nil)
        
        let retryAction = UIAlertAction(title: retryButton, style: .cancel) { _ in
            print("코드를 호출하여 다운로드를 다시 시도하면 스피너가 나타날 수 있습니다")
        }
        alert.addAction(okAction)
        alert.addAction(retryAction)
        present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func alertThree(_ sender: Any) {
        let title = "정말 하시겠습니까?"
        let message = "삭제하면 복구할 수 없습니다. 그래도 삭제하시겠습니까?"
        let cancelButton = "취소"
        let deleteButton = "삭제"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: cancelButton, style: .cancel, handler: nil)
        
        let deleteAction = UIAlertAction(title: deleteButton, style: .destructive) { _ in
            print("비디오를 영구 삭제 했습니다")
        }
        alert.addAction(cancelAction)
        alert.addAction(deleteAction)
        
        present(alert, animated: true, completion: nil)
        
    }
    
}

