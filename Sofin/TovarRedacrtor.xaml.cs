using System;
using System.Linq;
using System.Windows;

namespace Sofin
{
    public partial class TovarRedacrtor : Window
    {
        private readonly BazaDan _db = new BazaDan();
        private readonly Tovar _item;

        public TovarRedacrtor(Tovar product)
        {
            InitializeComponent();

            _item = product;

            InitData();
        }

        private void InitData()
        {
            LoadComboData();
            SetFormData();
        }

        private void LoadComboData()
        {
            cbCategory.ItemsSource = _db.TovarCategory.ToList();
            cbCategory.DisplayMemberPath = "TovarCategoryName";
            cbCategory.SelectedValuePath = "IDTovarCategory";

            cbManufacturer.ItemsSource = _db.Proizvoditeli.ToList();
            cbManufacturer.DisplayMemberPath = "NameProizvoditelia";
            cbManufacturer.SelectedValuePath = "IDProizvoditelia";

            cbSupplier.ItemsSource = _db.Postavshik.ToList();
            cbSupplier.DisplayMemberPath = "PostavshikName";
            cbSupplier.SelectedValuePath = "IDPostavshik";

            cbUnit.ItemsSource = _db.EdIzmer.ToList();
            cbUnit.DisplayMemberPath = "Edzm";
            cbUnit.SelectedValuePath = "IDEdIzm";
        }

        private void SetFormData()
        {
            tbId.Text = _item.IDTovar.ToString();
            tbName.Text = _item.TovarName;
            tbArticle.Text = _item.Article;
            tbDescription.Text = _item.Description;

            tbCost.Text = _item.Cost.ToString();
            tbStock.Text = _item.KolvoNaSklade.ToString();
            tbDiscount.Text = _item.Discount.ToString();

            cbCategory.SelectedValue = _item.IDTovarCategory;
            cbManufacturer.SelectedValue = _item.IDProizvoditelia;
            cbSupplier.SelectedValue = _item.IDPostavshik;
            cbUnit.SelectedValue = _item.IDEdIzm;
        }

        private void Save_Click(object sender, RoutedEventArgs e)
        {
            if (!IsFormValid())
                return;

            try
            {
                ApplyChanges();
                _db.SaveChanges();

                DialogResult = true;
                Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(
                    ex.InnerException != null ? ex.InnerException.Message : ex.Message,
                    "Ошибка сохранения",
                    MessageBoxButton.OK,
                    MessageBoxImage.Error);
            }
        }

        private bool IsFormValid()
        {
            if (!decimal.TryParse(tbCost.Text, out var price) ||
                !int.TryParse(tbStock.Text, out var stock) ||
                !int.TryParse(tbDiscount.Text, out var discount))
            {
                MessageBox.Show("Ошибка: неверный формат чисел");
                return false;
            }

            if (price < 0 || stock < 0 || discount < 0)
            {
                MessageBox.Show("Ошибка: значения не могут быть отрицательными");
                return false;
            }

            if (cbCategory.SelectedValue == null ||
                cbManufacturer.SelectedValue == null ||
                cbSupplier.SelectedValue == null ||
                cbUnit.SelectedValue == null)
            {
                MessageBox.Show("Ошибка: не все списки заполнены");
                return false;
            }

            if (tbArticle.Text == null || tbArticle.Text.Trim().Length != 6)
            {
                MessageBox.Show("Ошибка: артикул должен быть 6 символов");
                return false;
            }

            return true;
        }

        private void ApplyChanges()
        {
            if (_item.IDTovar == 0)
            {
                _item.IDTovar = _db.Tovar.Any()
                    ? _db.Tovar.Max(x => x.IDTovar) + 1
                    : 1;

                _db.Tovar.Add(_item);
            }

            _item.TovarName = tbName.Text;
            _item.Description = tbDescription.Text;
            _item.Article = tbArticle.Text;

            _item.Cost = Convert.ToDecimal(tbCost.Text);
            _item.KolvoNaSklade = Convert.ToInt32(tbStock.Text);
            _item.Discount = Convert.ToInt32(tbDiscount.Text);

            _item.IDTovarCategory = (int)cbCategory.SelectedValue;
            _item.IDProizvoditelia = (int)cbManufacturer.SelectedValue;
            _item.IDPostavshik = (int)cbSupplier.SelectedValue;
            _item.IDEdIzm = (int)cbUnit.SelectedValue;
        }
    }
}