# TASK FETP-21

## 任務說明

本次任務要讓各位將 [FETP-19](https://sdc-nycu.notion.site/Vue-Routing-Beginner-to-Advanced-3f8085ec15ca4ed18bb07674482d704a?pvs=4) 中的 Code 推到各位自己的 GitHub Repository.

## 任務回報

由 Task [FETP-22]() Cover。

## 任務指引

### 建立與上傳公鑰

```sh
ssh-keygen -o -a 100 -t ed25519 -f ~/.ssh/<_your-gethub-id_>@github.com
```

```
Generating public/private ed25519 key pair.
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in /home/ansible/.ssh/kdotwei@github.com
Your public key has been saved in /home/ansible/.ssh/kdotwei@github.com.pub
...
```

```sh
cat ~/.ssh/<_your-gethub-id_>@github.com.pub
```

Output:
```
ssh-ed25519 <random-code> <comment>
```

```
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOat8C5IfqN0Z2+44pcoE0nPrQahgh/C2prE6DbkqcXy ansible@vm-300
```

![](https://i.imgur.com/RfEqyna.png)

![](https://i.imgur.com/YY8wRPH.png)

![](https://i.imgur.com/gLwKxAK.png)

![](https://i.imgur.com/FOVcm20.png)

### 建立 Remote Repository

![](https://i.imgur.com/oYTHqRh.png)

![](https://i.imgur.com/sJ8OUPi.png)

### Push to GitHub
