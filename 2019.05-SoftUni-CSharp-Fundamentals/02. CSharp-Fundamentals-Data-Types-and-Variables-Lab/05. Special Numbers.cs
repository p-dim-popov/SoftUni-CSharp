using System;
class Program
{
    static void Main()
    {
        short n = short.Parse(Console.ReadLine());

        for (int i = 1; i <= n; i++)
        {
            int sum = 0;
            for (int j = i; j != 0; j /= 10)
            {
                sum += j % 10;
            }
            if (sum == 5 || sum == 7 || sum == 11)
                Console.WriteLine($"{i} -> True");
            else
                Console.WriteLine($"{i} -> False");
        }
    }
}