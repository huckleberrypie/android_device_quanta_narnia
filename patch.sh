 #!/bin/bash
 cd ../../..
 cd frameworks/native
 patch -p1 < ../../device/quanta/narnia/patches/frameworks_native.patch
 echo PATCHED !
