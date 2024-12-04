import { UserAccount } from "login/src/main/ets/model/UserAccount";


@Component
export struct MineView {
  @Consume('minePathStack') minePathStack: NavPathStack;
  @Consume userAccount: UserAccount
  build() {
    Navigation(this.minePathStack) {
      Row() {
        Text('我的')
        Text(this.userAccount.userAccount)
      }
      .width('100%')
      .height('100%')
    }
  }
}