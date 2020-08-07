package com.hqyj.realm;


import com.hqyj.dao.Customer1Mapper;
import com.hqyj.dao.User1Mapper;
import com.hqyj.pojo.Customer1;
import com.hqyj.pojo.User1;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashSet;
import java.util.Set;

/**
 * author  Jayoung
 * createDate  2020/7/28 0028 11:28
 * version 1.0
 */
public class MyRealm extends AuthorizingRealm {
    @Autowired
    private User1Mapper umapper;
    @Autowired
    private Customer1Mapper cmapper;

    //授权
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        String principal = (String) principals.getPrimaryPrincipal();
        String Role = (String) SecurityUtils.getSubject().getSession().getAttribute("Role");
        Set<String> roels = new HashSet<String>();
        if ("hotel".equals(Role)) {
            roels.add("hotel");
        } else if ("customer".equals(Role)) {
            roels.add("customer");
        }
        return new SimpleAuthorizationInfo(roels);
    }

    //认证
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        //1.将token强转为UsernamePasswordToken类型（可以通过这个类型可以拿到身份(用户名)）
        UsernamePasswordToken token1 = (UsernamePasswordToken) token;
        String Role = (String) SecurityUtils.getSubject().getSession().getAttribute("Role");
        if ("hotel".equals(Role)) {
            User1 user1 = umapper.selectByPersonNameAndPersonPassword(token1.getUsername());
            if (user1 != null) {
                SecurityUtils.getSubject().getSession().setAttribute("user_id", user1.getuId());
                SecurityUtils.getSubject().getSession().setAttribute("user_name", user1.getuName());
                //设置shiro身份比对器user
                Object principal = user1.getuAccount();
                //设置比对器里面的密码(把数据库里面的密码作为比对密码)
                Object credentials = user1.getuPassword();
                //自动给令牌类里面的用户名设置加盐方式
                ByteSource salt = ByteSource.Util.bytes(user1.getuAccount() + "hotel");
                //设置realm的名称
                String realmName = this.getName();
                return new SimpleAuthenticationInfo(principal, credentials, salt, realmName);
            } else {
                throw new AuthenticationException();
            }
        } else if ("customer".equals(Role)) {
            Customer1 customer1 = cmapper.selectByPersonNameAndPersonPassword(token1.getUsername());
            SecurityUtils.getSubject().getSession().setAttribute("cId", customer1.getcId());
            SecurityUtils.getSubject().getSession().setAttribute("cName", customer1.getcName());
            if (customer1 != null) {
                //设置shiro身份比对器
                Object principal = customer1.getcAccount();
                //设置比对器里面的密码(把数据库里面的密码作为比对密码)
                Object credentials = customer1.getcPassword();
                //自动给令牌类里面的用户名设置加盐方式
                ByteSource salt = ByteSource.Util.bytes(customer1.getcAccount() + "customer");
                //设置realm的名称
                String realmName = this.getName();
                return new SimpleAuthenticationInfo(principal, credentials, salt, realmName);
            } else {
                throw new AuthenticationException();
            }
        } else {
            throw new AuthenticationException();
        }
    }

    //测试加密
    public static void main(String[] args) {
        //设置加密方式
        String algorithmName = "MD5";
        //设置待加密的原密码
        Object source = "123";
        //设置加盐方式（一般来说都是以用户名来加盐的）
        Object salt = ByteSource.Util.bytes("zs" + "hotel");
        //加密次数
        int hashIterations = 1024;
        SimpleHash newPassword = new SimpleHash(algorithmName, source, salt, hashIterations);
        System.out.println(newPassword.toHex());
    }


}
