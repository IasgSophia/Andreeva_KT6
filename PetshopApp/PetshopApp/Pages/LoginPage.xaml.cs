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
    /// Логика взаимодействия для LoginPage.xaml
    /// </summary>
    public partial class LoginPage : Page
    {
        public LoginPage()
        {
            InitializeComponent();
        }

        private void LoginButton_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder errors = new StringBuilder();
            if(string.IsNullOrEmpty(LoginTextBox.Text))
            {
                errors.AppendLine("заполните логин");
            }
            if (string.IsNullOrEmpty(PasswordBox.Password))
            {
                errors.AppendLine("заполните пароль");
            }
            if (errors.Length>0)
            {
                MessageBox.Show(errors.ToString(), "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }
            else
            {
                if (Data.databaseEntities.GetContext().User.Any(d => d.Login == LoginTextBox.Text && d.Password == PasswordBox.Password))
                {
                    var user = Data.databaseEntities.GetContext().User.Where(d => d.Login == LoginTextBox.Text && d.Password == PasswordBox.Password).FirstOrDefault();

                    MessageBox.Show("Успешно!", "Успешно!", MessageBoxButton.OK, MessageBoxImage.Information);
                    switch (user.Role.Name)
                    {
                        case "Администратор":
                            Classes.Manager.MainFrame.Navigate(new Pages.ProductPage());
                            break;
                        case "Клиент":
                            Classes.Manager.MainFrame.Navigate(new Pages.ProductPage());
                            break;
                        case "Менеджер":
                            Classes.Manager.MainFrame.Navigate(new Pages.ProductPage());
                            break;
                    }
                }
                else
                {
                    MessageBox.Show("неверный логин/пароль", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }

        private void GuestButton_Click(object sender, RoutedEventArgs e)
        {
            Classes.Manager.MainFrame.Navigate(new Pages.ProductPage());
        }
    }
}
