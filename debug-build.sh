#!/usr/bin/env zsh
#set -x

echo Building debug executables
if ! [ $# -eq 1 ] ; then
  echo "Product version not found" >&2
  exit 1
fi

mkdir -p ./dist/macos

pushd ./commands/check
echo "Building check"
go-winres make --arch amd64 --product-version $1 --file-version $1
env GOOS=windows GOARCH=amd64 go build -o ../../dist/windows
env GOOS=linux GOARCH=amd64 go build -o ../../dist/linux
rm rsrc_windows_amd64.syso
popd

pushd ./commands/relock
echo "Building relock"
go-winres make --arch amd64 --product-version $1 --file-version $1
env GOOS=windows GOARCH=amd64 go build -o ../../dist/windows
env GOOS=linux GOARCH=amd64 go build -o ../../dist/linux
env GOOS=darwin GOARCH=amd64 go build -o ../../dist/macos
rm rsrc_windows_amd64.syso
popd

pushd ./commands/unlock
echo "Building unlock"
go-winres make --arch amd64 --product-version $1 --file-version $1
env GOOS=windows GOARCH=amd64 go build -o ../../dist/windows
env GOOS=linux GOARCH=amd64 go build -o ../../dist/linux
env GOOS=darwin GOARCH=amd64 go build -o ../../dist/macos
rm rsrc_windows_amd64.syso
popd

pushd ./commands/dumpsmc
echo "Building dumpsmc"
go-winres make --arch amd64 --product-version $1 --file-version $1
env GOOS=windows GOARCH=amd64 go build -o ../../dist/windows
env GOOS=linux GOARCH=amd64 go build -o ../../dist/linux
env GOOS=darwin GOARCH=amd64 go build -o ../../dist/macos
rm rsrc_windows_amd64.syso
popd

pushd ./commands/patchgos
echo "Building patchgos"
go-winres make --arch amd64 --product-version $1 --file-version $1
env GOOS=windows GOARCH=amd64 go build -o ../../dist/windows
env GOOS=linux GOARCH=amd64 go build -o ../../dist/linux
env GOOS=darwin GOARCH=amd64 go build -o ../../dist/macos
rm rsrc_windows_amd64.syso
popd

pushd ./commands/patchsmc
echo "Building patchsmc"
go-winres make --arch amd64 --product-version $1 --file-version $1
env GOOS=windows GOARCH=amd64 go build -o ../../dist/windows
env GOOS=linux GOARCH=amd64 go build -o ../../dist/linux
env GOOS=darwin GOARCH=amd64 go build -o ../../dist/macos
rm rsrc_windows_amd64.syso
popd

pushd ./commands/patchvmkctl
echo "Building patchvmkctl"
go-winres make --arch amd64 --product-version $1 --file-version $1
env GOOS=windows GOARCH=amd64 go build -o ../../dist/windows
env GOOS=linux GOARCH=amd64 go build -o ../../dist/linux
env GOOS=darwin GOARCH=amd64 go build -o ../../dist/macos
rm rsrc_windows_amd64.syso
popd

cp -v LICENSE ./dist
cp -v *.md ./dist
cp -v *.pdf ./dist
cp -vr ./iso ./dist
