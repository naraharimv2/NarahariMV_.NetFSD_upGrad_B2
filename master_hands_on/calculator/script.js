// ======================================
// Calculator Logic (ES6 + DOM + Async)
// ======================================

// DOM Elements
const display = document.getElementById("display");
const buttons = document.querySelectorAll("button");
const clearBtn = document.getElementById("clear");
const equalsBtn = document.getElementById("equals");

let expression = "";

// Add event listeners using arrow functions
buttons.forEach(button => {
    button.addEventListener("click", () => {

        const value = button.textContent;

        if (value !== "=" && value !== "C") {
            expression += value;
            display.value = expression;
        }
    });
});

// Clear functionality
clearBtn.addEventListener("click", () => {
    expression = "";
    display.value = "";
});

// ================================
// Promise version (like earlier)
// ================================

const calculateWithPromise = (exp) => {
    return new Promise((resolve, reject) => {
        setTimeout(() => {
            try {
                const result = eval(exp);
                resolve(result);
            } catch (error) {
                reject("Invalid Expression");
            }
        }, 300);
    });
};

// ================================
// Async/Await version
// ================================

const calculateResult = async () => {
    try {
        const result = await calculateWithPromise(expression);

        display.value = `${result}`; // template literal
        expression = result.toString();

    } catch (error) {
        display.value = error;
        expression = "";
    }
};

equalsBtn.addEventListener("click", calculateResult);