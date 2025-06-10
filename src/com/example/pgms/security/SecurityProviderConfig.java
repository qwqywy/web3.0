package com.example.pgms.security;

import org.bouncycastle.jce.provider.BouncyCastleProvider;
import java.security.Security;

public class SecurityProviderConfig {
    static {
        // 注册Bouncy Castle安全提供者
        Security.addProvider(new BouncyCastleProvider());
    }
}