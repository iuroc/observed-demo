import { BSColor } from 'bootstrap5_color'

@Component
export struct Test01 {
    @State numGroups: NumGroup[] = randomNumGroups(25)

    build() {
        Column({ space: 15 }) {
            Row({ space: 10 }) {
                Button('随机刷新全部').onClick(() => {
                    for (let i = 0; i < this.numGroups.length; i++) {
                        this.numGroups[i] = randomNumGroup()
                    }
                })

                Button('测试').onClick(() => {
                    this.numGroups[0][0] = randomNum()
                })
            }

            Scroll() {
                Column({ space: 15 }) {
                    ForEach(this.numGroups, (group: NumGroup) => {
                        NumsViewer({ nums: group })
                    })
                }
                .padding(15)
                .width('100%')
            }
            .layoutWeight(1)
            .border({
                color: BSColor.success_border_subtle,
                radius: 20,
                width: 3,
                style: BorderStyle.Dashed
            })
            .backgroundColor(BSColor.light)
            .edgeEffect(EdgeEffect.Spring, { alwaysEnabled: true })
        }
        .width('100%')
        .height('100%')
        .padding(15)
    }
}

@Observed
class NumGroup extends Array<number> {
    constructor() {
        super()
    }
}

function randomNum(): number {
    return Math.floor(Math.random() * 90) + 10
}

function randomNumGroup(count = 4): NumGroup {
    const numGroup = new NumGroup()
    for (let i = 0; i < count; i++) {
        numGroup.push(randomNum())
    }
    return numGroup
}

function randomNumGroups(lineNum: number, count = 4): NumGroup[] {
    return Array(lineNum).fill(0).map(() => randomNumGroup(count))
}


@Component
struct NumsViewer {
    @ObjectLink nums: NumGroup

    build() {
        Scroll() {
            Row({ space: 10 }) {
                ForEach(this.nums, (num: number) => {
                    Text(num.toString())
                        .padding({ top: 10, bottom: 10 })
                        .backgroundColor(BSColor.primary_bg_subtle)
                        .fontColor(BSColor.primary_text_emphasis)
                        .fontSize(20)
                        .border({
                            width: 1,
                            color: BSColor.primary_border_subtle,
                            radius: 10
                        })
                        .layoutWeight(1)
                        .textAlign(TextAlign.Center)
                })
            }
        }
        .scrollable(ScrollDirection.Horizontal)
        .scrollBar(BarState.Off)
    }
}