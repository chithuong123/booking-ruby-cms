require "aws-sdk-secretsmanager"
require "json"

def get_secret
  return "placeholder" if ENV["SECRET_KEY_BASE"] == "placeholder"

  client = Aws::SecretsManager::Client.new(region: "ap-southeast-2")

  begin
    get_secret_value_response = client.get_secret_value(secret_id: "myapp/rails/staging/secret_key_base")
  rescue StandardError => e
    Rails.logger.error "Failed to retrieve secret from AWS Secrets Manager: #{e.message}"
    raise e
  end

  secret = JSON.parse(get_secret_value_response.secret_string)
  secret["SECRET_KEY_BASE"] # Trả về giá trị của SECRET_KEY_BASE
end

unless ENV["SECRET_KEY_BASE"] == "placeholder"
  Rails.application.config.secret_key_base = get_secret
end
