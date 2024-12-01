/** 角色类型 */
export enum RoleType {
    PTR = '普通人',
    XLZ = '修炼者',
    LS = '灵兽',
    HAMS = '黑暗魔兽'
}

/** 角色性别 */
export enum RoleSex {
    Male = '男性',
    Female = '女性',
    Other = '其他',
    Unknown = '未知'
}

/** 角色信息 */
export interface IRole {
    /** 角色名称 */
    name: string
    /** 角色简介 */
    desc?: string
    /** 角色类型 */
    type: RoleType
    /** 角色性别 */
    sex: RoleSex
}

/** 关系类型信息 */
export interface IRelationship {
    /** 关系名称 */
    name: string
    /** 关系说明 */
    desc?: string
}

/** 角色关系信息
 *
 * **from** 是 **to** 的 **name**
 *
 * **林逸** 是 **楚梦瑶** 的 **男人**
 */
export interface IRelationshipMap {
    /** 林逸 */
    from: IRole
    /** 楚梦瑶 */
    to: IRole
    /** 男人 */
    relationship: IRelationship
}

export class RelationshipMap implements IRelationshipMap {
    from: IRole
    to: IRole
    relationship: IRelationship

    constructor(relationshipMap: IRelationshipMap) {
        this.from = relationshipMap.from
        this.to = relationshipMap.to
        this.relationship = relationshipMap.relationship
    }
}

@Observed
export class RelationshipMapObserved extends RelationshipMap {
    constructor(relationshipMap: IRelationshipMap) {
        super(relationshipMap)
    }
}

export class Role implements IRole {
    name: string
    desc?: string
    type: RoleType
    sex: RoleSex

    constructor(role: IRole) {
        this.name = role.name
        this.desc = role.desc
        this.type = role.type
        this.sex = role.sex
    }
}

@Observed
export class RoleObserved extends Role {
    constructor(role: IRole) {
        super(role)
    }
}

export class Relationship implements IRelationship {
    name: string
    desc?: string | undefined

    constructor(relationship: IRelationship) {
        this.name = relationship.name
        this.desc = relationship.desc
    }
}

@Observed
export class RelationshipObserved extends Relationship {
    constructor(relationship: IRelationship) {
        super(relationship)
    }
}