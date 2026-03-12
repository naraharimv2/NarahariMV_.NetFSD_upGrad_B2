
using System;

Console.Write("Enter Name: ");
string name = Console.ReadLine();

Console.Write("Enter Salary: ");
double salary = Convert.ToDouble(Console.ReadLine());

Console.Write("Enter Experience (years): ");
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

Console.ReadKey();
