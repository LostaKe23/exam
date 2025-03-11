using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;
using AdminApp.Helpers; // Подключаем RelayCommand
using AdminApp.Models;
using System;

namespace AdminApp.ViewModels
{

    public class AdminViewModel : INotifyPropertyChanged
    {
        private readonly HttpClient _httpClient = new HttpClient();

        private ObservableCollection<Client> _clients;
        private Client _selectedClient;
        private string _statusMessage;

        public string StatusMessage
        {
            get => _statusMessage;
            set
            {
                _statusMessage = value;
                OnPropertyChanged(nameof(StatusMessage));
            }
        }

        public ObservableCollection<Client> Clients
        {
            get => _clients;
            set
            {
                _clients = value;
                OnPropertyChanged(nameof(Clients));
            }
        }

        public Client SelectedClient
        {
            get => _selectedClient;
            set
            {
                _selectedClient = value;
                OnPropertyChanged(nameof(SelectedClient));
            }
        }

        public AdminViewModel()
        {
            LoadClientsCommand = new RelayCommand(async _ => await LoadClients());
            ConfirmCommand = new RelayCommand(async _ => await Confirm(), _ => SelectedClient != null);
            RejectCommand = new RelayCommand(async _ => await Reject(), _ => SelectedClient != null);

            LoadClients(); // Загружаем клиентов при старте
        }

        // Команды
        public RelayCommand LoadClientsCommand { get; }
        public RelayCommand ConfirmCommand { get; }
        public RelayCommand RejectCommand { get; }

        // Загрузка списка клиентов
        private async Task LoadClients()
        {
            try
            {
                var response = await _httpClient.GetStringAsync("http://localhost:5000/api/clients");
                Clients = JsonConvert.DeserializeObject<ObservableCollection<Client>>(response);
            }
            catch (HttpRequestException ex)
            {
                StatusMessage = "Ошибка подключения к серверу. Проверьте интернет-соединение.";
            }
            catch (Exception ex)
            {
                StatusMessage = $"Произошла ошибка: {ex.Message}";
            }
        }

        // Подтверждение клиента
        private async Task Confirm()
        {
            if (SelectedClient == null) return;

            try
            {
                await UpdateClientStatus(SelectedClient, "Проверка пройдена");
            }
            catch (Exception ex)
            {
                StatusMessage = $"Произошла ошибка: {ex.Message}";
            }
        }

        // Отклонение клиента
        private async Task Reject()
        {
            if (SelectedClient == null) return;

            try
            {
                await UpdateClientStatus(SelectedClient, "Проверка не пройдена");
            }
            catch (Exception ex)
            {
                StatusMessage = $"Произошла ошибка: {ex.Message}";
            }
        }

        // Обновление статуса клиента
        private async Task UpdateClientStatus(Client client, string newStatus)
        {
            var content = new StringContent(JsonConvert.SerializeObject(newStatus), Encoding.UTF8, "application/json");
            await _httpClient.PostAsync($"http://localhost:5000/api/clients/{client.Id}", content);
            client.Status = newStatus; // Обновляем статус локально
        }

        public event PropertyChangedEventHandler PropertyChanged;

        protected void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
