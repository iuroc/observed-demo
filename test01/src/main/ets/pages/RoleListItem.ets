// import { ComposeListItem, IconType } from '@kit.ArkUI'
// import { PersonList } from './RoleList'
//
// @Component
// export struct PersonItem {
//     @ObjectLink person: Person
//
//     build() {
//         Column() {
//             ComposeListItem({
//                 contentItem: {
//                     iconStyle: IconType.HEAD_SCULPTURE,
//                     icon: $r('sys.media.person_shield'),
//                     primaryText: this.person.name,
//                     secondaryText: '点击查看她的朋友们',
//                 },
//                 operateItem: {
//                     icon: { value: $r('sys.media.ohos_ic_public_arrow_right') },
//                 }
//             })
//                 .onClick(() => {
//                     const dialogController = new CustomDialogController({
//                         builder: DialogPanel({ persons: this.person.friends }),
//                     })
//                     dialogController.open()
//                 })
//         }
//     }
// }
//
// @CustomDialog
// struct DialogPanel {
//     controller: CustomDialogController
//     @ObjectLink persons: Persons
//
//     build() {
//         PersonList({ persons: this.persons })
//     }
// }