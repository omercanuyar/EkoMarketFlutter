namespace EKOMARKET.HANGFIRE
{
    public class UpdatePricesJobManager
    {

        public async Task Process()
        {
          await SendGetRequest();
        }

        public static async Task<string> SendGetRequest()
        {
            var url = "https://localhost:7119/Product/product/update";

            using (var httpClient = new HttpClient())
            {
                try
                {
                    var response = await httpClient.GetAsync(url);
                    response.EnsureSuccessStatusCode();

                    var responseBody = await response.Content.ReadAsStringAsync();
                    return responseBody;
                }
                catch (HttpRequestException ex)
                {
                    // İstek hatası
                    Console.WriteLine($"Hata: {ex.Message}");
                }
                catch (Exception ex)
                {
                    // Genel hata
                    Console.WriteLine($"Hata: {ex.Message}");
                }

                return string.Empty;
            }
        }
    }
}
