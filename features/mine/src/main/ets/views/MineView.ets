
import { UserInfoView } from "./UserInfoView";
import { MineHeaderView } from "./MineHeaderView";
import { TextLineComponent } from "../components/TextLineComponent";


@Component
export struct MineView {
  @Consume('minePathStack') minePathStack: NavPathStack;
  // @Consume userAccount: UserAccount
  build() {
    Navigation(this.minePathStack) {
      Row() {
        Column() {
          MineHeaderView()

          UserInfoView()


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