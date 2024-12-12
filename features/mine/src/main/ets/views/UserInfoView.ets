import { UserAccount } from 'login/src/main/ets/model/UserAccount'
import { TextLineComponent } from '../components/TextLineComponent'

@Component
export struct UserInfoView {
@Consume userAccount: UserAccount
  @State isBalanceShow: boolean = false
  build() {
    Column() {
      Row() {
        Image(this.userAccount.imgResource)
          .borderRadius(35)
          // .size({ height: 35, width: 35 })
          .width(70)
          .height(70)
          .padding({ top: 10, left: 10, right: 5 })
        Text(this.userAccount.userAccount)
          .fontSize(20)
          .fontWeight(FontWeight.Medium)
          .padding({ left: 25, top: 20 })
      }
      // .height('50%')
      .width('100%')
      .justifyContent(FlexAlign.Start)
      .alignItems(VerticalAlign.Top)

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
            .fontSize(25)
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