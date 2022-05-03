package com.example.trip.utils;

public class UUIDUtils {
    public static String getUUID() {
        // 返回用UUID
        String uuidResult = "";
        // 临时用UUID
        String uuidTemp = "";
        // 取得UUID存储到临时用UUID
        uuidTemp = java.util.UUID.randomUUID().toString();

        // 替换掉所有-字符
        uuidResult = uuidTemp.replaceAll("-", "");

        // 返回UUID
        return uuidResult;
    }
}
