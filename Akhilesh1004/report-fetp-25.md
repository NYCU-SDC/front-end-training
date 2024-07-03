# FETP-25 Report

## INFORMATION
**GitHub ID**: `Akhilehs1004`

## FETP-25

> **QUESTION:** 
> - 實際用過 useRoute 之後，請簡單介紹 useRoute 的用法，以及他和 useRouter, RouterLink 的差別。

**ANSWER:** 
- useRoute: Mainly used to access the current route information (path, parameters, query, etc.). Suitable for components that need to read the route status.
- useRouter: Provides access to the route instance, allowing programmatic navigation (such as jumping to another route in the code). Suitable for components that need to perform navigation operations.
- RouterLink: A component used to create navigation links, rendered as <a> tags, and route jumps when clicked. Suitable for situations where link navigation is required in the template.

---

> **QUESTION:** (optional) 
> - onBeforeMount 的功能是什麼呢？

**ANSWER:** 
- Initialize data: Before the component is mounted, you can use it to initialize data or state. This ensures that the data is ready once the component is mounted. 
- Set state: You can use it to set some initial state or variables for immediate use after the component is mounted. 
- Perform side effects: You can perform some side effect operations before the component is mounted, such as setting event listeners, etc.

---

> **QUESTION:** (optional) 
> - 在 `<template>` 區塊中，可以看到 `car.make` ，這裡代表什麼意思？ 
> - Hint: OOP 觀念。

**ANSWER:** Represents accessing a property (make) from an object (car)

---

> **QUESTION:**
> - 請執行 `npm run dev -- --host` ，點擊任一卡片並截圖頁面。

> [!TIP]
> - 圖片可以使用 imgur 存放，並複製 Markdown 連結。
> - 若有疑問請使用 issues 發問！

**ANSWER:** ![npm run dev -- --host](https://github.com/Akhilesh1004/Forex_trading_strategy/blob/351a2582fce4a252986f47d89f048a20e85c881a/03.png)

---

> **QUESTION:** (optional)
> - `import.meta.env.BASE_URL`  是什麼意思呢？

**ANSWER:** import.meta.env.BASE_URL is a global variable used to get the base URL address of the current application, that is, the publicPath used during development or the actual deployment path in the production environment.

---

> **QUESTION:**
> - onMounted 和 handlerChange 的功能是什麼呢？請簡單介紹

**ANSWER:** 
- onMounted is used to perform initialization operations after the component is mounted.
- handleChange is a naming convention, usually used for custom functions that handle certain changes. Its specific function depends on the actual usage scenario.

---

> **QUESTION:**
> - 嘗試部署到 Production 中，並截圖網址+網站。

**ANSWER:** ![build production](https://github.com/Akhilesh1004/Forex_trading_strategy/blob/9e4aaafc51aa9c75b753a69b81d5f21a4a855450/04.png)

---

## OTHERS

> 這裡可以寫下任何你想紀錄或你想展示的內容！

**ANSWER:** last part of example code have some problem, need to change car.value to cars.value in if execution.
