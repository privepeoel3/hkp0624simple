

## hkp0624simple

[![](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy?template=https://github.com/privepeoel3/hkp0624simple.git)

## 注意事项

- [x] 支持VMess和VLESS两种协议
- [x] 使用Xray最新版构建
- [x] 路径: /UUID-vless 或 /UUID-vmess




### 环境变量说明

|  名称 | 值  | 说明  |
| ------------ | ------------ | ------------ |
|  PROTOCOL |  vless<br>vmess（可选） |  协议：vless+ws+tls或vmess+ws+tls |默认vless
|  UUID |  [uuid在线生成器](https://www.uuidgenerator.net "uuid在线生成器") | 用户主ID  |



<details>
<summary>CloudFlare Pages单账户反代代码</summary>

```js
export default {
  async fetch(request, env) {
    let url = new URL(request.url);
    if (url.pathname.startsWith('/')) {
      url.hostname = 'app0.herokuapp.com'
      let new_request = new Request(url, request);
      return fetch(new_request);
    }
    return env.ASSETS.fetch(request);
  },
};
```
</details>

<details>
<summary>CloudFlare Pages单双日轮换反代代码</summary>

```js
export default {
  async fetch(request, env) {
    const day1 = 'app0.herokuapp.com'
    const day2 = 'app1.herokuapp.com'
    let url = new URL(request.url);
    if (url.pathname.startsWith('/')) {
      let day = new Date()
      if (day.getDay() % 2) {
        url.hostname = day1
      } else {
        url.hostname = day2
      }
      let new_request = new Request(url, request);
      return fetch(new_request);
    }
    return env.ASSETS.fetch(request);
  },
};
```
</details>

### 客户端配置

```
  - 别名: "yourName"
    协议: vless 或 vmess
    地址: yourName.pages.dev
    端口: 443
    用户id: yourUuid
    流控: xtls-rprx-direct
    加密: none
    伪装域名: yourName.pages.dev
    传输类型: ws
    路径: /UUID-vless 或 /UUID-vmess
    传输层安全：tls   跳过证书验证：false
    SNI：yourName.pages.dev
```



