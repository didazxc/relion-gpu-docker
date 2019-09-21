

dir=$(cd $(dirname $0); pwd)

# download cuda
mkdir $dir/root/nvidia
cd $dir/root/nvidia
wget http://developer.download.nvidia.com/compute/cuda/10.1/Prod/local_installers/cuda-repo-rhel7-10-1-local-10.1.243-418.87.00-1.0-1.x86_64.rpm

# clone relion.git
mkdir $dir/root/relion
cd $dir/root/relion
git clone https://github.com/3dem/relion.git

# get fltk file for somewhere cannot access google
mkdir /root/relion/relion/external /root/relion/relion/external/fltk
cd /root/relion/relion/external/fltk
wget https://doc-0s-5g-docs.googleusercontent.com/docs/securesc/ha0ro937gcuc7l7deffksulhg5h7mbp1/gk7e44e50nr681ucq217ejcpfsfvv6d1/1568440800000/10880455538747250321/*/0B942d76zVnSeazZWcExRaXIyVDg?e=download

# download
mkdir $dir/root/Gctf
cd $dir/root/Gctf
wget https://www.mrc-lmb.cam.ac.uk/kzhang/Gctf/Gctf_v1.06_and_examples.tar.gz

# install VcXsrv Windows X Server
# https://sourceforge.net/projects/vcxsrv/

# run the docker
# docker run --rm -it -e DISPLAY=host.docker.internal:0.0 -v /d/work/xinyue/app:/app --name xinyue relion-gpu-docker
