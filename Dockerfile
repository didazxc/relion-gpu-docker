FROM centos:7

WORKDIR /app

# install epel7
RUN curl -O https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN yum -y install ./epel-release-latest-7.noarch.rpm

# install base software
RUN yum install -y rpm pcc gcc gcc-c++ glibc make automake cmake lapack-devel kernel-devel kernel-headers libjpeg-turbo-devel zlib-devel pciutils dkms

# install cuda
COPY ./root/nvidia /root/nvidia
RUN rpm -i /root/nvidia/cuda-repo-rhel7-10-1-local-10.1.243-418.87.00-1.0-1.x86_64.rpm
RUN yum clean all
RUN yum -y install nvidia-driver-latest-dkms cuda
ENV PATH=/usr/local/cuda-10.1/bin:/usr/local/cuda-10.1/NsightCompute-2019.1${PATH:+:${PATH}}

# install relion
COPY ./root/relion /root/relion
RUN yum install -y openmpi-devel openmpi fftw-devel fltk-devel libtiff-devel patch
ENV PATH=/usr/lib64/openmpi/bin:$PATH
RUN sh /root/relion/build.sh


