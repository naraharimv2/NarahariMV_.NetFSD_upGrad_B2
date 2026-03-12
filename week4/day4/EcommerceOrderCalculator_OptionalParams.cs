
using System;

class OrderCalculator
{
    public double CalculateFinalAmount(double price, int quantity, double discount = 0, double shipping = 50)
    {
        double subtotal = price * quantity;
        double discountAmount = subtotal * discount / 100;
        double finalAmount = subtotal - discountAmount + shipping;

        Console.WriteLine("Subtotal = " + subtotal);
        Console.WriteLine("Discount Applied = " + discountAmount);

        return finalAmount;
    }
}

class Program
{
    static void Main()
    {
        OrderCalculator oc = new OrderCalculator();

        Console.Write("Enter product price: ");
        double price = Convert.ToDouble(Console.ReadLine());

        Console.Write("Enter quantity: ");
        int qty = Convert.ToInt32(Console.ReadLine());

        double finalAmount = oc.CalculateFinalAmount(price, qty);

        Console.WriteLine("Final Payable Amount = " + finalAmount);

        Console.ReadKey();
    }
}
