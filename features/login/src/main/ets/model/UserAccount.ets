export class UserAccount {
  id: string = ''
  uerType: UserTypeEnum = UserTypeEnum.HMOS
  username: string = ''
  nickname: string = ''
  password: string = ''
}

export enum UserTypeEnum {
  HMOS = 1,
  HUAWEI= 2
}