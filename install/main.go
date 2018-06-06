package main

import (
	"flag"

	_ "github.com/bzppx/bzppx-codepub/install/storage"

	"github.com/astaxie/beego"
)

// 安装程序

var (
	port = flag.String("port", "8090", "please input listen port")
)

func main() {
	flag.Parse()
	beego.Run(":" + *port)
}
