import { HomePageView } from 'homepage'
import { router } from '@kit.ArkUI';
import { UserAccount } from 'login/src/main/ets/model/UserAccount';
import { MineView } from 'mine';
import { TabBarType } from '../model/TabBarModel';
import { CustomTabBar } from '../components/CustomTabBar';

@Entry({ routeName: 'MainPage' })
@Component
struct MainPage {
  @Provide userAccount: UserAccount = router.getParams() as UserAccount;
  @State currentIndex: TabBarType = TabBarType.MAINPAGE
  @Provide('appPathStack') appPathStack: NavPathStack = new NavPathStack();
  @Provide('minePathStack') minePathStack: NavPathStack = new NavPathStack();
  @Provide('homePagePathStack') homePagePathStack: NavPathStack = new NavPathStack();

  build() {
    Navigation(this.appPathStack) {
      Stack() {
        Tabs({ index: this.currentIndex }) {
          TabContent() {
            HomePageView()
          }
          TabContent() {
            MineView()
          }
        }
        .layoutWeight(1)
        .barHeight(0)
        .scrollable(false)
        .onChange((index) => {this.currentIndex = index;})

        CustomTabBar({ currentIndex: $currentIndex })
      }
    }
  }
}