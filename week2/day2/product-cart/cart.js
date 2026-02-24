export const products = [
    { name: "Laptop", price: 50000, quantity: 1 },
    { name: "Mouse", price: 500, quantity: 2 },
    { name: "Keyboard", price: 1500, quantity: 1 },
    { name: "Headphones", price: 2000, quantity: 2 }
];

export const calculateCartTotal = (cartItems) => {

    const subtotals = cartItems.map(item => ({
        ...item,
        subtotal: item.price * item.quantity
    }));

    const total = subtotals.reduce(
        (acc, item) => acc + item.subtotal,
        0
    );

    return { subtotals, total };
};