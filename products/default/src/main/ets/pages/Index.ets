import { router } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import 'login/src/main/ets/pages/LoginPage'

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column() {}
        Button('点击进入登录界面')
          .onClick(() => {
              router.replaceNamedRoute({
                name: 'LoginPage'
              },router.RouterMode.Standard)
                .then(() => {
                  console.log('页面跳功！');
                }).catch((err: BusinessError) => {
                console.error(`页面跳转失败，错误代码：${err.code}, 错误信息：${err.message}`);
              });

          })
    }
  }
}