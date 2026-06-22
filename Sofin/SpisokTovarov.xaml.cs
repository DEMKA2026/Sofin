using System;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Media;

namespace Sofin
{
    public partial class SpisokTovarov : Window
    {
        private readonly BazaDan _db = new BazaDan();
        private readonly ObservableCollection<ProductView> _items = new ObservableCollection<ProductView>();
        private readonly ICollectionView _view;

        private readonly User _user;

        private string _searchText = "";

        private bool _isAdmin;
        private bool _isManager;
        private bool _isGuest;

        private TovarRedacrtor _editor;

        public SpisokTovarov(User user)
        {
            InitializeComponent();

            _user = user;

            DetectRole();
            ShowUserInfo();
            SetPermissions();

            _view = CollectionViewSource.GetDefaultView(_items);
            _view.Filter = Filter;

            dgProducts.ItemsSource = _view;

            LoadData();
        }

        private void DetectRole()
        {
            _isGuest = _user == null;

            if (_user?.Role != null)
            {
                string role = _user.Role.RoleName;

                _isAdmin = role == "Администратор";
                _isManager = role == "Менеджер";
            }
        }

        private void ShowUserInfo()
        {
            if (_user == null)
            {
                tbUser.Text = "Гость";
                tbRole.Text = "Не авторизован";
                return;
            }

            tbUser.Text = $"{_user.Familia} {_user.Imya} {_user.Otchestvo}";
            tbRole.Text = _user.Role.RoleName;
        }

        private void SetPermissions()
        {
            btnAdd.Visibility = _isAdmin ? Visibility.Visible : Visibility.Collapsed;
            btnDelete.Visibility = _isAdmin ? Visibility.Visible : Visibility.Collapsed;

            btnOrder.Visibility = (_isAdmin || _isManager)
                ? Visibility.Visible
                : Visibility.Collapsed;

            tbSearch.Visibility = (_isAdmin || _isManager)
                ? Visibility.Visible
                : Visibility.Collapsed;
        }

        private void LoadData()
        {
            _items.Clear();

            foreach (var p in _db.Tovar.ToList())
            {
                int discount = p.Discount ?? 0;
                int stock = p.KolvoNaSklade ?? 0;
                decimal price = p.Cost;

                decimal total = price - (price * discount / 100);

                Brush rowColor = Brushes.Transparent;

                if (stock <= 0)
                    rowColor = Brushes.LightGray;
                else if (discount > 15)
                    rowColor = (Brush)new BrushConverter().ConvertFrom("#008080");

                _items.Add(new ProductView
                {
                    Id = p.IDTovar,
                    TovarName = p.TovarName,
                    Description = p.Description,
                    CategoryName = p.TovarCategory?.TovarCategoryName ?? "",
                    Manufacturer = p.Proizvoditeli?.NameProizvoditelia ?? "",
                    Supplier = p.Postavshik?.PostavshikName ?? "",
                    Cost = price,
                    FinalPrice = total,
                    Discount = discount,
                    Unit = p.EdIzmer?.Edzm ?? "",
                    Stock = stock,
                    RowBrush = rowColor
                });
            }

            _view.Refresh();
        }

        private bool Filter(object obj)
        {
            var item = obj as ProductView;
            if (item == null) return false;

            if (string.IsNullOrWhiteSpace(_searchText))
                return true;

            string s = _searchText;

            return (item.TovarName?.ToLower().Contains(s) ?? false) ||
                   (item.Description?.ToLower().Contains(s) ?? false) ||
                   (item.CategoryName?.ToLower().Contains(s) ?? false) ||
                   (item.Manufacturer?.ToLower().Contains(s) ?? false) ||
                   (item.Supplier?.ToLower().Contains(s) ?? false);
        }

        private void tbSearch_TextChanged(object sender, TextChangedEventArgs e)
        {
            _searchText = tbSearch.Text.Trim().ToLower();
            _view.Refresh();
        }

        private void dgProducts_MouseDoubleClick(object sender, System.Windows.Input.MouseButtonEventArgs e)
        {
            var selected = dgProducts.SelectedItem as ProductView;
            if (selected == null) return;

            if (!_isAdmin)
            {
                MessageBox.Show("Редактирование доступно только администратору");
                return;
            }

            var entity = _db.Tovar.FirstOrDefault(x => x.IDTovar == selected.Id);
            if (entity == null) return;

            _editor = new TovarRedacrtor(entity);

            if (_editor.ShowDialog() == true)
            {
                _db.SaveChanges();
                LoadData();
            }
        }

        private void Add_Click(object sender, RoutedEventArgs e)
        {
            var newItem = new Tovar();
            var window = new TovarRedacrtor(newItem);

            if (window.ShowDialog() == true)
            {
                _db.SaveChanges();
                LoadData();
            }
        }

        private void Delete_Click(object sender, RoutedEventArgs e)
        {
            var selected = dgProducts.SelectedItem as ProductView;
            if (selected == null) return;

            var entity = _db.Tovar.FirstOrDefault(x => x.IDTovar == selected.Id);
            if (entity == null) return;

            if (_db.Zakaz.Any(x => x.IDTovar == entity.IDTovar))
            {
                MessageBox.Show("Удаление невозможно: есть связанные заказы");
                return;
            }

            if (MessageBox.Show("Удалить товар?", "Подтверждение", MessageBoxButton.YesNo) != MessageBoxResult.Yes)
                return;

            _db.Tovar.Remove(entity);
            _db.SaveChanges();

            LoadData();
        }

        private void Order_Click(object sender, RoutedEventArgs e)
        {
            new SpisokZakazov().Show();
        }

        private void BtnExit_Click(object sender, RoutedEventArgs e)
        {
            new MainWindow().Show();
            Close();
        }

        public class ProductView
        {
            public int Id { get; set; }
            public string CategoryName { get; set; }
            public string TovarName { get; set; }
            public string Description { get; set; }
            public string Manufacturer { get; set; }
            public string Supplier { get; set; }
            public decimal Cost { get; set; }
            public decimal FinalPrice { get; set; }
            public int Discount { get; set; }
            public string Unit { get; set; }
            public int Stock { get; set; }
            public Brush RowBrush { get; set; }
        }
    }
}