//
//  ViewController.swift
//  NewlyCoinedWord
//
//  Created by 이은서 on 2023/07/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var wordButtons: [UIButton]!
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var searchButton: UIButton!
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var resultImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        designResultLabel()
        designButton()
        designTextField()
        designSearchButton()
        resultImageView.image = UIImage(named: "word_logo")
        makeRandomButton()
    }
    
    func designResultLabel() {
        resultLabel.textAlignment = .center
        resultLabel.numberOfLines = 0
        resultLabel.text = ""
    }
    func designButton() {
        for item in wordButtons {
            item.tintColor = .black
            item.backgroundColor = .white
            item.layer.cornerRadius = 10
            item.configuration?.titleAlignment = .center
            item.layer.borderWidth = 1
            item.layer.borderColor = UIColor.black.cgColor

        }
    }
    func designTextField() {
        searchTextField.layer.borderWidth = 2
        searchTextField.layer.borderColor = UIColor.black.cgColor
        searchTextField.clearButtonMode = .whileEditing
    }
    func designSearchButton() {
        searchButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchButton.layer.borderColor = UIColor.black.cgColor
        searchButton.layer.borderWidth = 2
        searchButton.backgroundColor = .black
        searchButton.tintColor = .white
    }
    
    var newWord = ["군싹": "군침이 싹 도네", "남아공": "남아서 공부나 해라", "돈쭐": "착한 일을 한 가게에 찾아가서 물건이나 음식을 팔아주는 행위", "돼지런하다": "평소에는 게으른데 먹을 때만 부지런하다", "런치플레이션": "점심값이 너무 비싸다", "무물보": "무엇이든 물어보세요", "어쩔티비": "어쩌라고", "sbn": "선배님", "ㄹㄱㅎㅃ": "라고할뻔의 초성어로 약올릴 때 쓰는 말", "내또출": "내일 또 출근", "편리미엄": "편리한 것이 프리미엄이다", "쩝쩝박사": "음식의 조합을 잘 맞추는 사람", "인급동": "인기 급상승 동영상의 약자로 유튜브에서 많이 사용하는 단어", "드르륵 탁": "테이프를 되감기 할 떄 나는 소리로 다시 보고 싶은 장면에 사용하는 신조어"]
    
    func makeRandomButton() {
        var words: Set<String> = []
        while words.count != 4 {
            words.insert(newWord.randomElement()!.key)
        }
        var count = 0
        for i in wordButtons {
            i.setTitle(Array(words)[count], for: .normal)
            count += 1
        }
        
    }
    
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        searchTextField.text = sender.currentTitle
        typeWordTextField(searchTextField)
        makeRandomButton()
    }
    
    @IBAction func typeWordTextField(_ sender: Any) {
        resultImageView.image = UIImage(named: "background")
        for i in newWord.keys {
            if searchTextField.text == i {
                resultLabel.text = "\"\(i)\"의 뜻은 \n\"\(newWord[i]!)\"입니다."
                break
            } else {
                resultLabel.text = "입력하신 \"\(searchTextField.text ?? "")\" 단어는 사전에 존재하지 않습니다."
            }
        }
        makeRandomButton()
        view.endEditing(true)
    }
    
    
    @IBAction func viewTappedGesture(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}

