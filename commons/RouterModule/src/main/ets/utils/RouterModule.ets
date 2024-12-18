
import { RouterModel } from '../model/RouterModel';
import { Logger } from 'utils'


export class RouterModule {
  static builderMap: Map<string, WrappedBuilder<[object]>> = new Map<string, WrappedBuilder<[object]>>();
  static routerMap: Map<string, NavPathStack> = new Map<string, NavPathStack>();

  // 按名称注册builder。
  public static registerBuilder(builderName: string, builder: WrappedBuilder<[object]>): void {
    RouterModule.builderMap.set(builderName, builder);
  }

  // 按名称获取builder。
  public static getBuilder(builderName: string): WrappedBuilder<[object]> {
    const builder = RouterModule.builderMap.get(builderName);
    if (!builder) {
      Logger.info('not found builder ' + builderName);
    }
    return builder as WrappedBuilder<[object]>;
  }

  // 按名称注册Router。
  public static createRouter(routerName: string, router: NavPathStack): void {
    RouterModule.routerMap.set(routerName, router);
  }

  // 按名称获取Router。
  public static getRouter(routerName: string): NavPathStack {
    return RouterModule.routerMap.get(routerName) as NavPathStack;
  }

  // 通过获取 Page Stack 跳转到指定的 Page。
  public static async push(router: RouterModel): Promise<void> {
    try {
      const harName = router.builderName.split('_')[0];
      // 动态导入要重定向到的页面。
      try {
        await import(harName).then((ns: ESObject): Promise<void> => ns.harInit(router.builderName));
      } catch (importError) {
        // 捕获动态导入页面时出现的错误，比如模块不存在、路径错误等
        console.error(`动态导入页面失败，harName: ${harName}，错误信息:`, importError);
        console.error(`调用栈信息:`, importError.stack);
      }
      try {
        RouterModule.getRouter(router.routerName).pushPath({ name: router.builderName, param: router.param });
      } catch (pushPathError) {
        // 捕获操作页面栈的pushPath方法时出现的错误，比如页面栈不可用、参数格式错误等
        console.error(`页面栈pushPath操作失败，routerName: ${router.routerName}，builderName: ${router.builderName}，错误信息:`, pushPathError);
      }
    } catch (overallError) {
      // 捕获整个push方法执行过程中未被内层catch处理的其他异常，提供更通用的错误提示
      console.error(`执行push方法出现整体错误，错误信息:`, overallError);
    }
  }

  // 获取页面堆栈并弹出它。
  public static pop(routerName: string): void {
    // 查找 pop 的相应路由堆栈。
    RouterModule.getRouter(routerName).pop();
  }

  // 获取页面堆栈并将其清除。
  public static clear(routerName: string): void {
    // 查找 pop 的相应路由堆栈。
    RouterModule.getRouter(routerName).clear();
  }

  // 直接跳转到指定的路由。
  public static popToName(routerName: string, builderName: string): void {
    RouterModule.getRouter(routerName).popToName(builderName);
  }
}
