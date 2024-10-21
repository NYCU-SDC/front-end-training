# Task FETP-26

這次任務我們要學習用 docker 在本地建立環境跑專案，同時接續上次任務學習 Nested Routes 的用法。

## INFORMATION

- **任務回報**： Report and pull request
- **任務截止**： `2024/10/21` - `2024/10/28`
- **前置任務**：
  - [FETP-25](./fetp-25.md)

> [!WARNING]
> 請一定先完成前置任務，再開始執行此任務！

---

## TOC

- [Task FETP-26](#task-fetp-26)
  - [INFORMATION](#information)
  - [TOC](#toc)
  - [一、Docker 在本地執行專案的步驟](#一docker-在本地執行專案的步驟)
    - [STEP 1. clone 自己的 project 下來](#step-1-clone-自己的-project-下來)
    - [STEP 2. 利用 docker 建立此專案所需的環境](#step-2-利用-docker-建立此專案所需的環境)
    - [STEP 3. 執行以下兩行指令](#step-3-執行以下兩行指令)
  - [二、Nested Routes](#二nested-routes)
    - [Version Control ](#version-control-)
  - [Report, push and pull request ](#report-push-and-pull-request-)

---

## 一、Docker 在本地執行專案的步驟

### STEP 1. clone 自己的 project 下來

```bash
git clone https://github.com/{username}/{project_name} app
```

注意後面要有 `app` 才能創建一個資料夾。

### STEP 2. 利用 docker 建立此專案所需的環境

```bash
docker compose up --build -d
```

我們有寫好 Dockfile 了，這邊我們不會細講實作，有興趣可以自己看，或是參考 [SDC docker workshop 2024](https://www.notion.so/sdc-nycu/SDC-113-1-Resources-1037dadd80408032b091c76e96a7dc25?pvs=4#1147dadd804080e0be8ff515b050154a) 的教學。

### STEP 3. 執行以下兩行指令

```sh
docker exec -t -w "/code/app" node-app npm install
docker exec -t -w "/code/app" node-app npm run dev -- --host
```

> [!TIP]
> 要記得用 Docker 桌面版 start 和 stop containers， 盡量不要用 terminal 開關 containers
>
> ![](https://imgur.com/khUAvL1.jpg)

## 二、Nested Routes

回到 src/data.json 查看，可以發現除了目前 detail page （CarView）顯示的幾項之外，還有 manufacturer 和 dealer 兩項資訊。這邊我們透過 nested routes 顯示這兩項內容（平常不太會需要查看這兩項資訊，因此不直接顯示）。

首先在 `views/` 資料夾下新增兩個檔案

```bash
touch src/views/ManufacturerView.vue
touch src/views/DealerView.vue
```

接著透過 Car ID 找到 Car 的資訊，並設定這兩個 View。首先，修改 `src/views/ManufacturerView.vue` 成以下程式：

```jsx
<script setup>
    import { ref, onBeforeMount } from 'vue';
    import { useRoute } from 'vue-router';
    import cars from '../data.json';

    const manufacturer = ref('');
    const route = useRoute();

    onBeforeMount(() => {
        const carId = route.params.id;
        const car = cars.find(c => c.id === parseInt(carId));
        if (car) {
            manufacturer.value = car.manufacturer;
        }
    })
</script>

<template>
    <div>
        <h1>{{ manufacturer }}</h1>
    </div>
</template>
```

接著，再把`src/views/DealerView.vue` 修改成以下程式：

```jsx
<script setup>
    import { ref, onBeforeMount } from 'vue';
    import { useRoute } from 'vue-router';
    import cars from '../data.json';

    const dealer = ref('');
    const route = useRoute();

    onBeforeMount(() => {
        const carId = route.params.id;
        const car = cars.find(c => c.id === parseInt(carId));
        if (car) {
            dealer.value = car.dealer;
        }
    })
</script>

<template>
    <div>
        <h1>{{ dealer }}</h1>
    </div>
</template>
```

再到`src/views/CarView.vue` 的 CarView.vue 加入 RouterView，加入頁面的切換

```jsx
<script setup>
	import {useRoute, useRouter} from 'vue-router'
	import {ref, onBeforeMount} from "vue"
	import cars from "../data.json"

	const router = useRouter()
	const car = ref(null)
	const route = useRoute()
	const {id} = route.params;
	onBeforeMount(() => {
		car.value = cars.find(c => c.id === parseInt(id))
	})
</script>

<template>
	<div class='container'>
		<div v-if="car">
			<h1>The Car</h1>
			<p>Make: {{car.make}}</p>
			<p>Body: {{car.body}}</p>
			<p>Price: {{car.price}}</p>
			<p>Year: {{car.year}}</p>
			<button @click="router.back()">Go Back</button>
			<RouterView />
		</div>
		<div v-else>
			<h1>Car Not Found</h1>
		</div>
	</div>
</template>
```

最後回到 Router 的 `index.js` 設定 children routers

```jsx
import { createRouter, createWebHistory } from "vue-router";
import HomeView from "../views/HomeView.vue";
import AboutView from "../views/AboutView.vue";
import CarView from "../views/CarView.vue";
import NotFoundView from "../views/NotFoundView.vue";
import ManufacturerView from "../views/ManufacturerView.vue";
import DealerView from "../views/DealerView.vue";

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: "/",
      name: "home",
      component: HomeView,
    },
    {
      path: "/about",
      name: "about",
      component: AboutView,
    },
    {
      path: "/car/:id",
      name: "car",
      component: CarView,
      children: [
        {
          path: "manufacturer",
          component: ManufacturerView,
        },
        {
          path: "dealer",
          component: DealerView,
        },
      ],
    },
    {
      path: "/:pathMatch(.*)*",
      name: "notFound",
      component: NotFoundView,
    },
  ],
});

export default router;
```

接著回到網頁點擊任一張車輛卡片，並在網址後加上 `/manufacturer` 或 `/dealer`

這樣就可以看到指定的 manufacturer 或 dealer value！

完成的範例

![](https://imgur.com/z7VqeUa.jpg)

這邊就是 Nested Route 的簡單介紹

> **QUESTION:**
>
> - Nested routes 是什麼？ <ManufacturerView /> 和 <DealerView /> 這兩個 View 可以做什麼來達到透過 nested routes 顯示這兩項內容（平常不太會需要查看這兩項資訊，因此不直接顯示）的效果？請就你所知的角度用自己的話寫一次。
> -

### Version Control <a name="version-control"></a>

請使用 git 將此次變更進行 commit。

> [!TIP]
>
> - terminal 的當前位置
> - 查看未追蹤、已追蹤的變動
> - 把所有變更加入追蹤
> - commit

## Report, push and pull request <a name="pr"></a>

接著請依照前面幾次任務所學，完成 Report，並將內容推到 GtiHub 中。
最後發送 Pull Request 來完成本次任務。
