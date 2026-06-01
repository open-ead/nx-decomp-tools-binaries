#!/usr/bin/env bash

# upgrade llvm binaries for linux
# usage: change the version below to the target version you want to update to
# then run the script

repo='https://github.com/llvm/llvm-project'
version='22.1.6'
target='Linux-X64'
url="$repo/releases/download/llvmorg-$version/LLVM-$version-$target.tar.xz"
sha256='c5ac8ef89ca39d30cb32e9b83772f995dd891c685ebc188d593c943a64d5f8b5'
output="llvm-$version.tar.xz"

if ! [ -e $output ]; then
  echo '>>> downloading llvm'
  wget -O $output $url 
fi;
echo '>>> checking sha256sum'
actual_sha256=$(sha256sum "$output" | cut -d' ' -f1)
if [[ "$sha256" != "$actual_sha256" ]]; then
  echo '>>> error: sha256 mismatch, please try again'
  rm -f $output
  exit 1
fi;
echo '>>> finding tools'
archived_llvm_objdump_path=$(tar -tf $output | grep llvm-objdump)
if [ $? -ne 0 ]; then
  echo '>>> error: did not find llvm-objdump'
  exit 1
fi;
echo ">>> unpacking llvm-objdump: $archived_llvm_objdump_path"
tar -xJf $output $archived_llvm_objdump_path
mv $archived_llvm_objdump_path linux


rm -rf "LLVM-$version-$target"
echo $url >> README.md
echo ">>> url printed to README.md; please update it"
