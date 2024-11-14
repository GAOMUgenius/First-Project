import { Login } from 'login';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column() {}
        Login()
    }
  }
}