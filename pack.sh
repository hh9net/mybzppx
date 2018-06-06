#!/bin/bash
VER=$1
if [ "$VER" = "" ]; then
    echo 'please input pack version!'
    exit 1
fi
RELEASE="release-${VER}"
rm -rf ${RELEASE}
mkdir ${RELEASE}

# windows amd64
echo 'Start pack windows amd64...'
GOOS=windows GOARCH=amd64 go get ./...
GOOS=windows GOARCH=amd64 go build ./
cd install
GOOS=windows GOARCH=amd64 go build ./
cd ..
tar -czvf "${RELEASE}/bzppx-codepub-windows-amd64.tar.gz" bzppx-codepub.exe conf/ docs/ logs/.gitignore static/ views/ install/install.exe LICENSE README.md
rm -rf bzppx-codepub.exe

echo 'Start pack windows X386...'
GOOS=windows GOARCH=386 go get ./...
GOOS=windows GOARCH=386 go build ./
cd install
GOOS=windows GOARCH=386 go build ./
cd ..
tar -czvf "${RELEASE}/bzppx-codepub-windows-386.tar.gz" bzppx-codepub.exe conf/ docs/ logs/.gitignore static/ views/ install/install.exe LICENSE README.md
rm -rf bzppx-codepub.exe

echo 'Start pack linux amd64'
GOOS=linux GOARCH=amd64 go get ./...
GOOS=linux GOARCH=amd64 go build ./
cd install
GOOS=linux GOARCH=amd64 go build ./
cd ..
tar -czvf "${RELEASE}/bzppx-codepub-linux-amd64.tar.gz" bzppx-codepub conf/ docs/ logs/.gitignore static/ views/ install/install LICENSE README.md
rm -rf bzppx-codepub

echo 'Start pack linux 386'
GOOS=linux GOARCH=386 go get ./...
GOOS=linux GOARCH=386 go build ./
cd install
GOOS=linux GOARCH=386 go build ./
cd ..
tar -czvf "${RELEASE}/bzppx-codepub-linux-386.tar.gz" bzppx-codepub conf/ docs/ logs/.gitignore static/ views/ install/install LICENSE README.md
rm -rf bzppx-codepub

echo 'Start pack mac amd64'
GOOS=darwin GOARCH=amd64 go get ./...
GOOS=darwin GOARCH=amd64 go build ./
cd install
GOOS=darwin GOARCH=amd64 go build ./
cd ..
tar -czvf "${RELEASE}/bzppx-codepub-mac-amd64.tar.gz" bzppx-codepub conf/ docs/ logs/.gitignore static/ views/ install/install LICENSE README.md
rm -rf bzppx-codepub

echo 'END'
