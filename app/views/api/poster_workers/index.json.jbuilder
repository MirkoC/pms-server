json.array!(@poster_workers) do |poster_worker|
  json.partial! 'api/poster_workers/poster_worker', poster_worker: poster_worker
end