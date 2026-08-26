## 自用说明

docker分支为本人使用，主要是为了增加docker版

## 之后使用方法

拉取上游最新代码并合并到你的 docker 分支

```
# 合并上游代码
git checkout main
git pull https://github.com/WhY15w/lanzou-url-parser.git main

git checkout docker
git merge main

# 推送触发自动构建
git push origin docker
```
