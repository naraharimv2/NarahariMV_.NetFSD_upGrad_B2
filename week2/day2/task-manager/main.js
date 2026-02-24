import {
    addTaskCallback,
    deleteTaskCallback,
    listTasksCallback,
    addTaskPromise,
    deleteTaskPromise,
    listTasksPromise
} from "./taskStorage.js";


// ==========================================
// 1️⃣ CALLBACK DEMO
// ==========================================

const runCallbackVersion = () => {

    console.log("\n===== CALLBACK VERSION =====");

    addTaskCallback("Learn JS", (msg1) => {
        console.log(msg1);

        addTaskCallback("Practice Async", (msg2) => {
            console.log(msg2);

            listTasksCallback((tasks) => {
                console.log(`Tasks: ${tasks.join(", ")}`);
            });
        });
    });
};


// ==========================================
// 2️⃣ PROMISE VERSION
// ==========================================

const runPromiseVersion = () => {

    console.log("\n===== PROMISE VERSION =====");

    addTaskPromise("Build Project")
        .then(msg => {
            console.log(msg);
            return listTasksPromise();
        })
        .then(tasks => {
            console.log(`Tasks: ${tasks.join(", ")}`);
        })
        .catch(err => console.error(err));
};


// ==========================================
// 3️⃣ ASYNC/AWAIT VERSION
// ==========================================

const runAsyncAwaitVersion = async () => {

    console.log("\n===== ASYNC/AWAIT VERSION =====");

    try {
        const msg = await addTaskPromise("Master Async");
        console.log(msg);

        const tasks = await listTasksPromise();
        console.log(`Tasks: ${tasks.join(", ")}`);

    } catch (error) {
        console.error(`Error: ${error.message}`);
    }
};


// Run all versions
runCallbackVersion();

setTimeout(() => {
    runPromiseVersion();
}, 4000);

setTimeout(() => {
    runAsyncAwaitVersion();
}, 8000);