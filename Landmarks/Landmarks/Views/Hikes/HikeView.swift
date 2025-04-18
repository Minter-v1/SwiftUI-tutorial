/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A view displaying information about a hike, including an elevation graph.
*/


import SwiftUI

extension AnyTransition {
    //얘 리턴타입 뭐냐 -> 계산된 프로퍼티 ><
    //이렇게 하면 사용자 정의 전환을 확장할 때 코드가 깔끔하게 유지됩니다. ??
    static var moveAndFade: AnyTransition {
        .asymmetric(
            insertion: .move(edge: .trailing).combined(with: .opacity),//등장관련..
            removal: .scale.combined(with: .opacity) //사라질 때? scale관련이라서 커졌다 작아졌다함
        )
//        AnyTransition.slide //얘 슬라이드임
//        AnyTransition.move(edge: .trailing)// 움직이는 방향 고정된다고 해야하나? 오른쪽에서 들어왔다가 오른쪽으로 싸악 빠짐
    }
}



struct HikeView: View {
    var hike: Hike
    @State private var showDetail = false

    
    var body: some View {
        VStack {
            HStack {
                HikeGraph(hike: hike, path: \.elevation)
                    .frame(width: 50, height: 30)

                VStack(alignment: .leading) {
                    Text(hike.name)
                        .font(.headline)
                    Text(hike.distanceText)
                }

                Spacer()

                Button {
                    //얘뭐야 -> 4초길이의 베이직 에니메이션..? -> 와씨 4초나 걸려서 애니메이셔 ㄴ동작함
                    withAnimation/*(.easeInOut(duration: 4))*/ {
                        showDetail.toggle() // 이것도
                    }
                    
                } label: { //button에서 label은 뭐야
                    Label("Graph", systemImage: "chevron.right.circle")
                        .labelStyle(.iconOnly)
                        .imageScale(.large)
                        .rotationEffect(.degrees(showDetail ? 90 : 0))
                        //.animation(nil, value: showDetail) //nil..얘는 애니메이션은 없어지고 걍 변화만 있는걸? -> 애니메이션 끄기
                        .scaleEffect(showDetail ? 1.5 : 1) // 커졌다 작아졌다하네
                        .padding()
                        //.animation(.spring(), value: showDetail)
                    /* 여기 animation 효과
                     .easeInOut
                     */
                }
            }

            if showDetail {
                HikeDetail(hike: hike)
                    //.transition(.slide) //뭐여 슬라이드해서 등장하는군
                    .transition(.moveAndFade) //AnyTransition의 정적프로퍼티라서 인스턴스 생성 없이 가능하군 + 이렇게 하면 유지보수 상승한대
            }
        }
    }
}

#Preview {
    VStack {
        HikeView(hike: ModelData().hikes[0])
            .padding()
        Spacer()
    }
}
