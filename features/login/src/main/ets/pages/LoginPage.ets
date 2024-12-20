import { PrefUtil } from "utils/src/main/ets/utils/PrefUtil"
import { UserAccount } from '../model/UserAccount'
import { promptAction, router } from '@kit.ArkUI'
import { common } from '@kit.AbilityKit'
import { checkUserAccount, storeUserAccount } from '../model/PrifUtilModel'
import { InputAreaView } from '../components/InputAreaView'
import { Logger } from 'utils'

import { RouterModule } from "routermodule/src/main/ets/utils/RouterModule"
import { RouterNameConstants } from "routermodule"


const TAG: string = '[LoginPage]'
const builderName = RouterNameConstants.LOGIN_LOGINPAGE
if (!RouterModule.getBuilder(builderName)) {
  const builder: WrappedBuilder<[object]> = wrapBuilder(loginBuilderPage);
  RouterModule.registerBuilder(builderName, builder);
}


@Component
export struct LoginPage {
  @Prop user: UserAccount = new UserAccount()
  @State rememberPassword: boolean = false
  @State stopLogin: boolean = false
  @State loading: boolean = false
  @Prop isAccountShow: boolean = false
  @State accountImg: string = this.isAccountShow ? 'app.media.up' : 'app.media.down'
  private  prefUtil = new PrefUtil()
  onPageShow() {
    Logger.info(TAG, 'onPageShow');
  }

  async aboutToAppear() {
   await this.prefUtil.loadPreference(getContext(this));
  }
  // 登录逻辑
  async handleLogin() {
    //获取用户密码
    const isAccountMatched = await checkUserAccount(this.user, this.prefUtil);
    if(!this.user.userAccount) {
      promptAction.showToast({
        message: '请输入账号',
        duration: 2000
      });
      Logger.error(TAG, 'preferences账户为空，登录失败')
      return;
    }
    else if (!isAccountMatched) {// 密码错误
      promptAction.showToast({
        message: '密码错误，请重新输入',
        duration: 2000
      });
      Logger.error(TAG, 'preferences账户不匹配，登录失败');
      return;
    }
    if (this.rememberPassword) {
      await storeUserAccount(this.user, this.prefUtil);
    }
    // 检测完成，进行登录
    const bundleName = (getContext(this) as common.UIAbilityContext).applicationInfo.name;
    const url = `@bundle:${bundleName}/default/ets/pages/MainPage`
    router.replaceUrl({
      url,
      params: this.user
    }, (err) => {
      if (err) {
        Logger.error(`Invoke replaceUrl failed, code is ${err.code}, message is ${err.message}`);
        return;
      }
      Logger.info(TAG, 'Invoke replaceUrl succeeded.');
    })
  }

  build() {
    NavDestination() {
      Column() {
        Column({ space: 15 }) {
          Stack() {
            Image($r('app.media.login'))
              .width('100%')

            Text('Log In.')
              .fontSize(44)
              .fontWeight(FontWeight.Bolder)
              .fontColor('#ff201d5d')
              .textAlign(TextAlign.Center)
              .margin({ left: 10, top: 10 })
          }
          .width('100%')
          .alignContent(Alignment.TopStart)
          .padding({ top: 20 })

          InputAreaView({ user: this.user, isAccountShow: this.isAccountShow })

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
                promptAction.showToast({
                  message: "账号注册成功"
                })
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
    .hideTitleBar(true)
  }
}

@Builder
export function loginBuilderPage() {
  LoginPage()
}