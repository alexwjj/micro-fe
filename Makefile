#!/bin/bash
usage = "\
install                                     安装/更新依赖\n\
devMain                                     启动微前端容器开发模式\n\
devVue                                      启动vue仓库\n\
devVue3                                     启动vue3仓库\n\
devReact                                    启动react仓库\n\

# step print
define printStep
@echo "\033[1;33mPC-SHARED:\033[0m $1"
endef

# Must be the first target!
default:
	@echo $(usage)

# 安装所有依赖
install:
	cd main && yarn && cd ../vue && yarn && cd ../vue3 && yarn && cd ../react && yarn 
# 启动单个应用
devMain:
	cd main && yarn dev $(dev_args)

devVue:
	cd vue && yarn dev $(dev_args)

devVue3:
	cd vue3 && yarn dev $(dev_args)

devReact:
	cd react && yarn dev $(dev_args)
# 打包
buildMain:
	cd main && yarn build $(dev_args)

buildVue:
	cd vue && yarn build $(dev_args)
	
buildVue3:
	cd vue3 && yarn build $(dev_args)

buildReact:
	cd react && yarn build $(dev_args)