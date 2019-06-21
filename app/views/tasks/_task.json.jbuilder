# frozen_string_literal: true

json.extract!(task, :id, :body, :priority, :finish_at, :user_id, :created_at, :updated_at)
json.url(task_url(task, format: :json))
