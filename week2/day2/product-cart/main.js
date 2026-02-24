import { products, calculateCartTotal } from "./cart.js";

const { subtotals, total } = calculateCartTotal(products);

const generateInvoice = () => {

    console.log(`\n=========== INVOICE ===========`);

    subtotals.forEach(item => {
        console.log(`
Product  : ${item.name}
Price    : ₹${item.price}
Quantity : ${item.quantity}
Subtotal : ₹${item.subtotal}
--------------------------------`);
    });

    console.log(`
Grand Total : ₹${total}
===============================\n`);
};

generateInvoice();