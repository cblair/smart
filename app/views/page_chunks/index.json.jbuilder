json.array!(@page_chunks) do |page_chunk|
  json.extract! page_chunk, :id, :name, :content
  json.url page_chunk_url(page_chunk, format: :json)
end
