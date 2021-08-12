json.extract! beat, :id, :title, :preview, :mp3, :wav, :price, :cover, :tempo, :scale, :created_at, :updated_at
json.url beat_url(beat, format: :json)
json.preview url_for(beat.preview)
json.mp3 url_for(beat.mp3)
json.wav url_for(beat.wav)
json.cover url_for(beat.cover)
