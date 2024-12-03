import { TabBarData, TabsInfo } from "../model/TabBarModel"

@Component
export struct CustomTabBar {

  build() {
    Flex({
      alignItems: ItemAlign.Center,
      justifyContent: FlexAlign.SpaceAround
    }) {
      ForEach(TabsInfo, (Item: TabBarData) => {
        TabItem({
          // index: item.id,
          // selectedIndex: this.currentIndex,
          // onChange: (index: number) => this.onchange(index)
        })
      })
    }
  }
}
@Component
struct TabItem {
  @Prop index: number
  @Prop selectedIndex: number
  onChange: (index: number) => void = () => {
  };
  build() {

  }
}