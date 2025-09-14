#!/bin/bash

# 论坛应用一键启动脚本

# 检查 Java 是否安装
if ! command -v java &> /dev/null
then
    echo "错误: 未安装 Java"
    exit 1
fi

# 检查 Node.js 是否安装
if ! command -v node &> /dev/null
then
    echo "错误: 未安装 Node.js"
    exit 1
fi

# 设置工作目录
WORK_DIR="/Users/bls/Documents/GitHub/forum-java"
cd $WORK_DIR

# 启动 H2 数据库服务器（如果需要）
# java -cp ~/.m2/repository/com/h2database/h2/1.4.200/h2-1.4.200.jar org.h2.tools.Server -tcp -tcpAllowOthers -tcpPort 9092 &

# 构建后端应用
echo "正在构建后端应用..."
./mvnw clean package -DskipTests

if [ $? -ne 0 ]; then
    echo "后端应用构建失败"
    exit 1
fi

# 构建前端应用
echo "正在构建前端应用..."
cd forum-portal/src/main/forum-vue
npm run build

if [ $? -ne 0 ]; then
    echo "前端应用构建失败"
    exit 1
fi

# 返回工作目录
cd $WORK_DIR

# 启动应用
echo "正在启动应用..."
java -jar forum-starter/target/forum-java.jar --spring.profiles.active=h2 &

echo "应用已启动，访问地址: http://localhost:8080"