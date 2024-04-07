> [!WARNING]
> This page is drafting.

## 開始之前

### 先決條件

在開始之前，請確保您已安裝以下內容：
- Git
- 您喜歡的前端開發 IDE，或是使用任務 FETP-10 中所引導的 VS Code。

### 初始設定

1. **Create Project：**
   - 將您的專案推到自己的 GitHub Repository，並設置為公開。
   - 請參考 Task [FETP-21](tasks/fetp-21.md)。

2. **Clone Project：**
   - 使用 Git Clone 將 Front-end Training Project 複製到您的本地機器。替換 `URL_OF_REPO` 為實際的 Repo. 的 URL：
     ```
     git clone URL_OF_REPO
     ```

3. **Branch：**
   - 將 `your_name` 替換成你的 GitHub ID：
     ```
     git checkout -b your_name
     ```

4. **Submodule：**
   - 將 `URL_OF_YOUR_PROJECT` 替換為您 GitHub 專案 URL：
     ```
     git submodule add URL_OF_YOUR_PROJECT path/to/submodule/your_project_name
     ```

5. **Update Report：**
   - 在 `reports` 目錄中找到本次任務的目錄，在其中加入一個 markdown 文件 (`your_github_id.md`)，完成 Report。

6. **Push Branch：**
   - 加入了您的專案和報告後，將您的 Branch 推到 GitHub Repo.：
     ```
     git push -u origin your_name
     ```

## Contributors' Responsibility

1. **Pull Request：**

2. **Peer Review：**

3. **Feedback：**

4. **Approve & Merge：**