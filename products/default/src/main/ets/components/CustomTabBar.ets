import { WindowUtil } from "utils";
import { TabBarData, TabBarType, TabsInfo } from "../model/TabBarModel"
import { ConfigurationConstant } from "@kit.AbilityKit";

@Component
export struct CustomTabBar {
  @Link currentIndex: TabBarType;

  onChange(index: TabBarType): void {
    this.currentIndex = index;
    if (this.currentIndex === TabBarType.MINE) {
      WindowUtil.updateStatusBarColor(getContext(this), true);
    } else {
      WindowUtil.updateStatusBarColor(getContext(this),
        AppStorage.get('currentColorMode') === ConfigurationConstant.ColorMode.COLOR_MODE_DARK);
    }
  }

  build() {
    Flex({
      alignItems: ItemAlign.Center,
      justifyContent: FlexAlign.SpaceAround
    }) {
      ForEach(TabsInfo, (item: TabBarData) => {
        TabItem({
          index: item.id,
          selectedIndex: this.currentIndex,
          onChange: (index: number) => this.onChange(index)
        })
      }, (item: TabBarData) => item.id.toString())
    }
  }
}
@Component
struct TabItem {
  @Prop index: number
  @Prop selectedIndex: number
  @State showAnimation: boolean = false;
  onChange: (index: number) => void = () => {
  };
  build() {
    Column() {
      Image(this.selectedIndex === this.index ? TabsInfo[this.index].activeIcon : TabsInfo[this.index].defaultIcon)
        .size({
          width: 24,
          height: 24
        })
      Text(TabsInfo[this.index].title)
        .fontSize(10)
        .margin({ top: 5 })
        .fontWeight(600)
        .fontColor(this.index === this.selectedIndex ? $r('app.color.challenge_light') : $r('app.color.challenge_night'))

    }
    .clip(false)
    .padding({ left: 4, right: 4})
    .layoutWeight(1)
    .size({ width: '100%', height: '100%'})
    .onClick(() => {
      if (this.selectedIndex!==this.index) {
        this.showAnimation = true;
        this.onChange(this.index);
        setTimeout(() => {
          this.showAnimation = false;
        }, 300)
      }
    })
  }
}