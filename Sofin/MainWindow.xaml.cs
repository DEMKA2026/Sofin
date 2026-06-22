using System.Linq;
using System.Windows;

namespace Sofin
{
    public partial class MainWindow : Window
    {
        private readonly BazaDan _db = new BazaDan();

        public MainWindow()
        {
            InitializeComponent();
        }

        private void BtnLogin_Click(object sender, RoutedEventArgs e)
        {
            string login = tbLogin.Text.Trim();
            string password = pbPassword.Password;

            var user = _db.User.FirstOrDefault(u =>
                u.Login == login &&
                u.Password == password);

            if (user == null)
            {
                ShowError();
                return;
            }

            OpenProducts(user);
        }

        private void BtnGuest_Click(object sender, RoutedEventArgs e)
        {
            OpenProducts(null);
        }

        private void OpenProducts(User user)
        {
            new SpisokTovarov(user).Show();
            Close();
        }

        private void ShowError()
        {
            MessageBox.Show(
                "Логин или пароль указаны неверно",
                "Ошибка",
                MessageBoxButton.OK,
                MessageBoxImage.Warning);
        }
    }
}