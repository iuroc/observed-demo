import { BSColor } from 'bootstrap5_color'
import { statusBarManager } from '@kit.StatusBarExtensionKit'

@Component
export struct Test02 {
    async aboutToAppear() {
        if (canIUse('SystemCapability.PCService.StatusBarManager')) {
            statusBarManager.updateStatusBarIcon(getContext(), {
                white: undefined,
                black: undefined
            })
        }
    }

    build() {
        Column() {
            Text('Hello World')
        }
        .backgroundColor(BSColor.warning_bg_subtle)
        .width('100%')
        .height('100%')
    }
}