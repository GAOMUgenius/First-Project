import { router } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import 'login/src/main/ets/pages/LoginPage'
import { common } from '@kit.AbilityKit';
import { buildRouterModel, RouterModule, RouterNameConstants } from 'routermodule';




@Entry
@Component
struct Index {
  @Provide('indexPathStack') indexPathStack: NavPathStack = new NavPathStack()
  aboutToAppear() {
    if (!this.indexPathStack) {
      this.indexPathStack = new NavPathStack();
    }
    RouterModule.createRouter(RouterNameConstants.DEFAULT_INDEX, this.indexPathStack);
  };

  @Builder
  routerMap(builderName: string, param: object) {
    // 根据模块名称获取 WrappedBuilder 对象，通过 builder 界面创建页面，并导入 param 参数。
    RouterModule.getBuilder(builderName).builder(param);
  };



  build() {
    Navigation(this.indexPathStack) {
      Row() {
        Column() {
          Button('点击进入主页面')
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
            //通过routermap路由进行跳转，跳转到loginpage页面
            buildRouterModel(RouterNameConstants.DEFAULT_INDEX, RouterNameConstants.LOGIN_LOGINPAGE)
          })
      }
    }
    .title('引导页')
    .hideTitleBar(true)
    .navDestination(this.routerMap);
  }
}
