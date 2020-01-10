
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

3. 启动
    ```shell script
    docker-compose up
    ```
   将会自动构建容器并启动