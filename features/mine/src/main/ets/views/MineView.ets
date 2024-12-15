
import { UserInfoView } from "./UserInfoView";
import { MineHeaderView } from "./MineHeaderView";
import { PayManangeView } from "./PayManageView";


@Component
export struct MineView {
  @Consume('minePathStack') minePathStack: NavPathStack;
  // @Consume userAccount: UserAccount
  build() {
    Navigation(this.minePathStack) {
      Row() {
        Column() {
          MineHeaderView()
            .margin({ top: 10 })

          UserInfoView()
            .margin({ top: 20 })

          PayManangeView()
            .margin({ top: 20 })

        }
        .justifyContent(FlexAlign.Start)
        .alignItems(HorizontalAlign.Center)
        .width('100%')
      }
      .alignItems(VerticalAlign.Top)
      .width('100%')
      .height('100%')
    }
  }
}