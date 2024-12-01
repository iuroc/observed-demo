import { Test02 } from './Test02'

@Entry
@Component
struct Index {
    build() {
        Column() {
            // Test01()
            Test02()
        }
        .width('100%')
        .height('100%')
    }
}