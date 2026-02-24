// ===============================
// Student Marks Analyzer Module
// ===============================

// Array of student marks
const marks = [78, 85, 62, 90, 55];

// Convert marks to numbers (using map)
const processedMarks = marks.map(mark => Number(mark));

// Calculate total using reduce()
const calculateTotal = (arr) => {
    return arr.reduce((total, mark) => total + mark, 0);
};

// Calculate average using arrow function
const calculateAverage = (total, count) => total / count;

// Determine pass/fail based on average
const getResult = (average) => {
    return average >= 40 ? "PASS ✅" : "FAIL ❌";
};

// Main execution function
const analyzeMarks = () => {
    const total = calculateTotal(processedMarks);
    const average = calculateAverage(total, processedMarks.length);
    const result = getResult(average);

    console.log(`
    ===== Student Marks Report =====
    Marks       : ${processedMarks.join(", ")}
    Total Marks : ${total}
    Average     : ${average.toFixed(2)}
    Result      : ${result}
    =================================
    `);
};

// Run the analyzer
analyzeMarks();