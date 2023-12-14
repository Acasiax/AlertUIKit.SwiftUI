# 버튼 스타일에 따른 경고창 설정
showAlertTwo와 showAlertThree의 차이점은 각각의 경고창에서 설정된 버튼 스타일에 있습니다.

showAlertTwo:
showAlertTwo의 경고창은 primaryButton으로 "재다운로드"를 설정했습니다.



따라서 .default 스타일로 설정된 버튼이 기본으로 선택됩니다.


기본 버튼은 경고창이 나타날 때 누르는 키(주로 Return 키)의 기본 반응입니다.


showAlertThree:
showAlertThree의 경고창은 secondaryButton으로 "취소"를 설정했습니다.


.cancel 스타일로 설정된 버튼은 경고창의 취소 작업을 나타냅니다.


일반적으로 .cancel 스타일은 기본적으로 선택되며 사용자가 경고창을 닫거나 취소할 때 사용됩니다.


이렇게 버튼이 미리 선택되어 있는 것은 경고창에서 버튼에 부여된 스타일에 따라 달라집니다. 

"재다운로드"는 기본 버튼으로 설정되어 있기 때문에, 경고창이 표시될 때 미리 선택되어 있습니다.

반면 "취소"는 주로 경고창에서의 취소 작업을 나타내기 때문에, 경고창이 표시될 때 미리 선택되어 있는 것입니다.

```swift
import SwiftUI
            
            Button(action: {
                showAlertTwo.toggle()
            }) {
                Text("Alert Two")
            }
            .alert(isPresented: $showAlertTwo) {
                Alert(title: Text("비디오를 로딩 실패"),
                      message: Text("비디오를 로딩하는데 실패했습니다. 다시 시도해주세요"),
                      primaryButton: .default(Text("재다운로드")) {
                          print("코드를 호출하여 다운로드를 다시 시도하면 스피너가 나타날 수 있습니다")
                      },
                      secondaryButton: .cancel(Text("OK")))
                
            }
            
            Button(action: {
                showAlertThree.toggle()
            }) {
                Text("Alert Three")
            }
            .alert(isPresented: $showAlertThree) {
                Alert(title: Text("정말 하시겠습니까?"),
                      message: Text("삭제하면 복구할 수 없습니다. 그래도 삭제하시겠습니까?"),
                      primaryButton: .destructive(Text("삭제")) {
                          print("비디오를 영구 삭제 했습니다")
                      },
                      secondaryButton: .cancel(Text("취소")))
            }
        }
#Preview {
    AlertSwiftUI()
}
```

# .alert의 primaryButton과 secondaryButton의 차이점
- .alert의 primaryButton과 secondaryButton은 경고창(alert)에서 버튼을 나타내는 데 사용되는 두 가지 버튼 유형입니다.

- primaryButton:
primaryButton은 일반적으로 주요한 작업 또는 주요한 결정을 나타내는 버튼입니다.
.destructive 스타일을 사용할 수 있으며, 이는 사용자가 실수로 중요한 작업을 실행하는 것을 방지하기 위해 경고하는 데 주로 사용됩니다.
주로 "삭제", "확인" 등과 같이 주요 작업을 수행하는 버튼으로 표시됩니다.
.destructive 스타일은 버튼 텍스트를 강조하여 사용자의 주의를 끌고 중요한 작업에 대한 경고를 제공합니다.
- secondaryButton:
secondaryButton은 주요 작업 외의 대체 작업이나 취소, 뒤로가기와 같은 보조적인 작업을 나타내는 버튼입니다.
.cancel 스타일을 사용하여 사용자가 경고창을 닫거나 주요 작업을 취소할 수 있는 버튼으로 표시됩니다.
주로 "취소", "닫기", "뒤로가기" 등과 같이 기본적인 작업을 수행하는 버튼으로 사용됩니다.
예를 들어, 위의 코드에서 primaryButton은 "삭제" 버튼으로 설정되어 있고, .destructive 스타일을 사용하여 사용자가 비디오를 영구적으로 삭제하는 작업을 수행합니다. 반면 secondaryButton은 "취소" 버튼으로 설정되어 있고, 사용자가 삭제를 취소하거나 경고창을 닫을 수 있는 작업을 수행합니다.

이 두 버튼은 주요 작업과 대체 작업 또는 취소 작업을 분명히 나타내어 사용자가 선택할 수 있도록 도와줍니다.

***
# UIKit 방식

```swift
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
```

***
# 앱의 시작 파일을 설정하여 Swift UI 파일이 UIKit 파일보다 먼저 나오게 하기



