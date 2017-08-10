require 'spec_helper'

vault_host = ENV["VAULT_ADDR"] 
vault_token = ENV["VAULT_TOKEN"]
describe command("curl #{vault_host}/v1/secret/foo --data-binary '{\"bar\":\"baz\"}' -H 'Content-Type: application/json' -H 'X-Vault-Token: #{vault_token}' -sL -w \"%{http_code}\\n\" -o /dev/null") do
  its(:stdout) { should match /204/ }
end

describe command("curl #{vault_host}/v1/secret/foo -H 'X-Vault-Token: #{vault_token}'  -sL -w \"%{http_code}\\n\" -o /dev/null") do
  its(:stdout) { should match /200/ }
end

describe command("curl -X DELETE #{vault_host}/v1/secret/foo -H 'X-Vault-Token: #{vault_token}'  -sL -w \"%{http_code}\\n\" -o /dev/null") do
  its(:stdout) { should match /204/ }
end

