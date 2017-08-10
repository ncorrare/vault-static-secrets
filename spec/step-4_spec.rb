require 'spec_helper'

vault_host = ENV["VAULT_ADDR"] 
vault_token = ENV["VAULT_TOKEN"]

describe command("curl #{vault_host}/v1/secret/foo -H 'X-Vault-Token: #{vault_token}'  -sL -w \"%{http_code}\\n\" -o /dev/null") do
  its(:stdout) { should match /404/ }
end

