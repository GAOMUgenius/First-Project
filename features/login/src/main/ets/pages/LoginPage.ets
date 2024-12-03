import { PrefUtil } from "utils/src/main/ets/utils/prefUtil"
import { Logger } from "utils/src/main/ets/utils/Logger"
import { UserAccount } from '../model/UserAccount'
import { TAG } from '@ohos/hypium/src/main/Constant'
import { router } from '@kit.ArkUI'
import { common } from '@kit.AbilityKit'
import { checkUserAccount, storeUserAccount } from '../model/prifUtilModel'

//import 'default/src/main/ets/pages/MainPage'

@Entry({ routeName: 'LoginPage' })
@Component
struct LoginPage {
  private user: UserAccount = new UserAccount()
  private logger: Logger = new Logger('[LoginPage]')
  @State rememberPassword: boolean = false
  @State stopLogin: boolean = false
  @State loading: boolean = false
  @State isAccountShow: boolean = false
  @State accountImg: string = this.isAccountShow ? 'app.media.up' : 'app.media.down'
  private  prefUtil = new PrefUtil()
  onPageShow() {
    this.logger.info(TAG, 'onPageShow');
  }

  async aboutToAppear() {
   await this.prefUtil.loadPreference(getContext(this));
  }

  async handleLogin() {
    const isAccountMatched = await checkUserAccount(this.user, this.prefUtil);
    if (!isAccountMatched) {
      console.error('preferences账户不匹配，登录失败');
      return;
    }
    if (this.rememberPassword) {
      await storeUserAccount(this.user, this.prefUtil);
    }

    const bundleName = (getContext(this) as common.UIAbilityContext).applicationInfo.name;
    const url = `@bundle:${bundleName}/default/ets/pages/MainPage`
    router.pushUrl({
      url,
      params: this.user
    }, (err) => {
      if (err) {
        console.error(`Invoke pushUrl failed, code is ${err.code}, message is ${err.message}`);
        return;
      }
      console.info('Invoke pushUrl succeeded.');
    })
  }

  @Builder
  accountTextInput() {
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
            this.user.userAccount = value
          })
        if (this.isAccountShow) {
          Image($r('app.media.up'))
            .width(20)
            .height(20)
            .onClick(() => {
              this.isAccountShow =!this.isAccountShow
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
      .bindSheet(this.isAccountShow, this.accountShow(), {
        detents: [SheetSize.MEDIUM, SheetSize.LARGE, 200],
        backgroundColor: Color.White,
        blurStyle: BlurStyle.Thick,
        showClose: false,
        dragBar: true, // 默认显示控制条
      });
    }
  }  

  @Builder
  accountShow() {
    List() {
      // ForEach()
    }
  }

  @Builder
  passwordTextInput() {
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
          this.user.password = value
        })
    }
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
        //账号输入框
        this.accountTextInput()
        //密码输入框
        this.passwordTextInput()

        Button('登录')
          .type(ButtonType.Capsule)
          .borderRadius(8)
          .backgroundColor('#ff180258')
          .width('80%')
          .onClick(() => {
            this.handleLogin()
          })

        Row() {
          Text('注册账号')
            .fontSize(12)
            .fontColor('#ff5f5d5d')
            .onClick(()=> {
              storeUserAccount(this.user, this.prefUtil)
            })

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
}