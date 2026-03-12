
using System;

class ResultAnalyzer
{
    public void CalculateResult(int m1, int m2, int m3, out int total, out double average)
    {
        total = m1 + m2 + m3;
        average = total / 3.0;
    }
}

class Program
{
    static void Main()
    {
        ResultAnalyzer r = new ResultAnalyzer();

        Console.Write("Enter marks 1: ");
        int m1 = Convert.ToInt32(Console.ReadLine());

        Console.Write("Enter marks 2: ");
        int m2 = Convert.ToInt32(Console.ReadLine());

        Console.Write("Enter marks 3: ");
        int m3 = Convert.ToInt32(Console.ReadLine());

        int total;
        double average;

        r.CalculateResult(m1, m2, m3, out total, out average);

        Console.WriteLine("Total Marks = " + total);
        Console.WriteLine("Average Marks = " + average);

        if (average >= 40)
            Console.WriteLine("Result: Pass");
        else
            Console.WriteLine("Result: Fail");

        Console.ReadKey();
    }
}
