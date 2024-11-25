import { UserAccount } from "login/src/main/ets/model/UserAccount"

@Component
export struct HomePageView {
  @Consume userAccount: UserAccount

  build() {
    Row() {
      Text('首页')
      Text(this.userAccount.userAccount)

    }
  }
}