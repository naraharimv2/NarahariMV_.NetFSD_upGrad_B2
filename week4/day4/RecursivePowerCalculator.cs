
using System;

class PowerCalculator
{
    public int CalculatePower(int baseNum, int exponent)
    {
        if (exponent == 0)
            return 1;

        return baseNum * CalculatePower(baseNum, exponent - 1);
    }
}

class Program
{
    static void Main()
    {
        PowerCalculator pc = new PowerCalculator();

        Console.Write("Enter base: ");
        int b = Convert.ToInt32(Console.ReadLine());

        Console.Write("Enter exponent: ");
        int e = Convert.ToInt32(Console.ReadLine());

        int result = pc.CalculatePower(b, e);

        Console.WriteLine("Result = " + result);

        Console.ReadKey();
    }
}
