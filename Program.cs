using System;
using System.Linq;

namespace MaPremiereApplication
{
    class Program
    {    
        static void AfficherNumeros(int[] numeros)
        {
            Console.Write("Voici le tirage de ce soir : ");
            foreach (int i in numeros)
            {
                Console.Write(i + " "); 
            }
            Console.WriteLine("\nAvez-vous gagné ?");
        }

        static void Main(string[] args)
        {
            int[] numeros = new int[7]; //Création du tableau
            int numerosTires = 0;   //Compteur sur le nombre de numéros tirés

            Random random = new Random();   //Générateur de nombres aléatoires
            while (numerosTires < 7)    //Boucle sur le compteur
            {
                int n = random.Next(1, 50); //Génère un nombre aléatoire entre 1 et 49
                if(!numeros.Contains<int>(n))   //Teste si le numéro a déjà été tiré
                {
                    numeros[numerosTires++] = n;    //Ajout du numéro au tableau et incrémentation du compteur
                }
            }

            AfficherNumeros(numeros);   //Affiche le tableau
        }
    }
}
