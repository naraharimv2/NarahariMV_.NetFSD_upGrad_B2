// ==========================================
// Task Storage Module
// ==========================================

let tasks = []; // In-memory storage

// --------------------------------------------------
// 1️⃣ CALLBACK VERSION (setTimeout simulation)
// --------------------------------------------------

export const addTaskCallback = (task, callback) => {
    setTimeout(() => {
        tasks.push(task);
        callback(`Task "${task}" added successfully (Callback).`);
    }, 1000);
};

export const deleteTaskCallback = (task, callback) => {
    setTimeout(() => {
        tasks = tasks.filter(t => t !== task);
        callback(`Task "${task}" deleted successfully (Callback).`);
    }, 1000);
};

export const listTasksCallback = (callback) => {
    setTimeout(() => {
        callback(tasks);
    }, 1000);
};


// --------------------------------------------------
// 2️⃣ PROMISE VERSION
// --------------------------------------------------

export const addTaskPromise = (task) => {
    return new Promise((resolve) => {
        setTimeout(() => {
            tasks.push(task);
            resolve(`Task "${task}" added successfully (Promise).`);
        }, 1000);
    });
};

export const deleteTaskPromise = (task) => {
    return new Promise((resolve) => {
        setTimeout(() => {
            tasks = tasks.filter(t => t !== task);
            resolve(`Task "${task}" deleted successfully (Promise).`);
        }, 1000);
    });
};

export const listTasksPromise = () => {
    return new Promise((resolve) => {
        setTimeout(() => {
            resolve(tasks);
        }, 1000);
    });
};


// --------------------------------------------------
// 3️⃣ ASYNC/AWAIT READY FUNCTIONS
// (Same promise functions reused)
// --------------------------------------------------