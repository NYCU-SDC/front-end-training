# TASK FETP-25

這次任務我們要使用動態路由（Dynamic Routing）來顯示車輛的進階資訊，並自定義 Error Page。

## INFORMATION

- **任務回報**： Report and pull request
- **任務截止**： `2024/07/01` - `2024/07/07`
- **前置任務**：
  - [FETP-24](./fetp-24.md)

> [!WARNING]
> 請一定先完成前置任務，再開始執行此任務！

---

## TOC

- [TASK FETP-25](#task-fetp-25)
	- [INFORMATION](#information)
	- [TOC](#toc)
	- [一、個別細節顯示 — Dynamic Routing](#一個別細節顯示--dynamic-routing)
		- [STEP 1](#step-1)
		- [STEP 2](#step-2)
		- [Version Control](#version-control)
	- [二、Error Page](#二error-page)
		- [Filter 功能 — Params in URL](#filter-功能--params-in-url)
		- [Version Control](#version-control-1)
	- [Report, push and pull request](#report-push-and-pull-request)

---

## 一、個別細節顯示 — Dynamic Routing

### STEP 1

進入 Developing Environment

> [!TIP]
> 如果你的 Developing Project （Home 中的 `routingapp/`）不見了，可以參考以下提示：
> 1. clone 自己的 project 下來
> 2. 利用 npm 安裝此專案所需的套件
> 3. 利用 npm 提供 web service

> [!WARNING]
> 若有疑問請使用 issues 發問！

我們目前的 Home Page 只有顯示生產商和金額。
如果想顯示更多細節，又不想讓版面很亂的話，通常會選擇點擊卡片後顯示細節。
最直觀的作法，就是透過 car id 進行 dynamic routing

![Imgur](https://imgur.com/unG78X4.jpg)

首先在 `views` 資料夾下新增一個 `CarView.vue` ，建立點擊卡片後顯示的詳細資訊頁面，同時增加回上一頁的 button

```bash
touch src/views/CarView.vue
```

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
		</div>
		<div v-else>
			<h1>Car Not Found</h1>
		</div>
	</div>
</template>
```

> **QUESTION:** 
> - 實際用過 useRoute 之後，請簡單介紹 useRoute 的用法，以及他和 useRouter, RouterLink 的差別。

> **QUESTION:** (optional) 
> - onBeforeMount 的功能是什麼呢？

> **QUESTION:** (optional) 
> - 在 `<template>` 區塊中，可以看到 `car.make` ，這裡代表什麼意思？ 
> - Hint: OOP 觀念。

### STEP 2

接著在 HomeView 設定點擊卡片時的變化

```jsx
<script setup>
  import carsData from '../data.json'
  import {ref} from 'vue'
	import {useRouter} from "vue-router"

	const router = useRouter()
  const cars = ref(carsData)
</script>

<template>
  <main class='container'>
    <h1>Our Cars</h1>
    <div class='cards'>
      <div v-for='car in cars' :key='car.id' class='card' @click="router.push(`/car/${car.id}`)">
        <h1>{{ car.make }}</h1>
        <p>${{ car.price }}</p>
      </div>
    </div>
  </main>
</template>

<style scoped>
  .cards {
    display: flex;
    width: 1000px;
    flex-wrap: wrap;
    margin-top: 50px;
    justify-content: center;
  }
  .card {
    box-shadow: 1px 1px 10px rgba(0, 0, 0, 0.207);
    padding: 15px;
    width: 150px;
    margin-right: 15px;
    cursor: pointer;
    margin-bottom: 20px;
  }
</style>
```

最後到 index.js 新增我們需要的 router rule，動態連到 `CarView`

```jsx
import {createRouter, createWebHistory} from 'vue-router'
import HomeView from '../views/HomeView.vue'
import AboutView from '../views/AboutView.vue'
import CarView from '../views/CarView.vue'

const router = createRouter({
	history: createWebHistory(import.meta.env.BASE_URL),
	routes: [
		{
			path: '/',
			name: 'home',
			component: HomeView
		},
		{
			path: '/about',
			name: 'about',
			component: AboutView
		},
		{
			path: '/car/:id',
			name: 'car',
			component: CarView,
		}
	]
})

export default router
```

現在設定完之後，可以點進 Home Page 的卡片，看看能不能顯示詳細資訊。

> **QUESTION:**
> - 請執行 `npm run dev -- --host` ，點擊任一卡片並截圖頁面。

> [!TIP]
> - 圖片可以使用 imgur 存放，並複製 Markdown 連結。
> - 若有疑問請使用 issues 發問！

### Version Control

請使用 git 將此次變更進行 commit。

> [!TIP]
> - terminal 的當前位置
> - 查看未追蹤、已追蹤的變動
> - 把所有變更加入追蹤
> - commit

> [!TIP]
> - 可以在 VSCode 中利用 git 查看每次 Code 的變動（增加/修改/刪除 的行）。
> - 若有疑問請使用 issues 發問！

## 二、Error Page

目前 URL 錯誤時，顯示的頁面會是 404 的預設畫面，如果要客製化 error page，需要設定 `pathMatch` 的 router，以及希望的頁面設定。

首先在 `views/` 資料夾下建立一個 `NotFoundView.vue` 檔案

```bash
touch src/views/NotFoundView.vue
```

```jsx
<template>
	<div class="container">
		<h1>404 - Not Found</h1>
	</div>
</template>
```

接著再回到 index.js 設定 router rule

```jsx
import {createRouter, createWebHistory} from 'vue-router'
import HomeView from "../views/HomeView.vue"
import AboutView from "../views/AboutView.vue"
import CarView from "../views/CarView.vue"
import NotFoundView from "../views/NotFoundView.vue"

const router = createRouter({
	history: createWebHistory(import.meta.env.BASE_URL),
	routes: [
		{
			path: '/',
			name: 'home',
			component: HomeView
		},
		{
			path: '/about',
			name: 'about',
			component: AboutView
		},
		{
			path: '/car/:id',
			name: 'car',
			component: CarView
		},
		{
			path: '/:pathMatch(.*)*',
			name: 'notFound',
			component: NotFoundView
		}
	]
})

export default router
```

> **QUESTION:** (optional)
> - `import.meta.env.BASE_URL`  是什麼意思呢？

### Filter 功能 — Params in URL

如果想指定顯示某些 manufacturer 的車輛訊息，可以透過 filter 並傳 params 到 URL 中

```jsx
<script setup>
	import carsData from "../data.json"
	import {ref, watch, onMounted} from 'vue'
	import {useRouter, useRoute} from 'vue-router'

	const router = useRouter()
	const route = useRoute()
	const cars = ref(carsData)
	const make = ref("")

	onMounted(() => {
		make.value = route.query.make || ""
	})

	watch(make, () => {
		if(make.value){
			if(make.value === "All") car.value = carsData;
			else {
				cars.value = carsData.filter(c => c.make === make.value)
			}
		}
	})
	
	const handlerChange = () => {
		router.push({query: {make: make.value}})
	}
</script>

<template>
	<main class="container">
		<h1>Our Cars</h1>
		<select @change="handlerChange" v-model="make">
			<option value="All">All</option>
			<option value="Chevrolet">Chevy</option>
			<option value="Porsche">Porsche</option>
			<option value="Audi">Audi</option>
		</select>
		<div class="cards">
			<div class="card" v-for='car in cars' :key='car.id' @click='router.push(`/car/${car.id}`)'>
				<h1>{{ car.make }}</h1>
				<p>${{ car.price }}</p>
			</div>
		</div>
	</main>
</template>

<style scoped>
	.cards {
    display: flex;
    width: 1000px;
    flex-wrap: wrap;
    margin-top: 50px;
    justify-content: center;
  }
  .card {
    box-shadow: 1px 1px 10px rgba(0, 0, 0, 0.207);
    padding: 15px;
    width: 150px;
    margin-right: 15px;
    cursor: pointer;
    margin-bottom: 20px;
  }
</style>
```

> **QUESTION:**
> - onMounted 和 handlerChange 的功能是什麼呢？請簡單介紹

### Version Control

請使用 git 將此次變更進行 commit。

> [!TIP]
> - terminal 的當前位置
> - 查看未追蹤、已追蹤的變動
> - 把所有變更加入追蹤
> - commit

## Report, push and pull request

接著請依照前面幾次任務所學，完成 Report，並將內容推到 GtiHub 中。
最後發送 Pull Request 來完成本次任務。

> **QUESTION:**
> - 嘗試部署到 Production 中，並截圖網址+網站。