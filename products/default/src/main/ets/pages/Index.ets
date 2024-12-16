import { router } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import 'login/src/main/ets/pages/LoginPage'
import { common } from '@kit.AbilityKit';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column() {
        Button('点击进入主面')
          .onClick(() => {
            const bundleName: string = (getContext(this) as common.UIAbilityContext).applicationInfo.name;
            const url = `@bundle:${bundleName}/default/ets/pages/MainPage`
            router.replaceUrl({ url: url },router.RouterMode.Standard)
              .then(() => {
                console.log('页面跳转成功！');
              }).catch((err: BusinessError) => {
              console.error(`页面跳转失败，错误代码：${err.code}, 错误信息：${err.message}`);
            });
          })
      }
        Button('点击进入登录界面')
          .onClick(() => {
              router.replaceNamedRoute({
                name: 'LoginPage'
              },router.RouterMode.Standard)
                .then(() => {
                  console.log('页面跳转成功！');
                }).catch((err: BusinessError) => {
                console.error(`页面跳转失败，错误代码：${err.code}, 错误信息：${err.message}`);
              });
          })

    }
  }
}