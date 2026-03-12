using System;

Console.WriteLine("Choose Program");
Console.WriteLine("1. Calculator");
Console.WriteLine("2. Employee Bonus");
Console.WriteLine("3. Number Analysis");

Console.Write("Enter Choice: ");
int choice = Convert.ToInt32(Console.ReadLine());

switch (choice)
{
    case 1:

        Console.Write("Enter First Number: ");
        double num1 = Convert.ToDouble(Console.ReadLine());

        Console.Write("Enter Second Number: ");
        double num2 = Convert.ToDouble(Console.ReadLine());

        Console.Write("Enter Operator (+, -, *, /): ");
        char op = Convert.ToChar(Console.ReadLine());

        double result = 0;

        switch (op)
        {
            case '+':
                result = num1 + num2;
                Console.WriteLine("Result: " + result);
                break;

            case '-':
                result = num1 - num2;
                Console.WriteLine("Result: " + result);
                break;

            case '*':
                result = num1 * num2;
                Console.WriteLine("Result: " + result);
                break;

            case '/':
                if (num2 == 0)
                    Console.WriteLine("Division by zero not allowed");
                else
                {
                    result = num1 / num2;
                    Console.WriteLine("Result: " + result);
                }
                break;

            default:
                Console.WriteLine("Invalid operator");
                break;
        }

        break;

    case 2:

        Console.Write("Enter Name: ");
        string name = Console.ReadLine();

        Console.Write("Enter Salary: ");
        double salary = Convert.ToDouble(Console.ReadLine());

        Console.Write("Enter Experience: ");
        int exp = Convert.ToInt32(Console.ReadLine());

        double bonusPercent;

        if (exp < 2)
            bonusPercent = 0.05;
        else if (exp <= 5)
            bonusPercent = 0.10;
        else
            bonusPercent = 0.15;

        double bonus = salary * bonusPercent;
        double finalSalary = salary + bonus;

        Console.WriteLine("Employee: " + name);
        Console.WriteLine("Bonus: " + bonus);
        Console.WriteLine("Final Salary: " + finalSalary);

        break;

    case 3:

        Console.Write("Enter Number: ");
        int n = Convert.ToInt32(Console.ReadLine());

        int evenCount = 0;
        int oddCount = 0;
        int sum = 0;

        for (int i = 1; i <= n; i++)
        {
            sum += i;

            if (i % 2 == 0)
                evenCount++;
            else
                oddCount++;
        }

        Console.WriteLine("Even Count: " + evenCount);
        Console.WriteLine("Odd Count: " + oddCount);
        Console.WriteLine("Sum: " + sum);

        break;

    default:
        Console.WriteLine("Invalid choice");
        break;
}