
@Component
export struct HomePageView {
  @Provide('NavPathStack') pageStack: NavPathStack = new NavPathStack()
  build() {
      Row() {
        Text('这里是主页')
      }
  }
}