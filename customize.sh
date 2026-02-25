#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: eSirPlayground
# Youtube Channel: https://goo.gl/fvkdwm 
#=================================================
#1. Modify default IP
sed -i 's/192.168.1.1/192.168.5.1/g' openwrt/package/base-files/files/bin/config_generate

#2. Clear the login password
sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.//g' openwrt/package/lean/default-settings/files/zzz-default-settings

#3. Replace with JerryKuKu’s Argon
# rm openwrt/package/lean/luci-theme-argon -rf




echo "### 5. 设置 Clash 核心 ###"
OPENCLASH_CORE_DIR="openwrt/files/etc/openclash/core"
mkdir -p "$OPENCLASH_CORE_DIR"
cd "$OPENCLASH_CORE_DIR"

CLASH_DEV_URL="https://github.com/vernesong/OpenClash/releases/download/Clash/clash-linux-amd64.tar.gz"
CLASH_TUN_URL="https://raw.githubusercontent.com/vernesong/OpenClash/refs/heads/core/master/premium/clash-linux-amd64-2023.08.17-13-gdcc8d87.gz"

echo "正在获取 Clash Meta 最新版本..."
# LATEST_META_VERSION=$(curl -s https://api.github.com/repos/MetaCubeX/mihomo/releases/latest | grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/')
# if [ -z "$LATEST_META_VERSION" ]; then
# echo "❌ 获取 Clash Meta 最新版本失败，退出"; exit 1
# fi
CLASH_META_URL="https://github.com/MetaCubeX/mihomo/releases/download/v1.19.20/mihomo-linux-amd64-v1.19.20.gz"

wget -qO- "$CLASH_DEV_URL" | tar xOvz > clash && chmod +x clash
wget -qO- "$CLASH_TUN_URL" | gunzip -c > clash_tun && chmod +x clash_tun
wget -qO- "$CLASH_META_URL" | gunzip -c > clash_meta && chmod +x clash_meta

wget -qO GeoSite.dat "https://github.com/MetaCubeX/meta-rules-dat/releases/download/latest/geosite.dat"
wget -qO GeoIP.dat "https://github.com/MetaCubeX/meta-rules-dat/releases/download/latest/GeoIP.dat"
wget -qO geoip.metadb "https://github.com/MetaCubeX/meta-rules-dat/releases/download/latest/geoip.metadb"






