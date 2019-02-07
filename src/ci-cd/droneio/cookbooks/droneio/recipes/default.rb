#
# Cookbook:: droneio
# Recipe:: default
#

package %w(docker.io) do
  action :upgrade
end

execute 'docker-run' do
  command <<-EOH
    docker run \
    --volume=/var/lib/drone:/data \
    --env=DRONE_GIT_ALWAYS_AUTH=false \
    --env=DRONE_GITLAB_SERVER=http://gitlab.ditemiku.local \
    --env=DRONE_GITLAB_CLIENT_ID=ebc36df0ccbc4a2228c09d2366a4024aa506e80a67cee34a33b5f5d90e873fc7 \
    --env=DRONE_GITLAB_CLIENT_SECRET=c0e6aeb24d5fdaf0998acfa803dfc2cdf1feb7aa1201e46784c562af6c06f434 \
    --env=DRONE_RPC_SECRET=e9d4336aefd1af81b57aa2217cf97c37 \
    --env=DRONE_SERVER_HOST=droneio.ditemiku.local \
    --env=DRONE_SERVER_PROTO=http \
    --env=DRONE_TLS_AUTOCERT=false \
    --publish=80:80 \
    --publish=443:443 \
    --restart=always \
    --detach=true \
    --network=host \
    --name=drone \
    drone/drone:1.0.0-rc.5
  EOH
end

execute 'drone-agent' do
  command <<-EOH
    docker run \
    --volume=/var/run/docker.sock:/var/run/docker.sock \
    --env=DRONE_RPC_SERVER=http://droneio.ditemiku.local \
    --env=DRONE_RPC_SECRET=e9d4336aefd1af81b57aa2217cf97c37 \
    --env=DRONE_RUNNER_CAPACITY=2 \
    --env=DRONE_RUNNER_NAME=local-runner \
    --restart=always \
    --detach=true \
    --network=host \
    --name=agent \
    drone/agent:1.0.0-rc.5
  EOH
end
