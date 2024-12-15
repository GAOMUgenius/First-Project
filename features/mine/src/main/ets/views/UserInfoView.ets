import { UserAccount } from 'login/src/main/ets/model/UserAccount'
import { TextLineComponent } from 'utils/src/main/ets/components/TextLineComponent'


//用户信息卡片片
@Component
export struct UserInfoView {
  @Consume userAccount: UserAccount
  @State isBalanceShow: boolean = false
  build() {
    Column() {
      Row() {
        Image(this.userAccount.imgResource)
          .borderRadius(30)
          // .size({ height: 35, width: 35 })
          .width(60)
          .height(60)
          .margin({ left: 20 })
        Text(this.userAccount.userAccount)
          .fontSize(20)
          .fontWeight(FontWeight.Medium)
          .margin({ left: 25, top: 10 })
      }
      // .height('50%')
      .width('100%')
      .justifyContent(FlexAlign.Start)
      .alignItems(VerticalAlign.Top)
      .margin({
        left: 20,
        right: 20,
        top: 20,
        bottom: 10
      })

      TextLineComponent()

      Row() {
        Column() {
          Row() {
            Text('可用额度')
              .fontSize(17)
              .fontWeight(FontWeight.Regular)
              .margin({ right: 10 })

            Image(this.isBalanceShow ? $r('app.media.balance_appear') : $r('app.media.balance_disappear'))
              .size({
                width: 20,
                height: 20
              })
              .onClick(() => {
                this.isBalanceShow = !this.isBalanceShow
              })
          }
          .alignItems(VerticalAlign.Center)
          .margin({ bottom: 10 })

          Text( this.isBalanceShow ? '￥' + this.userAccount.balance : '******')
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
            // .textAlign(TextAlign.Start)
        }
        // .justifyContent(FlexAlign.Start)
        .alignItems(HorizontalAlign.Start)

        Button('立即充值')
          .backgroundColor(Color.Black)
          .size({
            width: 90,
            height: 40
          })
          .margin({ top: 15 })

      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      .padding({
        left: 20,
        right: 20,
        top: 10,
        bottom: 20
      })
    }
    .linearGradient({
      angle: 135, // 设置颜色渐变起始角度为顺时针方向135°
      colors: [
        [0xfbc2eb, 0.0],
        [0xa6c1ee, 1.0],
      ]
    })
    .borderRadius(20)
    .width('90%')
  }
}