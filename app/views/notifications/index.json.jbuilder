json.array!(@notifications) do |notification|
  json.extract! notification, :id, :title, :ndesc
  json.url notification_url(notification, format: :json)
end
