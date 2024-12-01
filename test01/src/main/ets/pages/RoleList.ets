// import { Person, Persons } from './Person'
// import { PersonItem } from './RoleListItem'
//
// @Component
// export struct PersonList {
//     @ObjectLink persons: Persons
//
//     build() {
//         Column() {
//             List() {
//                 ForEach(this.persons, (person: Person) => {
//                     ListItem() {
//                         PersonItem({ person: person })
//                     }
//                 }, (person: Person, index) => {
//                     return person.name + index.toString()
//                 })
//             }
//             .width('100%')
//             .height('100%')
//         }
//     }
// }