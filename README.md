
### 配置

1. 安装NVIDIA显卡驱动

2. 安装docker

    ```shell script
    apt install docker,nvidia-docker2
    ```

    修改/etc/docker/daemon.json文件配置如下
    ```json
    {
        "default-runtime": "nvidia",
        "runtimes": {
            "nvidia": {
                "path": "nvidia-container-runtime",
                "runtimeArgs": []
            }
        }
    }
    ```
    测试docker和显卡
    ```shell script
    docker run --rm -it --gpus all nvidia/cuda:10.1-cudnn7-runtime-centos7 nvidia-smi
    ```

3. 初次启动

    a. 首先请配置.env文件，分别填写
    * WWW_DIR 网站根目录
    * APP_DIR 运行脚本根目录
    * PROJECT_DIR 项目所在根目录
    * MYSQL_DIR 数据库根目录
    
    b. 构建容器并启动
    ```shell script
    docker-compose up
    ```
    
    c. 数据初始化
    ```shell script
    docker exec docker_web_1 sh init.sh
    ```
   
4. 启动与停止
    
    与docker-compose一样
    ```shell script
    #启动
    docker-compose start
    #停止
    docker-compose stop
    #创建容器
    docker-compose up
    #删除容器
    docker-compose down
    ```