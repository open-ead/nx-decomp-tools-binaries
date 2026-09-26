#!/usr/bin/env bash

# update nx2elf for same platform as the machine running this script
# usage: change the revision below
# then run the script

case "$(uname -s)" in
    Linux) platform='linux' ;;
    Darwin) platform='macos' ;;
    *) echo "unsupported platform: $(uname -s)" >&2; exit 1 ;;
esac

repo='https://github.com/shuffle2/nx2elf'
revision='a1760ba54e2aefb41444933f53b90e6e8b05c399'
local='build/nx2elf'
mkdir -p build
rm -rf $local
git clone $repo $local
cd $local
git config advise.detachedHead false
git checkout $revision
cmake -GNinja -Bbuild
cmake --build build
cp build/nx2elf ../../$platform

echo "* nx2elf $revision: $repo"
echo ">>> revision printed; please update it in the README.md"
