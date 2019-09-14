mkdir /usr/local/relion
mkdir /root/relion/relion/build
cd /root/relion/relion/build
cmake -DCMAKE_INSTALL_PREFIX=/usr/local/relion -DFORCE_OWN_FLTK=ON DFORCE_OWN_FFTW=ON -DCUDA=ON -DCudaTexture=ON ..
make -j4
make install