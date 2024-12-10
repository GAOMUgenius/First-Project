
import { UserInfoView } from "../components/UserInfoView";


@Component
export struct MineView {
  @Consume('minePathStack') minePathStack: NavPathStack;
  // @Consume userAccount: UserAccount
  build() {
    Navigation(this.minePathStack) {
      Row() {
        Column() {
          Row() {
            UserInfoView()

            Image($r('app.media.setting'))
              .size({
                width: 20,
                height: 20
              })
          }
          .padding({ top: 25 , left: 25, right: 25})
          .width('100%')
          .justifyContent(FlexAlign.SpaceBetween)
          .alignItems(VerticalAlign.Center)

          this.TextLine()
        }
        .width('100%')
      }
      .alignItems(VerticalAlign.Top)
      .width('100%')
      .height('100%')
    }
  }
  @Builder
  TextLine() {
    Line()
      .height(0.8)
      .width('80%')
      .backgroundColor('#ffc3c3c3')
      .padding({
        left: 12,
        right: 12
      })
  }
}