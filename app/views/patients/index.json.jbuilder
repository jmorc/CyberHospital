json.array!(@patients) do |patient|
  json.extract! patient, :id, :name, :summary, :temperature, :heart_rate
  json.url patient_url(patient, format: :json)
end
