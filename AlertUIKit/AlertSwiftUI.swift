//
//  AlertSwiftUI.swift
//  AlertUIKit
//
//  Created by 이윤지 on 12/14/23.
//

import SwiftUI



struct AlertSwiftUI: View {
    @State private var showAlertOne = false
    @State private var showAlertTwo = false
    @State private var showAlertThree = false
    var body: some View {
        VStack {
            Button(action: {
                showAlertOne.toggle()
            }) {
                Text("Alert 1️⃣")
            }
            .alert(isPresented: $showAlertOne) {
                Alert(title: Text("다운로드를 완료했습니다"),
                      message: Text("비디오 다운로드가 완료되면, 메뉴에서 확인할 수 있습니다"),
                      dismissButton: .default(Text("OK")) {
                          print("OK 버튼이 눌러졌습니다")
                      })
            }
            
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
    }
}

#Preview {
    AlertSwiftUI()
}

