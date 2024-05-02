// 發送 AJAX 請求
fetch("/ajaxFindEvenDataByID/" + evenID)
    .then(function (response) {
        // 將 JSON 數據轉換為 JavaScript 物件
        return response.json();
    })
    .then(function (data) {
        // 從返回的數據中獲取 "startTime" 欄位的值
        const startTime = "data.startTime";

        // 將 data.startTime 轉換為 JavaScript 的 Date 物件
        const targetTime = new Date(startTime);

        // 更新倒數計時器
        function updateCountdown() {
            const currentTime = new Date();
            const diff = targetTime - currentTime;

            const d = Math.floor(diff / 1000 / 60 / 60 / 24);
            const h = Math.floor(diff / 1000 / 60 / 60) % 24;
            const m = Math.floor(diff / 1000 / 60) % 60;
            const s = Math.floor(diff / 1000) % 60;

            // 更新 HTML 中指定的元素
            days.innerHTML = d;
            hours.innerHTML = h < 10 ? '0' + h : h;
            minutes.innerHTML = m < 10 ? '0' + m : m;
            seconds.innerHTML = s < 10 ? '0' + s : s;
        }

        // 初始更新一次倒數計時器
        updateCountdown();

        // 每秒更新一次倒數計時器
        setInterval(updateCountdown, 1000);
    })
    .catch(function (error) {
        // 處理錯誤
        console.error('Error:', error);
    });



//年度倒數計時器
// const days = document.getElementById('days');
// const hours = document.getElementById('hours');
// const minutes = document.getElementById('minutes');
// const seconds = document.getElementById('seconds');

// const currentYear = new Date().getFullYear();

// const newYearTime = new Date(`January 01 ${currentYear + 1} 00:00:00`);

// // Update countdown time
// function updateCountdown() {
//     const currentTime = new Date();
//     const diff = newYearTime - currentTime;

//     const d = Math.floor(diff / 1000 / 60 / 60 / 24);
//     const h = Math.floor(diff / 1000 / 60 / 60) % 24;
//     const m = Math.floor(diff / 1000 / 60) % 60;
//     const s = Math.floor(diff / 1000) % 60;

//     days.innerHTML = d;
//     hours.innerHTML = h < 10 ? '0' + h : h;
//     minutes.innerHTML = m < 10 ? '0' + m : m;
//     seconds.innerHTML = s < 10 ? '0' + s : s;
// }

// setInterval(updateCountdown, 1000);
