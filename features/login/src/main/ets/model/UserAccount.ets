export class UserAccount {
  uid: string = ''
  userType: UserTypeEnum = UserTypeEnum.OWNER
  userName: string = ''
  userAccount: string = ''
  community: string = ''
  password: string = ''
}

export enum UserTypeEnum {
  OWNER = 1,
  PROPERTY= 2
}