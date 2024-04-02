# TASK FETP-21
本次任務要讓各位將 [FETP-19](https://sdc-nycu.notion.site/Vue-Routing-Beginner-to-Advanced-3f8085ec15ca4ed18bb07674482d704a?pvs=4) 中的 Code 推到各位自己的 GitHub Repository.

- **任務回報**：Covered by Task [FETP-22](./fetp-22.md).
- **任務截止**：`2024/04/08` - `2024/04/14`

# 任務指引

## 建立 Key Pair

### 1. 使用 `ssh-keygen` 生成 Key Pair。

請將 `<_your-gethub-id_>` 換成你的 GitHub ID。
```sh
ssh-keygen -o -a 100 -t ed25519 -f ~/.ssh/<_your-gethub-id_>@github.com
```

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

### 2. 通通都按 `Enter`。

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
> 全部的輸出都要複製起來！格式請參考 Output Format 輸出的所有內容。

## 將公鑰上傳至 GitHub

### 1. 點擊 <ins>Settings</ins>
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
![](https://i.imgur.com/FOVcm20.png)

## 建立 Remote Repository

### 1. 回到自己的 GitHub 首頁，並點擊紅圈處 <ins>New</ins>。
![](https://i.imgur.com/oYTHqRh.png)

---

### 2. 完成紅圈處設定
- <ins>Owner</ins> 請選擇自己的帳號
- <ins>Repository name</ins> 依照 [FETP-19](https://sdc-nycu.notion.site/Vue-Routing-Beginner-to-Advanced-3f8085ec15ca4ed18bb07674482d704a?pvs=4) 請命名 <ins>routingapp</ins> 或 <ins>routing-app</ins>。
![](https://i.imgur.com/sJ8OUPi.png)

---

看到此頁面就建立成功囉！
![](https://i.imgur.com/056xCCa.png)

## Push to GitHub

### 1. 選擇 SSH 並複製紅圈處指令
![](https://i.imgur.com/B5BAKLU.png)

---

### 2. 在 VM 中 `routingapp` 的專案目錄下貼上此指令