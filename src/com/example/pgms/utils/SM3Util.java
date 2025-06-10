package com.example.pgms.utils;

import org.bouncycastle.crypto.digests.SM3Digest;
import org.bouncycastle.util.encoders.Hex;
import java.nio.charset.StandardCharsets;

public class SM3Util {
    public SM3Util() {
    }

    public static String sm3Digest(String plainText) {
        // 明确使用 UTF-8 编码
        byte[] data = plainText.getBytes(StandardCharsets.UTF_8);
        return sm3Digest(data);
    }

    public static String sm3Digest(byte[] data) {
        SM3Digest digest = new SM3Digest();
        digest.update(data, 0, data.length);
        byte[] result = new byte[digest.getDigestSize()];
        digest.doFinal(result, 0);
        return new String(Hex.encode(result));
    }

    public static String hash(String input) {
        return sm3Digest(input);
    }
}