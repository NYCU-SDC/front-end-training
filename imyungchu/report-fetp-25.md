# FETP-25 Report

## INFORMATION
**GitHub ID**: `imyungchu`

## FETP-25

> **QUESTION:** 
> - 實際用過 useRoute 之後，請簡單介紹 useRoute 的用法，以及他和 useRouter, RouterLink 的差別。

useRoute 用法是 `import { useRoute } from 'vue-router' ` 然後再 `const route = useRoute() ` 之後就可以用 `route.params` 來取得 route 參數。還有 `route.path` , `route.query` 可以輸出或查詢當前路由的資訊。
1. `useRoute` 是 是 `Vue Router` 中的 API。用來得知目前 route 的路徑、參數或是其他狀態。
2. `useRouter` 是 `Vue Router` 中的另一個 API 可以在方法中呼叫，讓我們在不同組件中導航，達到切換頁面的功能。
3. `RouterLink` 是 `Vue Router` 中提供的一個組件， 用於 template 中，可以定義用戶點擊會切換到哪個連結。

---

> **QUESTION:** (optional) 
> - onBeforeMount 的功能是什麼呢？

可以在組建掛載之前做想做的事，例如從其他地方獲得數據，設置組建狀態。

---

> **QUESTION:** (optional) 
> - 在 `<template>` 區塊中，可以看到 `car.make` ，這裡代表什麼意思？ 
> - Hint: OOP 觀念。

這代表 car 包含多個屬性的物件object。可以用 car.make 訪問 car 的 make 或其他更多屬性（即 json 中欄位）。

---

> **QUESTION:**
> - 請執行 `npm run dev -- --host` ，點擊任一卡片並截圖頁面。

> [!TIP]
> - 圖片可以使用 imgur 存放，並複製 Markdown 連結。
> - 若有疑問請使用 issues 發問！

![card imur](https://imgur.com/a/a0tZrre)

---

> **QUESTION:** (optional)
> - `import.meta.env.BASE_URL`  是什麼意思呢？

這是 javascript 的環境變數，用來得到當前模組的基本 URL，更方便得到不同組件的路徑。

---

> **QUESTION:**
> - onMounted 和 handlerChange 的功能是什麼呢？請簡單介紹

1. onMouted 用於在組建掛載到 DOM 之前執行代碼。在這個程式裡，是在 Script 中用來取得 URL 資料的 ` onMounted(() => { make.value = route.query.make || "" })` 中的
route.query 是用來從當前路由的 URL 查詢參數中獲取值的。這是 Vue Router 提供的功能，允許訪問到 URL 中 ? 之後的參數。例如，如果 URL 是 http://example.com/?make=Toyota，那麼 route.query.make 的值將是 "Toyota"。如果找不到就會回傳空字串。
2. handlerChange 是事件處理器，當 filter 中元素被改變的時候會觸發，功能是將根據 filter 選擇更動對應的內容和導航。

---

> **QUESTION:**
> - 嘗試部署到 Production 中，並截圖網址+網站。

![pic](https://imgur.com/a/jJk8GJa)
---

## OTHERS

> 這裡可以寫下任何你想紀錄或你想展示的內容！

發現之前做過的東西（部署）已經忘光光，甚至連 nycu.me 網址都要再去找下，但還是莫名部署失敗。git 的使用也會很卡，對於不同模組(submodule)概念很模糊。果然還是要不斷複習、有用才會記得吧！這次 Route 有很多知道但感覺過一陣子又會忘記的觀念，繼續加油～～