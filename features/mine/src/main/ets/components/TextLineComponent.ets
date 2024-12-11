@Component
export struct TextLineComponent {

  build() {
    Line()
      .height(0.8)
      .width('80%')
      .backgroundColor('#ffc3c3c3')
      .padding({
        left: 12,
        right: 12
      })
  }
}
