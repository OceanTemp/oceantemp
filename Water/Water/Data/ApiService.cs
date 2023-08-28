using Newtonsoft.Json;
using System.Collections;
using Water.Models;

namespace Water.Data;

public class ApiService : IApiService
{
	private readonly HttpClient _http;

	public ApiService()
	{
		_http = new HttpClient();
	}



	public async Task<OceanData> GetOceansResultPerKeyAsync(string key)
	{
	
	var response = await _http.GetAsync(
		$"https://opendata-download-ocobs.smhi.se/api/version/latest/parameter/5/station/{key}/period/latest-hour/data.json");


		if (response.IsSuccessStatusCode)
		{
			var content = await response.Content.ReadAsStringAsync();
			var oceanData = JsonConvert.DeserializeObject<OceanData>(content);
			return oceanData;
		}
		else
		{
			return null;
		}
		
	}
}