# 编译阶段
FROM maven:3.6.3-jdk-8 AS build
# 增加/opt/app目录
ADD . /opt/app
# 切换工作目录为/opt/app
WORKDIR /opt/app
# 清理, 打包. 
# -B -> 非交互模式下运行
# -DskipTests -> 不执行测试用例( 编译测试用例类生成相应的class文件至target/test-classes下 )
RUN mvn -B -DskipTests clean package

# 基础镜像
FROM openjdk:8-jdk-alpine
# 指定标签 ( Author )
LABEL Author="cbw"
# 将/tmp目录持久化
VOLUME /tmp
# 从编译阶段中拷贝结果到当前镜像中, 改名为app.jar
COPY --from=build /opt/app/target/cbw-springBoot-docker.jar app.jar
# 对外暴露8080端口
EXPOSE 8080
# 执行 java -jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
