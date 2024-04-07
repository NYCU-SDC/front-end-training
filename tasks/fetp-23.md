# TASK FETP-23

我們在 [FETP-9](https://www.notion.so/sdc-nycu/Vue-Environment-and-Initialization-f3494b38c2654c489689f97d8d373d2a?pvs=4) 中使用的 `npm run dev -- --host` 只能提供臨時的 Web Service。

本任務要讓各位安裝並設定 Web Server: Nginx，同時部署自己的 Vue 專案，來提供固定的 Web Service。

各位將於本次任務學習到：
1. 如何部署 Vue 專案
2. 初步認識 Developing Environment 與 Production Environment
3. 如何提供 Web Service（建立你的網站）

## INFORMATION

- **任務回報**： Covered by [FETP-22](./fetp-22.md)
- **任務截止**：`2024/04/08` - `2024/04/14`
- **前置任務**：
  - [FETP-9](https://www.notion.so/sdc-nycu/Vue-Environment-and-Initialization-f3494b38c2654c489689f97d8d373d2a?pvs=4)
  - [FETP-19](https://www.notion.so/sdc-nycu/Vue-Routing-Beginner-to-Advanced-3f8085ec15ca4ed18bb07674482d704a?pvs=4)
  - [FETP-21](./fetp-21.md)

> [!WARNING]
> 請一定先完成前置任務在開始執行此任務！

---

## TOC

- [TASK FETP-23](#task-fetp-23)
  - [INFORMATION](#information)
  - [TOC](#toc)
  - [Install Nginx](#install-nginx)
  - [Deploy your VUE project](#deploy-your-vue-project)
    - [STEP 1: Turn to www directory](#step-1-turn-to-www-directory)
    - [STEP 2: Clone your VUE project with `sudo`](#step-2-clone-your-vue-project-with-sudo)
    - [STEP 3: Turn into your project directory](#step-3-turn-into-your-project-directory)
    - [STEP 4: Deploy VUE project](#step-4-deploy-vue-project)
  - [Configure Nginx](#configure-nginx)
    - [STEP 1: Configuration File](#step-1-configuration-file)
    - [STEP 2: Restart Nginx](#step-2-restart-nginx)
    - [STEP 3: Check](#step-3-check)

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

連到你的網站查看，若看到 Welcome Message 就代表安裝完成了。

![](https://imgur.com/8qtTmVx.png)

> [!IMPORTANT]
> 在先前任務中，我們都有加入 Port ，在這邊開始，網址不需加 Port。

> **QUESTION**
>
> 為何我們安裝了 Nginx 後，在瀏覽器輸入網址或 IP 就可以連到網站？而在先前的任務中都要加入 Port 號？

> **QUESTION**
>
> 如果我們同時在專案中使用 `npm run dev -- --host`，加 Port 與不加 Port 會有什麼差別？可以的話也請將兩者的截圖都放上來。

## Deploy your VUE project

### STEP 1: Turn to www directory

```sh
cd /var/www/
```

### STEP 2: Clone your VUE project with `sudo`

```sh
sudo git clone <your-repo-https-link>
```

> [!IMPORTANT]
> 請將 `<your-repo-https-link>` 更改為您的 routingapp 專案的 Https 連結。

### STEP 3: Turn into your project directory

```sh
cd routingapp
```

### STEP 4: Deploy VUE project

```sh
sudo npm install
```

```sh
sudo npm run build
```

> **QUESTION**
>
> 為何要執行 `npm run install`？ 不執行會怎樣？

> **QUESTION**
>
> 不同前幾次任務，這邊使用 `run build` 而非 `run dev`，請問差別在哪？

## Configure Nginx

### STEP 1: Configuration File
使用 vim 進行修改。

```sh
sudo vim /etc/nginx/sites-available/default
```

往下找到 `root /var/www/html;` 這行，
並將其修改成下方樣子。

```
root /var/www/routingapp/dist;
```

> [!NOTE]
> 不熟 VIM 的話，請參考 [簡明 Vim 文字編輯器操作入門教學](https://blog.techbridge.cc/2020/04/06/how-to-use-vim-as-an-editor-tutorial/)。

> [!TIP]
> 這裡也可以使用 VSCode Remote 進到 `/etc/nginx/sites-available/` 修改 `default` 檔案。
> 但因預設連線並未擁有 `root` 權限，可以安裝 <ins>Save as Root</ins> Extension 來存檔。

> **QUESTION**
>
> 在 Nginx 中 `root` 這個設定項代表著什麼？

> **QUESTION**
>
> 為什麼我們要設定 `/var/www/routingapp/dist` 為 `root` ，而非 `/var/www/routingapp/` 或其他目錄？

### STEP 2: Restart Nginx

```sh
sudo systemctl restart nginx
```

### STEP 3: Check

開啟瀏覽器，連到 [FETP-9](https://www.notion.so/sdc-nycu/Vue-Environment-and-Initialization-f3494b38c2654c489689f97d8d373d2a?pvs=4) 中您於 [nycu.me](https://nycu.me/) 所註冊的 Name。

![](https://imgur.com/4XTPoGl.png)

> [!NOTE]
> 也可以在瀏覽器中直接輸入 IP 連到您的網站（不需加 Port）。

> **QUESTION**
>
> 請「簡單」說明 Production Environment 與 Developing Environment。

> (optional) **QUESTION**
>
> 除了 Production 與 Developing 以外，還有什麼 Environment？
> 您也可以針對這幾種 Env 進行介紹。


> **QUESTION**
>
> 可以注意到在 Server 上有兩個地方都有 `routingapp` 的專案： `~/ansible/routingapp` 與 `/var/www/routingapp`。
>
> 請問您認為以上兩個目錄，誰更適合作為 Production，誰適合作為 Developing？

> **QUESTION**
>
> 前面請各位同時使用 `npm run dev -- --host` 並截圖差異。請根據此提示，說明前一個問題的為何會這樣判斷。