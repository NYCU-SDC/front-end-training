# TASK FETP-23

我們在 [FETP-9](https://www.notion.so/sdc-nycu/Vue-Environment-and-Initialization-f3494b38c2654c489689f97d8d373d2a?pvs=4) 中使用的 `npm run dev -- --host` 只能提供臨時的 Web Service。

本任務要讓各位安裝並設定 Web Server: Nginx，同時部署自己的 Vue 專案，來提供固定的 Web Service。

在此任務中你將學到：
- 如何部署 Vue 專案。
- 初步認識 Developing Environment 與 Production Environment。
- 如何提供 Web Service（建立你的網站）。

---

- **任務回報**：
- **任務截止**：`2024/04/08` - `2024/04/14`

---

## TOC


---

## Install Nginx

```sh
sudo apt update
```

```sh
sudo apt upgrade -y
```

```sh
sudo apt install nginx -y
```

![](https://imgur.com/8qtTmVx.png)

## Deploy your VUE project

```sh
cd /var/www/
```

```sh
sudo git clone <your-repo-https-link>
```

```sh
cd routingapp
```

```sh
sudo npm install
```

```sh
sudo npm run build
```

## Configure Nginx

```sh
sudo vim /etc/nginx/sites-available/default
```

```
root /var/www/routingapp/dist;
```

> [!TIP]
> 

```sh
sudo systemctl restart nginx
```

### STEP

開啟瀏覽器，連到 [FETP-9](https://www.notion.so/sdc-nycu/Vue-Environment-and-Initialization-f3494b38c2654c489689f97d8d373d2a?pvs=4) 中您於 [nycu.me](https://nycu.me/) 所註冊的 Name。

![](https://imgur.com/4XTPoGl.png)

> [!NOTE]
> 也可以在瀏覽器中直接輸入 IP 連到您的網站（不需加 Port）。