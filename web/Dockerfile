FROM centos:7

WORKDIR /app

## create user
RUN useradd relion

# install nginx
RUN rpm -Uvh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm
RUN yum install -y nginx

# install php7.1
RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm
RUN yum install -y php72w php72w-fpm php72w-cli php72w-common php72w-devel php72w-gd php72w-pdo php72w-mysql php72w-mbstring php72w-bcmath php72w-dom

# install mysql
RUN yum install -y mysql

# install php-composer
RUN php -r "copy('https://install.phpcomposer.com/installer', 'composer-setup.php');"
RUN php composer-setup.php --install-dir=/usr/local/bin --filename=composer

## install cuda
#COPY ./root/nvidia /root/nvidia/

#driver
#RUN yum install -y kmod mesa-libGL-devel mesa-libGLU-devel libGLEW glew-devel freeglut-devel
#RUN sh /root/nvidia/NVIDIA-Linux-x86_64-440.36.run -a -N --ui=none --no-kernel-module
#RUN rm -f /root/nvidia/NVIDIA-Linux-x86_64-440.36.run

#cuda10.1
#RUN rpm -i /root/nvidia/cuda-repo-rhel7-10-1-local-10.1.243-418.87.00-1.0-1.x86_64.rpm
#RUN rm -f /root/nvidia/cuda-repo-rhel7-10-1-local-10.1.243-418.87.00-1.0-1.x86_64.rpm
#RUN yum clean all
#RUN yum -y install nvidia-driver-latest-dkms cuda
#ENV PATH=/usr/local/cuda/NsightCompute-2019.1${PATH:+:${PATH}}

#env and cudnn
#ENV PATH=/usr/local/cuda/bin:$PATH
#ENV LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH
#ENV CUDA_HOME=/usr/local/cuda
#RUN cp /root/nvidia/cudnn/cuda/include/cudnn.h /usr/local/cuda/include/
#RUN cp /root/nvidia/cudnn/cuda/lib64/libcudnn* /usr/local/cuda/lib64/
#RUN chmod a+r /usr/local/cuda/include/cudnn.h
#RUN chmod a+r /usr/local/cuda/lib64/libcudnn*
#RUN rm -fr /root/nvidia


# conf
COPY ./app/default.conf /etc/nginx/conf.d/default.conf
RUN sed -i "s/daemonize = yes/daemonize = no/g" /etc/php-fpm.conf
EXPOSE 80 9000

# run
STOPSIGNAL SIGQUIT
COPY ./app/* /app/
ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["php-fpm"]