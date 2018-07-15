json.extract! course, :id, :name, :description, :duration, :is_active, :created_at, :updated_at
json.url course_url(course, format: :json)
