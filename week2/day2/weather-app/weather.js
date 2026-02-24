// ===================================
// Weather Data Fetcher (Level-2)
// ===================================

// Example: Bangalore Coordinates
const latitude = 12.97;
const longitude = 77.59;

const weatherURL = `https://api.open-meteo.com/v1/forecast?latitude=${latitude}&longitude=${longitude}&current_weather=true`;

// --------------------------------------------------
// 1️⃣ VERSION USING PROMISES (.then)
// --------------------------------------------------

const fetchWeatherWithPromises = () => {

    fetch(weatherURL)
        .then(response => {
            if (!response.ok) {
                throw new Error("Failed to fetch weather data");
            }
            return response.json();
        })
        .then(data => {
            displayWeather(data.current_weather, "PROMISE VERSION");
        })
        .catch(error => {
            console.error(`❌ Error (Promise): ${error.message}`);
        });
};


// --------------------------------------------------
// 2️⃣ VERSION USING ASYNC / AWAIT
// --------------------------------------------------

const fetchWeatherAsync = async () => {

    try {
        const response = await fetch(weatherURL);

        if (!response.ok) {
            throw new Error("Failed to fetch weather data");
        }

        const data = await response.json();

        displayWeather(data.current_weather, "ASYNC/AWAIT VERSION");

    } catch (error) {
        console.error(`❌ Error (Async/Await): ${error.message}`);
    }
};


// --------------------------------------------------
// Weather Report Formatter
// --------------------------------------------------

const displayWeather = (weather, version) => {

    console.log(`
========== WEATHER REPORT ==========
Version      : ${version}
Temperature  : ${weather.temperature} °C
Wind Speed   : ${weather.windspeed} km/h
Wind Dir     : ${weather.winddirection}°
Time         : ${weather.time}
====================================
    `);
};


// --------------------------------------------------
// Run Both Versions
// --------------------------------------------------

fetchWeatherWithPromises();
fetchWeatherAsync();