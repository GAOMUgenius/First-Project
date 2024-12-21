import { RouterNameConstants } from "routermodule";


export function harInit(builderName: string): void {
  switch (builderName) {
    case RouterNameConstants.MAINPAGE_MAINPAGE:
      import ("./src/main/ets/pages/MainPage");
      break;
    default:
      break;
  }
}
