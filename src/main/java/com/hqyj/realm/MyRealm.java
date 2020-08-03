package com.hqyj.realm;


import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;

/**
 * author  Jayoung
 * createDate  2020/7/28 0028 11:28
 * version 1.0
 */
public class MyRealm extends AuthorizingRealm {

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        return null;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        return null;
    }

    //测试加密
    public static void main(String[] args) {
        //设置加密方式
        String algorithmName = "MD5";
        //设置待加密的原密码
        Object source = "123";
        //设置加盐方式（一般来说都是以用户名来加盐的）
        Object salt = ByteSource.Util.bytes("admin");
        //加密次数
        int hashIterations = 1024;
        SimpleHash newPassword = new SimpleHash(algorithmName, source, salt, hashIterations);
        System.out.println(newPassword);
    }


}
