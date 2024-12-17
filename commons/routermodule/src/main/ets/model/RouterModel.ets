import { RouterModule } from "../routermodule/RouterModule";

// 路由信息类，便于跳转时传递更多信息
export class RouterModel {
  // 路由页面别名，形式为${包名}_${页面名}
  builderName: string = "";
  // 路由栈名称
  routerName: string = "";
  // 需要传入页面的参数
  param?: object = new Object();
}

// 创建路由信息，并放到路由栈表中
export function buildRouterModel(routerName: string, builderName: string, param?: object) {
  let router: RouterModel = new RouterModel();
  router.builderName = builderName;
  router.routerName = routerName;
  router.param = param;
  RouterModule.push(router);
}
