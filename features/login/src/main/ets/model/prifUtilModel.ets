// import { PrefUtil } from "utils";
// import { UserAccount } from "./UserAccount";
//
// export class prifUtilModel extends PrefUtil {
//
//   // 新增方法，用于获取所有用户账户的键
//   async getAllUserAccountKeys(): Promise<string[]> {
//     if (!this.pref) {
//       console.error('preferences[mydata]未初始化！');
//       return [];
//     }
//     try {
//       // 假设所有用户账户键都以'userAccount_'开头
//       const keys: string[] = await this.pref.keys('userAccount_');
//       return keys;
//     } catch (err) {
//       console.error('获取用户账户键失败');
//       console.error('err: ', JSON.stringify(err));
//       return [];
//     }
//   }
//
//   // 新增方法，用于获取所有用户账户信息
//   async getAllUserAccounts(): Promise<UserAccount[]> {
//     const keys = await this.getAllUserAccountKeys();
//     const userAccounts: UserAccount[] = [];
//     for (const key of keys) {
//       const serializedAccount = await this.getPreferenceValue(key, '');
//       if (serializedAccount) {
//         try {
//           const userAccount = JSON.parse(serializedAccount) as UserAccount;
//           userAccounts.push(userAccount);
//         } catch (err) {
//           console.error('解析用户账户信息失败');
//           console.error('err: ', JSON.stringify(err));
//         }
//       }
//     }
//     return userAccounts;
//   }
// }