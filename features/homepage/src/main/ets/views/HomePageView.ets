import { UserAccount } from "login/src/main/ets/model/UserAccount"

@Component
export struct HomePageView {
  @Consume userAccount: UserAccount
  // @Consume('homePagePathStack') homePagePathStack: NavPathStack;

  build() {
    Navigation() {
      Row() {
        Text('这里是首页')
      }
      .width('100%')
      .height('100%')
    }
  }
}