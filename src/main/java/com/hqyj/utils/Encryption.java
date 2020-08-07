package com.hqyj.utils;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;

public class Encryption {
    //客户加密
    public String customerMd5IsEncryption(String customer,String Pwd){
        //设置加密方式
        String algorithmName = "MD5";
        //设置待加密的原密码
        Object source = Pwd;
        //设置加盐方式（一般来说都是以用户名来加盐的）
        Object salt = ByteSource.Util.bytes(customer+"customer");
        //加密次数
        int hashIterations = 1024;
        SimpleHash newPassword = new SimpleHash(algorithmName, source, salt, hashIterations);
        newPassword.toHex();
        return newPassword.toHex();
    }

    //店员加密
    public String userMd5IsEncryption(String user,String Pwd){
        //设置加密方式
        String algorithmName = "MD5";
        //设置待加密的原密码
        Object source = Pwd;
        //设置加盐方式（一般来说都是以用户名来加盐的）
        Object salt = ByteSource.Util.bytes(user+"hotel");
        //加密次数
        int hashIterations = 1024;
        SimpleHash newPassword = new SimpleHash(algorithmName, source, salt, hashIterations);
        newPassword.toHex();
        return newPassword.toHex();
    }

}
