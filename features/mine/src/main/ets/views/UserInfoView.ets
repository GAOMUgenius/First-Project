import { UserAccount } from 'login/src/main/ets/model/UserAccount'
import { TextLineComponent } from '../components/TextLineComponent'

@Component
export struct UserInfoView {
@Consume userAccount: UserAccount
  @State isBalanceShow: boolean = false
  build() {
    Column() {
      Row() {
        Image($r('app.media.userImg'))
          .width('10%')
          .height('10%')
          .size({ height: 35, width: 35 })
          .padding({ top: 10, left: 10, right: 5 })
        Text(this.userAccount.userAccount)
          .fontSize(20)
          .fontWeight(FontWeight.Medium)
          .padding({ top: 10 })
      }
      .width('100%')
      .justifyContent(FlexAlign.Start)

      TextLineComponent()

      Row() {
        Column() {
          Row() {
            Text('可用额度')
              .margin({top: 15, left: 10, bottom: 10})
              .fontSize(18)
              .fontWeight(FontWeight.Bold)
            Image(this.isBalanceShow ? $r('app.media.balance_appear') : $r('app.media.balance_disappear'))
              .margin({top: 15, left: 10, bottom: 10})
              .size({
                width: 20,
                height: 20
              })
              .onClick(() => {
                this.isBalanceShow = !this.isBalanceShow
              })
          }
          Text( this.isBalanceShow ? this.userAccount.balance : '******')
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 7 })
        }
        Button('立即充值')
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
    }
    .linearGradient({
      angle: 45, // 设置颜色渐变起始角度为顺时针方向45°
      colors: [
        [0xf56c6c, 0.0],
        [0xffffff, 1.0],
      ]
    })
    .width('90%')
  }
}