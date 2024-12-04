@Component
export struct MineView {
  @Consume('minePathStack') minePathStack: NavPathStack;
  build() {
    Navigation(this.minePathStack) {
      Row() {
        Text('我的')
      }
      .width('100%')
      .height('100%')
    }
  }
}