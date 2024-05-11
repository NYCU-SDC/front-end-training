# FETP-22 Report

## INFORMATION
**GitHub ID**: `Akhilesh1004`

## FETP-21

> **QUESTION:** 請簡單說明非對稱加密的概念。並說明 Public Key 與 Private Key 的用法。

**ANSWER:** Asymmetric encryption uses a pair of keys: a public key and a private key. The public key is used for encryption and the private key is used for decryption. The public key can be shared with anyone, while the private key remains private. Use the other party's public key when encrypting, and use your own private key when decrypting.

---

> **QUESTION:** 在這邊我們使用了加密演算法 ED25519。除了 ED25519 以外，還有一個很有名的加密演算法，叫什麼名字？

**ANSWER:** RSA(Rivest-Shamir-Adleman)

---

> (optional) **QUESTION:** 這個有名的加密演算法有什麼問題，用了什麼方式降低了這個問題的風險？

**ANSWER:** The problem with the RSA encryption algorithm is the factorization of large numbers, which may be broken by future computing power. To reduce risk, increase the RSA key length or switch to other more secure algorithms such as ED25519 or ECC.

---

## FETP-23

> **QUESTION:** 為何我們安裝了 Nginx 後，在瀏覽器輸入網址或 IP 就可以連到網站？而在先前的任務中都要加入 Port 號？

**ANSWER:** Nginx uses HTTP port 80 by default, so when you enter a URL in the browser, it automatically connects to this port and does not need to be specified.

---

> **QUESTION:** 如果我們同時在專案中使用 `npm run dev -- --host`，加 Port 與不加 Port 會有什麼差別？可以的話也請將兩者的截圖都放上來。

**ANSWER:** Without port, it will be handled by nginx

---

> **QUESTION:** 為何要執行 `npm run install`？ 不執行會怎樣？

**ANSWER:** If you don't run npm install, you won't be able to use these dependencies in your project, which means your code may lack necessary functionality, or errors may occur during execution. Simply put, if you don't execute npm install, your project will not work properly.

---

> **QUESTION:** 不同前幾次任務，這邊使用 `run build` 而非 `run dev`，請問差別在哪？

**ANSWER:** npm run build is used to build the project and generate the final code for production, while npm run dev starts the development server for development and testing.

---

> **QUESTION:** 在 Nginx 中 `root` 這個設定項代表著什麼？

**ANSWER:** In Nginx, the root setting item represents the root directory location of website files. When root is set, Nginx will set the root directory of all HTTP requests to this location.

---

> **QUESTION:** 為什麼我們要設定 `/var/www/routingapp/dist` 為 `root` ，而非 `/var/www/routingapp/` 或其他目錄？

**ANSWER:** Because the final compiled code will be placed in the dist directory. Therefore, setting dist to root can directly serve these compiled static files without having Nginx serve the entire project directory.

---

> **QUESTION:** 請「簡單」說明 Production Environment 與 Developing Environment。

**ANSWER:** Production Environment is the official operating environment, while Developing Environment is the environment used for development and testing. In the Production Environment, applications need to run stably and securely, while in the Developing Environment, developers can develop and test code and are generally more flexible.

---

> (optional) **QUESTION:** 除了 Production 與 Developing 以外，還有什麼 Environment？ 您也可以針對這幾種 Env 進行介紹。

**ANSWER:** Staging Environment, Testing Environment

---

> **QUESTION:** 可以注意到在 Server 上有兩個地方都有 `routingapp` 的專案： `~/ansible/routingapp` 與 `/var/www/routingapp`。
>
> 請問您認為以上兩個目錄，誰更適合作為 Production，誰適合作為 Developing？

**ANSWER:** ~/ansible/routingapp for Developing Environment and /var/www/routingapp for Production Environment

---

> **QUESTION:** 前面請各位同時使用 `npm run dev -- --host` 並截圖差異。請根據此提示，說明前一個問題的為何會這樣判斷。

**ANSWER:** ![npm run dev -- --host](https://github.com/Akhilesh1004/Forex_trading_strategy/blob/3da9b43a4ab596bb6ada036af705993b2d593894/01.png) ![nginx](https://github.com/Akhilesh1004/Forex_trading_strategy/blob/3da9b43a4ab596bb6ada036af705993b2d593894/02.png) i don't know, it almost look the same to me. 

---

## OTHERS

> 這裡可以寫下任何你想紀錄或你想展示的內容！

Answer here.
