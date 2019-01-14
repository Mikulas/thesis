external_url 'http://gitlab.ditemiku.local'

gitlab_rails['initial_root_password'] = "CVUT_FIT"
gitlab_rails['initial_shared_runners_registration_token'] = "preset-runner-token"

registry_external_url 'https://registry.gitlab.ditemiku.local:4567'
registry_nginx['ssl_certificate'] = "/opt/registry-cert.pem"
registry_nginx['ssl_certificate_key'] = "/opt/registry-key.pem"
