import { HomePageView } from 'homepage'

@Entry({ routeName: 'MainPage' })
@Component
struct MainPage {

  build() {

    Row() {
      HomePageView()
    }
  }
}