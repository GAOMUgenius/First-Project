import { UserAccount } from 'login/src/main/ets/model/UserAccount'

@Component
export struct UserInfoView {
@Consume userAccount: UserAccount
  build() {
    Row() {
      Image(this.userAccount.imgResource)
        .size({
          width: 25,
          height: 25
        })
        .margin({
          right: 15
        })
      Column() {
        Text(this.userAccount.userName)
          .fontSize(15)
          .fontWeight(FontWeight.Bold)
        Text(this.userAccount.userAccount)
          .fontSize(15)
      }
      .padding({
        bottom: 5
      })
      .alignItems(HorizontalAlign.Start)
    }
    .alignItems(VerticalAlign.Top)
    .justifyContent(FlexAlign.Start)
  }
}