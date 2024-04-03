# TASK FETP-21
本任務要讓各位將 [FETP-19](https://sdc-nycu.notion.site/Vue-Routing-Beginner-to-Advanced-3f8085ec15ca4ed18bb07674482d704a?pvs=4) 中的 Code 推到各位自己的 GitHub Repository.

- **任務回報**：Covered by Task [FETP-22](./fetp-22.md).
- **任務截止**：`2024/04/08` - `2024/04/14`

> [!NOTE]
>
> 其中有兩個部分會要求各位閱讀文件。未來各位在開發或工作時，大量的閱讀文件將是必備的能力。

---

## TOC
- [TASK FETP-21](#task-fetp-21)
  - [TOC](#toc)
  - [建立 Key Pair](#建立-key-pair)
  - [設定 SSH Config](#設定-ssh-config)
    - [STEP 1](#step-1)
    - [STEP 2](#step-2)
    - [STEP 3](#step-3)
  - [將公鑰上傳至 GitHub](#將公鑰上傳至-github)
  - [建立 Remote Repository](#建立-remote-repository)
    - [STEP 1](#step-1-1)
    - [STEP 2](#step-2-1)
    - [STEP 3](#step-3-1)
  - [Push to GitHub](#push-to-github)
    - [STEP 1](#step-1-2)
    - [STEP 2](#step-2-2)
    - [STEP 3](#step-3-2)

---

## 建立 Key Pair

**Reading Documentation**

> [!IMPORTANT]
> 
> GitHub Docs: [Generating a new SSH key and adding it to the ssh-agent](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

> [!IMPORTANT]
> 
> 請完成 Section: <ins>Generating a new SSH key</ins> 即可。

> [!WARNING]
>
> 請注意文件中應選擇 <ins>Linux</ins> 的 Tag，並在 VM 中完成操作！

> [!TIP]
>
> 如果忘記怎麼判斷本機與 VM (Server) ，Review TASK [(FETP-9) Vue Environment and Initialization](https://www.notion.so/sdc-nycu/Vue-Environment-and-Initialization-f3494b38c2654c489689f97d8d373d2a?pvs=4)

<!-- ### 1. 使用 `ssh-keygen` 生成 Key Pair。

請將 `<_your-gethub-id_>` 換成你的 GitHub ID。
```sh
ssh-keygen -o -a 100 -t ed25519 -f ~/.ssh/<_your-gethub-id_>@github.com
``` -->

---

> **QUESTION**
>
> 請簡單說明非對稱加密的概念。並說明 Public Key 與 Private Key 的用法。

> **QUESTION**
>
> 在這邊我們使用了加密演算法 ED25519。除了 ED25519 以外，還有一個很有名的加密演算法，叫什麼名字？

> (Optional) **QUESTION**
>
> 這個有名的加密演算法有什麼問題，用了什麼方式降低了這個問題的風險？


<!-- <table>
    <tr>
        <td>QUESTIONS</td>
    </tr>
    <tr>
        <td>請簡單說明非對稱加密的概念</td>
    </td>
    <tr>
        <td>在這邊我們使用了加密演算法 ED25519。除了 ED25519 以外，還有一個很有名的加密演算法，叫什麼名字？</td>
    </td>
    <tr>
        <td>(Optional) 這個有名的加密演算法有什麼問題，用了什麼方式降低了這個問題的風險？</td>
    </td>
</table> -->

---

<!-- ### 2. 通通都按 `Enter`。

Sample Output:
```
Generating public/private ed25519 key pair.
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in /home/ansible/.ssh/kdotwei@github.com
Your public key has been saved in /home/ansible/.ssh/kdotwei@github.com.pub
...
```

---

### 3. 取得 Public Key 的內容
```sh
cat ~/.ssh/<_your-gethub-id_>@github.com.pub
```

Output Format:
```
ssh-ed25519 <random-code> <comment>
```

Sample Output:
```
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOat8C5IfqN0Z2+44pcoE0nPrQahgh/C2prE6DbkqcXy ansible@vm-300
```

將 Output 完全複製起來。

> [!IMPORTANT]
> 全部的輸出都要複製起來！格式請參考 Output Format 輸出的所有內容。 -->


## 設定 SSH Config

> [!IMPORTANT]
>
> 此 Section 也應於 VM 中完成！

### STEP 1
建立 `~/.ssh/config` 文件。
```sh
touch ~/.ssh/config
```

### STEP 2
請將下方指令中的 `<your-github-id>` 與 `<private-key-name>` 更改為你的 GitHub ID 與 Private Key 的檔案名稱。

```sh
echo -e "Host github.com\n\tUser <your-github-id>\n\tIdentityFile ~/.ssh/<private-key-name>" >> ~/.ssh/config
```

### STEP 3
使用 `cat` 檢查檔案資訊是否正確。

```sh
cat ~/.ssh/config
```

Output Format
```
Host github.com
	User <your-github-id>
	IdentityFile ~/.ssh/<private-key-name>
```

## 將公鑰上傳至 GitHub

**Reading Documentation**

> [!IMPORTANT]
> GitHub Docs: [Adding a new SSH key to your GitHub account](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)

> [!TIP]
> 
> GitHub Docs: [Testing your SSH connection](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/testing-your-ssh-connection)

<!-- ### 1. 點擊 <ins>Settings</ins>
![](https://i.imgur.com/RfEqyna.png)

---

### 2. 在左側目錄找到 <ins>SSH and GPG keys</ins>
![](https://i.imgur.com/YY8wRPH.png)

---

### 3. 點擊 <ins>New SSH key</ins>
![](https://i.imgur.com/gLwKxAK.png)

---

### 4. 完成圖片紅圈處
- <ins>Title</ins> 可以自由決定
- <ins>Key</ins> 貼入完整的 SSH key。

輸入完後，點擊 <ins>Add SSH key</ins>。
![](https://i.imgur.com/FOVcm20.png) -->

## 建立 Remote Repository

### STEP 1
回到自己的 GitHub 首頁，並點擊紅圈處 <ins>New</ins>。
![](https://i.imgur.com/oYTHqRh.png)

---

### STEP 2
完成紅圈處設定
- <ins>Owner</ins> 請選擇自己的帳號
- <ins>Repository name</ins> 依照 [FETP-19](https://sdc-nycu.notion.site/Vue-Routing-Beginner-to-Advanced-3f8085ec15ca4ed18bb07674482d704a?pvs=4) 請命名 <ins>routingapp</ins> 或 <ins>routing-app</ins>。
- 請將 Repository 設為公開。

![](https://i.imgur.com/sJ8OUPi.png)

---

### STEP 3
看到此頁面就建立成功囉！

![](https://i.imgur.com/056xCCa.png)

## Push to GitHub

### STEP 1
選擇 SSH 並複製紅圈處指令

![](https://i.imgur.com/B5BAKLU.png)

---

### STEP 2
在 VM 中 `routingapp` 的專案目錄下貼上此指令，並執行。

![](https://i.imgur.com/neLz7tL.png)

---

### STEP 3
重新整理 GitHub 頁面，看到專案出現就完成了！

![](https://i.imgur.com/hl9yy2Y.png)