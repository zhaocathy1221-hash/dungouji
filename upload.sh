#!/bin/bash

# 🚇 国央企地铁招投标信息监控平台 - 一键上传脚本

echo "🚀 开始上传地铁招投标信息监控平台到GitHub..."

# 检查GitHub CLI
if ! command -v gh &> /dev/null; then
    echo "❌ GitHub CLI 未安装，请先安装: brew install gh"
    exit 1
fi

# 检查是否已登录GitHub
if ! gh auth status &> /dev/null; then
    echo "🔐 请先在浏览器中完成GitHub登录..."
    gh auth login --web
fi

# 设置变量
REPO_NAME="metro-tender-platform"
REPO_DESC="国央企地铁招投标信息监控平台 - 实时追踪盾构机、超前钻机等地铁建设设备招投标信息"

# 创建GitHub仓库
echo "📦 创建 GitHub 仓库..."
gh repo create $REPO_NAME --public --description "$REPO_DESC" --source . --remote origin

# 推送代码
echo "⬆️ 推送代码到GitHub..."
git push -u origin main

# 启用GitHub Pages
echo "🌐 启用 GitHub Pages..."
gh repo edit $REPO_NAME --enable-pages --pages-branch main --pages-path "/"

# 获取访问地址
REPO_URL=$(gh repo view --json url -q '.url')
PAGES_URL="https://$(echo $REPO_URL | sed 's|https://github.com||' | sed 's|/|.github.io/|')"

echo "✅ 上传完成！"
echo ""
echo "📁 仓库地址: $REPO_URL"
echo "🌐 在线访问: $PAGES_URL/metro-tender-platform.html"
echo ""
echo "📖 使用说明："
echo "1. 访问在线地址即可使用"
echo "2. 点击'刷新数据'获取最新信息"
echo "3. 使用'销售模式'进行客户管理"
echo ""
echo "🎉 项目已成功部署到GitHub！"