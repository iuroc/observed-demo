import {
    IRelationshipMap,
    IRole,
    Relationship,
    RelationshipMap,
    Role,
    RoleSex,
    RoleType
} from './IRole'

export const relationships = [
    '男人', '女人', '朋友',
    '小弟', '老大', '敌人'
].map(name => new Relationship({ name }))

export const roles = ([
    {
        name: '林逸',
        type: RoleType.XLZ,
        sex: RoleSex.Male,
        desc: '全宇宙最闪亮的男主角'
    },
    {
        name: '楚梦瑶',
        type: RoleType.XLZ,
        sex: RoleSex.Female,
        desc: '属于林逸的超级大美人'
    },
    {
        name: '雨凝',
        type: RoleType.XLZ,
        sex: RoleSex.Female,
        desc: '林逸的白月光女神'
    },
    {
        name: '王心妍',
        type: RoleType.XLZ,
        sex: RoleSex.Female,
        desc: '一心一意用爱陪伴着林逸'
    },
    {
        name: '天婵',
        type: RoleType.XLZ,
        sex: RoleSex.Female,
        desc: '属于林逸的天之娇女'
    }
] as IRole[]).map(role => new Role(role))

export const relationshipMaps = ([
    {
        from: roles[0],
        to: roles[1],
        relationship: relationships[0]
    },
    {
        from: roles[1],
        to: roles[0],
        relationship: relationships[1]
    },
    {
        from: roles[1],
        to: roles[2],
        relationship: relationships[2]
    },
    {
        from: roles[1],
        to: roles[3],
        relationship: relationships[2]
    },
    {
        from: roles[1],
        to: roles[4],
        relationship: relationships[2]
    },
    {
        from: roles[0],
        to: roles[2],
        relationship: relationships[0]
    },
    {
        from: roles[2],
        to: roles[0],
        relationship: relationships[1]
    },
    {
        from: roles[2],
        to: roles[1],
        relationship: relationships[2]
    },
    {
        from: roles[2],
        to: roles[3],
        relationship: relationships[2]
    },
    {
        from: roles[2],
        to: roles[4],
        relationship: relationships[2]
    },
    {
        from: roles[0],
        to: roles[3],
        relationship: relationships[0]
    },
    {
        from: roles[3],
        to: roles[0],
        relationship: relationships[1]
    },
    {
        from: roles[3],
        to: roles[1],
        relationship: relationships[2]
    },
    {
        from: roles[3],
        to: roles[2],
        relationship: relationships[2]
    },
    {
        from: roles[3],
        to: roles[4],
        relationship: relationships[2]
    },
    {
        from: roles[0],
        to: roles[4],
        relationship: relationships[0]
    },
    {
        from: roles[4],
        to: roles[0],
        relationship: relationships[1]
    },
    {
        from: roles[4],
        to: roles[1],
        relationship: relationships[2]
    },
    {
        from: roles[4],
        to: roles[2],
        relationship: relationships[2]
    },
    {
        from: roles[4],
        to: roles[3],
        relationship: relationships[2]
    },
] as IRelationshipMap[]).map(relationshipMap => new RelationshipMap(relationshipMap))