import { PrefUtil } from "utils/src/main/ets/utils/PrefUtil"
import { Logger } from "utils/src/main/ets/utils/Logger"
import { UserAccount } from '../model/UserAccount'
import { TAG } from '@ohos/hypium/src/main/Constant'
import { promptAction, router } from '@kit.ArkUI'
import { common } from '@kit.AbilityKit'
import { checkUserAccount, storeUserAccount } from '../model/PrifUtilModel'
import { InputAreaView } from '../components/InputAreaView'


@Entry({ routeName: 'LoginPage' })
@Component
struct LoginPage {
  private dialog: AlertDialog = new AlertDialog()
  @Prop user: UserAccount = new UserAccount()
  private logger: Logger = new Logger('[LoginPage]')
  @State password: string = ''
  @State userAccount: string | undefined = undefined
  @State rememberPassword: boolean = false
  @State stopLogin: boolean = false
  @State loading: boolean = false
  @Prop isAccountShow: boolean = false
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
    if(!this.userAccount) {
      promptAction.showToast({
        message: '请输入账号',
        duration: 2000
      });
      console.error('preferences账户为空，登录失败');
      return;
    }
    else if (!isAccountMatched) {
      promptAction.showToast({
        message: '密码错误，请重新输入',
        duration: 2000
      });
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
        InputAreaView({ userAccount: this.userAccount, isAccountShow: this.isAccountShow, password: this.password })

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