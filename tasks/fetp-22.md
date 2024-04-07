# TASK FETP-22
本任務要讓各位了解新的 Workflow 中，要怎麼完成任務回報。

- **任務回報**：Pull Request
- **任務截止**：`2024/04/08` - `2024/04/14`

---

## TOC

- [TASK FETP-22](#task-fetp-22)
  - [TOC](#toc)
  - [Clone Repository](#clone-repository)
    - [STEP 1: Go to the home directory](#step-1-go-to-the-home-directory)
    - [STEP 2: Clone `front-end-training` repository with ssh](#step-2-clone-front-end-training-repository-with-ssh)
  - [New your branch](#new-your-branch)
    - [STEP 1: Turn into `front-end-training` directory](#step-1-turn-into-front-end-training-directory)
    - [STEP 2: Create your own branch and switch to this branch](#step-2-create-your-own-branch-and-switch-to-this-branch)
    - [STEP 3: Check the branch you are on](#step-3-check-the-branch-you-are-on)
  - [Add your work](#add-your-work)
    - [STEP 1: Make your directory](#step-1-make-your-directory)
    - [STEP 2: Turn into your direcotory](#step-2-turn-into-your-direcotory)
    - [STEP 3: Add your repo as a submodule.](#step-3-add-your-repo-as-a-submodule)
  - [Add your report](#add-your-report)
    - [STEP 1: Copy the report template in `report-templates/fetp-22.md`](#step-1-copy-the-report-template-in-report-templatesfetp-22md)
    - [STEP 2: Write your report with markdown syntax.](#step-2-write-your-report-with-markdown-syntax)
  - [Push your work and report](#push-your-work-and-report)
    - [STEP 1: Back to the project root directory](#step-1-back-to-the-project-root-directory)
    - [STEP 2: Add all changes](#step-2-add-all-changes)
    - [STEP 3: Commit all changes](#step-3-commit-all-changes)
    - [STEP 4: Publish your branch to the front-end-training repo](#step-4-publish-your-branch-to-the-front-end-training-repo)
  - [Pull Request](#pull-request)
    - [SETP 1](#setp-1)
    - [SETP 2](#setp-2)
    - [SETP 3](#setp-3)
    - [SETP 4](#setp-4)
    - [SETP 5](#setp-5)
    - [STEP 6](#step-6)

---

## Clone Repository

### STEP 1: Go to the home directory

```sh
cd ~
```

### STEP 2: Clone `front-end-training` repository with ssh

```sh
git clone git@github.com:NYCU-SDC/front-end-training.git
```

## New your branch

### STEP 1: Turn into `front-end-training` directory

```sh
cd front-end-training
```

### STEP 2: Create your own branch and switch to this branch

```sh
git checkout -b <your-github-id>
```

> [!IMPORTANT]
> 請將 `<your-github-id>` 更改為您的 GitHub ID。

### STEP 3: Check the branch you are on

```sh
git status
```

Output:

```
On branch <your-github-id>
nothing to commit, working tree clean
```

## Add your work

> [!IMPORTANT]
> Please use `pwd` to check whether your location in the file system is in `/home/ansible/front-end-training/<your-github-id>/`.

### STEP 1: Make your directory

```sh
mkdir <your-github-id>
```

> [!IMPORTANT]
> 請將 `<your-github-id>` 更改為您的 GitHub ID。

### STEP 2: Turn into your direcotory

```sh
cd <your-github-id>
```

> [!IMPORTANT]
> 請將 `<your-github-id>` 更改為您的 GitHub ID。

Check your location in file system.
```sh
pwd
```

Output:
```
/home/ansible/front-end-training/<your-github-id>
```

### STEP 3: Add your repo as a submodule.

```sh
git submodule add <your-repo-https-link>
```

> [!IMPORTANT]
> 請將 `<your-repo-https-link>` 替換為您 `routingapp` 的 https 連結，請參考下方圖片。
> ![](https://i.imgur.com/mrRVOMv.png)

> [!TIP]
> 如果想重設 Submodule，請參考 [How do I remove a submodule?](https://stackoverflow.com/questions/1260748/how-do-i-remove-a-submodule) 中的正確解法（被打綠色勾的回覆）。

## Add your report

> [!IMPORTANT]
> Please use `pwd` to check whether your location in the file system is in `/home/ansible/front-end-training/<your-github-id>/`.

### STEP 1: Copy the report template in `report-templates/fetp-22.md`

```sh
cp ~/front-end-training/report-templates/report-fetp-22.md ./report-fetp-22.md
```

### STEP 2: Write your report with markdown syntax.
> [!TIP]
> 可以使用 VSCode Remote 開啟目錄 `/home/ansible/front-end-training/<your-github-id>/` 並編輯 `report-fetp-22.md`。

> [!TIP]
> 若不熟 GitHub Markdown，請參考 [Basic writing and formatting syntax](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax)。

## Push your work and report

> [!IMPORTANT]
> Please use `pwd` to check whether your location in the file system is in `/home/ansible/front-end-training/<your-github-id>/`.

### STEP 1: Back to the project root directory

```sh
cd ~/front-end-training/
```

### STEP 2: Add all changes

```sh
git add .
```

> [!IMPORTANT]
> Please use `pwd` to check whether your location in the file system is in `/home/ansible/front-end-training/`.

### STEP 3: Commit all changes

```sh
git commit -m "complete fetp-22"
```

### STEP 4: Publish your branch to the front-end-training repo

```sh
git push --set-upstream origin <your-github-id>
```

> [!IMPORTANT]
> 請將 `<your-github-id>` 更改為您的 GitHub ID。

> [!TIP]
> How to check if your branch is published.
> 
> ![](https://imgur.com/DMW7AXu.png)

## Pull Request

### SETP 1

點選 `front-end-training` Repo 上方的 `Pull requests`。

![](https://imgur.com/gfjfkFX.png)

### SETP 2

點選 `New pull request`。

![](https://imgur.com/GA1LIqa.png)

### SETP 3

`base` 為 `main`，`compare` 選擇要推入 `main` 的 branch。

> [!NOTE]
> 這邊選擇 `<your-github-id>` 這條 branch。

![](https://imgur.com/mjk6xzE.png)

### SETP 4

點選 `Create pull request`。

![](https://imgur.com/wDZC4lD.png)

### SETP 5

在紅匡處總結本次任務所學或心得，作為 PR 敘述。並點選 `Create pull request` 送出 PR。

![](https://imgur.com/pD4xNCJ.png)

> [!TIP]
> 若不熟 GitHub Markdown，請參考 [Basic writing and formatting syntax](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax)。

> [!TIP]
> <ins>Preview</ins> Tag 可以查看妳所撰寫的內容會怎麼呈現在 GitHub 中。

### STEP 6

確定紅匡處的資訊是由您的 branch 併入 `main`，即完成本任務。
![](https://imgur.com/BsW1aex.png)