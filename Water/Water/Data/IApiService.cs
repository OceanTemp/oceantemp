using Water.Models;

namespace Water.Data;

public interface IApiService
{
	//Task<IEnumerable<Station>> GetOceansResultAsync();
	Task<OceanData> GetOceansResultPerKeyAsync(string key);
}