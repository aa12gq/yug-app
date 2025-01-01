flowchart TB;
A[语光 APP]

    subgraph 用户管理
        direction TB
        B1[注册/登录] --> B2[用户资料]
        B2 --> B3[好友管理]
        B3 --> B4[好友推荐]
        B2 --> B5[用户偏好设置]
        B5 --> B6[个性化AI助手]
        B6 --> B7[情感分析]
    end

    subgraph 社交功能
        direction TB
        C1[聊天] --> C2[动态分享]
        C2 --> C3[群组]
        C1 --> C4[表情包]
        C1 --> C5[语音消息]
        C3 --> C6[群组创建]
        C3 --> C7[群组邀请]
        C5 --> C8[实时翻译]
        C2 --> C9[AR互动]
    end

    subgraph 语乐岛-社区
        direction TB
        D1[互动游戏] --> D2[虚拟聚会]
        D2 --> D3[音乐分享]
        D3 --> D4[创意展示]
        D4 --> D5[虚拟购物]
        D1 --> D6[每日挑战]
        D2 --> D7[主题聚会]
        D3 --> D8[用户音乐榜单]
        D4 --> D9[创意工作坊]
        D5 --> D10[限时折扣]
        D6 --> D11[AI生成内容]
        D7 --> D12[虚拟现实体验]
    end

    subgraph 内容管理
        direction TB
        E1[内容发布] --> E2[内容审核]
        E2 --> E3[内容推荐]
        E3 --> E4[个性化推荐]
        E1 --> E5[内容分类]
        E5 --> E6[自动标签生成]
        E4 --> E7[情境感知推荐]
    end

    subgraph 通知系统
        direction TB
        F1[消息推送] --> F2[活动提醒]
        F2 --> F3[系统公告]
        F3 --> F4[智能通知过滤]
        F4 --> F5[预测性通知]
    end

    subgraph 设置
        direction TB
        G1[隐私设置] --> G2[账号安全]
        G2 --> G3[通知设置]
        G3 --> G4[语言设置]
        G4 --> G5[多语言支持]
        G5 --> G6[个性化主题]
    end

    subgraph 积分系统
        direction TB
        H1[积分获取] --> H2[积分兑换]
        H1 --> H3[积分排行榜]
        H2 --> H4[积分商城]
        H4 --> H5[积分捐赠]
        H5 --> H6[积分投资]
    end

    subgraph 旅行探索
        direction TB
        I1[旅行指南] --> I2[旅行计划]
        I2 --> I3[邀请好友]
        I3 --> I4[旅行打卡]
        I4 --> I5[活动推荐]
    end

    subgraph 动态圈
        direction TB
        J1[发布动态] --> J2[浏览动态]
        J2 --> J3[点赞评论]
        J3 --> J4[分享动态]
        J1 --> J5[引用随心记]
    end

    subgraph 随心记
        direction TB
        K1[创建随心记] --> K2[管理随心记]
        K2 --> J5
        K1 --> K3[灵光一现]
    end

    A --> B1
    A --> C1
    A --> D1
    A --> E1
    A --> F1
    A --> G1
    A --> H1
    A --> I1
    A --> J1
    A --> K1

    B3 --> C1
    C3 --> D1
    D5 --> E1
    F2 --> G3
    D1 --> H1
    C2 --> H1
    I3 --> C1
    I4 --> J1
    J1 --> C2
