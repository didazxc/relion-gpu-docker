FROM nvidia/cuda:10.1-cudnn7-runtime-centos7

WORKDIR /app

RUN yum install -y deltarpm

# install php7.2
RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm
RUN yum install --nogpgcheck -y php72w php72w-fpm php72w-cli php72w-common php72w-devel php72w-gd php72w-pdo php72w-mysqlnd php72w-mbstring php72w-bcmath php72w-dom

# install mysql
RUN yum install -y mysql

COPY ./app/* /app/

#install conda
#wget --quiet https://repo.anaconda.com/archive/Anaconda3-2019.10-Linux-x86_64.sh -O anaconda.sh
RUN wget --quiet https://repo.anaconda.com/archive/Anaconda3-2019.10-Linux-x86_64.sh -O anaconda.sh && \
    /bin/bash anaconda.sh -b -p /opt/conda && \
    rm anaconda.sh && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc

#install python

ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["php","/var/www/artisan","queue:work","--queue=yx"]