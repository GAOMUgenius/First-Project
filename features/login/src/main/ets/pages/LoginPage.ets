import { PrefUtil } from "utils/src/main/ets/utils/prefUtil"
import { Logger } from "utils/src/main/ets/utils/Logger"
import { UserAccount } from '../model/UserAccount'
import { TAG } from '@ohos/hypium/src/main/Constant'


@Entry({ routeName: 'LoginPage' })
@Component
struct LoginPage {
  private userAccount: UserAccount = new UserAccount()
  private logger: Logger = new Logger('[GENIUS]')
  @State account: string = ''
  @State password: string = ''
  @State rememberPassword: boolean = false
  @State stopLogin: boolean = false
  @State loading: boolean = false
  onPageShow() {
    this.logger.info(TAG, 'onPageShow');
  }

  async aboutToAppear() {
    const prifUtil = new PrefUtil()
  }

  build() {
    Column() {
      Column({ space: 15 }) {
        Column() {
          Text('Sign Up.')
            .fontSize(44)
            .fontWeight(FontWeight.Bolder)
            .width('90%')
            .fontColor('#ff201d5d')

          Image($r('app.media.login'))
            .width('90%')
        }
        .padding({ top: 50 })

        Column() {
          Text('账号')
            .fontSize(15)
            .fontFamily('HarmonyHeiTi')
            .fontWeight(FontWeight.Medium)
            .width('80%')
            .fontColor('#ff201d5d')
            .grayscale(0)
            .padding({ bottom: 5})

          TextInput()
            .type(InputType.Email)
            .width('80%')
            .onChange(( value: string) => {
              this.account = value
            })
        }

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

        Button('登录')
          .type(ButtonType.Capsule)
          .borderRadius(8)
          .backgroundColor('#ff180258')
          .width('80%')
          .onClick(() => {
            this.handleLogin()
          })

        Row() {
          Text('忘记密码')
            .fontSize(12)
            .fontColor('#ff5f5d5d')

          Row() {
            Checkbox()
              .onChange((value: boolean) => {
                this.rememberPassword = !this.rememberPassword
              })

            Text('记住密码')
              .fontSize(12)
              .fontColor('#ff5f5d5d')
          }
        }
        .justifyContent(FlexAlign.SpaceBetween)
        .width('60%')

      }
      .width('100%')
    }
    .height('100%')
  }
  async handleLogin() {

  }
}
