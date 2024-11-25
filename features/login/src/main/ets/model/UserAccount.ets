export class UserAccount {
  id: string = ''
  uerType: UserTypeEnum = UserTypeEnum.OWNER
  userName: string = ''
  userAccount: string = ''
  community: string = ''
  password: string = ''
}

export enum UserTypeEnum {
  OWNER = 1,
  PROPERTY= 2
}