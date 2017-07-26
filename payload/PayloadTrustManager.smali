.class public PLACEHOLDER/PayloadTrustManager;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljavax/net/ssl/X509TrustManager;
.implements Ljavax/net/ssl/HostnameVerifier;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static bytesToHex([B)Ljava/lang/String;
    .locals 6
    .param p0, "bytes"    # [B

    .prologue
    .line 35
    const/16 v3, 0x10

    new-array v2, v3, [C

    fill-array-data v2, :array_0

    .line 36
    .local v2, "hexDigits":[C
    new-instance v1, Ljava/lang/StringBuilder;

    array-length v3, p0

    mul-int/lit8 v3, v3, 0x2

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 37
    .local v1, "buf":Ljava/lang/StringBuilder;
    array-length v4, p0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v4, :cond_0

    aget-byte v0, p0, v3

    .line 38
    .local v0, "aByte":B
    and-int/lit16 v5, v0, 0xf0

    shr-int/lit8 v5, v5, 0x4

    aget-char v5, v2, v5

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 39
    and-int/lit8 v5, v0, 0xf

    aget-char v5, v2, v5

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 37
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 41
    .end local v0    # "aByte":B
    :cond_0
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 35
    nop

    :array_0
    .array-data 2
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x61s
        0x62s
        0x63s
        0x64s
        0x65s
        0x66s
    .end array-data
.end method

.method public static getCertificateSHA1(Ljava/security/cert/X509Certificate;)Ljava/lang/String;
    .locals 2
    .param p0, "cert"    # Ljava/security/cert/X509Certificate;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/cert/CertificateEncodingException;
        }
    .end annotation

    .prologue
    .line 29
    const-string v1, "SHA-1"

    invoke-static {v1}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    .line 30
    .local v0, "md":Ljava/security/MessageDigest;
    invoke-virtual {p0}, Ljava/security/cert/X509Certificate;->getEncoded()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/security/MessageDigest;->update([B)V

    .line 31
    invoke-virtual {v0}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v1

    invoke-static {v1}, PLACEHOLDER/PayloadTrustManager;->bytesToHex([B)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static useFor(Ljava/net/URLConnection;)V
    .locals 6
    .param p0, "uc"    # Ljava/net/URLConnection;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 75
    instance-of v3, p0, Ljavax/net/ssl/HttpsURLConnection;

    if-eqz v3, :cond_0

    move-object v0, p0

    .line 76
    check-cast v0, Ljavax/net/ssl/HttpsURLConnection;

    .line 77
    .local v0, "huc":Ljavax/net/ssl/HttpsURLConnection;
    new-instance v1, PLACEHOLDER/PayloadTrustManager;

    invoke-direct {v1}, PLACEHOLDER/PayloadTrustManager;-><init>()V

    .line 78
    .local v1, "ptm":PLACEHOLDER/PayloadTrustManager;
    const-string v3, "SSL"

    invoke-static {v3}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v2

    .line 79
    .local v2, "sc":Ljavax/net/ssl/SSLContext;
    const/4 v3, 0x0

    const/4 v4, 0x1

    new-array v4, v4, [Ljavax/net/ssl/TrustManager;

    const/4 v5, 0x0

    aput-object v1, v4, v5

    new-instance v5, Ljava/security/SecureRandom;

    invoke-direct {v5}, Ljava/security/SecureRandom;-><init>()V

    invoke-virtual {v2, v3, v4, v5}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    .line 80
    invoke-virtual {v2}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljavax/net/ssl/HttpsURLConnection;->setSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    .line 81
    invoke-virtual {v0, v1}, Ljavax/net/ssl/HttpsURLConnection;->setHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V

    .line 83
    .end local v0    # "huc":Ljavax/net/ssl/HttpsURLConnection;
    .end local v1    # "ptm":PLACEHOLDER/PayloadTrustManager;
    .end local v2    # "sc":Ljavax/net/ssl/SSLContext;
    :cond_0
    return-void
.end method


# virtual methods
.method public checkClientTrusted([Ljava/security/cert/X509Certificate;Ljava/lang/String;)V
    .locals 0
    .param p1, "certs"    # [Ljava/security/cert/X509Certificate;
    .param p2, "authType"    # Ljava/lang/String;

    .prologue
    .line 45
    return-void
.end method

.method public checkServerTrusted([Ljava/security/cert/X509Certificate;Ljava/lang/String;)V
    .locals 7
    .param p1, "certs"    # [Ljava/security/cert/X509Certificate;
    .param p2, "authType"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateException;
        }
    .end annotation

    .prologue
    .line 48
    const-string v5, "WWWW"

    const/4 v6, 0x4

    invoke-virtual {v5, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    .line 49
    .local v4, "payloadHash":Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    if-eqz v5, :cond_3

    .line 50
    if-eqz p1, :cond_0

    array-length v5, p1

    const/4 v6, 0x1

    if-ge v5, v6, :cond_1

    .line 51
    :cond_0
    new-instance v5, Ljava/security/cert/CertificateException;

    invoke-direct {v5}, Ljava/security/cert/CertificateException;-><init>()V

    throw v5

    .line 53
    :cond_1
    move-object v0, p1

    .line 54
    .local v0, "arr$":[Ljava/security/cert/X509Certificate;
    array-length v3, v0

    .line 55
    .local v3, "len$":I
    const/4 v2, 0x0

    .line 56
    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_3

    .line 58
    :try_start_0
    aget-object v5, v0, v2

    invoke-static {v5}, PLACEHOLDER/PayloadTrustManager;->getCertificateSHA1(Ljava/security/cert/X509Certificate;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 59
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 61
    :cond_2
    new-instance v5, Ljava/security/cert/CertificateException;

    const-string v6, "Invalid certificate"

    invoke-direct {v5, v6}, Ljava/security/cert/CertificateException;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 63
    :catch_0
    move-exception v1

    .line 64
    .local v1, "e":Ljava/lang/Exception;
    new-instance v5, Ljava/security/cert/CertificateException;

    invoke-direct {v5, v1}, Ljava/security/cert/CertificateException;-><init>(Ljava/lang/Throwable;)V

    throw v5

    .line 68
    .end local v0    # "arr$":[Ljava/security/cert/X509Certificate;
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v2    # "i$":I
    .end local v3    # "len$":I
    :cond_3
    return-void
.end method

.method public getAcceptedIssuers()[Ljava/security/cert/X509Certificate;
    .locals 1

    .prologue
    .line 25
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/security/cert/X509Certificate;

    return-object v0
.end method

.method public verify(Ljava/lang/String;Ljavax/net/ssl/SSLSession;)Z
    .locals 1
    .param p1, "hostname"    # Ljava/lang/String;
    .param p2, "session"    # Ljavax/net/ssl/SSLSession;

    .prologue
    .line 71
    const/4 v0, 0x1

    return v0
.end method
