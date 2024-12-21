import { ResourceConstants } from "../constants/LoginContants"
import { UserAccount } from "../model/UserAccount"
/**
 * 输入账号密码的View
 */
@Component
export struct InputAreaView {
  @Link user: UserAccount
  @Link isAccountShow: boolean

  build() {
    Column() {
      Column() {
        Text('账号')
          .fontSize(15)
          .fontFamily('HarmonyHeiTi')
          .fontWeight(FontWeight.Medium)
          .width('80%')
          .fontColor('#ff201d5d')
          .grayscale(0)
          .padding({ bottom: 5 })
        Stack() {
          TextInput({ text: this.user.userAccount })
            .type(InputType.Email)
            .width('80%')
            .onChange((value: string) => {
              this.user.userAccount = value
            })
          Image(this.isAccountShow ? ResourceConstants.ACCOUNT_SHOW_UP : ResourceConstants.ACCOUNT_SHOW_DOWN)
            .width(20)
            .height(20)
            .onClick(() => {
              this.isAccountShow = !this.isAccountShow
            })
            .margin({ right: 15 })
        }.alignContent(Alignment.End)
      }
      .margin({ bottom: 15 })
      Column() {
        Text('密码')
          .fontSize(15)
          .fontFamily('HarmonyHeiTi')
          .fontWeight(FontWeight.Medium)
          .width('80%')
          .fontColor('#ff201d5d')
          .grayscale(0)
          .padding({ bottom: 5 })

        TextInput({ text: this.user.password })
          .type(InputType.Password)
          .width('80%')
          .onChange((value: string) => {
            this.user.password = value
          })
      }
    }
    .margin({ bottom: 15 })
  }
}
