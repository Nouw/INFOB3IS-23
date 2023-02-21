using System;
using System.Collections.Generic;
using System.Linq;

namespace Chaining
{
    internal class Program
    {
        public static List<string> facts = new List<string>(){"true"};
        public static List<Implication> rules = new List<Implication>();
        public static List<string> entails = new List<string>();
        
        public static void Main(string[] args)
        {
            string input = Console.ReadLine();
            int index = 0;
            
            foreach (char c in input)
            {
                if (Char.IsWhiteSpace(c))
                {
                    continue;
                }

                if (Char.ToLower(c) == 'f' || Char.ToLower(c) == 'b')
                {
                    index = input.IndexOf(c);
                    break;
                }
            }

            input = input.Substring(0, index + 1);
            string[] query = input.Split(' ');
            
            int clauses = Int32.Parse(query[1]);
            int formulas = Int32.Parse(query[2]);
            string type = query[3].ToLower();

            Implication rule = new Implication();
            
            while (rules.Count < clauses)
            {
                string line = Console.ReadLine().Replace("\t", string.Empty);
                bool newRule = processLine(line, rule);

                if (newRule)
                {
                    rules.Add(rule);
                    rule = new Implication();
                }
            }
            
            while (entails.Count < formulas)
            {
                string line = Console.ReadLine();
                line = line.Replace("%", string.Empty);
                entails.Add(line.Split('.')[0].Trim());
            }
            
            foreach (var alpha in entails)
            {
                Console.WriteLine($"{alpha}. {forwardChaining(alpha).ToString()}.");
            }
            
            return;
        }

        public static bool processLine(string line, Implication rule)
        {
            // Remove comments and spaces
            line = line.Split('%')[0].Trim();
            
            // Add the head to the rule
            if (line.Contains(":-"))
            {
                string head = line.Split(':')[0].Trim();
                rule.Head = head;
            } else if (line.Contains('.') && rule.Head == null)
            {
                // This is a fact
                rule.Head = line.Split('.')[0];
                rule.Tail.Add("true");
                return true;
            }

            string[] args;
            
            if (line.Contains("-"))
            {
                args = line.Split('-')[1].Split(',');
            }
            else
            {
                args = line.Split(',');
            }


            foreach (var arg in args)
            {
                if (arg == String.Empty)
                {
                    break;
                }
                
                // Add arg to tail
                string tail = arg.Trim().Replace(",", String.Empty).Replace(".", string.Empty);
                rule.Tail.Add(tail);
                
                if (arg.Contains("."))
                {
                    // Create new rule
                    return true;
                }
            }
            

            return false;
        }

        public static bool forwardChaining(string alpha)
        {
            Queue<string> queue = new Queue<string>(facts);

            while (queue.Count > 0)
            {
                // Get a fact from the queue
                string fact = queue.Dequeue();

                if (fact == alpha)
                {
                    return true;
                }
                
                // Loop through all the rules and add the conclusion to the queue
                foreach (var rule in rules)
                {
                    if (rule.Tail.Contains(fact))
                    {
                        if (rule.isTrue())
                        {
                            if (!facts.Contains(rule.Head))
                            {
                                facts.Add(rule.Head);
                                queue.Enqueue(rule.Head);
                            }
                        }
                    }
                }
            }

            return false;
        }
    }

    class Implication
    {
        private string head;
        private List<string> tail = new List<string>();

        public bool isTrue()
        {
            foreach (var a in tail)
            {
                if (!Program.facts.Contains(a))
                {
                    return false;
                }
            }

            return true;
        }

        public string Head
        {
            get => head;
            set => head = value;
        }

        public List<string> Tail
        {
            get => tail;
            set => tail = value;
        }
    }
}