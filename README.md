apt install nvidia-docker2

修改/etc/docker/daemon.json文件配置如下
{
    "default-runtime": "nvidia",
    "runtimes": {
        "nvidia": {
            "path": "nvidia-container-runtime",
            "runtimeArgs": []
        }
    }
}


docker run --rm -it --gpus all nvidia/cuda:10.1-cudnn7-runtime-centos7 nvidia-smi