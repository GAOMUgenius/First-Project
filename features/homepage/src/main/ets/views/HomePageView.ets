import { UserAccount } from "login/src/main/ets/model/UserAccount"

@Component
export struct HomePageView {
  @Consume userAccount: UserAccount
  @Consume('homePagePathStack') homePagePathStack: NavPathStack;

  build() {
    Navigation(this.homePagePathStack) {
      Row() {
        Text('首页')
        Text(this.userAccount.userAccount)

      }
      .width('100%')
      .height('100%')
    }
  }
}