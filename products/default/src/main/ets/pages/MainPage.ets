import { HomePageView } from 'homepage'
import { router } from '@kit.ArkUI';
import { UserAccount } from 'login/src/main/ets/model/UserAccount';
import { MineView } from 'mine';
import { TabBarType } from '../model/TabBarModel';
import { CustomTabBar } from '../components/CustomTabBar';

const TAG: string = '[MainPage]'

@Entry({ routeName: 'MainPage' })
@Component
struct MainPage {
  @Provide userAccount: UserAccount = router.getParams() as UserAccount;
  @State currentIndex: TabBarType = TabBarType.MAINPAGE
  @Provide('MainPagePathStack') MainPagePathStack: NavPathStack = new NavPathStack();
  @Provide('minePathStack') minePathStack: NavPathStack = new NavPathStack();
  @Provide('homePagePathStack') homePagePathStack: NavPathStack = new NavPathStack();

  build() {
    Navigation(this.MainPagePathStack) {
      Flex({ direction: FlexDirection.Column }) {
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
      .backgroundColor($r('app.color.mainpage_background'))
      .width('100%')
    }
    .hideTitleBar(true)
    .mode(NavigationMode.Stack)
  }
}