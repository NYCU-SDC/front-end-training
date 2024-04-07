# TASK FETP-22
本任務要讓各位了解新的 Workflow 中，要怎麼完成任務回報。

- **任務回報**：`<your-github-id>/report-fetp-22.md`
- **任務截止**：`2024/04/08` - `2024/04/14`

---

## TOC


---

## Clone Repository

```sh
cd ~
```

```sh
git clone git@github.com:NYCU-SDC/front-end-training.git
```

## New your branch

```sh
cd front-end-training
```

```sh
git checkout -b <your-github-id>
```

```sh
git status
```

```
On branch <your-github-id>
nothing to commit, working tree clean
```

## Add your work

```sh
mkdir <your-github-id>
```

```sh
cd <your-github-id>
```

```sh
pwd
```

```
/home/ansible/front-end-training/<your-github-id>
```

```sh
git submodule add <your-repo-link>
```

![](https://i.imgur.com/mrRVOMv.png)

> [!TIP]
> 如果想重設 Submodule，請參考 [How do I remove a submodule?](https://stackoverflow.com/questions/1260748/how-do-i-remove-a-submodule) 中的正確解法（被打綠色勾的回覆）。

## Add your report

### STEP 1: Create Report with markdown.
> [!TIP]
> 可以使用 VSCode Remote 在 `/home/ansible/front-end-training/<your-github-id>/` 底下建立 `report-fetp-22.md`。

> [!TIP]
> 若不熟 GitHub Markdown，請參考 [Basic writing and formatting syntax](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax)。

## Push your work and report

```sh
cd ~/front-end-training/
```

```sh
git add .
```

```sh
git commit -m "complete fetp-22"
```

```sh
git push --set-upstream origin <your-github-id>
```

![](https://imgur.com/DMW7AXu.png)

## Pull Request

### SETP 1
![](https://imgur.com/gfjfkFX.png)

### SETP 2
![](https://imgur.com/GA1LIqa.png)

### SETP 3
![](https://imgur.com/zJnomnu.png)

### SETP 4
![](https://imgur.com/mjk6xzE.png)

### SETP 5
![](https://imgur.com/wDZC4lD.png)

### SETP 6
在此處總結本次任務所學作為 PR 敘述。

![](https://imgur.com/pD4xNCJ.png)

> [!TIP]
> 若不熟 GitHub Markdown，請參考 [Basic writing and formatting syntax](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax)。

> [!TIP]
> <ins>Preview</ins> Tag 可以查看妳所撰寫的內容會怎麼呈現在 GitHub 中。

### STEP 7
![](https://imgur.com/BsW1aex.png)