import { relationshipMaps, roles } from './datas'
import { IRole, RelationshipObserved, Role, RoleObserved, RoleSex, RoleType } from './IRole'
import { ComposeListItem, IconType, SymbolGlyphModifier } from '@kit.ArkUI'

@Observed
class Person {
    friends: Person[] = []
    relationship?: RelationshipObserved
    roleObserved: RoleObserved
    role: IRole

    constructor(role: IRole, relationship?: RelationshipObserved) {
        this.role = role
        this.roleObserved = new RoleObserved(role)
        this.relationship = relationship
    }
}

function getFriends(role: IRole) {
    return relationshipMaps
        .filter(relationshipMap => relationshipMap.to == role)
        .map(relationshipMap => {
            const role = relationshipMap.from as Role
            return new Person(
                role,
                new RelationshipObserved(relationshipMap.relationship)
            )
        })
}

@Entry
@Component
struct Index {
    @State persons: Person[] = roles.map(role => new Person(role))
    /** 下一个页面要展示的内容 */
    @State friends: Person[] = []
    @Provide pathInfos: NavPathStack = new NavPathStack()
    @Provide navDestinationTitle: string = ''

    aboutToAppear(): void {
    }

    build() {
        Navigation(this.pathInfos) {
            PersonList({ persons: this.persons, friends: this.friends })
        }
        .navDestination(this.FriendList)
        .title(this.persons[0].roleObserved.name)
        .menus([
            {
                value: '倒置姓名',
                symbolIcon: new SymbolGlyphModifier($r('sys.symbol.text_and_arrow_down')),
                action: () => {
                    this.persons = this.persons.map(person => {
                        person.roleObserved.name = this.reverseString(person.roleObserved.name)
                        person.roleObserved.desc = this.reverseString(person.roleObserved.desc)
                        person.roleObserved.type = this.reverseString(person.roleObserved.type) as RoleType
                        return person
                    })
                }
            },
            {
                value: '倒置列表',
                symbolIcon: new SymbolGlyphModifier($r('sys.symbol.list_letter')),
                action: () => {
                    this.persons = this.persons.reverse()
                }
            }
        ])
    }

    @Builder
    FriendList() {
        NavDestination() {
            PersonList({ persons: this.persons, friendsShow: [...this.friends], friends: this.friends })
        }
        .title(this.navDestinationTitle)
    }

    reverseString(text: string): string {
        return text.split('').reverse().join('')
    }
}

@Component
struct PersonList {
    @Link persons: Person[]
    friendsShow: Person[] = []
    @Link friends: Person[]

    build() {
        List() {
            ForEach(this.friendsShow.length > 0 ? this.friendsShow : this.persons, (person: Person) => {
                PersonListItem({
                    role: person.role,
                    roleObserved: person.roleObserved,
                    relationship: person.relationship,
                    thisFriends: person.friends,
                    friends: this.friends,
                })
            })
        }
        .edgeEffect(EdgeEffect.Spring, { alwaysEnabled: true })
        .padding(10)
        .width('100%')
        .height('100%')
    }
}

@Component
struct PersonListItem {
    @ObjectLink relationship: RelationshipObserved
    @ObjectLink roleObserved: RoleObserved
    @Require thisFriends: Person[] = []
    @Consume pathInfos: NavPathStack
    @Link friends: Person[]
    @Require role?: IRole
    @Consume navDestinationTitle: string

    build() {
        ListItem() {
            ComposeListItem({
                contentItem: {
                    primaryText: this.roleObserved.name,
                    secondaryText: `${this.roleObserved.type} | ${this.roleObserved.sex}`,
                    description: this.roleObserved.desc,
                    iconStyle: IconType.HEAD_SCULPTURE,
                    icon: this.chooseSexIcon(this.roleObserved.sex)
                },
                operateItem: {
                    text: this.relationship?.name || '本人'
                }
            })
                .onClick(() => {
                    this.navDestinationTitle = this.role!.name
                    this.friends = getFriends(this.role!)
                    this.pathInfos.replacePath({ name: 'friends' })
                })
        }
    }

    chooseSexIcon(sex: RoleSex): Resource {
        switch (sex) {
            case RoleSex.Male:
                return $r("app.media.role_sex_male")
            case RoleSex.Female:
                return $r("app.media.role_sex_female")
            case RoleSex.Other:
                return $r('app.media.role_sex_other')
            case RoleSex.Unknown:
                return $r('app.media.role_sex_unknown')
        }
    }
}