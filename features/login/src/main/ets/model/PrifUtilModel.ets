import { PrefUtil } from 'utils';
import { UserAccount } from './UserAccount';
// 将用户数据存入首选项数据库中
export async function  storeUserAccount(userAccount: UserAccount, prefUtil: PrefUtil) {
  const userAccountObj = userAccount;
  const userAccountObjJSON = JSON.stringify(userAccountObj);
  try {
    await prefUtil.putPreferenceValue(userAccount.userAccount, userAccountObjJSON);
    console.log('preferences用户账户信息存储成功');
  } catch (err) {
    console.error('preferences用户账户信息存储失败: ', err);
  }
}

// 用于检查账户是否在数据库中并且密码是否相同
export async function checkUserAccount(userAccount: UserAccount, prefUtil: PrefUtil): Promise<boolean> {
  let value = await prefUtil.getPreferenceValue(userAccount.userAccount, '');
  let storedAccountJSON: string | null;
  if (typeof value === 'string') {
  storedAccountJSON = value;
} else if (typeof value === 'number') {
  storedAccountJSON = value.toString();
} else {
  storedAccountJSON = null;
}
let storedAccount: UserAccount | null = null;
if (storedAccountJSON) {
  try {
    storedAccount = JSON.parse(storedAccountJSON) as UserAccount;
  } catch (err) {
    console.error('preferences解析存储账户信息时出错: ', err);
  }
}
if (storedAccount) {
  return storedAccount.password === userAccount.password;
}
return false;
}