@Component
export struct InputAreaView {
  @Link userAccount: string
  @Link isAccountShow: boolean
  @Link password: string
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
          .padding({ bottom: 5})
        Stack() {
          TextInput()
            .type(InputType.Email)
            .width('80%')
            .onChange(( value: string) => {
              this.userAccount = value
            })
          if (this.isAccountShow) {
            Image($r('app.media.up'))
              .width(20)
              .height(20)
              .onClick(() => {
                this.isAccountShow = !this.isAccountShow
              })
              .margin({ right: 15 })
          } else {
            Image($r('app.media.down'))
              .width(20)
              .height(20)
              .onClick(() => {
                this.isAccountShow =!this.isAccountShow
              })
              .margin({ right: 15 })
          }
        }
        .alignContent(Alignment.End)
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
          .padding({ bottom: 5})

        TextInput()
          .type(InputType.Password)
          .width('80%')
          .onChange(( value: string) => {
            this.password = value
          })
      }
    }
  }
}