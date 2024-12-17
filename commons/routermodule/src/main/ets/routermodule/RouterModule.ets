import { Logger } from 'utils'
import { RouterModel } from '../model/RouterModel';

export class RouterModule {
  // 初始化路由栈，需要关联Navigation组件
  static routerMap: Map<string, NavPathStack> = new Map<string, NavPathStack>();

  // 通过名称注册路由栈
  public static createRouter(routerName: string, router: NavPathStack): void {
    RouterModule.routerMap.set(routerName, router);
  }

  // 通过名称获取路由栈
  public static getRouter(routerName: string): NavPathStack {
    return RouterModule.routerMap.get(routerName) as NavPathStack;
  }

  // 通过传入RouterModule跳转到指定页面组件，RouterModule中需要增加routerName字段用于获取路由栈
  public static async push(router: RouterModel): Promise<void> {
    const harName = router.builderName.split('_')[0];
    await import(harName).then((ns: ESObject): Promise<void> => ns.harInit(router.builderName));
    RouterModule.getRouter(router.routerName).pushPath({ name: router.builderName, param: router.param });
  }
}

export default new RouterModule()