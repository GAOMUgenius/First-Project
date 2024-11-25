import { HomePageView } from 'homepage'
import { router } from '@kit.ArkUI';
import { UserAccount } from 'login/src/main/ets/model/UserAccount';

@Entry({ routeName: 'MainPage' })
@Component
struct MainPage {
  @Provide userAccount: UserAccount = router.getParams() as UserAccount;
  build() {
      Row() {
        HomePageView()
      }
  }
}