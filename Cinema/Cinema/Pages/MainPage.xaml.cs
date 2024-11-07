using Cinema.Database;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Cinema.Pages
{
    /// <summary>
    /// Логика взаимодействия для MainPage.xaml
    /// </summary>
    public partial class MainPage : Page
    {
        Film newfilm;
        public MainPage()
        {

            InitializeComponent();
            CBAccess.ItemsSource = App.Database.Film.ToList();
            CBGenre.ItemsSource = App.Database.Genre.ToList();
            DGFilm.ItemsSource = App.Database.Film.ToList();

            newfilm = new Film();
            DataContext = newfilm;

        }

        

        private void BSave_Click(object sender, RoutedEventArgs e)
        {
            var flm = new Database.Film();
            flm.FilmName = TBName.Text;
            flm.Description = TBDescription.Text;
            flm.Genre = CBGenre.SelectedItem as Genre;
            flm.CardAccess = CBAccess.Text;
            flm.ShowDate = DPDate.SelectedDate;
            var errorMessage = "";
            if (!Regex.IsMatch(newfilm.FilmName, @"^[A-z А-я]+$"))
                errorMessage += "Имя фильма не должно быть пустым \n";
            if (flm.Genre == null)
                errorMessage += "Жанр фильма не должен быть пустым \n";
            if (string.IsNullOrWhiteSpace(newfilm.Description))
                errorMessage += "Описание не должно быть пустым \n";
            if (newfilm.CardAccess == null)
                errorMessage += "Доступ пушкинской карты не должен быть пустым \n";
            if (newfilm.ShowDate == null)
                errorMessage += "Дата показа не должна быть пустая";
            if (!string.IsNullOrEmpty(errorMessage))
            {
                MessageBox.Show(errorMessage);
                return;
            }
            else
            {
                App.Database.Film.Add(flm);
                App.Database.SaveChanges();
                DGFilm.ItemsSource = App.Database.Film.ToList();
                MessageBox.Show("Фильм добавлен", "Успешно");
                Refresh();
            }




                



        }
        private void Refresh()
        {
            var Filtr = App.Database.Film.ToList();
            DGFilm.ItemsSource = Filtr.ToList();
        }

            private void BClean_Click(object sender, RoutedEventArgs e)
        {
            
                TBName.Text = "";
            TBDescription.Text = "";
                CBGenre.SelectedItem = null;
            CBAccess.Text = "";
            DPDate.SelectedDate = null;                 
        }

        private void BDelete_Click(object sender, RoutedEventArgs e)
        {
            var film = (Film)DGFilm.SelectedItem;
            App.Database.Film.Remove(film);
            App.Database.SaveChanges();
            DGFilm.ItemsSource = App.Database.Film.ToList();
        }
    }
}
                                