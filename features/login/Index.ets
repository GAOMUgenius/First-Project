import { RouterNameConstants } from "routermodule";


export function harInit(builderName: string): void {
  switch (builderName) {
    case RouterNameConstants.LOGIN_LOGINPAGE:
      import ("./src/main/ets/pages/LoginPage");
      break;
    default:
      break;
  }
}


