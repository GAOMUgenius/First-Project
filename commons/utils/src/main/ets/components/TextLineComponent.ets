@Component
export struct TextLineComponent {

  build() {
    Line()
      .height(0.5)
      .width('90%')
      .backgroundColor('#ffc3c3c3')
      .padding({
        left: 12,
        right: 12
      })
  }
}
