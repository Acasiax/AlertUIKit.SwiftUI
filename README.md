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
이렇게 버튼이 미리 선택되어 있는 것은 경고창에서 버튼에 부여된 스타일에 따라 달라집니다. "재다운로드"는 기본 버튼으로 설정되어 있기 때문에, 경고창이 표시될 때 미리 선택되어 있습니다. 반면 "취소"는 주로 경고창에서의 취소 작업을 나타내기 때문에, 경고창이 표시될 때 미리 선택되어 있는 것입니다.

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
