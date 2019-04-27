 #!/bin/bash
 cd ../../..
 cd system/core/libutils
 patch -p1 < ../../device/quanta/narnia/patches/system_core.patch
 echo This is ugly.
