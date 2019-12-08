FROM nvidia/cuda:10.1-cudnn7-runtime-centos7

WORKDIR /app


# install php7.1
RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm
RUN yum install -y php71w php71w-fpm php71w-cli php71w-common php71w-devel php71w-gd php71w-pdo php71w-mysql php71w-mbstring php71w-bcmath

# install mysql
RUN yum install -y mysql

COPY ./app/* /app/

ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["php","/var/www/artisan","queue:work","--queue=yx"]