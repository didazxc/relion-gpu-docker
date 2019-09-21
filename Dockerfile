FROM centos:7

WORKDIR /app

# install epel7
RUN curl -O https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN yum -y install ./epel-release-latest-7.noarch.rpm

# install base software
RUN yum install -y rpm pcc gcc gcc-c++ glibc make automake cmake lapack-devel kernel-devel kernel-headers libjpeg-turbo-devel zlib-devel pciutils dkms

# install cuda
COPY ./root/nvidia /root/nvidia
#RUN rpm -i /root/nvidia/cuda-repo-rhel7-10-1-local-10.1.243-418.87.00-1.0-1.x86_64.rpm
RUN rpm -i /root/nvidia/cuda-repo-rhel7-8-0-local-ga2-8.0.61-1.x86_64.rpm
RUN yum clean all
RUN yum -y install nvidia-driver-latest-dkms cuda
#ENV PATH=/usr/local/cuda-10.1/bin:/usr/local/cuda-10.1/NsightCompute-2019.1${PATH:+:${PATH}}
ENV PATH=/usr/local/cuda/bin:$PATH

# install relion
COPY ./root/relion /root/relion
RUN yum install -y openmpi-devel openmpi fftw-devel fltk-devel libtiff-devel patch
ENV PATH=/usr/lib64/openmpi/bin:$PATH
RUN sh /root/relion/build.sh
ENV PATH=/usr/local/relion/bin:$PATH
RUN yum install -y ImageMagick ghostscript

# install Gctf
COPY ./root/Gctf /root/Gctf
RUN mkdir -p /public/EM
RUN tar -zxf /root/Gctf/Gctf_v1.06_and_examples.tar.gz -C /public/EM
RUN mv /public/EM/Gctf_v1.06 /public/EM/Gctf
RUN ln -s Gctf-v1.06_sm_30_cu8.0_x86_64 /public/EM/Gctf/bin/Gctf
ENV RELION_GCTF_EXECUTABLE /public/EM/Gctf/bin/Gctf

# create user
RUN useradd relion

# install evince
RUN yum install -y evince