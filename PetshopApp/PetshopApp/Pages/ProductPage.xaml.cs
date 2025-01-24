using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
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

namespace PetshopApp.Pages
{
    /// <summary>
    /// Логика взаимодействия для ProductPage.xaml
    /// </summary>
    public partial class ProductPage : Page
    {
        public ProductPage()
        {
            InitializeComponent();
            Init();
        }
        public void Init()
        {
            ProductListView.ItemsSource = Data.databaseEntities.GetContext().Product.ToList();

            var manufactorerList = Data.databaseEntities.GetContext().Manufactorer.ToList();
            manufactorerList.Insert(0, new Data.Manufactorer { Name = "Все производители" });
            ManufactorerComboBox.ItemsSource = manufactorerList;
            ManufactorerComboBox.SelectedIndex = 0;

            if (Classes.Manager.CurrentUser != null)
            {
                FIOLabel.Content = Visibility.Visible;
                FIOLabel.Content = $"{Classes.Manager.CurrentUser.LastName} " + $"{Classes.Manager.CurrentUser.FirstName}" + $"{ Classes.Manager.CurrentUser.MiddleName}";
                if (true)
                {

                }
            }
            else
            {
                FIOLabel.Content = Visibility.Hidden;
            }
            CountAllLabel.Content = $"{Data.databaseEntities.GetContext().Product.Count()}/" + $"{Data.databaseEntities.GetContext().Product.Count()}";
        }

        private void SearchTextBox_TextChanged(object sender, TextChangedEventArgs e)
        {

        }

        private void SortUpButton_Checked(object sender, RoutedEventArgs e)
        {

        }

        private void ManufactorerComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }

        private void SortDown_Checked(object sender, RoutedEventArgs e)
        {

        }
    }
}
