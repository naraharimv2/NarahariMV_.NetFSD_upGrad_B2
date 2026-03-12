
using System;

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

Console.ReadKey();
