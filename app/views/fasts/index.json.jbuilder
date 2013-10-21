json.array!(@fasts) do |fast|
  json.extract! fast, :where, :when, :price, :seats, :notes
  json.url fast_url(fast, format: :json)
end
